**Uncertainty、selective prediction 与 abstention**

`VERIFIED_PRIMARY_EVIDENCE`：现代 neural networks 的 confidence 可能 miscalibrated；Guo 等人的实验显示 architecture 与 training choices 会影响 calibration，temperature scaling 在其测试设置中经常有效，但这并不等于跨任务、跨模型、跨 distribution 的通用保证。citeturn10search0

LLM self-evaluation 提供有用信号，但证据同时给出明确限制。Kadavath 等发现，在合适格式和一些任务上，larger models 可表现出有意义的 `P(True)` calibration；同一研究也报告 `P(IK)` 在新任务上的 calibration struggle。Yin 等对 20 个 LLM 的研究则发现，模型识别 unknowns 的能力仍与人类存在显著差距。citeturn17academia49turn17academia48

`VERIFIED_PRIMARY_EVIDENCE`：在 ambiguous task 上，LLM 可以保持较高 self-consistency，同时对自身 consistency 既 over-confident 又 under-confident，并可能仍给替代答案分配大量 probability mass。因此，多次采样“答案一致”不能单独证明答案正确、目标清晰或行动被授权。citeturn15search3

Semantic entropy 可检测一类由任意、无根据生成造成的 confabulations，并通过 selective rejection 改善剩余回答的准确率；但作者明确指出，它不检测系统性错误，也不保证 factuality。故其可作为 `VERIFY` 或 `ABSTAIN` 的一个 signal，而不能成为 permission gate。citeturn15search1turn15search2

Conformal prediction 可为特定、满足假设的任务提供 empirical coverage；在 LLM multiple-choice QA 中，prediction-set size 与 accuracy 有相关性。但保证依赖 calibration data 与 exchangeability，out-of-subject 或 distribution shift 会削弱适用性。citeturn17academia50

由此建议使用**多信号 uncertainty bundle**：

```yaml
uncertainty_bundle:
  task_specific_empirical_error:
  calibrated_probability_if_available:
  selective_risk_or_coverage:
  source_quality_and_freshness:
  deterministic_checks:
  independent_model_or_human_disagreement:
  semantic_or_sample_instability:
  out_of_distribution_signal:
  tool_state_freshness:
  unresolved_requirement_conflict:
```

模型 verbal confidence 或 self-reported certainty 只能是 bundle 中的弱信号之一。`RECOMMENDATION`

## 主要方法、审批模式与负面证据

**Managed-autonomy ladder**

该 ladder 描述“在既定 authority ceiling 下允许多少 initiative 和 side effects”，不授予新 authority：

| Level | 名称 | Agent 可做什么 | 典型 gate |
|---|---|---|---|
| `M0` | Prohibited / abstain | 拒绝越权步骤，保存最小必要解释，指向 Owner。 | Hard prohibition、无权限、敏感材料、不可恢复风险。 |
| `M1` | Advisory | 分析、解释、列选项、生成 proposal；无工具 side effect。 | 允许的公开或 synthetic context。 |
| `M2` | Read-and-verify | 使用 bounded read-only tools、核验来源、比较状态、运行无副作用检查。 | 数据类别与 read scope 已授权。 |
| `M3` | Preview / dry-run | 生成 diff、plan、simulation、preview、validation report；不持久化。 | 工具具有可信 dry-run semantics；preview 与 apply state 绑定。 |
| `M4` | Scoped reversible execution | 在限时 session grant 内执行局部、可回滚、可检测的写操作。 | exact object/path/verb、budget、expiry、rollback、audit。 |
| `M5` | Staged high-impact action | Agent 准备最终 artifact 与 evidence package，但等待 fresh approval。 | 对 exact plan/hash/state 的 per-action 或 independent approval。 |
| `M6` | Owner-only terminal boundary | Agent 不自主执行，只能解释、准备或记录 Owner decision。 | target truth、authority、privacy、credentials、activation、不可逆高影响行动。 |

`INDUSTRY_PRACTICE`：Terraform 的 `plan` 与 `apply` 分离展示了 preview-before-commit 模式；官方文档同时警告 speculative plan 可能因目标状态变化而与最终效果不同，说明 approval 必须绑定 fresh state，而不是批准一个已过期的摘要。citeturn12search1turn12search3turn12search4

`OFFICIAL_SPECIFICATION_OR_DOCUMENTATION_FACT`：Kubernetes dry-run 会经过 admission、validation 和 conflict handling，但不持久化并保证无其他 side effects；其文档也明确指出 generated fields 可能与实际执行不同，而且 dry-run 权限与真实写权限相同。换言之，dry-run 降低 execution risk，却不等于 permission。citeturn18search0turn18search1

**Approval-pattern comparison matrix**

| Pattern | 适用条件 | 优点 | 主要失败方式与 burden |
|---|---|---|---|
| **Per-action approval** | 不可逆、高影响、外部可见、state-sensitive action。 | 审批对象精确；便于将 consent 绑定到 plan 与当前状态。 | 高频使用造成 approval fatigue；用户可能机械点击；等待造成 latency。 |
| **Scoped session approval** | 一段时间内重复、同质、低至中风险、可撤销步骤。 | 显著减少逐步打断；不必永久授权。 | Scope 表述过宽、语义漂移、session 被劫持、expiry 过长。 |
| **Capability grant** | 稳定而狭窄的 verb/object/data class，例如特定 repo 的 read。 | 可由 policy engine 机械执行 least privilege。 | “write”或“send”之类 capability 可能过于粗；业务授权仍需另行判断。 |
| **Independent or two-person gate** | security、financial、legal、production、truth/authority change。 | 防止 initiator 自批；引入不同视角。 | 两人可能共享同一错误来源；仅“人数为二”不保证 independence；协调成本高。 |
| **Expiring exception / break-glass** | 紧急事件且等待造成显著损失。 | 允许处理 time-critical risk；可自动失效。 | 例外常态化、反复续期、事后审计缺失、过宽 emergency scope。 |
| **Preview / dry-run / reversible plan** | 可以模拟或明确展示 side effects 的写操作。 | 降低 surprise；支持人类高效验证。 | preview/apply mismatch、stale state、隐藏 side effect、rollback 不完整。 |
| **Policy-as-code** | 可形式化的 invariant、path/verb/data-class rules。 | 一致、可测试、可版本化；decision 与 enforcement 可分离。 | 未编码的风险不被发现；policy bug 或 fail-open；维护与解释成本。 |
| **Post-hoc audit** | 低风险、高流量、可检测且可恢复的操作。 | 最低实时审批负担；适合 sampling。 | 对不可逆、低 detectability 或快速扩散的损害无效。 |

GitHub Actions environments 展示了 required reviewer、prevent self-review、approval 前不释放 environment secrets 等模式，但官方默认只需列出的 reviewer 中一人批准，且某些配置允许管理员 bypass；因此它是 gating primitive，不自动等于严格 two-person rule。citeturn13search0turn13search1

AWS temporary credentials 展示了 capability grant 的 expiry 与 revocation 模式；较长 session 会增加 credential exposure 风险，而 revocation 本身也可能使现有用户丢失未保存工作。故 expiry、revocation 与 blast-radius 评估必须共同存在。citeturn13search3turn13search6

OPA 将 policy decision-making 与 enforcement 解耦，并使用 declarative policy-as-code；Kubernetes admission policy 进一步区分 `Deny`、`Warn` 和 `Audit`。这支持把 hard gate、soft warning 与 audit-only policy 明确分开，而非让所有规则都成为 blocking approval。citeturn12search0turn18search3

**失败模式与 negative evidence**

| 失败模式 | 证据或推理 | 对政策的含义 |
|---|---|---|
| Automation bias | 专家与新手都可能出现 omission/commission errors；简单 training 或 instruction 不能完全消除。citeturn14search0 | 不把“有人在环”视为充分控制；必须改善 review information quality。 |
| Out-of-the-loop degradation | 自动化下 passive processing 与较低 situation awareness 会减慢 failure takeover。citeturn14search2 | 保留 active checkpoints、可验证 evidence 与 periodic manual competence。 |
| Algorithm aversion | 人看到算法犯错后可能过度弃用，即使算法总体仍优于人。citeturn16search9 | 同时测 over-reliance 和 under-reliance，不能只追求更高接受率。 |
| Explanation-induced overtrust | 很多 explanations 不能帮助验证正确性，甚至增加 over-reliance；只有支持 efficient verification 的 explanation 才更可能产生 complementary performance。citeturn14search6turn14search7 | 审批界面应展示可检查的 diff、test、source、scope、rollback，不是冗长 rationale。 |
| Self-consistency illusion | 一致回答可能仍不校准，且模型内部仍保留竞争答案。citeturn15search3 | self-consistency 不能独立触发 `PROCEED`。 |
| Systematic-error blind spot | Semantic entropy 主要检测 confabulation，不检测 consistently wrong output。citeturn15search1 | 必须加入 external evidence、oracle、cross-source 与 regression tests。 |
| Conformal guarantee misuse | Coverage 依赖 exchangeability 与 calibration regime。citeturn17academia50 | Distribution shift 时降级为 empirical signal，并触发 recalibration。 |
| Alert/approval fatigue | 2026 systematic review 发现 alert fatigue 的 operational definition 极不一致；22 个 reviews 中仅一个明确给出定义，raw quantity、override 和 acceptance rate 都不足以独立证明 fatigue。citeturn16search0turn16search4 | 监测“相对于基线的持续 appropriate-response decline”，而不只统计 clicks。 |
| Correlated independent review | 两个 reviewer 若共享相同模型、prompt、source 或组织激励，错误并不独立。 | Gate 应记录 reviewer diversity 与 evidence independence。`RECOMMENDATION` |
| Historical-success authority creep | 低 observed failure 可能来自 selection bias、低难度样本、漏报或 distribution stability。 | 历史性能只调 review intensity，不能调 authority ceiling。`RECOMMENDATION` |
| Rollback theater | 技术对象可恢复，不代表外部通知、泄露、市场影响或 human decision 已恢复。 | Reversibility 必须按 semantic/external consequence 定义，而非仅“有 backup”。`RECOMMENDATION` |
| Human expert fallibility | Learning-to-defer 依赖 downstream expert performance；获取足够且当前的 expert labels 本身成本高，专家也可能有 bias。citeturn10academia24turn10academia25turn11academia48 | “Escalate to human”不是零风险终点；应路由到合适、可用且有权限的 reviewer。 |

## Meta-Agent 映射与候选决策框架

**与现有 target baseline 的映射**

| 现有对象 | MA-DR-12 证据带来的候选解释 | 权威状态 |
|---|---|---|
| `MA-REQ-0011` capability-aware work split | 从 task class 扩展为逐行动 risk vector、evidence state 与 decision outcome。 | `TARGET_SPECIFIC_INFERENCE`，不修改 requirement。 |
| `MA-REQ-0013` Owner authority | 建议落实为 non-learnable hard gates，而不是 weighted preferences。 | 与现有 truth 一致，不产生新 ID。 |
| `MA-METHOD-0001` framing | 在 ask user 前先判断是否可通过 authorized read-only evidence gathering 消除不确定性。 | Candidate refinement。 |
| `MA-METHOD-0003` authority/source separation | 增加 permission、competence、value judgment 与 side-effect scope 的 typed separation。 | Candidate refinement。 |
| `MA-METHOD-0004` decomposition/escalation | 增加 ladder、VOI、review intensity 与 abstention policy。 | Candidate refinement。 |
