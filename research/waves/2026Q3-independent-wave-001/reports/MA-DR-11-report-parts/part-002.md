Case-study generalization 应针对 theory、mechanism 和可比较条件，而不是将少量案例当作随机总体样本。Yin 强调 rival explanations、triangulation 和 logic models；Tsang 指出案例研究尤其适合理论泛化和寻找 disconfirming cases。citeturn0search2turn0search12 `VERIFIED_PRIMARY_EVIDENCE`

**三层可推广主张**

```yaml
claim_level_target_specific:
  statement_form: "在项目 P、条件 C、时期 T 下，方法 M 与结果 O 相关或有用"
  evidence_needed:
    - traceable observation
    - acceptance criterion
    - known confounders
  promotion_effect: none

claim_level_scoped_method:
  statement_form: "当 scope conditions S 成立时，M 倾向于改善 O 或降低 risk R"
  evidence_needed:
    - repeated or comparative evidence
    - variation across relevant conditions
    - negative-case search
    - mechanism or rationale
    - explicit uncertainty
  promotion_effect: candidate_or_conditionally_accepted_only

claim_level_general_method:
  statement_form: "M 应成为跨项目默认方法，但保留 listed exceptions"
  evidence_needed:
    - diverse cross-project replication
    - strong simple baselines
    - contradiction and counterexample review
    - plausible confounders materially reduced
    - maintenance and burden evidence
    - Owner decision
  promotion_effect: possible_only_after_authorized_update
```

即便是 “general method”，也不应被表述为 universal law；它仍应带 applicability、exceptions、freshness 和 review date。

**主要 Small-N 方法的比较**

| Approach | 对 Meta-Agent 的价值 | 主要限制 | 合理用途 |
|---|---|---|---|
| **Case-Based Reasoning** | 保留丰富上下文，支持相似案例检索、adaptation 和反例学习 | similarity 可主观；旧案例可能过时；case base 可被 success bias 污染 | target-specific decision support 与 scope-condition 发现 |
| **Analytic Generalization** | 将案例与理论、mechanism、rival explanation 联系起来 | 不提供 population frequency 或 effect-size precision | 从案例形成可检验、可限定的 method claim |
| **Bayesian / Sequential Updating** | 显式表示 prior、new evidence、uncertainty 和 decision loss；允许持续更新 | posterior 高度依赖模型、prior、likelihood 与 comparability；异质案例不可机械相加 | 可量化、重复、相对同质的 bounded trials |
| **Qualitative Comparative Analysis** | 研究多重条件组合、necessary/sufficient configurations 和 causal asymmetry | 对 calibration、measurement error、limited diversity 敏感；极小或稀疏 case base 容易产生不稳结论 | case 数和条件定义成熟后的辅助分析 |
| **Evidence-Based Software Engineering** | 强调问题形成、最佳可得证据、context、systematic review 和实践整合 | 外部研究常与本地任务间存在 indirectness；研究质量不均 | 搜集工程证据与评价 applicability |
| **Safety/Assurance Case Reasoning** | 强迫写出 claim、argument、evidence、assumption、defeater 和 confidence | 结构正确不等于内容真实；可被用来包装预设结论 | 高影响方法晋升 dossier 和反方审查 |
| **Organizational Learning** | 将 failure、near miss、success 和 routines 纳入长期学习 | blame、政治和 narrative bias 会阻碍真实学习 | negative-case preservation、postmortem 与 retirement |
| **Realist Evaluation / CMO** | 强调 “what works, for whom, in what context, and why” | context/mechanism operationalization 容易模糊；分析成本较高 | scope condition 和 mechanism statement |

Evidence-Based Software Engineering 最初即主张将最佳研究证据与软件工程决策结合，而不是仅依赖个人经验；这适合作为外部 evidence discovery 原则，但不能把 literature result 直接当作 Meta-Agent-specific effect。citeturn1search9turn1search15 `VERIFIED_PRIMARY_EVIDENCE`

Bayesian 方法适合 small-sample uncertainty，因为它能将先验和新增证据联合表示；但 sample-size 和 decision threshold 应围绕具体 action、loss 和 data-generating model，而非套用固定数字。citeturn5search4turn5search6 `VERIFIED_PRIMARY_EVIDENCE`

Sequential tests 适用于连续、可比较的重复观测，并要求预先定义 hypotheses、error bounds 和 stopping rule。对于异质、叙事型、事后选择的个人项目案例，直接套用 SPRT 会制造 false precision。citeturn1search2turn1academia36 `VERIFIED_PRIMARY_EVIDENCE`

QCA 可以表达 conjunctural causation 和不同路径产生同一结果，但研究也发现其结果对 measurement error、misclassification、limited empirical diversity 和 solution type 高度敏感。因此，在 Meta-Agent 只有极少、彼此不可比的案例时，不应把 QCA 输出当作 promotion engine。citeturn0search3turn0search7turn0search8 `MULTI_SOURCE_PATTERN`

Realist evaluation 的 Context–Mechanism–Outcome 思路特别适合方法 scope：它要求描述何种 context 激活何种 mechanism 并产生何种 outcome，而不是只写“方法成功”。但相关研究也指出 context 和 mechanism 的定义与 operationalization 经常困难。citeturn6search1turn6search6turn6search12 `MULTI_SOURCE_PATTERN`

**推荐的 scope-condition contract**

```yaml
method_scope_contract:
  intended_outcome:
  applicable_domains: []
  excluded_domains: []
  task_characteristics:
  required_capabilities:
  required_tools_or_permissions:
  operator_assumptions:
  risk_assumptions:
  baseline_or_counterfactual:
  known_counterexamples: []
  known_failure_modes: []
  evidence_freshness_date:
  model_tool_version_dependencies: []
  invalidation_triggers: []
  review_or_expiry_condition:
```

`RECOMMENDATION`

## Confounders、负面证据与叙事污染控制

**Confounder and competing-explanation checklist**

| Confounder | 如何伪装成 method effect | 最低控制或记录 |
|---|---|---|
| **Model/version change** | 新模型能力提升被归因于方法 | 固定或记录 visible selection、date、version；backend unknown 单独标记 |
| **Task difficulty** | 新案例更简单或更熟悉 | 预先分层；记录 complexity、novelty、ambiguity、risk |
| **Operator behavior** | Owner/Agent 熟练度、注意力或期待变化 | 记录 operator、experience、manual interventions 和 deviations |
| **Prompt change** | 结构、示例或 rubric 改变导致结果变化 | 保存 prompt hash/version；一次只改变关键变量 |
| **Tool availability** | 搜索、代码执行或 repository access 改变 | 记录工具、权限、故障、latency 和 degraded mode |
| **Novelty/learning curve** | 初期失败或后期熟练被误作方法效果 | 记录 exposure order；考虑 warm-up 和 carryover |
| **Selection bias** | 只选择适合该方法的项目或可公开的成功案例 | 保存 inclusion/exclusion log 和未进入分析的案例 |
| **Survivorship bias** | 只看到完成项目，忽略被放弃、阻塞或超预算项目 | abandoned、blocked、cancelled 作为正式 outcome |
| **Regression to the mean** | 在极端失败后采用新方法，后续自然改善 | 使用 baseline period、control/comparison 或多个前后测量 |
| **Measurement error** | rubric 变化、记录不全、judge 不稳定产生假差异 | metric version、inter-rater disagreement、missingness 和 sensitivity |
| **Evaluator dependence** | 多个 judge 共享模型族、prompt 或 source，产生相关错误 | 记录 dependency graph；区分重复测量与独立验证 |
| **Concurrent interventions** | 同时改变 workflow、model、tool、training | 列出所有 concurrent changes；必要时判定 `causality_unresolved` |
| **Temporal drift** | 平台、模型、任务生态改变 | freshness date；触发 revalidation 或 deprecation |
| **Expectation and hindsight bias** | 成功后重新定义目标或原因 | 尽可能预先固定 acceptance criteria 和 hypotheses |
| **Contamination/data leakage** | benchmark、答案或先前评价进入上下文 | contamination check、hidden tests、novel holdout cases |

Regression to the mean 尤其危险：当方法在一次极端差表现后引入，下一次结果即使没有真实干预作用也可能自然接近平均水平，因而被错误解释为 treatment effect。citeturn3search0turn3search7turn3search11 `VERIFIED_PRIMARY_EVIDENCE`

**Negative evidence preservation model**

每一个 evidence-bearing case 应有以下 outcome 分类，而不是只有 PASS/FAIL：

```yaml
outcome_class:
  - positive
  - neutral
  - negative
  - mixed
  - blocked
  - abandoned
  - missing
  - uninterpretable
```

其中：

- `neutral` 表示未见 meaningful change，而不是失败或缺乏记录。
- `blocked` 表示因输入、权限、工具或 integrity gate 无法测试方法。
- `abandoned` 表示因成本、复杂度、风险或优先级停止；不得从 denominator 中消失。
- `missing` 必须保留 missingness reason。
- `uninterpretable` 表示 concurrent change、measurement failure 或 confounding 过强。

**Publication-bias 与 success-only ledger 控制**

研究文献对 file-drawer effect 的大小并不完全一致：一些领域显示未发表资料会改变综合结果，另一些大型相关矩阵研究未发现普遍的 upward inflation。因此治理不应假定所有 null evidence 都被压制，也不应假定 bias 不存在；更稳妥的策略是记录 case inception、所有结果状态和未完成原因，让缺失机制可见。citeturn3search1turn3search8turn3search9 `MULTI_SOURCE_PATTERN`

建议采用：

```yaml
anti_success_bias_controls:
  prospective_case_registration: preferred
  record_all_started_cases: required_for_promotion_evidence
  neutral_and_failed_outcomes_first_class: true
  abandoned_case_reason_required: true
  missing_data_reason_required: true
  inclusion_exclusion_log_required: true
  contradictory_evidence_link_required: true
  retroactive_case_addition_labeled: true
  narrative_summary_cannot_replace_raw_evidence_refs: true
```

`RECOMMENDATION`

**Narrative laundering tests**

下列情况应阻止晋升，直到被解决：

1. summary 的主张比原始 case finding 更广；
2. project-specific constraint 在摘要中消失；
3. failed 或 neutral cases 被标为 “not relevant” 而无预先标准；
4. producer 和 verifier 使用同一模型、同一上下文或同一推理链，却被描述为 independent;
5. benchmark gain 被改写为 real-project outcome；
6. after-the-fact metric 替换了预先 acceptance criterion；
7. tool/model upgrade 被方法叙事吸收；
8. 被退休方法由新模型重新表述后失去原 tombstone；
9. missing evidence 被写成“没有反例”；
10. Owner preference 被写成 domain-general effectiveness evidence。

**失败学习的边界**

组织学习研究显示 failure 和 near-failure 可提供高信息量，但学习能力受 reporting、blame、motivation、prior experience 和环境噪声影响；成功结果也可能来自错误过程，失败结果也可能来自正确过程和随机环境。citeturn2search0turn2search7turn3search14 `VERIFIED_PRIMARY_EVIDENCE`

因此每个 postmortem 应分离：

```text
observed outcome
≠ process correctness
≠ causal explanation
≠ general method lesson
```

## Candidate lifecycle、Small-N 决策框架与合成案例

**候选生命周期**

```text
candidate
   ├─> trial
   │     ├─> conditionally accepted
   │     │      ├─> accepted
   │     │      ├─> narrowed
   │     │      ├─> deprecated
   │     │      └─> retired
   │     ├─> rejected
   │     └─> retained as candidate
   ├─> rejected
   └─> retained without trial

deprecated -> retired
rejected/retired -> reopened only through explicit new evidence review
