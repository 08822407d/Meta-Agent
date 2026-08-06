| Verification | 每个 critical claim 是否有独立可检查 evidence；是否依赖 self-evaluation？ |
| Security | 是否考虑 malicious requirement、indirect prompt injection、tool-output injection、memory poisoning 和 confused deputy？ |
| Portability | 是否声明 capability assumptions、provider-specific behavior 和 degraded semantics？ |
| Observability | 是否能重建关键 decisions、tool use、retries、failures 和 human approvals？ |
| Recovery | rollback 是真实 state restoration/compensation，还是只写了“重试/备份”？ |
| Learning value | AI 是否给用户展示 alternatives 和 trade-offs，而不是替用户悄然完成 architecture judgment？ |
| Burden | dossier、review、logging 和 approval cost 是否与风险相称？ |
| Uncertainty | unresolved assumptions 是否有 owner、impact、falsifier 和 revisit trigger？ |

### Alternative and counterfactual baseline procedure

Alternative generation 不应从“发明更多 architectures”开始，而应从**保持任务不变、逐步增加必要自由度**开始。

```text
B0  Fixed mechanism / manual checklist
B1  Direct Agent
B2  Strong single-Agent
B3  Deterministic workflow with bounded Agent steps
B4  Same-workflow single-Agent simulation
B5  Human-authored design
B6  Homogeneous multi-Agent design
B7  Genuinely heterogeneous multi-Agent design
```

| Baseline | 必须包含的强版本 | 何时有意义 |
|---|---|---|
| **B0 Fixed mechanism** | Template、rules、search/filter、script 或 manual process，不能故意做成弱基线。 | 任务高度重复、decision space 小、结果可机械验证。 |
| **B1 Direct Agent** | 清晰 instruction、必要 tools、单次或 bounded interaction；不是故意省略上下文。 | 检验 workflow overhead 是否真的必要。 |
| **B2 Strong single-Agent** | Planning、tool use、structured scratch、self-check、bounded retry、完整 context。 | 检验 role separation 是否带来非模拟性收益。 |
| **B3 Deterministic workflow** | 明确 stages、branches、validators 和 human gates；Agent 只用于无法机械完成的节点。 | 任务结构稳定但包含局部 ambiguity。 |
| **B4 Same-workflow single-Agent simulation** | 用同一 Agent 串行模拟 planner/writer/reviewer，并隔离必要 context。 | 分离“workflow benefit”与“多 Agent identity benefit”。 |
| **B5 Human-authored design** | 由熟悉问题的人按同一 dossier/rubric 设计，不给予额外隐藏信息。 | 评估 AI synthesis 是否减少时间或改善 coverage。 |
| **B6 Homogeneous multi-Agent** | 相同 model class、不同 roles；明确 coordination 和 state cost。 | 测试 role specialization 或 parallelism，而不声称真正能力异质。 |
| **B7 Heterogeneous multi-Agent** | 不同 tools、permissions、evidence channels、expertise 或 trust boundaries，并证明不能由单 Agent 安全模拟。 | 只有真正需要 segregation、independent evidence、parallelism 或 capability separation 时。 |

程序如下：

```text
freeze problem frame and hard constraints
→ construct B0–B5 before preferred complex design
→ vary one major architectural dimension at a time
→ include B6/B7 only when justified
→ run static hard-gate review
→ compare feasible designs on separate dimensions
→ preserve Pareto set, not one opaque total score
→ Owner selects or authorizes experiment
```

比较维度必须至少包括：

```text
requirement coverage
hard-gate compliance
outcome quality
false-success risk
cost and latency
coordination/handoff burden
permission and attack surface
human review/rework
observability and recoverability
portability/maintenance
administrative burden
user learning value
```

Automated Agent design research表明，workflow 或 Agent code 可以通过 search 获得 benchmark gains；ADAS 和 AFlow 分别展示了 meta-agent/code-search 与 MCTS-based workflow generation 的可行性。citeturn9academia47turn9academia48 但这些结果不能直接证明生产 architecture quality：它们依赖有限 benchmark、evaluation functions、search operators、model/tool versions 与 budget，并面临 evaluator co-adaptation 和 benchmark overfitting。RobustFlow 进一步显示，语义等价的 requirement phrasing 可导致生成 workflow 不一致，这意味着 design synthesis 必须把 paraphrase stability 视为待验证属性，而不是自然成立。citeturn9academia49

因此，**`RECOMMENDATION`：complexity 永远不进入 objective function 作为正向奖励；它只能作为成本、风险或为满足 requirement 所付的代价。**

### Traceability and rationale model

概念实体：

```text
R  requirement or quality attribute
C  constraint or invariant
A  assumption
E  evidence or source
H  hazard or risk
O  explicit Owner preference/decision
D  design decision
W  design element:
     role / workflow step / tool / memory / permission / state
V  verification or evaluation
X  alternative or rejected option
```

允许的主要关系：

```text
D satisfies R
D constrained_by C
D justified_by E
D selected_by O
D mitigates H
D relies_on A
W realizes D
V verifies R or D
X rejected_because R/C/H/O/E
D conflicts_with another D
D supersedes prior D
```

最小 trace invariants：

1. 每个 load-bearing `D` 必须至少有一个来自 `R`、`C`、`E`、`H` 或 `O` 的入边。
2. 每个 critical `R/C/H` 必须至少有一个 design response 和一个 verification route，或明确标记 unresolved。
3. 每个 permission、persistent memory、external side effect 和 human override 都必须有直接 justification；不能仅继承自 role。
4. 每个 rejected alternative 必须保存 rejection reason、evidence state 与 revisit trigger，防止在上下文丢失后无意复活。
5. Assumption 必须有 impact、owner、confidence、falsifier 和 expiry/review trigger。
6. Trace link 必须区分“claims to satisfy”与“verified to satisfy”；设计者自述不能自动成为 verification。
7. Evidence、candidate、rationale 和 rejected option 不因被写入同一 dossier 而成为 target truth。

推荐的简洁 rationale record：

```yaml
decision_context:
decision_question:
driving_requirements:
hard_constraints:
options_considered:
selected_candidate:
reasoning:
evidence:
tradeoffs_and_consequences:
assumptions:
uncertainty:
rejected_options:
verification_needed:
revisit_trigger:
decision_authority:
status: candidate | owner_selected | rejected | superseded
```

此 YAML 只是可读示例，不是 schema proposal。

## Meta-Agent 候选方法、审阅框架与实验依赖

### Meta-Agent-specific mapping

仓库 target truth 已要求：multi-Agent 非默认；design 可包含 roles、workflow、memory、handoff、routing、evaluation 和 human-decision boundaries；user 是 product purpose、truth、privacy、methodology promotion 和 operational acceptance 的最终 authority；v0.1 是 file-based、human-reviewed、inactive baseline。fileciteturn2file0L2-L2

现有方法与候选方法之间的关系应保持为“补充而非重写”：

| Existing method | 候选 design-synthesis method 的接口 |
|---|---|
| `MA-METHOD-0001` Requirement and problem framing | 接收 approved problem frame、requirements/status split、assumptions、evidence gaps 与 stop conditions，不自行重定义 goal。 |
| `MA-METHOD-0002` Single-Agent versus multi-Agent decision | 接收初步 topology posture；通过 stronger baseline 和 contract discovery 允许回退到更简单 topology。 |
| `MA-METHOD-0003` Authority/source/memory separation | 把 Owner、truth source、source roles、memory roles 和 promotion boundaries 作为 hard constraints。 |
| `MA-METHOD-0004` Capability-aware decomposition | 把 design activities 划分为 frontier judgment、bounded candidate drafting、mechanical checks 与 human-only decisions。 |
| `MA-METHOD-0005` Evaluation/promotion gate | 输出 testable dossier、baselines、acceptance evidence 与 unresolved assumptions，供 evaluation；不自行宣布 empirical validation。 |
| `MA-METHOD-0006` Handoff/fresh-session continuity | Dossier 必须可由 fresh qualified reviewer 恢复，不依赖 hidden conversation。 |

这是 `TARGET_SPECIFIC_INFERENCE`。它不修改六个方法的语义，也不发行后续方法 ID。

### Candidate method: Frame-to-Design Dossier Cycle

```yaml
candidate_name: Frame-to-Design Dossier Cycle
candidate_status: research_recommendation_only
canonical_IR_assumed: false
operational_execution_authorized: false
methodology_promotion_authorized: false
```

**Inputs**

```text
approved problem frame
confirmed/pending/unknown requirement split
Owner and authority map
truth-source and source-role map
constraints and non-goals
available evidence
risk/material/tool boundaries
initial topology posture
budget and expected assurance profile
```

**Process**

```text
bind and normalize
→ operationalize requirements and quality scenarios
→ construct simplest viable design
→ define roles/contracts/state/tools/permissions
→ define workflow/termination/fallback/rollback
→ generate strong alternatives and counterfactual baselines
→ build trace/rationale/hazard/evidence package
→ run hard gates
→ score only feasible candidates
→ human/frontier review
→ candidate disposition
```

**Outputs**

```text
implementation-neutral design dossier
baseline and alternative package
traceability/rationale map
risk/hazard and permission review
hard-gate result
scored trade-off profile
unresolved assumptions and Owner decisions
validation/experiment dependency
candidate disposition and handoff
```

**Stop and escalation**

```text
Owner:
  purpose, non-goals, priorities, risk acceptance,
  truth/authority/privacy, irreversible actions,
  final architecture selection, activation

frontier review:
  novel architecture, conflicting requirements,
  ambiguous authority, high-impact security,
  non-convergent tradeoffs, methodology implications

bounded execution:
  frozen self-contained drafting,
  trace generation, linting, scenario expansion,
  sandboxed evaluation under exact limits

mechanical:
  required-field checks, orphan traces,
  permission completeness, cycle/termination checks,
  source freshness, version/diff checks
```

**Validation before any methodology promotion**

| Evidence required | Why |
|---|---|
| Cross-domain synthetic cases | 确认方法不只是 software-engineering documentation pattern。 |
| Comparison with strong human-authored and single-Agent baselines | 证明 dossier cycle 提供额外 coverage 或降低 rework，而非只增加 paperwork。 |
| Reviewer agreement and defect detection | 测量 rubric 是否能稳定发现真实 design flaws。 |
| Paraphrase/underspecification stability | 检查相同 problem frame 是否产生不合理 topology drift。 |
| Administrative-burden measurements | 防止方法因成本过高而被形式化执行或绕过。 |
| Security/authority challenge cases | 检查 poisoned requirements、overgranting、source laundering 和 false success。 |
| Fresh-session reconstruction | 证明 dossier 消除了 hidden context dependence。 |
| Negative and null results | 防止只记录成功案例并自动提升 methodology。 |

### Hard gates and scored review rubric

Hard gates 先于评分；任何 critical hard-gate failure 均不能由其他维度高分抵消。

| Hard gate | PASS 条件 | Failure disposition |
|---|---|---|
| **Identity and authority** | Owner、truth source、artifact status、source roles 明确且不冲突。 | `BLOCKED` |
| **Requirement integrity** | Confirmed、pending、unknown、assumption、non-goal 可区分。 | `REVISE/BLOCKED` |
| **Simple baseline** | 至少有一个强而可行的 simpler counterfactual。 | `REVISE` |
