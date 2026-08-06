15. high-risk 与 low-risk promotion path 的边界。

这些参数均为 `EXPERIMENT_GATED`，不应从医学、组织行为或一般软件工程研究中照搬。

**建议的校准数据**

未来若 Owner 单独授权 real cases，可收集：

```yaml
case_calibration_metrics:
  quality:
    - acceptance_criterion_pass
    - false_success
    - defect_escape
    - correction_after_review
  efficiency:
    - creation_time
    - review_time
    - rework_time
    - total_elapsed_time
  burden:
    - artifacts_created
    - duplicated_entry
    - stale_record_incidents
    - unresolved_conflicts
  transfer:
    - cross_project_recurrence
    - model_or_tool_change_stability
    - operator_change_stability
  governance:
    - owner_decision_time
    - reviewer_disagreement
    - accidental_resurrection
    - missing_negative_case_rate
```

**行政与维护成本**

下列为规划估算，不是实测事实：

| Review path | 适用对象 | 建议最小内容 | 初始人工负担估计 |
|---|---|---|---:|
| **Light evidence path** | 只记录 target-specific lesson；不影响方法默认值 | source、scope、result、confounders、contradiction link | 约 10–25 分钟 |
| **Standard candidate path** | scoped candidate、trial 或 conditional acceptance | 完整 dossier、rubric、baseline、negative-case review | 约 45–90 分钟 |
| **High-impact path** | authority、privacy、security、irreversible action 或 general default | 标准路径加 adversarial review、rollback、migration、Owner decision package | 约 2–4 小时或更多 |
| **Retirement/reopening path** | 已使用方法的 deprecation、retirement 或 reopening | impact graph、replacement、tombstone、compatibility 和 migration | 必须按 dependency 数校准 |

`RECOMMENDATION`

上述时间是候选 planning range，必须在真实 case 中记录实际 creation、review 和 rework time。若 dossier 成本稳定接近或超过方法带来的节省，应缩减字段、降低 review tier，或放弃该方法。

**何时允许 lighter path**

仅当全部成立时：

```yaml
light_path_gate:
  target_specific_only: true
  no_general_method_change: true
  no_authority_or_truth_change: true
  no_private_material_change: true
  no_irreversible_or_external_side_effect: true
  no_cross_project_default_created: true
  outcome_and_scope_traceable: true
  contradictory_evidence_linked: true
```

轻量路径可以形成 lesson 或 candidate signal，不能进入 `accepted` general method。

**Implementation dependencies**

本框架不要求立即引入 database、QCA software、Bayesian platform 或 assurance-case tool。最低实现可保持 Markdown/Git：

```text
case ledger
+ candidate dossier
+ contradiction index
+ lifecycle status
+ tombstone record
+ review receipt
```

若以后案例数量增长，才考虑：

- derived index 或 query layer；
- machine-readable schema；
- dependency graph；
- automated stale/freshness checks；
- blinded evidence packet；
- statistical or QCA analysis；
- reviewer calibration dashboard。

这些都应保持 derived/non-authoritative，除非 Owner 另行指定。

**Unresolved questions and Owner decisions**

Owner 仍需决定，但本报告不代替决定：

1. 是否接受本报告中的 lifecycle vocabulary 作为后续 candidate specification 起点；
2. `accepted` 是否应保持极少使用，通常优先采用 `conditionally accepted`；
3. 什么类型的 target-specific lesson 值得进入 shared case ledger；
4. 是否要求 future case 在开始时 prospective registration；
5. 哪些高影响 change 必须有非 producer reviewer；
6. 是否允许 LLM judge 作为 supporting reviewer，以及最低 human/mechanical evidence；
7. retirement 是否设置固定 review date，或仅使用 event-triggered review；
8. dossier 是附加到现有 case ledger，还是形成独立 candidate record；
9. 真实 case 是否允许使用 private external pointers，以及安全边界；
10. 何时开始收集 review-burden 数据；
11. 是否在真实案例出现前保持所有 quantitative thresholds 未定义；
12. 哪些 scope variation 最能代表 Meta-Agent 所称的 cross-project learning。

## Portable source table 与最终处置矩阵

**Portable source table**

| Source title | Identifier / version / date | Direct URL | Claims supported | Limitations |
|---|---|---|---|---|
| *Validity and generalization in future case study evaluations* | DOI `10.1177/1356389013497081`, 2013 | https://doi.org/10.1177/1356389013497081 | analytic generalization、rival explanations、triangulation、logic models | 方法论论文；不提供 Meta-Agent threshold |
| *Generalizing from Research Findings: The Merits of Case Studies* | DOI `10.1111/ijmr.12024`, 2014 | https://doi.org/10.1111/ijmr.12024 | theoretical generalization、disconfirming cases | 管理研究语境；非 AI-specific |
| *Drawing Lessons from Case Studies by Enhancing Comparability* | DOI `10.1177/0048393111426683`, 2012 | https://doi.org/10.1177/0048393111426683 | comparability 优先于代表性 | 理论性较强 |
| *Strategies of Causal Inference in Small-N Analysis* | DOI `10.1177/0049124100028004001`, 2000 | https://doi.org/10.1177/0049124100028004001 | nominal、ordinal、within-case causal strategies | comparative-historical domain |
| *Case-Based Reasoning: Foundational Issues, Methodological Variations, and System Approaches* | DOI `10.3233/AIC-1994-7104`, 1994 | https://doi.org/10.3233/AIC-1994-7104 | retrieve–reuse–revise–retain、case adaptation | 早期 CBR；不解决现代 LLM evidence |
| *Evidence-Based Software Engineering* | DOI `10.1109/ICSE.2004.1317449`, ICSE 2004 | https://doi.org/10.1109/ICSE.2004.1317449 | 软件工程决策应使用最佳可得证据 | 外部 evidence 仍需本地 applicability review |
| *Complexity, Generality, and Qualitative Comparative Analysis* | DOI `10.1177/1525822X03257689`, 2003 | https://doi.org/10.1177/1525822X03257689 | configurational causation、moderate-N QCA | 不能证明 QCA 适合极小、异质 case ledger |
| *The Double Bind of Qualitative Comparative Analysis* | DOI `10.1177/0049124119882460`, 2022 issue | https://doi.org/10.1177/0049124119882460 | QCA 对 dataset size、measurement error 和 classification 敏感 | simulation assumptions 影响结论 |
| *Beyond the Facts: Limited Empirical Diversity and Causal Inference in QCA* | DOI `10.1177/0049124119882463`, 2022 issue | https://doi.org/10.1177/0049124119882463 | limited diversity 与部分 solution types 的 causal fallacy 风险 | 针对特定 QCA variants |
| *Bayesian additional evidence for decision making under small sample uncertainty* | DOI `10.1186/s12874-021-01432-5`, 2021 | https://doi.org/10.1186/s12874-021-01432-5 | small-sample Bayesian evidence integration | 医学方法语境；参数不能直接移植 |
| *How many samples?: a Bayesian nonparametric approach* | DOI `10.1046/j.1467-9884.2003.00373.x`, 2003 | https://doi.org/10.1046/j.1467-9884.2003.00373.x | sample size 应围绕 terminal decision | 需正式 utility/action model |
| *Sequential probability ratio tests: conservative and robust* | DOI `10.1177/0037549720954916`, 2021 | https://doi.org/10.1177/0037549720954916 | sequential testing、error bounds、sample efficiency | 适合可比较 sequential data，不适合异质叙事案例 |
| *ISO/IEC/IEEE 15026-2:2022 — Assurance case* | Edition 2, 2022-11 | https://www.iso.org/standard/80625.html | assurance-case structure and terminology | 标准不保证 evidence 内容质量 |
| *Opportunity, Motivation, and Ability to Learn from Failures and Errors* | DOI `10.5465/annals.2016.0049`, 2018 | https://doi.org/10.5465/annals.2016.0049 | failure learning、spurious success/failure、reporting conditions | broad organizational review |
| *Failing to Learn? The Effects of Failure and Success on Organizational Learning in the Global Orbital Launch Vehicle Industry* | DOI `10.5465/amj.2010.51467631`, 2010 | https://doi.org/10.5465/amj.2010.51467631 | failure 与 success learning 的差异、knowledge depreciation | 单一高可靠行业 |
| *Regression to the mean: treatment effect without the intervention* | DOI `10.1111/j.1365-2753.2004.00505.x`, 2005 | https://doi.org/10.1111/j.1365-2753.2004.00505.x | RTM 可伪造 intervention effect | 医疗示例；原理可泛化 |
| *Revisiting the File Drawer Problem in Meta-Analysis* | DOI `10.1111/j.1744-6570.2012.01243.x`, 2012 | https://doi.org/10.1111/j.1744-6570.2012.01243.x | publication bias 大小并非所有领域一致 | 相关矩阵与组织研究范围 |
| *Large Language Models are Inconsistent and Biased Evaluators* | arXiv `2405.01724`, 2024 | https://arxiv.org/abs/2405.01724 | familiarity、anchoring、prompt sensitivity、inconsistency | preprint；task-dependent |
| *LLM Evaluators Recognize and Favor Their Own Generations* | arXiv `2404.13076`, NeurIPS 2024 | https://arxiv.org/abs/2404.13076 | self-recognition 与 self-preference bias | 不能量化所有 evaluator dependence |
| *Large Language Models are not Fair Evaluators* | arXiv `2305.17926`, 2023 | https://arxiv.org/abs/2305.17926 | position bias、calibration 和 human escalation | 主要针对 response comparison |
| *Unpacking context in realist evaluations* | DOI `10.1177/13563890211053032`, 2022 | https://doi.org/10.1177/13563890211053032 | context levels、CMO 和 operationalization challenge | program-evaluation domain |
| *The Generalizability of IR Experiments beyond the United States* | DOI `10.1017/S0003055424001199`, 2025 | https://doi.org/10.1017/S0003055424001199 | harmonized multisite replication、effect heterogeneity | IR experiments；不提供通用 case count |
| *Generalizability of Heterogeneous Treatment Effect Estimates Across Samples* | DOI `10.1073/pnas.1808083115`, 2018 | https://doi.org/10.1073/pnas.1808083115 | transportability 取决于 heterogeneity 与 selection | survey experiment domain |

**Final disposition matrix**

下表仅是 research disposition，不是 Meta-Agent target truth 或 method promotion。

| Category | Item | Disposition | Basis |
|---|---|---|---|
| **Adoptable design principle** | 分离 target-specific lesson、scoped method 与 general default claim | `SUPPORTED_FOR_OWNER_CONSIDERATION` | analytic generalization 与仓库 authority separation 一致 |
| **Adoptable design principle** | 所有方法带 scope、exclusions、dependencies、counterexamples 和 freshness | `SUPPORTED_FOR_OWNER_CONSIDERATION` | generalizability 与 realist-evaluation evidence |
| **Adoptable design principle** | neutral、negative、blocked、abandoned、missing 作为一等 outcome | `SUPPORTED_FOR_OWNER_CONSIDERATION` | failure learning、publication-bias control |
| **Adoptable design principle** | LLM consensus 不视为 independent replication | `SUPPORTED_FOR_OWNER_CONSIDERATION` | evaluator bias 与 dependency evidence |
| **Adoptable design principle** | rejected/retired 方法保留 tombstone，禁止 implicit resurrection | `SUPPORTED_FOR_OWNER_CONSIDERATION` | current rollback/ID rules 与 anti-laundering need |
| **Candidate item** | lifecycle：candidate、trial、conditionally accepted、accepted、narrowed、deprecated、retired、rejected、reopened | `CANDIDATE_ONLY` | 需要 Owner 对 vocabulary 和 semantics 决策 |
| **Candidate item** | promotion dossier schema | `CANDIDATE_ONLY` | 应先在 synthetic 或 future authorized case 上测试负担 |
| **Candidate item** | non-weighted review rubric | `CANDIDATE_ONLY` | 避免在无 calibration 时制造 false precision |
| **Candidate item** | qualitative Bayesian ledger | `CANDIDATE_ONLY` | 适合当前 small-N，但需 usability test |
| **Experiment-gated** | accepted 所需案例数、项目数或 domain 数 | `MUST_BE_CASE_CALIBRATED` | 文献不能给出可移植 universal threshold |
