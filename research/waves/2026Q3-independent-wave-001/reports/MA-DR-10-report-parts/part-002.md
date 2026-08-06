| Safety cases / GSN | 区分 claim、argument、evidence、context 与 assumption；迫使 reviewer 检查“为何相信设计安全”。GSN Community Standard v3 提供标准化 safety-argument notation。citeturn3search3 | 图形完整性不等于证据真实性；巨大 assurance case 可能掩盖薄弱 evidence，且普通低风险 Agent 不需完整 safety case。 | 高风险 design 使用“mini assurance argument”；低风险只需 hazard-to-control-to-evidence 链。 |
| STPA / hazard analysis | 从 unacceptable losses、hazards、control structure、unsafe control actions 和 causal scenarios 推导 safety constraints；适合软件、人和组织交互的复杂系统。citeturn3search0turn3search16turn2search9 | 对无 side effect 的低风险 proposal-only design，完整 STPA 成本不成比例；其术语也需翻译为 Agent control loop。 | 对 tool-bearing、write-bearing、permission-bearing 或 autonomous loops 做缩减版 STPA。 |
| Socio-technical systems design | 把工作、人员、组织、技术和 responsibility allocation 视为整体；强调设计过程本身影响最终组织结构。citeturn8search0turn8search3 | 不能自动决定 model routing、prompt structure 或 software controls。 | 把 human workload、decision ownership、learning value 和 administrative burden 纳入 architecture quality。 |
| Human-centered design | ISO 9241-210 要求在生命周期中考虑 users、tasks、contexts、iteration 与 evaluation。citeturn2search1 | User satisfaction 不能覆盖 security、truth、authority 或 systemic safety；“用户喜欢”不等于 architecture 正确。 | 将 user goals、explanation needs、review burden 和 learning preservation 纳入，但不取代 hard gates。 |
| Workflow/process design | BPMN 等规范能明确 branches、events、loops、parallelism、messages 和 termination。citeturn2search0 | BPMN 不表达 model uncertainty、prompt context、tool permissions、source authority 和 memory contamination。 | 借用 control-flow discipline，不规定 BPMN 为 representation。 |
| Protocol design | RFC 2119/8174 的 MUST/SHOULD/MAY discipline 减少 normative ambiguity；RFC 3552 要求显式 Security Considerations、威胁、misuse 和 residual risk。citeturn8search2turn8search8turn8search7 | Network protocol 的 peer、message 和 failure assumptions 不完全适用于 stochastic Agents。 | 用 normative language 定义 gates、permissions、timeouts、retry 和 fallback。 |
| Software architecture review | Architecture review checklist 通常检查 stakeholder needs、quality attributes、interfaces、rationale、prior successes/failures 和 component provenance。NASA guidance 明确要求将 architecture 与 driving requirements、quality attributes、stakeholder concerns 和 component rationale 对齐。citeturn8search15 | 常规 review 可能不检查 hidden shared context、prompt injection、agentic tool use 或 evaluator collusion。 | 增加 Agent-specific failure taxonomy 与 adversarial review。 |

### 跨传统综合结论

**`MULTI_SOURCE_PATTERN`：**有效的 design synthesis 不应是“一次生成完整 architecture”，而应是一个逐步收敛循环：

```text
requirements clarification
↔ candidate architecture
↔ contract and hazard discovery
↔ trade-off analysis
↔ evidence and review
```

这一模式同时出现在 requirements lifecycle、contract refinement、ATAM spiral、STPA constraint derivation、human-centered iteration 和 ADR review 中。它支持一个**阶段化但非瀑布式**的 Meta-Agent 方法。

**`MULTI_SOURCE_PATTERN`：**representation 与 methodology 必须分离。ISO 42010 明确不规定记录 architecture description 的 format 或 media；BPMN、GSN、ADRs 和 trace matrices 都只是可能的 views，不是 architecture 本身。citeturn10view1turn2search0turn3search3turn1search11

**`RECOMMENDATION`：**设计质量至少应分成三层：

```text
semantic validity:
  design 是否满足目标、requirements 和 constraints

governance validity:
  authority、source、permission、human decision 和 truth boundary 是否正确

empirical validity:
  design 在现实或受控环境中是否优于强基线并保持安全、成本与可维护性
```

一份 polished specification 最多支持前两层的 review；它本身不能证明第三层。

## 表示中立的设计综合生命周期与最小档案

### Lifecycle diagram

```text
┌──────────────────────────────┐
│ Approved problem frame       │
│ goal / scope / authority     │
│ requirements / unknowns      │
└──────────────┬───────────────┘
               ▼
┌──────────────────────────────┐
│ Requirement operationalization│
│ scenarios / qualities / gates │
│ assumptions / hazards         │
└──────────────┬───────────────┘
               ▼
┌──────────────────────────────┐
│ Simplest viable design sketch│
│ fixed → direct → single →    │
│ workflow → multi-Agent       │
└──────────────┬───────────────┘
               ▼
┌──────────────────────────────┐
│ Responsibilities & contracts │
│ roles / I-O / handoffs       │
│ authority / tools / state    │
└──────────────┬───────────────┘
               ▼
┌──────────────────────────────┐
│ Control & operational design │
│ branches / loops / terminate │
│ observe / fallback / rollback│
└──────────────┬───────────────┘
               ▼
┌──────────────────────────────┐
│ Alternatives and baselines   │
│ counterfactuals / rationale  │
│ rejected options             │
└──────────────┬───────────────┘
               ▼
┌──────────────────────────────┐
│ Review and evidence package  │
│ trace / trade-offs / hazards │
│ adversarial & human review   │
└──────────────┬───────────────┘
               ▼
┌──────────────────────────────┐
│ Candidate disposition        │
│ ACCEPT_CANDIDATE / REVISE    │
│ EXPERIMENT / BLOCK / REJECT  │
└──────────────────────────────┘
```

主要迭代回路：

```text
contract discovery ───────────────→ requirement clarification
permission or hazard discovery ──→ topology simplification
observability gaps ──────────────→ workflow redesign
baseline superiority ────────────→ preferred design rejection
review disagreement ─────────────→ assumption/evidence refinement
```

该 lifecycle 是 `RECOMMENDATION`，不是 canonical Meta-Agent method。

### Stage-gate table

| Stage | 主要活动 | Entry criteria | Exit evidence | Iteration / stop / escalation |
|---|---|---|---|---|
| **Binding and framing receipt** | 绑定 approved frame、Owner、truth source、scope、source freshness、non-goals。 | 有经批准或明确标为 candidate 的 problem frame。 | Binding receipt；confirmed/pending/unknown split；prohibited assumptions。 | 若 purpose、Owner、truth source 或 sensitive scope 不明，`BLOCK` 并交由 Owner。 |
| **Requirement operationalization** | 把抽象要求转为 scenarios、quality attributes、invariants、failure definitions、acceptance evidence。 | Requirement provenance 可辨认。 | Requirement set、assumption register、quality scenarios、hard constraints、hazard seeds。 | 若无法判断何为成功或失败，回到 framing；不得通过设计猜测填补。 |
| **Simplest viable design sketch** | 从 fixed mechanism 开始，依次考虑 direct Agent、strong single-Agent、workflow、multi-Agent。 | 至少一个可测试 scenario。 | 最小候选 topology；为什么更简单机制不足或足够。 | 若简单方案满足 gates，不因“创新”继续增加 roles。 |
| **Responsibility and contract design** | 定义 roles、inputs/outputs、preconditions、guarantees、state access、handoffs、authority、tools 和 permissions。 | Candidate topology 存在。 | Responsibility map；interaction contracts；permission matrix；state ownership。 | 发现 circular delegation、ambiguous ownership、hidden state 或 unverifiable output 时，重构 topology。 |
| **Control and lifecycle design** | 定义 workflow、branches、parallelism、retry、timeouts、termination、fallback、rollback、deployment 和 observability。 | Role contracts 足够稳定。 | Control-flow view；termination proof sketch；failure handling；telemetry/evaluation hooks。 | 无 termination、不可恢复 side effect、无观测性或 rollback 时，hard fail。 |
| **Alternative and baseline generation** | 构造反事实方案，保持任务和 workflow 目标一致，改变最少的 architecture variables。 | Preferred candidate 可描述。 | Baseline ladder；comparison matrix；rejected alternatives；uncertainties。 | 若 preferred design 未明显超过简单基线，则选择基线或要求 experiment。 |
| **Review and evidence assembly** | Trace lint、contract review、hazard/security review、quality-scenario walkthrough、adversarial challenge、human decision。 | Dossier 概念内容完整。 | Gate results；scored trade-offs；review comments；open assumptions；evidence references。 | Critical gate failure → `REVISE/BLOCK`；reviewer disagreement → Owner/frontier escalation。 |
| **Disposition and handoff** | 声明候选状态、适用范围、证据强度、下一验证、revisit triggers。 | Review evidence 完整。 | `ACCEPT_CANDIDATE`、`REVISE`、`EXPERIMENT_REQUIRED`、`BLOCKED` 或 `REJECTED`。 | 没有 operational activation 的隐式转换；candidate 不能自动成为 truth。 |

### Stop conditions

方法不应追求“直到设计看起来完整”。出现以下条件时应停止或升级：

| Stop condition | 处置 |
|---|---|
| Core goal、non-goal 或 Owner preference 冲突 | Owner decision；AI 不自行裁决。 |
| Critical requirement 没有可观察 acceptance evidence | `BLOCKED_BY_UNTESTABLE_REQUIREMENT` 或重新 framing。 |
| 关键 permission、truth source 或 data sensitivity 不明 | 停止受影响 design；authority/security review。 |
| 设计依赖未证实的 provider/model behavior | 标记 assumption，加入 portability risk；必要时实验。 |
| Loop、delegation 或 retry 无有限 termination | `REJECT/REVISE`，不得以 runtime monitoring 替代设计。 |
| Preferred architecture 不优于 viable simple baseline | 选择 simple baseline，或进入 bounded experiment；不以 sophistication 辩护。 |
| Reviewer 只能凭“看起来合理”确认 handoff/output | 增加 independently verifiable evidence contract。 |
| 新 design 引入不可逆 side effect 且无 rollback/compensation | Owner/high-risk review；在解决前 blocked。 |
| Evidence package 成本超过预期价值 | 降级到 proportional profile，或拒绝不必要复杂性。 |
