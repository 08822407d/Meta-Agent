```yaml
research_id: MA-DR-10
research_title: Requirements-to-Agent/Workflow Design Synthesis and Review Methodology
target_project: Meta-Agent
report_role: external_research_evidence_non_execution_source
independence_contract_observed: true
```

# MA-DR-10 — 从需求到 Agent／Workflow 设计的综合与审阅方法论

## 执行裁决、仓库绑定与研究边界

**Executive verdict**

本研究的核心裁决是：**Meta-Agent 存在一个真实且边界清晰的方法缺口，适合由一个新的、显式的 design-synthesis method candidate 来填补；但现有证据只支持提出候选方法，不支持直接提升为 target truth、正式 methodology object 或 operational control。**

该缺口位于：

```text
approved problem frame
→ coherent Agent/workflow design
→ alternatives and strong baselines
→ review/evidence package
→ evaluation or bounded experiment
```

Meta-Agent 当前已接受的方法覆盖 requirement framing、single-Agent versus multi-Agent topology、authority/source separation、capability-aware decomposition、evaluation/promotion gate 与 handoff；但尚未定义如何把经过批准的 problem frame 转换为**一致、可追溯、可审阅、implementation-neutral** 的 Agent/workflow design dossier。仓库中的 DR-01–05 synthesis、gap analysis、Batch-A adjudication 与 candidate ledger 都把这一点标记为候选缺口，而不是已接受方法。fileciteturn5file0L2-L2 fileciteturn7file0L2-L2 fileciteturn8file0L2-L2 fileciteturn9file0L2-L2

本报告建议的候选方法具有六项基础性质：

| 性质 | 结论 |
|---|---|
| Representation-neutral | 方法定义概念、关系、门槛和证据，不定义 canonical DSL、IR、YAML schema 或 graph syntax。 |
| Baseline-first | complexity 不是目标；fixed mechanism、direct Agent、strong single-Agent 和 deterministic workflow 必须先成为可比较基线。 |
| Hard-gate before scoring | authority、privacy、permission、termination、truth-source、critical safety 等约束不能被综合评分抵消。 |
| Traceable | 每个 role、tool、memory、permission 和 workflow decision 必须回溯到 requirement、evidence、risk 或明确 Owner preference。 |
| Human-governed | AI 可起草、检查和生成候选；目的、权威、风险接受、不可逆权限和最终 architecture choice 由人决定。 |
| Evidence-producing | 输出不是“漂亮的说明书”，而是可以被独立 reviewer 检查、比较、反驳和转交给后续 evaluation 的 evidence package。 |

**证据状态：**`RECOMMENDATION`。  
**Target-specific implication：**Meta-Agent Owner 可以考虑建立显式 design-synthesis method candidate；本报告没有授权方法提升、运行、试点或仓库修改。

### Repository input-binding receipt

```yaml
repository: 08822407d/Mnemosyne
default_branch: master
prepared_against_master: 5cc758caa6baf86de0cf67cda2d852724f5edbbb
execution_time_ref_read: 0865f334177e2ff0d81a3652ea9e3384e55f4259
execution_time_ref_timestamp_utc: 2026-08-04T00:47:52Z
execution_time_ref_commit_message: >
  Merge pull request #245 from
  08822407d/mnemosyne-188-fable-research-project-knowledge-surface
repository_read_mode: exact_commit_read
mandatory_inputs_available: true
target_specific_mapping_status: COMPLETED
missing_target_input_status: none
repository_writes_performed: false
target_truth_changes_performed: false
methodology_promotion_performed: false
operational_activation_performed: false
```

实际读取的 `master` ref 晚于任务准备时的 `5cc758...`，因此 target mapping 以执行时 commit `0865f334177e2ff0d81a3652ea9e3384e55f4259` 为准。Commit URL：

`https://github.com/08822407d/Mnemosyne/commit/0865f334177e2ff0d81a3652ea9e3384e55f4259`

| Mandatory path | 读取状态 | 绑定作用 |
|---|---:|---|
| `target-projects/meta-agent/current/approved-spec.md` | PASS | 确认 Owner authority、inactive target truth、requirements、non-goals 与 activation boundary。fileciteturn2file0L2-L2 |
| `target-projects/meta-agent/current/active-context.md` | PASS | 确认 Batch A 已合并、DR-08 尚未执行、design quality 与 pilot evidence 仍未证明。fileciteturn3file0L2-L2 |
| `target-projects/meta-agent/authority/source-and-owner-map.md` | PASS | 确认 sole truth source、source classes、Owner decision authority 与 platform permission ≠ task authority。fileciteturn4file0L2-L2 |
| `target-projects/meta-agent/methodology/core-methodology.md` | PASS | 确认现有六方法的覆盖范围及 initial incomplete library 状态。fileciteturn5file0L2-L2 |
| `target-projects/meta-agent/history/decision-version-and-migration-log.md` | PASS | 确认 v0.1.0、inactive baseline、stable-ID discipline 与 rollback boundary。fileciteturn6file0L2-L2 |
| `MA-DR-01-05-cross-report-synthesis-v0.1.md` | PASS | 作为 non-execution research synthesis 使用；没有把其候选内容视为 target truth。fileciteturn7file0L2-L2 |
| `MA-DR-01-05-gap-analysis-v0.1.md` | PASS | 用于识别 design synthesis、baseline、IR、security 与 pilot gaps；保持 candidate role。fileciteturn8file0L2-L2 |
| `MA-DR-06-07-cross-report-adjudication.md` | PASS | 用于 target-specific mapping 与 Batch-A constraints；没有导入 sibling task conclusions。fileciteturn9file0L2-L2 |
| `Batch-A-candidate-change-ledger.md` | PASS | 仅作为 candidate ledger；其中任何 label 均未被视为正式 target ID。fileciteturn10file0L2-L2 |

本研究遵守 independent-wave contract：没有要求、等待或使用任何未列为 mandatory repository input 的 sibling research conclusion。仓库内已存在的 Batch-A review 与 candidate ledger 是任务明确要求读取的 target-bound inputs，但其 non-execution、candidate-only 地位被保留。

### 定义、范围与非目标

本文中的 **design synthesis** 指：将已批准的 problem frame、requirements、constraints、authority 和 evidence 转化为一组连贯的 design decisions，并生成足以支持独立 review、alternative comparison 和后续 evaluation 的 dossier。它不等于生成 prompts，也不等于选择某个 framework。

本文中的 **Agent/workflow design** 是对以下概念关系的说明，而不是特定序列化格式：

```text
purpose
+ requirements and quality attributes
+ roles and responsibilities
+ interaction/control flow
+ state and memory
+ tools and capabilities
+ permissions and side effects
+ authority and human decisions
+ termination/fallback/rollback
+ observability/evaluation
+ deployment and operating assumptions
```

本文不研究或决定：

- canonical Agent Design IR、DSL、schema、graph notation 或 backend compiler；
- automated architecture search 的最终算法；
- 某个 provider、model、framework、storage product 或 runtime 作为默认实现；
- operational activation、private-material ingestion 或真实 pilot；
- 新的稳定 `MA-REQ`、`MA-PEND`、`MA-METHOD`、`MA-MIG` 或 schema/runtime ID；
- 通过 visible model label、response style 或 self-report 推断 exact served backend。

报告采用以下 claim labels：

| Label | 含义 |
|---|---|
| `VERIFIED_PRIMARY_EVIDENCE` | 由 peer-reviewed paper、primary preprint、benchmark 或直接研究结果支持。 |
| `OFFICIAL_SPECIFICATION_OR_DOCUMENTATION_FACT` | 来自 standards body、RFC、official handbook 或 official project documentation。 |
| `MULTI_SOURCE_PATTERN` | 多种独立传统或研究得到方向一致的模式，但不构成形式定理。 |
| `INDUSTRY_PRACTICE` | 广泛使用且有工程价值，但 empirical validation 可能有限。 |
| `TARGET_SPECIFIC_INFERENCE` | 根据 Meta-Agent repository truth 与 external evidence 得出的限定推论。 |
| `RECOMMENDATION` | 本报告提出的候选设计原则或方法。 |
| `UNRESOLVED` | 需要 MA-DR-08、MA-DR-09、Owner decision 或 real pilot 才能回答。 |

## 证据景观与主要方法传统比较

Requirements-to-design 不是一个单一学科问题。它横跨 requirements engineering、software architecture、contract-based design、safety engineering、human factors、socio-technical design、workflow notation、protocol design 和 architecture governance。没有一种传统可以原样解决 Agent systems 的全部问题，但多种传统组合后可以形成有效的 representation-neutral method。

`ISO/IEC/IEEE 29148:2018` 将 requirements engineering 视为贯穿生命周期的过程，并要求形成相应 information items；`ISO/IEC/IEEE 42010:2022` 则明确区分 architecture 与 architecture description，并且不规定 architecture description 必须使用何种格式。这两个边界共同支持本研究的核心立场：Meta-Agent 需要的是一个从 requirements 到 reviewable architecture description 的过程，而不是先选择 syntax。citeturn10view2turn10view1

ATAM 把 architecture review 组织为 quality-attribute scenarios、候选 architecture、trade-off analysis、risk identification 与迭代 refinement，而不是把 architecture quality 化约为一个总分。citeturn10view3 Requirements traceability 的系统综述显示，traceability 在 change impact、verification、compliance 和 maintenance 中具有实际价值，但同时面临成本、语义质量、更新和 adoption 等持续挑战；因此，Meta-Agent 需要的是**最小充分 traceability**，而不是无限扩张的 trace graph。citeturn1search15

### 方法传统的可迁移性

| 传统 | 可迁移到 Agent systems 的核心 | 不能直接迁移或需要修正的部分 | 本报告采用方式 |
|---|---|---|---|
| Requirements engineering | 区分 requirement、constraint、assumption、interface、quality attribute、acceptance evidence；支持 lifecycle traceability。 | 传统文档可能假定 system boundary 和 stakeholder 相对稳定；Agent 的 model/tool behavior、context 和 external services 更易漂移。 | 为每项 design decision 提供 requirement/evidence/risk/Owner-preference 来源。 |
| Contract-based design | 用 assumptions/guarantees 描述 components、roles 和 interactions；支持 compositional reasoning。Contracts 传统强调组件在环境假设成立时提供保证。citeturn1academia49turn1search12 | LLM behavior 通常无法给出强形式保证；prompt 不是可靠 contract，概率性输出也不能伪装为 deterministic postcondition。 | 使用“operational contract”：输入、允许状态、输出、acceptance check、failure、timeout、escalation，而非虚假形式证明。 |
| Architecture Tradeoff Analysis Method | 通过 concrete scenarios 讨论 modifiability、security、performance、availability 等互相冲突的质量属性。citeturn10view3 | 完整 ATAM 的人员和会议成本对小型 Agent design 过高；它也不直接覆盖 prompt injection、memory poisoning 或 evaluator coupling。 | 采用轻量 scenario-based trade-off review，按风险 profile 缩放。 |
| Architecture Decision Records | 保存 context、decision、alternatives 与 consequences；能防止设计理由在交接后丢失。Nygard-style ADR 通常包含 title、status、context、decision 与 consequences。citeturn1search11 | ADR 常以单一 decision 为单位，无法替代完整 requirement trace、workflow contract 或 safety evidence。 | 每个 load-bearing decision 形成简洁 rationale record，并链接到 dossier。 |
| Requirements traceability | 支持 orphan detection、change impact、verification coverage 和 rejected-option history。citeturn1search15 | 全量双向 trace 容易产生维护负担和 stale links；数量不等于语义质量。 | 只强制 load-bearing objects 与 hard gates 的双向 trace；其余按风险增量添加。 |
