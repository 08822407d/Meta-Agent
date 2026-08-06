```yaml
research_id: MA-DR-12
research_title: Dynamic Delegation, Managed Autonomy, and Human Approval Policy
target_project: Meta-Agent
report_role: external_research_evidence_non_execution_source
independence_contract_observed: true
```

# MA-DR-12 — 动态委派、受控自主性与人工审批策略

## 执行结论与仓库输入绑定

**Executive verdict**

本研究的核心结论是：Meta-Agent 的自主性不应被建模为一个随“模型更聪明”而单调上升的等级，而应被建模为一个由**权限上限、行动风险、证据充分性、可逆性、人类价值判断与恢复能力共同约束的动态决策变量**。高能力可以减少执行错误，却不能自动授予工具权限、扩大 side-effect scope、改变 target truth、替代 Owner 的价值判断，或授权不可逆行动。`RECOMMENDATION`

建议采用由三部分组成的治理结构：

1. **不可优化的 hard gates**：Owner authority、privacy、credentials、target truth、methodology promotion、operational activation、不可逆高影响行动等不得被历史成功率、模型置信度或成本收益分数“学掉”。
2. **授权集合内的 risk-adaptive routing**：在权限已经成立的前提下，根据 reversibility、blast radius、uncertainty、evidence quality、sensitivity、detectability、time pressure 与 cost of delay，在 `PROCEED / VERIFY / ASK / ABSTAIN / ESCALATE` 之间选择。
3. **受限的历史适应**：历史表现只能降低或提高同一权限范围内的 review intensity、抽样审计频率或 verifier 强度，不能扩大 authority ceiling，也不能把一次次批准累积为永久授权。

这一方向与 mixed-initiative、levels of automation、learning to defer、selective prediction、human factors 和 least-privilege engineering 的证据相符。经典 automation 研究将自动化区分为 information acquisition、analysis、decision/action selection 和 action implementation，并表明自动化会重新分配人的工作，而不是简单消除工作；更高 automation 可能改善 routine performance 和 workload，却同时产生 situation awareness、failure takeover 与协调成本问题。citeturn10search3turn11search0turn14search2

**Repository-binding receipt**

执行时通过 GitHub connector 读取的仓库和引用如下：

```yaml
repository: 08822407d/Mnemosyne
branch_read: master
actual_commit_read: 0865f334177e2ff0d81a3652ea9e3384e55f4259
commit_timestamp_utc: 2026-08-04T00:47:52Z
commit_timestamp_asia_singapore: 2026-08-04T08:47:52+08:00
prepared_against_master_from_task: 5cc758caa6baf86de0cf67cda2d852724f5edbbb
binding_status: ALL_MANDATORY_TARGET_INPUTS_AVAILABLE
target_specific_mapping_status: COMPLETED
repository_writes_performed: false
target_truth_changed: false
methodology_promoted: false
operational_activation_performed: false
```

执行时最新 master 已晚于任务的 `prepared_against_master`。本报告因此绑定到实际读取的 `0865f334...`，而不是假定旧 commit 仍为最新状态。

| Mandatory input | 读取结果与角色保持 |
|---|---|
| `current/approved-spec.md` | 已读取。它是 Owner 接受但仍 inactive 的 sole designated target truth path；未将其解释为已 operationally active。fileciteturn2file0L2-L2 |
| `current/active-context.md` | 已读取。它是 non-execution current-state/navigation artifact，并明确记录无 pilot、无 private material、无 operational activation。fileciteturn3file0L2-L2 |
| `authority/source-and-owner-map.md` | 已读取。Owner 保留 purpose、truth、methodology promotion、privacy、write scope、migration 和 activation 的最终权力；platform permission 不等于 task authorization。fileciteturn4file0L2-L2 |
| `methodology/core-methodology.md` | 已读取。现有方法库已经要求 authority/source separation、bounded executor contracts、stop-on-ambiguity 与 no automatic promotion。fileciteturn5file0L2-L2 |
| `history/decision-version-and-migration-log.md` | 已读取。Owner disposition 为 `ACCEPT_WITH_LIMITATIONS`，operational status 仍 inactive，并已存在按影响分级的 change classes。fileciteturn6file0L2-L2 |
| `MA-DR-01-05-cross-report-synthesis-v0.1.md` | 已读取并保持其 `review_candidate_non_execution_source` 地位；其指出 human governance 与 scalable operation 之间仍存在未解决的 bottleneck。fileciteturn7file0L2-L2 |
| `MA-DR-01-05-gap-analysis-v0.1.md` | 已读取并保持 candidate/gap-analysis 地位；其将 dynamic delegation 与 managed autonomy 列为 P1 gap，并要求结合 uncertainty、reversibility、loss、evidence 与 human burden。fileciteturn8file0L2-L2 |
| `MA-DR-06-07-cross-report-adjudication.md` | 已读取并保持 non-execution evidence 地位；其已经把 Owner authority、privacy、irreversible actions 和 activation 放在 optimizer 外部。fileciteturn9file0L2-L2 |
| `Batch-A-candidate-change-ledger.md` | 已读取并保持 candidate-only 地位；其中 typed permissions、side effects、security–utility gates 均未成为 stable target controls。fileciteturn10file0L2-L2 |

`TARGET_SPECIFIC_INFERENCE`：当前 Meta-Agent baseline 已包含正确的 authority skeleton，但尚缺少一个可执行、可评估且不会 silent authority growth 的 delegation policy。现有 `MA-REQ-0011` 和 `MA-METHOD-0004` 描述 capability-aware decomposition，却尚未给出逐行动的动态 threshold、value-of-information 规则、approval-density 控制与 calibrated deferral policy。fileciteturn2file0L2-L2 fileciteturn5file0L2-L2

## 定义、边界与主要证据景观

**概念分离**

| 概念 | 本报告定义 | 不等同于 |
|---|---|---|
| **Agency** | 系统形成目标相关计划、选择步骤并根据观察调整行为的能力。 | 不等于合法 authority。 |
| **Autonomy** | 在给定边界内，无需逐步人工指令即可完成多少 sensing、analysis、selection 与 implementation。 | 不等于 unrestricted action。 |
| **Delegation** | 有权主体把一个明确任务、能力或行动范围交给另一个 actor，并附带期限、边界、验收与撤销条件。 | 不等于永久移交 ownership。 |
| **Authority** | 决定某行动是否被允许、谁有权改变规则、truth、privacy 或 product purpose 的规范性权力。 | 不等于 competence 或 confidence。 |
| **Competence** | actor 在某类任务上正确完成工作的经验能力。 | 不产生 permission。 |
| **Initiative** | actor 主动收集证据、提出下一步或触发预先允许的步骤的程度。 | 不产生 write scope。 |
| **Tool permission** | 可调用哪些工具、对哪些对象、执行哪些 verbs、使用哪些 credentials。 | 不表示所有调用都有业务授权。 |
| **Side-effect scope** | 行动可修改、披露、发送、删除或承诺的外部状态范围。 | 不应由模型自行估计后扩大。 |
| **Value judgment** | 对目的、优先级、公平、风险容忍、学习价值和可接受 trade-off 的选择。 | 不能从 accuracy score 推导。 |
| **Methodology/product authority** | 改变 Meta-Agent 方法、target truth、activation 或 product direction 的权力。 | 不属于运行时自适应。 |

`VERIFIED_PRIMARY_EVIDENCE`：Parasuraman、Sheridan 与 Wickens 的 framework 将自动化拆分为 information acquisition、information analysis、decision/action selection、action implementation 四类，并在每类上设置从 manual 到 automatic 的连续 level。这意味着“让 Agent 更自主”必须说明究竟自动化了哪一个阶段；自动搜索资料与自动执行不可逆动作并非同一种 autonomy。citeturn10search3

`VERIFIED_PRIMARY_EVIDENCE`：Horvitz 的 mixed-initiative 原则强调 automated services 与 direct manipulation 的耦合，而不是把全部控制交给一方；adjustable-autonomy 与 learning-to-defer 研究同样把“继续还是交给外部 decision-maker”视为系统级选择。citeturn11search1turn10academia24turn11academia48

**适用于 single-Agent、workflow 与 multi-Agent 的统一 taxonomy**

任何 arrangement 都可以用以下独立字段描述，而不必把“Agent 数量”当作 autonomy 的代理：

```yaml
delegation_object:
  task_competence_required:
  initiative_allowed:
  decision_authority:
  tool_permissions:
  side_effect_scope:
  evidence_requirements:
  verifier_or_reviewer:
  approval_pattern:
  time_and_budget_limit:
  expiry:
  rollback_or_recovery:
  owner_only_boundaries:
```

一个 multi-Agent team 可能每个成员都只有 read-only 权限；一个 single Agent 也可能拥有危险的 broad write 权限。因此 topology、capability 与 authority 必须分别建模。`RECOMMENDATION`

**风险适应行动分类**

建议用多轴 action vector，而非单一“低、中、高”标签：

```text
ActionRisk =
  authority_class
  × reversibility
  × blast_radius
  × uncertainty
  × evidence_quality
  × information_sensitivity
  × external_side_effects
  × legal_financial_security_impact
  × detectability
  × recovery_cost
  × time_pressure
  × cost_of_delay
```

| 维度 | 关键问题 | 升级信号 |
|---|---|---|
| Reversibility | 能否完整撤回？撤回是否真实恢复语义和外部后果？ | 删除、支付、发送、发布、credential rotation、外部承诺。 |
| Blast radius | 错误影响一个临时对象，还是多个项目、用户、系统或未来方法？ | 跨项目、共享 memory、production、公共发布。 |
| Uncertainty | 是否存在目标歧义、事实不确定、模型 OOD、工具状态不确定？ | 核心要求冲突、未知 domain、state drift。 |
| Evidence quality | 是否有 primary source、fresh state、deterministic test、independent check？ | 仅有模型自述、单一二手来源、过期状态。 |
| Sensitivity | 是否含 private data、credentials、customer data、personal records？ | 任意 secret、private source、身份或账户信息。 |
| External side effects | 是否修改或通知外部 actor？ | email send、deployment、merge、payment、permission grant。 |
| Legal/financial/security impact | 错误是否产生责任、损失或攻击面？ | 合同、税务、医疗、账户安全、access control。 |
| Detectability | 错误能否及时被 observability 捕获？ | 静默泄露、长期 poisoning、误导性 methodology。 |
| Time pressure | 延迟是否本身造成损失？ | incident response、短时窗口。 |
| Cost of delay | 等待人工与继续行动的相对损失是多少？ | 只能影响授权集合内的 routing，不能取消 hard gate。 |

`OFFICIAL_SPECIFICATION_OR_DOCUMENTATION_FACT`：NIST AI RMF 1.0 将风险管理作为跨 lifecycle 的持续活动，而不是仅凭一个模型分数作部署判断；其 Generative AI Profile 是 cross-sectoral companion resource，并于 2026 年更新了 publication metadata。citeturn12search2turn16search2

**Hard prohibition 与 risk-adjusted approval 的分离**

Hard prohibition 回答“这个系统在当前 authority 下是否有资格执行”；risk-adjusted approval 回答“已经有资格的行动需要多强的 review”。前者必须先于任何 expected-utility 或 confidence calculation：

```text
if authority_not_granted
or owner_only_decision
or prohibited_material
or credential_boundary_violation
or irreversible_action_without_fresh_human_approval:
    do not score into permissibility
    ABSTAIN or ESCALATE
```

把 authority、privacy 或 Owner decision 作为一个可被其他高分抵消的加权项，会产生“benchmark score 足够高，所以可以越权”的错误结构。Batch-A adjudication 已明确要求这些约束位于 optimizer 外部。`TARGET_SPECIFIC_INFERENCE` fileciteturn9file0L2-L2

