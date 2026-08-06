| **Responsibility closure** | 每项 critical responsibility 有唯一 accountable owner，无 orphan/circular delegation。 | `REVISE` |
| **State declaration** | Shared/persistent state 均有 owner、scope、freshness、write/promotion rule。 | `BLOCKED` |
| **Permission correctness** | External side effect 明确、least-privileged、task-local、可批准、可撤销或可补偿。 | `BLOCKED` |
| **Termination and recovery** | Loops/retries 有 finite bounds；failure、fallback、rollback/recovery 明确。 | `BLOCKED` |
| **Independent verifiability** | Critical outcomes 有可由 receiver/reviewer 独立检查的 evidence。 | `REVISE/BLOCKED` |
| **Security/hazard proportionality** | 按风险处理 injection、confused deputy、memory contamination、misuse 和 residual risk。 | `BLOCKED` for critical risk |
| **Uncertainty escalation** | Critical unknowns 没有被 silent assumption 替代，并有 decision/experiment path。 | `BLOCKED` |
| **Material boundary** | 未授权 private/sensitive/prohibited material 未进入 design evidence package。 | `BLOCKED` |
| **No implicit promotion/activation** | Candidate、research、evaluation result 没有被描述为 target truth 或 operational authorization。 | `BLOCKED` |

通过 gates 后，使用 0–4 的分项评分，不建议在 pilot 前固定 universal weights：

| Scored dimension | 评分重点 |
|---|---|
| Correctness | 对 approved requirements、scenarios 和 failure definitions 的覆盖。 |
| Completeness | contracts、state、authority、permissions、termination、recovery 是否足够。 |
| Simplicity | 是否以最少 roles、state 和 coordination 满足需求。 |
| Testability | requirements 与 outputs 是否可验证；是否能检测 false success。 |
| Observability | 是否能定位 decisions、failures、side effects 和 evidence。 |
| Security | attack surface、least privilege、isolation、residual risk。 |
| Portability | capability-based assumptions、backend independence、degradation visibility。 |
| Maintainability | change impact、rationale preservation、trace upkeep、clear ownership。 |
| Administrative burden | authoring、review、approval、duplicate entry 和 stale-state cost。 |
| Learning value | 用户是否保留 architecture reasoning、trade-off 和 acceptance judgment。 |
| Explicit uncertainty | assumptions、confidence、conflicts、unknowns 与 revisit triggers 的质量。 |

建议评分规则：

```text
hard gates: all applicable critical gates PASS
critical scored dimensions: no zero
score use: compare feasible candidates, not certify correctness
weights: set by Owner/task context, not universal
uncertainty: shown separately, never hidden inside average
result: candidate disposition only
```

### Human–AI co-design allocation

Human-AI interaction research表明，自动化不只是“多少自动化”，还包括 information acquisition、analysis、decision selection 和 action implementation 等不同阶段；较高 automation 可能改善 routine performance，却在 automation failure 时损害 situation awareness、diagnosis 或 recovery。因此，Meta-Agent 应按活动类型分配 automation，而不是用一个 autonomy level 覆盖整个 design process。citeturn7search4turn7search2 Human-AI Interaction guidelines 也强调在不同阶段让系统说明能力、显示相关信息、支持 correction、提供控制并从行为中谨慎学习。citeturn7search1

| Activity | AI 可独立进行 | AI candidate + human judgment | Human-only |
|---|---:|---:|---:|
| Source extraction、format normalization | ✓ |  |  |
| Requirement候选分类、duplicate detection |  | ✓ |  |
| Missing-field、orphan-trace、cycle lint | ✓ |  |  |
| Alternative skeleton generation |  | ✓ |  |
| Quality scenarios 与 hazard brainstorming |  | ✓ |  |
| Role/tool/memory/permission proposals |  | ✓ |  |
| Trade-off summary 与 review preparation |  | ✓ |  |
| Project purpose、success 和 non-goals |  |  | ✓ |
| Owner preference 与 priority weights |  |  | ✓ |
| Authority、privacy 与 sensitive-material approval |  |  | ✓ |
| Irreversible permission 和 risk acceptance |  |  | ✓ |
| Final selection among feasible architectures |  |  | ✓ |
| Methodology promotion、target truth change、activation |  |  | ✓ |

为了保留 user learning value，候选方法应要求：

```text
AI first exposes alternatives and decision drivers
→ user states or confirms the decisive trade-off
→ AI records rationale and consequences
→ user retains final architecture/acceptance decision
```

AI 不应在生成 polished preferred design 后才展示弱化的 alternatives；这种顺序会制造 anchoring，并削弱用户 architecture judgment。

### Worked synthetic example

**Problem frame**

```yaml
goal: >
  每周为 Owner 生成一份只使用公开来源的技术研究简报。
non_goals:
  - autonomous publication
  - private email or document access
  - persistent user profiling
constraints:
  - read-only public web access
  - maximum runtime budget: 15 minutes
  - every material claim requires source and date
  - Owner must approve final brief
failure:
  - fabricated citation
  - unsupported material claim
  - use of private material
  - publication without Owner approval
```

**Baseline ladder**

| Alternative | Strength | Weakness | Gate result |
|---|---|---|---|
| Fixed RSS + manual template | 最简单、可预测、低攻击面。 | 主题变化和跨来源综合能力有限。 | Feasible for stable source list。 |
| Direct Agent | 低 orchestration cost。 | 容易遗漏 source coverage、claim checking 与 stop logic。 | Feasible but weaker evidence control。 |
| Strong single-Agent | 可完成 source discovery、synthesis 和 self-review。 | Self-review 不独立，容易 false success。 | Feasible with mechanical citation checks and human approval。 |
| Deterministic staged workflow with one Agent | 明确 collect→extract→draft→verify→human approve；state 与 stop points 清晰。 | 比 direct Agent 多一些 admin overhead。 | Preferred candidate。 |
| Planner/researcher/writer/reviewer multi-Agent | 角色清晰，可能并行。 | 没有独特 permission、tool 或 trust boundary；handoff 与 correlation cost 高。 | Rejected absent empirical benefit。 |

**Preferred candidate**

```text
one bounded Agent operating inside a deterministic workflow
with separate stage contexts where useful
+ mechanical URL/date/claim-coverage checks
+ Owner final review
```

**Workflow**

```text
load approved topic and source policy
→ collect public candidate sources
→ reject stale/low-authority/duplicate sources
→ extract claim-evidence pairs
→ draft brief from evidence bundle
→ run mechanical citation/date/coverage checks
→ run bounded critical review
→ present draft, uncertainty and rejected claims to Owner
→ Owner accepts, revises or rejects
```

**State and memory**

```text
task-local evidence bundle only
no cross-week automatic memory promotion
no private material
no autonomous methodology update
discard or archive candidate draft according to Owner policy
```

**Permissions**

```text
allowed: public read/search
prohibited: send, publish, write repository, access private connectors
approval: Owner required before any external publication
```

**Termination and fallback**

```text
stop when:
  - 15-minute budget reached
  - fewer than two adequate independent sources for a material claim
  - unresolved contradiction affects central conclusion
  - source access or date cannot be verified

fallback:
  - produce evidence-gap report instead of confident brief

rollback:
  - discard candidate draft and task-local derived bundle;
    no external state has been modified
```

**Rationale**

该 workflow 比 multi-Agent 方案更简单，且不存在必须通过不同 permissions、trust boundaries、tools 或 genuinely independent evidence channels 才能满足的 requirement。Reviewer stage 可以通过 fresh context、mechanical checks 与 Owner decision 获得部分独立性，但不能被描述为完全 independent model review。是否需要独立第二模型或 human fact-checker 属于风险与 pilot 数据驱动的后续决定。

**Synthetic status：**`ACCEPT_CANDIDATE_FOR_OFFLINE_REVIEW`。这不是 pilot authorization 或 operational design approval。

### Administrative, cost and maintenance burden

设计 rigor 具有成本。Traceability review 的文献长期报告 link creation、maintenance、semantic accuracy 和 adoption burden；完整 ATAM、STPA 或 assurance case 也可能对低风险任务不成比例。citeturn1search15turn10view3turn3search0 因此建议使用 assurance profiles：

| Profile | 适用范围 | 最小 dossier/review |
|---|---|---|
| **Lite** | Proposal-only、无 tools 或只读、无 sensitive data、可轻易丢弃。 | 一页 problem/design/rationale；两个强基线；authority、state、termination、evidence gates；single reviewer。 |
| **Standard** | Bounded tools、有限 side effects、持续 workflow 或多人协作。 | 完整 role/contract/state/permission sections；三个以上 baselines；hazard review；rollback；independent review sample。 |
| **High Assurance** | Write/delete/send、credentials、private material、high-impact decisions 或 autonomous loops。 | Threat model、mini safety case、STPA-style control analysis、adversarial testing、independent reviewer、recovery exercise、Owner risk acceptance。 |

Real pilot 应记录：

```text
dossier authoring minutes
review minutes
number of clarification loops
duplicate-entry count
stale trace/source count
orphan decision count
defects detected before execution
defects missed
human rework
execution cost and latency
coordination overhead
reviewer disagreement
rollback/reconstruction effort
user-reported learning and decision ownership
```

方法只有在发现 defect、减少 rework、支持 handoff 或改善 decision quality 的收益超过其 administrative burden 时，才值得推广。这个比例不能由 literature 代替 Meta-Agent-specific pilot 决定。

### Implementation and experiment dependencies

| Dependency | 必须等待的问题 |
|---|---|
| **MA-DR-08** | Canonical IR 是否需要哪些实体/关系；如何映射到 multiple backends；unsupported/degraded semantics 如何声明；哪些 fields 可机械验证；schema/version/conformance 的准确形式。 |
| **MA-DR-09** | Benchmark design、case sampling、ablation、baseline implementation、rubric calibration、acceptance thresholds、hidden tests、reviewer protocol 与 bounded-pilot design。 |
| **Real pilots** | Dossier 最小长度；Lite/Standard/High-Assurance 分界；真实 review burden；single-Agent versus workflow threshold；learning-value measurement；trace maintenance；rollback cost；cross-domain transfer。 |
| **Owner decision** | 是否创建显式 method candidate；是否要求所有 designs 使用 dossier；哪些 hard gates 为 Meta-Agent invariant；何时授权实验或 pilot。 |

明确需要等待、不能由本报告决定的事项：

- 是否把 design dossier 序列化为 Markdown、YAML/JSON、graph 或 DSL；
- exact role/tool/memory/permission field schema；
- rubric weights、numeric threshold 和 statistical confidence；
- 何种 performance delta 足以证明 multi-Agent complexity；
- same-Agent fresh-context review 是否在何种风险等级下足够独立；
- cross-domain 方法是否需要不同 adapters；
- 自动生成 trace links 的 precision/recall 是否可接受；
- 自动 architecture search 的 operator library、budget 和 adversarial controls；
- 何时允许 persistent memory、runtime adaptation 或 tool-bearing execution。

## Portable source register 与最终处置

### Portable source table

| Source | Direct URL / identifier | Version/date | Claims supported | Limitations |
