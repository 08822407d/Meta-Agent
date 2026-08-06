```yaml
research_id: MA-DR-11
research_title: Methodology Promotion, Evidence Generalization, and Cross-Project Learning Governance
target_project: Meta-Agent
report_role: external_research_evidence_non_execution_source
independence_contract_observed: true
```

# MA-DR-11 — 方法论晋升、证据泛化与跨项目经验治理

## 执行结论、定义与边界

**Executive verdict**

```yaml
overall_verdict: ACCEPT_AS_EXTERNAL_RESEARCH_EVIDENCE_ONLY
target_truth_changed: false
methodology_promoted: false
stable_target_IDs_issued: false
repository_write_performed: false
operational_activation_authorized: false
private_material_ingested: false
pilot_authorized: false
```

Meta-Agent 当前的基本方向是合理的：项目结果不能自动改写通用方法论；经验必须经过证据审查、抽象、候选变更、Owner 决策、版本化和回滚安排。现有缺口不在于是否需要 gate，而在于 gate 应如何区分**目标特定经验、有限适用的方法候选、可接受的通用方法、反例、退休方法以及重新开启的方法**。仓库当前已明确禁止单一成功、单一失败、用户偏好或一个模型的行为自动成为一般方法，但尚未定义可审计的 inferential-strength、evidence-diversity、contradiction、scope-condition 与 lifecycle 标准。fileciteturn2file0L2-L2 fileciteturn5file0L2-L2

本研究的核心结论是：

1. **不存在由文献直接给出的、适用于个人 AI 项目历史的通用样本量门槛。** Small-N 案例最可靠的用途是形成或修正解释、识别机制、发现边界条件和寻找反例，而不是声称对某个总体完成了统计证明。Case-study literature 将此称为 *analytic generalization*，并强调 rival explanations、triangulation、logic models 和理论边界，而不是从单一或少量案例直接进行 population-level statistical generalization。citeturn0search2turn0search12turn0search14

2. **重复成功只增加“在相似条件下可再现”的可信度，不自动增加跨域 generality。** 真正的泛化证据来自有意改变项目、任务、模型、工具、operator 和风险条件后的 replication，以及对 effect heterogeneity 和 failed/neutral cases 的分析。跨样本或跨地点结果能否推广，实质上取决于效应是否随条件变化，而非简单取决于案例总数。citeturn6search11turn6search16turn6search15

3. **方法晋升应采用“claim–argument–evidence–assumption–counterargument”结构，而不是成功票数。** Assurance-case standards 支持将主张、证据和显式假设结构化，但标准本身不保证证据内容质量，因此 dossier 是推理纪律，不是自动认证。citeturn7search0turn7search3

4. **负面、矛盾和缺失证据必须是一等记录。** 组织可能从 failure 中学到比 success 更多的信息，但 outcome 本身不等于 process quality：错误过程可能偶然成功，正确过程也可能因噪声失败。忽略这种 “spurious success / spurious failure” 会导致 narrative laundering。citeturn2search7turn3search14

5. **LLM evaluator consensus 不是独立 replication。** 相同或相关模型、相似训练来源、同一 rubric、同一 prompt 和同一上下文可产生相关误差；研究已显示 LLM judges 存在 position、familiarity、anchoring 和 self-preference 等偏差。因此，多次调用、多个相近模型或多数投票最多是重复测量，除非其错误来源和 evidence channel 实质独立。citeturn4search0turn4academia48turn4search5

6. **适合 Meta-Agent 的最低治理单位不是“完整论文式审查”，而是一个紧凑的 promotion dossier。** 对只保留为 target-specific lesson 的记录可走轻量路径；任何会影响通用方法、权限、隐私、不可逆行动或跨项目默认行为的候选必须走标准或高风险路径。

**证据标签约定**

本报告对 load-bearing claim 使用以下标签：

- `VERIFIED_PRIMARY_EVIDENCE`：由同行评审研究、原始实验或方法论文直接支持。
- `OFFICIAL_SPECIFICATION_OR_DOCUMENTATION_FACT`：由正式标准或官方文档支持。
- `MULTI_SOURCE_PATTERN`：多个独立来源呈现一致模式，但不构成普适定律。
- `INDUSTRY_PRACTICE`：工程实践中常见但证据强度有限。
- `TARGET_SPECIFIC_INFERENCE`：基于 Meta-Agent 仓库状态作出的映射。
- `RECOMMENDATION`：本报告提出、尚未被 Owner 接受的候选设计。
- `UNRESOLVED`：文献或当前案例无法确定。

**范围与非目标**

本报告研究 methodology promotion governance，不执行任何方法晋升，不创建或修改 `MA-REQ`、`MA-PEND`、`MA-METHOD`、`MA-MIG`、schema 或 runtime control ID；不运行 pilot；不使用私有项目材料；不从可见 model label 或 model self-report 推断实际 served backend；不把外部文献或仓库 research review 当作 target truth。

## 仓库绑定回执与 Meta-Agent 映射

**实际读取引用**

```yaml
repository: 08822407d/Mnemosyne
default_branch: master
execution_time_master_commit: 0865f334177e2ff0d81a3652ea9e3384e55f4259
commit_timestamp_utc: 2026-08-04T00:47:52Z
prepared_against_commit_in_task: 5cc758caa6baf86de0cf67cda2d852724f5edbbb
mandatory_inputs_available: true
target_specific_mapping_status: COMPLETED
```

执行时读取的最新 `master` 是 `0865f334177e2ff0d81a3652ea9e3384e55f4259`，其提交信息为 `MNEMOSYNE-188 prepare Project-knowledge Research surface for Fable A1/A2`。fileciteturn12file0L2-L6

**Mandatory input receipt**

| Mandatory path | 读取状态 | 绑定后的角色 |
|---|---:|---|
| `current/approved-spec.md` | PASS | 当前 Owner-accepted、但 inactive 的唯一 designated target truth path |
| `current/active-context.md` | PASS | 非执行 current-state/navigation |
| `authority/source-and-owner-map.md` | PASS | authority/source role support |
| `methodology/core-methodology.md` | PASS | 由 spec 引用的 initial incomplete method library |
| `history/decision-version-and-migration-log.md` | PASS | reviewed history、version、lineage、rollback |
| `MA-DR-01-05-cross-report-synthesis-v0.1.md` | PASS | non-execution research synthesis |
| `MA-DR-01-05-gap-analysis-v0.1.md` | PASS | non-execution gap analysis |
| `MA-DR-06-07-cross-report-adjudication.md` | PASS | completed non-execution adjudication |
| `Batch-A-candidate-change-ledger.md` | PASS | candidate-only ledger |
| `cases/case-and-feedback-ledger.md` | PASS | evidence/candidate ledger；当前无真实案例 |

当前 approved spec 已将以下规则定义为 target truth 的一部分：项目反馈不得自动改写一般方法；目标特定教训不能静默成为 global method；Owner 对 methodology promotion 保留最终权力；重要方法变更需要证据、acceptance criteria、适当的 regression/semantic review 及 rollback。fileciteturn2file0L2-L2

`MA-METHOD-0005` 已提供基本管线：

```text
case result or feedback
  -> evidence-bearing feedback record
  -> review and competing explanations
  -> scoped lesson candidate
  -> candidate method change
  -> acceptance criteria and regression/semantic review
  -> user decision
  -> authorized method update
```

但该方法没有定义 evidence classes、diversity、independence、scope-condition、retirement、reopening 或 quantitative calibration。fileciteturn5file0L2-L2

现有 case ledger 已包含许多正确字段，包括 acceptance criteria、observed evidence、producer claims、verifier findings、limitations/confounds、contradictory evidence 和 generalization status；然而 ledger 仍为空，且其 `generalization_status` 只有 `not_reviewed | target_specific | candidate_general | rejected`，不足以表示 conditionally accepted、narrowed、deprecated、retired 或 reopened。fileciteturn11file0L2-L2

先前 gap analysis 已正确指出 methodology promotion evidence threshold 是 P1 缺口，并明确认为 exact thresholds、rubric weights、test-set size、approval density 和 administrative burden 应由 Meta-Agent-specific cases 校准，而不是由 broad literature 直接决定。fileciteturn8file0L2-L2

Batch-A adjudication 进一步支持 promotion quarantine、negative evidence、anti-resurrection、origin metadata 和 strong baselines，但这些仍是 candidate-only，不是方法变更。fileciteturn9file0L2-L2 fileciteturn10file0L2-L2

**TARGET_SPECIFIC_INFERENCE**

Meta-Agent 当前不缺“禁止自动晋升”的原则；它缺的是一种可由一个 Owner 实际维护的**证据对象模型和状态机**。因此最小增量不应是复杂统计平台，而应是：

```text
evidence record
+ explicit claim
+ scope conditions
+ competing explanations
+ contradiction register
+ decision status
+ tombstone / reopening rule
```

该映射不授权修改仓库。

## 证据类型、Small-N 泛化与主要方法比较

**Evidence-strength and generalizability matrix**

下表中的“强度”不是单一排名。证据可能有很强的 target validity、很弱的 causal validity，或很强的内部因果识别、很弱的跨项目 transportability。

| Evidence type | 可支持的最强合理主张 | 不能单独支持 | 推荐 ledger 处理 |
|---|---|---|---|
| **Anecdote** | 发现问题、提出假设、暴露潜在风险 | effect、causality、frequency、generality | 记录为 `signal`；不得计作 replication |
| **Observation** | “在指定时间和条件下发生了 X”；target-specific lesson | 方法导致结果；跨任务有效 | 保留上下文、时间、版本、measurement |
| **Controlled comparison** | 在可比条件下，方法与 baseline 的局部差异；若控制良好可支持局部 causal claim | 自动跨域；长期稳定性 | 保存 baseline、分配方式、predeclared metric、concurrent changes |
| **Repeated case** | 在同一项目或相似条件下的 repeatability 和稳定性 | independent replication；cross-project generality | 标记 shared dependencies，不把重复调用视为独立 N |
| **Cross-project replication** | 在已观察项目与 scope 中具 transportability；可发现 heterogeneity | 所有领域普遍适用 | 比较项目结构、domain、operator、model/tool 和 risk level |
| **Negative case** | 反驳过宽主张；发现 failure condition；降低 posterior confidence | 单独估计失败率或总体 effect | 强制链接受影响 claim 和 scope |
| **Counterexample** | 足以否定“无例外 universal claim” | 不必否定加入 scope condition 后的较窄方法 | 禁止删除；触发 narrowing/rejection review |
| **Expert judgment** | 建立 prior、解释机制、识别风险和未知量 | 独立 empirical confirmation | 记录 expert relation、依据、conflict of interest、uncertainty |
| **Benchmark** | 在固定 dataset/protocol/model/tool 条件下的 relative performance | 实际项目效用、跨版本稳定性、权限正确性 | 保存版本、split、metric、seed、baseline 和 contamination risk |
| **Postmortem** | 机制假设、causal chain、organizational/process lesson | 在无 counterfactual 时确认唯一原因 | 分离 facts、interpretations、rival explanations、action items |
| **Causal evidence** | 在研究设计和 assumptions 成立时支持 method effect | 自动 transport 到不同 context；消除所有 residual confounding | 明确 estimand、assumptions、intervention fidelity、effect heterogeneity |

Case-based reasoning 的核心是 retrieve、reuse、revise 和 retain：过去案例可帮助新问题，但其有效性依赖于 similarity、adaptation 和 testing，而不是表面相似或简单累计。citeturn5search0turn5search8 `VERIFIED_PRIMARY_EVIDENCE`

