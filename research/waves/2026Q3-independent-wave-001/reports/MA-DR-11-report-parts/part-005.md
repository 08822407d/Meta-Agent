| **Experiment-gated** | Bayesian posterior、loss、stopping threshold | `MUST_BE_CASE_CALIBRATED` | 依赖具体 estimand、data model 与 decision cost |
| **Experiment-gated** | rubric weights 和 aggregate score | `MUST_BE_CASE_CALIBRATED` | 当前无 target performance data |
| **Experiment-gated** | review time、artifact burden、approval density | `MUST_BE_MEASURED` | 仓库已将 proportionality 识别为未验证问题 |
| **Experiment-gated** | expiry、freshness 和 forced revalidation interval | `MUST_BE_CASE_CALIBRATED` | 取决于 model/tool/domain drift |
| **Deferred** | QCA 自动分析 | `DEFER_UNTIL_COMPARABLE_CASE_BASE_EXISTS` | 当前 ledger 为空；极小、异质 N 不适用 |
| **Deferred** | 自动 Bayesian promotion score | `DEFER` | 会隐藏 assumptions 并制造伪精确性 |
| **Deferred** | database、graph 或 assurance-case tooling | `DEFER_UNTIL_MARKDOWN_BURDEN_PROVEN` | 当前最小治理可由 file-based artifacts 支持 |
| **Rejected approach** | 固定 universal sample-size threshold | `REJECT` | 与 task prohibition 和 small-N literature 不符 |
| **Rejected approach** | 同一项目重复成功等同 cross-domain generality | `REJECT` | repeatability 不等于 transportability |
| **Rejected approach** | 删除矛盾案例以简化 method narrative | `REJECT` | 导致 success bias 与 narrative laundering |
| **Rejected approach** | 多个 LLM judge 多数票等同 independent replication | `REJECT` | shared error sources、position/self-preference bias |
| **Rejected approach** | benchmark improvement 单独触发 method promotion | `REJECT` | benchmark validity 不等于 real-project applicability |
| **Rejected approach** | assurance-case 格式自动证明方法有效 | `REJECT` | 标准只约束结构，不保证内容质量 |
| **Rejected approach** | retired/rejected 方法因新模型重新提出而自动恢复 | `REJECT` | 违反 lineage、Owner authority 和 anti-resurrection |

**Canonical research disposition**

```yaml
report_disposition:
  external_evidence_value: HIGH
  target_specific_mapping: COMPLETED
  supports_current_conservative_governance_direction: true
  requires_current_v0_1_rollback: false
  authorizes_methodology_change: false
  authorizes_new_target_IDs: false
  authorizes_operational_activation: false

best_supported_governance_model:
  - claim_scoped_evidence_records
  - explicit_confounder_and_competing_explanation_review
  - mandatory_negative_and_missing_evidence_preservation
  - scope_conditions_and_counterexample_register
  - lifecycle_with_narrowing_retirement_and_reopening
  - compact_promotion_dossier
  - qualitative_small_N_uncertainty_before_quantitative_thresholds
  - Owner_decision_at_every_authority_changing_transition

thresholds_remaining_unresolved:
  - sample_or_case_counts
  - evidence_diversity_quantity
  - replication_quantity
  - rubric_weights
  - Bayesian_decision_bounds
  - review_burden_tolerance
  - expiry_and_revalidation_intervals
  - promotion_retirement_and_reopening_numeric_triggers
```