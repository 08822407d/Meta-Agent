accepted -> narrowed/deprecated/retired when counterevidence or drift appears
```

**状态定义与 transition gates**

| Status | 含义 | 进入条件 | 离开条件与 Owner role |
|---|---|---|---|
| **candidate** | 可讨论的 method claim，未获测试或接受 | source、claim、scope、rationale 至少可追踪 | Owner 可授权 trial、保留、拒绝；不得执行为默认方法 |
| **trial** | 在明确边界下收集证据 | bounded protocol、baseline、metrics、stop/rollback、Owner 授权 | 依据结果进入 conditional、retained、narrowed 或 rejected |
| **conditionally accepted** | 在明确 scope 和不确定性下可作为候选默认 | 证据跨越单一 anecdote；已审查 confounders、negative cases、burden | Owner 明确接受；scope 扩张需新审查 |
| **accepted** | 作为当前通用方法使用，但仍有 conditions 和 review triggers | 多样 evidence、强 baseline、无 fatal counterexample、成本可接受 | 仅 Owner 可接受、narrow、deprecate 或 retire |
| **narrowed** | 原 claim 过宽，保留在较小范围 | counterexample 或 heterogeneity 显示 scope 需缩小 | 更新 scope、version、migration/compatibility 记录 |
| **deprecated** | 不建议用于新项目，但为兼容或过渡仍存在 | 更好替代、staleness、risk 或 burden | 设 sunset 和 replacement；不得静默恢复默认 |
| **retired** | 不再允许作为活动方法选择 | 无净价值、过时、危险、不可维护或完全取代 | 保留 tombstone、reason、replacement、reopening gate |
| **rejected** | 候选从未达到接受标准，或 evidence 显示不应采用 | unsupported、dominated、harmful、unfalsifiable | 保留最小 tombstone；不是删除 |
| **reopened** | 因 materially new evidence 重新进入 candidate review | 新数据、新 scope、新 mechanism 或 corrected flaw | Owner 明确决定；不能因模型再次建议而自动 reopening |

**Anti-resurrection record**

```yaml
method_tombstone:
  former_or_candidate_identifier:
  terminal_status: rejected | retired
  decision_date:
  reason:
  evidence_refs: []
  known_harms_or_failures: []
  replacement_ref:
  prohibited_implicit_reactivation: true
  reopening_requires:
    - materially_new_evidence
    - explicit_scope
    - contradiction_review
    - Owner_decision
```

这与仓库现有 stable-ID non-reuse、retired-candidate preservation 和 rollback lineage 原则一致。fileciteturn6file0L2-L2

**Small-N decision framework**

建议使用五个维度，而不是一个“证据分数”：

```yaml
small_N_evidence_profile:
  claim_scope:
    - target_specific
    - scoped_cross_project
    - general_default_candidate

  inferential_strength:
    - signal
    - descriptive_observation
    - comparative_association
    - locally_causal
    - mechanism_supported

  diversity:
    projects:
    domains:
    task_structures:
    models_or_versions:
    tools:
    operators:
    risk_tiers:

  contradiction:
    negative_cases:
    counterexamples:
    neutral_cases:
    missing_or_abandoned:
    unresolved_conflicts:

  uncertainty:
    confounders_remaining:
    evidence_dependence:
    measurement_limits:
    transportability_limits:
    freshness_limits:
```

决策顺序应为：

```text
hard-stop integrity checks
→ classify claim scope
→ inspect evidence type and independence
→ inspect diversity and scope variation
→ inspect contradictions and negative cases
→ inspect confounders and measurement
→ compare benefit, risk and governance burden
→ choose status
→ Owner decision
```

**Hard-stop checks**

以下任何一项成立时，不应晋升：

- 主要 evidence source 不可读、不可追踪或被重建；
- success criteria 在结果之后才被定义，且无 sensitivity review；
- contradictory evidence 被删除或未披露；
- 唯一“replication”是相同模型或 judge 的重复调用；
- baseline 明显弱于现实可用替代方案；
- privacy、authority 或 irreversible-action 边界未解决；
- case outcome 与 method effect 无法区分；
- method statement 无法被反驳或无 observable implications；
- scope condition 为空却声称普遍适用。

**定性门槛优先于数值门槛**

`RECOMMENDATION`

- **Target-specific lesson**：可由一个高质量观察或 postmortem 支持，但必须附 context 和 competing explanations；不构成 methodology promotion。
- **Scoped candidate**：应至少超越单一 anecdote，并包含有意寻找 negative/counterexample 的记录；不要求统计显著性。
- **Conditionally accepted**：需要在与 scope 相关的差异条件下有可重复支持，且未解决反例已被写入限制。
- **Accepted general method**：需要证明它不是某个项目、模型、operator、prompt 或工具的偶然产物，并证明其 review/maintenance cost 不抵消收益。
- **Rejection**：不要求“证明永远无效”；若候选被强 baseline 稳定支配、风险不可接受、不可验证或无法定义适用范围，即可拒绝。
- **Retirement**：可由持续失效、环境漂移、维护成本、严重安全反例或替代方法支配触发。
- **Reopening**：只需 materially new evidence 足以使旧结论值得重新测试，但必须保留旧负面历史。

**Bayesian 表示的可用形式**

对于当前 case 数量少且异质的 Meta-Agent，不建议把所有案例压缩成一个 posterior probability。可先使用 *qualitative Bayesian ledger*：

```yaml
bayesian_update_record:
  claim:
  prior_basis:
  evidence_item:
  expected_if_claim_true:
  expected_if_claim_false:
  update_direction: strongly_down | down | little_change | up | strongly_up
  dependence_on_prior_evidence:
  posterior_category:
    - unsupported
    - plausible
    - supported_with_material_uncertainty
    - strongly_supported_in_scope
  sensitivity_to_alternative_explanations:
```

只有当项目形成重复、同质、predeclared 的 bounded trials 时，才适合建立 quantitative likelihood、effect distribution、credible interval 和 sequential stopping rule。`RECOMMENDATION`

**Promotion dossier**

```yaml
promotion_dossier:
  identity:
    candidate_name:
    current_status:
    proposer:
    review_date:

  claim:
    exact_method_statement:
    intended_outcome:
    claim_scope:
    falsifiable_predictions: []

  scope:
    applicable_conditions: []
    excluded_conditions: []
    capability_dependencies: []
    freshness_or_expiry:

  evidence:
    supporting_cases: []
    neutral_cases: []
    negative_cases: []
    counterexamples: []
    missing_or_abandoned_cases: []
    external_sources: []

  inference:
    baseline_or_counterfactual:
    competing_explanations: []
    confounders_remaining: []
    evidence_independence:
    causal_status:
    generalizability_status:

  burden_and_risk:
    expected_benefit:
    review_cost:
    runtime_or_operator_cost:
    new_failure_modes:
    authority_privacy_security_impact:

  decision:
    proposed_status:
    alternative_dispositions: []
    acceptance_criteria:
    validation_plan:
    rollback_or_revision:
    owner_decision_ref:
```

**Review rubric**

每项使用 `PASS | PASS_WITH_LIMITATIONS | FAIL | BLOCKED | NOT_APPLICABLE`，不建议在尚无 case calibration 时使用加权总分。

| Rubric question | 关键判断 |
|---|---|
| Claim clarity | 方法主张是否明确、可反驳、未混入结果叙事？ |
| Evidence traceability | 每项 evidence 是否可定位到原始记录、时间和版本？ |
| Comparison quality | 是否有现实可行的 strong baseline 或 counterfactual？ |
| Independence | replication 是否具有实质独立的项目、模型、operator 或 evaluator channel？ |
| Confounders | 最重要 competing explanations 是否被控制、降低或明确保留？ |
| Negative evidence | neutral、failed、abandoned、missing 和 counterexample 是否全部可见？ |
| Scope validity | applicability、excluded domains、required capabilities 和 freshness 是否明确？ |
| Benefit and burden | method benefit 是否大于执行、review、maintenance 和 learning cost？ |
| Risk and authority | 是否改变隐私、权限、truth、irreversibility 或 human-decision boundary？ |
| Lifecycle readiness | 是否有 status、version effect、rollback、tombstone 和 reopening rule？ |

**Worked synthetic example with contradictory evidence**

候选主张：

> `M-CAND`: “在 AI-assisted project work 中增加独立 verifier pass，会普遍降低 false-success。”

这只是合成示例，不是现有 Meta-Agent case。

| Case | Context | Result | 初步解释 | 主要问题 |
|---|---|---|---|---|
| A | 软件仓库任务；producer 与 verifier 使用不同 evidence channels；存在 deterministic tests | false-success 明显减少；review time 增加 | verifier 可能捕获 producer omission | 单项目；operator 熟练 |
| B | 研究综合任务；两个 judge 使用相同模型族和相同 rubric | 两个 judge 一致，但漏掉相同 source error | 一致性是 correlated error，不是独立验证 | evaluator dependence |
| C | 软件任务；引入 verifier 同时升级模型和工具 | outcome 改善 | verifier、model upgrade 或 tool access 都可能解释 | severe concurrent confounding |
| D | 低风险机械格式任务；deterministic checker 已覆盖全部 acceptance criteria | verifier 未发现新问题，仅增加成本 | 人工/LLM verifier 被强 mechanical baseline 支配 | scope counterexample |
| E | 高歧义架构任务；verifier 提出相反设计，Owner rework 上升，无明显 quality gain | role conflict 或 rubric 不明确 | method 可能需 risk/task-specific use | neutral/negative outcome |

合理推断：

```yaml
target_specific_lesson:
  case_A: "在该 repository task 和 evidence separation 条件下，verifier pass 有用"
  status: supportable

universal_claim:
  "independent verifier always reduces false-success"
  status: refuted_by_scope_counterexample_D_and_unresolved_E

scoped_candidate:
  statement: >
    对高影响、非机械、存在可独立 evidence channel 的任务，
    verifier pass 可能降低 false-success；当 deterministic oracle 已充分覆盖，
    或 verifier 与 producer 共享主要错误来源时，不应默认增加该步骤。
  status: plausible_candidate_not_promoted

remaining_uncertainty:
  - effect size
  - review burden
  - model_family dependence
  - task ambiguity interaction
  - optimal escalation conditions
```

可选 disposition 不是直接 `accepted`，而是 `retain candidate` 或由 Owner 选择 `conditionally accepted` 于非常窄的 scope。Case B 的 judge consensus 不计作 cross-project replication；Case D 不是应被删除的“无关案例”，而是限定 scope 的关键 counterexample。

## 实验依赖、治理成本与 Owner 决策

**必须通过真实案例校准的阈值**

以下数值无法从文献直接转移到 Meta-Agent：

1. 多少项目或案例构成足够 replication；
2. 需要多少 domain、model/tool、operator 或 task-structure diversity；
3. neutral、negative 或 contradictory evidence 达到何种比例时应 narrow、reject 或 retire；
4. conditionally accepted 到 accepted 所需的最短观察周期；
5. evidence freshness、expiry 和 forced revalidation 周期；
6. 可接受的 false-success、false-rejection 和 missed-counterexample rate；
7. reviewer disagreement 的 escalation threshold；
8. LLM evaluator 与 human reviewer 的允许角色和 sample fraction；
9. review burden 相对节省时间的最大可接受比例；
10. dossier 字段、approval point 和 evidence-link 数量的最小集合；
11. Bayesian prior、decision-loss、posterior 或 sequential stopping threshold；
12. rubric weights 或 aggregate score；
13. 何种 effect magnitude 才值得成为 default method；
14. retirement 后重新开启所需的新证据量；
