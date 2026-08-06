| Automatic evidence-to-methodology promotion | **REJECTED** | `TARGET_SPECIFIC_INFERENCE` | 与 Owner authority 和 promotion gate 冲突 |
| Permanent provider-specific core representation | **REJECTED** | `RECOMMENDATION` | 阻碍 vendor exit 与 degraded operation |
| “Hybrid” without explicit module costs and authority model | **REJECTED** | `RECOMMENDATION` | 会隐藏 migration、sync、security 与 maintenance 成本 |

最终可供 Owner/reviewer 使用的决策结论为：

```yaml
viable_architecture_families:
  - repository_first_manual_core_with_replaceable_clients
  - repository_plus_bounded_local_CLI
  - local_personal_service_after_measured_need
  - expanded_API_or_hosted_service_after_operational_gates

plane_separation:
  control: logically_separate_and_authoritative
  evidence: supporting_non_promoting
  state: mutable_and_explicitly_non_authoritative_where_derived
  execution: least_privilege_and_side_effect_gated

dedicated_repository:
  required_now: false
  remain_valid_candidate: true
  decision_basis:
    - access_boundary
    - independent_release_and_CI
    - repository_health_or_churn
    - operational_ownership
    - disaster_recovery_scope
  directory_count_or_product_identity_alone: insufficient

optional_automation:
  baseline_assumption: none
  staging_rule: module_by_module
  required_evidence:
    - benefit_over_manual_baseline
    - authority_correctness
    - recovery
    - security
    - maintenance_proportionality

highest_value_initial_prototypes:
  - repository_manual_baseline
  - read_mostly_local_CLI
  - non_authoritative_conversational_client
  - rebuildable_local_search_projection
  - repository_extraction_dry_run
  - clean_environment_recovery_and_vendor_exit_drill

target_truth_changed: false
methodology_changed: false
operational_activation_authorized: false
private_material_authorized: false
repository_write_performed: false
```