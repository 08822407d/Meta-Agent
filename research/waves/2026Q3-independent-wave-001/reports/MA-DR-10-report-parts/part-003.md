| 多轮 refinement 不再减少 uncertainty 或 risk | 记录 non-convergence，转为 experiment 或 Owner choice。 |

### Minimal design-dossier content model

以下是概念内容模型，不是 canonical IR：

| Conceptual section | 最小内容 | 审阅问题 |
|---|---|---|
| Identity and status | design name、scope、version、candidate status、author/reviewer、source ref。 | Reviewer 是否知道自己审查的精确对象？ |
| Problem and outcome | approved goal、users/stakeholders、success、failure、non-goals。 | 是否把 proposed solution 误当成 requirement？ |
| Requirement set | functional needs、quality attributes、constraints、acceptance evidence。 | 每项是否来源明确、可判定？ |
| Assumption register | assumption、owner、confidence、falsifier、expiry/revisit trigger。 | 哪项 assumption 失败会破坏 design？ |
| Authority and sources | Owner、truth source、source priority、human-only decisions。 | Evidence、context 或 Agent output 是否可能越权成为 truth？ |
| Topology rationale | fixed/direct/single/workflow/multi choice 与 coordination-cost argument。 | 为什么需要这些 roles，而不是更简单结构？ |
| Roles and responsibilities | 每个 role 的 purpose、inputs、outputs、prohibited actions、escalation。 | 是否有重复、孤立或权责不对称 role？ |
| Workflow/control | sequence、branches、loops、parallelism、timeouts、termination。 | 是否有 circular delegation、deadlock、livelock 或 infinite retry？ |
| Interaction contracts | producer/consumer、schema concept、pre/postconditions、verification、failure semantics。 | Handoff 是否可由 receiver 独立验证？ |
| State and memory | state owner、lifetime、scope、write rules、freshness、contamination handling。 | 是否存在 hidden shared state 或 unauthorized promotion？ |
| Tools and capabilities | tool purpose、capability requirements、fallback、version/freshness assumption。 | Tool 是必要的，还是 prompt cargo culting 的装饰？ |
| Permissions and effects | read/write/execute/send/delete scope、resource、expiry、approval、compensation。 | 是否 least privilege；是否把 platform access 当成 task authorization？ |
| Human decision map | decision、decision owner、timing、evidence shown、default on no response。 | 人是否保留目的、risk acceptance 和 irreversible-action control？ |
| Evaluation and observability | success metrics、hard gates、logs/traces、false-success checks、review sampling。 | 能否区分 claimed success 与 verified success？ |
| Deployment assumptions | runtime class、network、credentials、concurrency、budget、portability/degradation。 | Design 是否隐藏 provider-specific assumptions？ |
| Fallback, rollback and recovery | trigger、safe state、compensation、reconstruction、handoff。 | “重新运行”是否错误地被当成 rollback？ |
| Risk and hazard register | loss、hazard、cause、control、residual risk、owner。 | Controls 是否有 evidence，而不仅是声明？ |
| Alternatives and rationale | baseline ladder、rejected options、trade-offs、Owner preferences。 | 是否只为 preferred design 找理由？ |
| Trace and evidence index | requirements→decisions→components→checks；source dates；review findings。 | 是否存在 orphan design element 或 untested requirement？ |
| Open questions and disposition | unresolved、blocked、experiment dependency、revisit date、status。 | Reviewer 是否能区分 accepted、candidate、unknown 和 rejected？ |

**Minimality rule：**删除某一 section 后，如果 reviewer 仍能可靠判断 requirement satisfaction、authority correctness、failure containment 与 alternative superiority，则该 section 可按 profile 缩减；若删除后必须依赖 hidden conversation context，它就不是可选项。

## Agent 特有失效模式、替代方案与 rationale trace

### Design-failure taxonomy

多 Agent 研究提供了重要负面证据。对五种常见 multi-Agent frameworks、超过 150 个任务的分析识别出十四类 failure modes，集中在 specification/system design、inter-Agent misalignment、task verification 和 termination 等领域；仅增加角色说明或 orchestration 提示并不足以消除系统性问题。citeturn4academia1 近期 strong single-Agent baseline 研究还显示，一些 homogeneous multi-Agent workflows 的收益可以被更强的 single-Agent control flow 复现，同时减少 coordination overhead；真正的 heterogeneity 需要独立论证。citeturn4academia0

| Failure family | 典型症状 | 为什么危险 | Review detector | Candidate control |
|---|---|---|---|---|
| **Requirement substitution** | 把用户建议的 Agent team 当作已确认需求；从 solution 倒推出 problem。 | 使 topology 免于比较并隐藏 simpler alternatives。 | 每项 requirement 是否有 source；是否存在 solution-free problem statement。 | Problem/solution split；baseline-first generation。 |
| **Role proliferation** | planner、manager、critic、reviewer、router 等 roles 不断增加，但没有独特 authority、tool 或 context。 | 增加 handoff、latency、state drift 和 attack surface。 | 删除某 role 是否不改变 capability、permission 或 independent evidence？ | Role necessity test；merge simulable roles。 |
| **Prompt cargo culting** | 角色主要由人格化 prompt 区分，没有 contract、state 或 permission boundary。 | Persona wording 无法建立 architecture guarantee。 | Role 差异是否只存在于 adjectives 和 system prompt？ | 用 responsibility/contract 差异替代 persona 差异。 |
| **Premature multi-Agent decomposition** | 在 fixed mechanism 或 single-Agent baseline 未建立前选择 team。 | complexity 成为目标；无法判断 coordination 是否有价值。 | 是否存在 strong single-Agent 与 same-workflow simulation。 | Mandatory baseline ladder；coordination-cost budget。 |
| **Circular delegation** | A 让 B 规划，B 让 A 验证；manager/worker 相互等待。 | 产生 deadlock、infinite recursion 或 accountability gap。 | Interaction graph cycle 是否具有 bounded progress invariant。 | Cycle justification、iteration cap、single decision owner。 |
| **Ambiguous authority** | 多个 roles 都能 approve、write、publish 或修改 shared truth。 | 造成 confused deputy、conflicting decisions 和 silent truth mutation。 | 每个 irreversible action 是否只有一个 authorization route。 | Authority ceiling；single truth source；Owner gate。 |
| **Tool overgranting** | Reviewer 与 writer 都有 write/send/delete；只因平台支持便授权。 | 一次 prompt injection 可扩大 blast radius。 | 每项 permission 是否由 requirement/risk 直接支持。 | Least privilege、task-local expiry、read-only default。 |
| **Hidden shared state** | Agents 假定共享 conversation、scratchpad、files 或 memory，但 dossier 未定义。 | Handoff 无法重现；fresh session 行为漂移。 | Receiver 是否能仅凭 declared inputs 继续。 | Explicit state inventory、owner、lifetime 和 source role。 |
| **Brittle context assumptions** | 依赖固定 prompt order、特定 token window、implicit examples 或 model quirks。 | 小幅 paraphrase、context truncation 或 backend change 即失效。 | Paraphrase/context-loss review；fresh-session test。 | Canonical requirement package；context minimum；fallback。 |
| **Memory contamination** | Project-specific output、malicious source 或 rejected idea 被写入 general memory。 | 错误可能跨任务传播并“复活”。 | 每次 memory write 是否有 origin、allowed influence 和 promotion gate。 | Quarantine、provenance、semantic tombstone、clean rebuild。 |
| **Unverifiable handoff** | Output 是 prose confidence statement，receiver 无法重算或检查。 | 产生 false success；错误在多层转交中被洗白。 | 是否有 evidence bundle、acceptance test、source links 和 uncertainty。 | Producer/consumer contract；independent verification。 |
| **Missing termination** | “继续改进直到满意”“让 agents 达成共识”。 | 无限成本、livelock、collusion 或 score chasing。 | 是否定义 max iterations、progress metric 和 no-progress stop。 | Explicit budget、timeout、iteration cap、fallback owner。 |
| **Evaluator/executor coupling** | 同一 Agent 制定计划、执行、定义 rubric 并宣布成功。 | Reward hacking、self-confirmation 与 undetected errors。 | 谁定义 success；谁产生 evidence；谁可 override。 | Deterministic oracle where possible；independent review sample；human gate。 |
| **False independence** | 多个 Agents 使用同一 model、context、sources 和 prompt pattern，却被称为 independent reviewers。 | Correlated errors 被误当成共识。 | Reviewers 是否有 genuinely different evidence、tools 或 isolation。 | 声明 independence type；不把 role count 当作 evidence diversity。 |
| **Workflow/data mismatch** | Workflow 假定 structured input，但现实输入含 ambiguity、conflict 或 missing fields。 | 失败被错误路由成 confident output。 | Contract 是否定义 malformed/unknown/conflicting input。 | Typed failure states；clarification/escalation branch。 |
| **Observability omission** | 只记录 final answer，不记录 decisions、tool calls、retries、permission denials。 | 无法调试、复现或区分 design failure 与 runtime failure。 | 是否能回答“哪个 decision 在何证据下产生”。 | Proportional event/evidence log；decision trace。 |
| **Provider lock-in by accident** | Design 假设特定 hidden context、tool-calling semantics 或 model identity。 | 后端替换时 silent semantic degradation。 | Capability assumptions 是否显式；unsupported behavior 是否有 fallback。 | Capability-based requirements；degradation declaration。 |
| **Administrative overdesign** | 每个小任务都要求完整 safety case、ADRs、trace graph、数十 gates。 | Review burden 超过 value，引发形式化造假和 stale records。 | Dossier authoring/review cost 是否被测量。 | Lite/Standard/High-Assurance profiles。 |

AgentDojo 说明 tool-using Agents 需要同时检查 benign utility 与 security：该 benchmark 使用形式化、确定性的 utility/security checks，并展示 prompt injection 防御可能在安全和任务完成之间产生 trade-off。citeturn6academia46 ToolEmu 的模拟高风险工具研究也发现，Agent failures 不只是理论可能；其测试框架从大量 scenarios 中识别出可被人类判断为现实有效的失败案例。citeturn6academia47 这支持把 permission、side effect 和 false-success controls 置于 design review，而不是留到 implementation 后补。

### Review checklist

Reviewer 至少应能对下列问题回答“有证据的 yes / no / unknown”，而不是“看起来不错”：

| Review area | Checklist |
|---|---|
| Purpose | 是否存在 approved goal、success、failure 和 non-goals？是否区分 user statement、evidence 与 inference？ |
| Simplicity | fixed mechanism、direct Agent 和 strong single-Agent 是否被真实比较？每个 role 是否有不可替代的 responsibility？ |
| Contracts | 每个 handoff 是否定义输入、输出、acceptance、failure 和 timeout？ |
| State | 所有 shared/persistent/task-local state 是否有 owner、scope、freshness 和 write rule？ |
| Authority | 谁能决定、approve、write、publish、delete、promote？platform access 是否被错误当成 authorization？ |
| Permissions | 每个 tool permission 是否必要、最小、可撤销、有限期，并有 side-effect classification？ |
| Control | loops、retry、delegation、parallelism 是否有 progress condition、termination 和 fallback？ |
