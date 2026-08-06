```yaml
research_id: MA-DR-15
research_title: Capability Matrix, Provider/Tool Routing, Freshness, and Failure/Fallback Governance
target_project: Meta-Agent
report_role: external_research_evidence_non_execution_source
independence_contract_observed: true
```

# 能力矩阵、模型／工具路由、时效性与故障降级治理

## 执行结论、定义与研究边界

**Executive verdict**

Meta-Agent 不应维护一张“哪个品牌永远最强”的静态排行榜，而应维护一个由**原子化 capability claims、适用范围、证据、时效状态、冲突记录和降级语义**组成的可审计 registry。每次路由先执行 authority、privacy、permission、side-effect、required capability 与 freshness 等 hard gates；只有通过 gate 的候选，才可在质量、成本、延迟、可靠性、可观察性和维护负担之间评分。这个结构比将任务永久绑定到品牌或 visible model label 更能抵御 provider churn、alias 漂移、区域差异和 subscription 差异。现有 Meta-Agent baseline 已明确要求 capability-aware work split、禁止永久指定品牌，并明确 visible selection、速度、风格和 model self-report 不能证明 hidden backend identity。fileciteturn2file0L2-L2 fileciteturn4file0L2-L2

本报告的核心结论如下。

| 结论 | 证据状态 | 判定 |
|:--|:--|:--|
| Capability matrix 应是 **dated claim registry**，而非 vendor ranking。 | `MULTI_SOURCE_PATTERN` | 官方平台文档同时存在 aliases、pinned snapshots、usage-tier limits、region/surface 差异和 deprecation；这些事实具有明确时效和作用域。citeturn18search0turn19search0turn19search1turn19search12 |
| Authority、privacy、permission 和 irreversible side effects 必须是不可交易的 feasibility constraints。 | `TARGET_SPECIFIC_INFERENCE` + `OFFICIAL_SPECIFICATION_OR_DOCUMENTATION_FACT` | Meta-Agent target baseline 将 Owner authority、material boundary 和 write authorization 与平台权限分离；MCP、OAuth 和 OpenAPI 也将 operation authorization、scope、audience 和 security scheme 作为明确接口条件。fileciteturn2file0L2-L2 fileciteturn4file0L2-L2 citeturn20search0turn20search6turn21search1 |
| “Required / preferred / prohibited / unknown” 是任务需求状态；“supported / partial / unsupported / unknown” 是候选能力状态，两者不得混为一列。 | `RECOMMENDATION` | 分离后才能表达“任务 required，但候选 unknown”，并据风险决定 test、escalate 或 stop。 |
| Unknown 或 stale 不是低分，而是在高影响任务中通常意味着 **infeasible until verified**。 | `RECOMMENDATION` | 将 unknown 仅作为 MCDA 扣分，可能让便宜但未经验证的候选越过权限或能力底线。 |
| Fallback 必须产生显式的 **guarantee delta**；禁止将“格式不再机器可执行”“来源不再新鲜”或“工具不再可用”静默包装成等价成功。 | `MULTI_SOURCE_PATTERN` | Circuit breaker、HTTP retry semantics、idempotency guidance 与当前 Meta-Agent candidate evidence 都支持区分重试、替代、降级和停止。citeturn6search0turn6search1turn7search0 fileciteturn9file0L2-L2 |
| Tool description、OpenAPI schema 或 MCP tool metadata 只能作为 capability claim 输入，不能单独证明语义、安全性、权限或实际可用性。 | `OFFICIAL_SPECIFICATION_OR_DOCUMENTATION_FACT` + `RECOMMENDATION` | JSON Schema 验证结构而非业务真实性；OpenAPI 允许 external references 和 extensions，并要求消费者处理不可信资源风险；MCP 另有独立授权和安全要求。citeturn20search1turn20search5turn21search1turn20search0turn20search6 |
| Learned router、contextual bandit 和 multi-model review 可以提供价值，但只能在 hard-gated、可逆、可测量、具有足够流量和反馈质量的范围内采用。 | `VERIFIED_PRIMARY_EVIDENCE` + `RECOMMENDATION` | FrugalGPT、RouteLLM 和 contextual-bandit research 展示了 cost-quality routing 的可能收益；其结果来自特定数据集、模型组合和目标函数，不能越过权限或泛化为永久最优策略。citeturn14academia49turn14academia51turn14academia50 |
| 多次调用或多个 named models 不自动形成 independent review。 | `VERIFIED_PRIMARY_EVIDENCE` + `TARGET_SPECIFIC_INFERENCE` | Homogeneous multi-agent workflows 可能被强 single-agent baseline 模拟；debate 会增加计算成本且可能收敛到错误答案；LLM judges 存在 position、verbosity 和 self-enhancement bias。citeturn14academia48turn16search1turn16academia51 |
| 维护计划应围绕少量 active routes、event-triggered revalidation 和 just-in-time facts，而不是持续穷举所有 provider。 | `RECOMMENDATION` | Live benchmarks 和 release notes 说明更新与污染问题真实存在，但完整 benchmark harness 可能需要容器、依赖和高资源；治理收益必须超过行政成本。citeturn17academia29turn17search4turn11search0 |

**关键定义**

本报告使用以下 provider-neutral 定义：

* **Capability**：一个系统在指定 surface、version、region、account、input class 和 operation mode 下，能否满足某项可验证要求。
* **Capability claim**：形如“subject 在 scope 中，以 constraints 为条件，支持 predicate”的原子陈述。它必须关联 evidence、date、version、confidence 和 expiry。
* **Task requirement**：任务对 capability 的约束，状态为 `required`、`preferred`、`prohibited` 或 `unknown`。
* **Candidate support state**：候选对 capability 的当前证据状态，至少为 `supported`、`partial`、`unsupported`、`unknown`、`stale` 或 `conflicted`。
* **Attested backend identity**：由 provider response metadata、pinned endpoint、signed deployment record 或其他可信控制面明确给出的 backend identity。UI label、输出风格、延迟和 self-report 不构成 attestation。
* **Degraded guarantee**：fallback 后仍被保留、被削弱、完全丢失或需要人工补偿的保证集合。
* **Route**：满足 hard gates 后，对 model、tool、human review、fallback chain 和 evidence requirements 的一次任务级选择，而非永久品牌绑定。
* **Current availability**：在本次 account、region、subscription、quota、auth state 和 provider status 下的可用性，不等于文档中一般性支持。

**Scope 与 non-goals**

本研究覆盖 capability ontology、claim evidence、freshness、routing、tool/connector permission、fallback、heterogeneous review 和轻量维护计划。它不执行 provider benchmark、不测试用户账户、不消耗其他 provider quota、不访问 private material、不启动 pilot、不修改 repository，也不将任何 candidate 直接提升为 Meta-Agent target truth 或 methodology。当前 target truth 仍是 inactive design and governance baseline，且任何 operational activation、private material use、write authority 或 methodology promotion 都需要独立 Owner decision。fileciteturn2file0L2-L2

本报告使用任务规定的证据标签：

`VERIFIED_PRIMARY_EVIDENCE` 表示同行评审论文、主要 preprint、正式实验或标准正文直接支持；`OFFICIAL_SPECIFICATION_OR_DOCUMENTATION_FACT` 表示当前官方规范或平台文档中的作用域事实；`MULTI_SOURCE_PATTERN` 表示多个独立来源一致呈现的工程模式；`INDUSTRY_PRACTICE` 表示成熟但未必经过目标环境实验的工程做法；`TARGET_SPECIFIC_INFERENCE` 表示根据 Meta-Agent repository inputs 作出的映射；`RECOMMENDATION` 表示尚待 Owner 选择的候选设计；`UNRESOLVED` 表示现有证据不足。

## 仓库输入绑定回执与目标约束

**Repository-binding receipt**

```yaml
repository: 08822407d/Mnemosyne
branch_read: master
actual_commit_read: 0865f334177e2ff0d81a3652ea9e3384e55f4259
commit_time_utc: 2026-08-04T00:47:52Z
execution_date_asia_singapore: 2026-08-04
prepared_against_commit_superseded: 5cc758caa6baf86de0cf67cda2d852724f5edbbb
mandatory_inputs_available: true
target_specific_mapping_status: COMPLETED
blocked_by_missing_target_inputs: false
repository_writes_performed: false
private_material_ingested: false
operational_activation_performed: false
stable_target_ids_issued: false
```

任务执行时读取的是 `master@0865f334177e2ff0d81a3652ea9e3384e55f4259`，而不是 preparation metadata 中较旧的 `5cc758…`。九个 mandatory inputs 均在该 exact ref 上成功读取，因此无需标记 `BLOCKED_BY_MISSING_TARGET_INPUTS`。所有 review 和 candidate ledger 均保留其 non-execution / candidate-only 角色；没有把研究材料视作 target truth。

| Mandatory input | 实际读取结果 | 约束性含义 |
|:--|:--|:--|
| `current/approved-spec.md` | PASS，exact commit read。fileciteturn2file0L4-L6 | Sole designated target truth path；Owner 已接受为 inactive baseline，但未授权 operation。Capability split 不永久绑定品牌。 |
| `current/active-context.md` | PASS。fileciteturn3file0L4-L6 | Navigation only；可能变 stale；记录 Batch-A candidates 和 activation blockers。 |
| `authority/source-and-owner-map.md` | PASS。fileciteturn4file0L4-L6 | Owner authority、source classes、task-local authorization、freshness 和 non-attestation rules。 |
| `methodology/core-methodology.md` | PASS。fileciteturn5file0L4-L6 | Initial incomplete method library；single-agent first；capability-aware decomposition；visible selection 不证明 backend。 |
| `history/decision-version-and-migration-log.md` | PASS。fileciteturn6file0L4-L6 | v0.1.0 lineage、rollback、stable identity 与 inactive operational status。 |
| `MA-DR-01-05-cross-report-synthesis-v0.1.md` | PASS，non-execution synthesis preserved。fileciteturn7file0L4-L6 | 既有共识支持 capability/risk/permission/evidence-aware routing，但 provider facts 会快速过时。 |
| `MA-DR-01-05-gap-analysis-v0.1.md` | PASS，research-gap role preserved。fileciteturn8file0L4-L6 | 指出 portable IR、benchmark、安全和行政负担仍是 gap；具体阈值应实验决定。 |
| `MA-DR-06-07-cross-report-adjudication.md` | PASS，non-execution adjudication preserved。fileciteturn9file0L4-L6 | Hard constraints outside optimizer；typed permissions、degraded semantics 和 risk-tiered testing 仍为 candidate。 |
| `Batch-A-candidate-change-ledger.md` | PASS，candidate-only role preserved。fileciteturn10file0L4-L6 | `CAND-TYPED-PERMISSION-SIDE-EFFECT`、`CAND-BACKEND-DEGRADED-SEMANTICS` 等不是已接受 control。 |

**Repository-bound constraints**

Meta-Agent 的现有 accepted baseline 对本研究形成五个不可绕过的边界。

第一，Owner 是 product purpose、target truth、privacy、repository/write scope、methodology promotion 和 operational acceptance 的最终 authority。平台上“技术上可调用”不代表当前任务“被授权调用”；read authorization 不意味着 write authorization。fileciteturn4file0L2-L2

第二，模型路由必须按 capability demand 进行：ambiguous、novel、authority-changing 或 high-impact work 升级到 frontier reasoning 和 human decision；frozen、bounded、可验证任务可交由 validated next-tier executor；机械检查应尽量交给 deterministic mechanisms。这里的 tier 是能力／风险层级，不是永久品牌。fileciteturn2file0L2-L2 fileciteturn5file0L2-L2

