---
target_project_id: meta-agent
artifact_id: META-AGENT-V0.1-DECISION-VERSION-MIGRATION-LOG-001
artifact_role: reviewed_history_version_lineage_migration_and_rollback
status: owner_accepted_v0_1_inactive_baseline_dedicated_repository_cutover_recorded
authority_level: reviewed_history_and_migration_record
target_runtime_truth_source: false
created_by_task: MNEMOSYNE-171
last_updated_by_task: META-AGENT-DEDICATED-REPOSITORY-CUTOVER-001
design_version: 0.1.0
schema_version: 0.1.0
policy_version: 0.1.0
delivery_version: 0.1.0
source_refs:
  - https://github.com/08822407d/Mnemosyne/pull/221
  - https://github.com/08822407d/Mnemosyne/pull/222
  - https://github.com/08822407d/Mnemosyne/pull/224
  - https://github.com/08822407d/Mnemosyne/pull/237
  - https://github.com/08822407d/Meta-Agent/pull/1
  - https://github.com/08822407d/Meta-Agent/pull/2
  - migration/source-snapshot-pointer.yaml
  - decision-support/Meta-Agent-v0.1-owner-disposition-decision-package.md
known_limits:
  - public_Git_history_cannot_be_promised_erased
  - no_prior_operational_Meta_Agent_state_existed
  - owner_baseline_acceptance_does_not_equal_operational_activation
  - repository_cutover_does_not_equal_operational_activation
  - physical_Mnemosyne_redirect_or_tombstone_is_a_separate_follow_up
---

# Meta-Agent Decision, Version and Migration Log v0.1

## 1. Decision records

### MA-DEC-0001 — Select product-build launch route

```yaml
id: MA-DEC-0001
decision: select_META_AGENT_PRODUCT_BUILD_LAUNCH_PREPARATION
status: accepted
source_ref: current_conversation_user_instruction_after_PR_220_merge
effect:
  - product_build_route_selected
  - M0_and_M1_required_before_target_files
```

### MA-DEC-0002 — Accept M0 and M1 baseline

```yaml
id: MA-DEC-0002
decision: accept_Meta_Agent_v0_1_M0_and_M1
status: accepted_by_human_merge
source_ref: https://github.com/08822407d/Mnemosyne/pull/221
effect:
  - requirements_and_authority_baseline_accepted
  - workspace_safety_manifest_and_upgrade_profile_accepted
  - M2_requires_fresh_authorization
```

### MA-DEC-0003 — Select owner and designated runtime truth path

```yaml
id: MA-DEC-0003
decision:
  owner: user
  designated_runtime_truth_source: target-projects/meta-agent/current/approved-spec.md
  Mnemosyne_role: design_archive_control_plane_and_bootstrap_host
status: accepted_in_M0
source_ref: notes/first-target-project-intake-records/meta-agent/meta-agent-v0.1-M0-requirements-and-authority-baseline.md
supersession:
  repository_and_path_location: superseded_by_MA_DEC_0008
  owner_and_single_truth_invariant: preserved
```

### MA-DEC-0004 — Select public-risk bootstrap workspace and safe-input default

```yaml
id: MA-DEC-0004
decision:
  workspace_root: target-projects/meta-agent/
  visibility_treatment: public_risk
  private_original_default: outside_git
  allowed_material: public_synthetic_redacted_safe_pointer_or_reviewed_non_sensitive_summary
status: accepted_in_M1
source_ref: notes/first-target-project-intake-records/meta-agent/meta-agent-v0.1-M1-workspace-safety-build-manifest.md
supersession:
  workspace_root_location: superseded_by_MA_DEC_0008_project_root_flattening
  material_safety_rules: preserved
```

### MA-DEC-0005 — Select standard upgrade profile

```yaml
id: MA-DEC-0005
decision:
  contract_id: META-AGENT-V0.1-UPGRADE-CONTRACT-001
  profile: standard
  unnecessary_service_architecture_required: false
status: accepted_in_M1
source_ref: current/first-target-minimum-upgrade-contract-status.md
```

### MA-DEC-0006 — Authorize exact seven-file M2 construction

```yaml
id: MA-DEC-0006
decision:
  task_id: MNEMOSYNE-171
  exact_target_file_count: 7
  operational_use_in_same_task: false
status: authorized
source_ref: current_conversation_user_instruction_after_PR_221_merge
```

### MA-DEC-0007 — Accept v0.1 with limitations as an inactive design and governance baseline

```yaml
id: MA-DEC-0007
decision: ACCEPT_WITH_LIMITATIONS
status: accepted_by_owner
recorded_by_task: META-AGENT-OWNER-DISPOSITION-001
source_ref: current_dedicated_Meta_Agent_conversation_owner_disposition_2026_07_31
accepted_as:
  - repository_backed_Meta_Agent_v0_1_design_and_governance_baseline
  - MA_REQ_0001_through_MA_REQ_0016
  - MA_METHOD_0001_through_MA_METHOD_0006_as_initial_incomplete_method_library
  - sole_target_truth_path_designation
  - authority_source_and_memory_role_separation
  - stable_ID_version_migration_and_rollback_baseline
not_accepted_as:
  - production_ready_system
  - unrestricted_operational_Meta_Agent
  - empirically_validated_Agent_architecture_optimizer
  - secure_autonomous_self_improving_system
  - provider_neutral_Agent_compiler_or_complete_design_IR
  - private_material_capable_system
  - RAG_MCP_auto_writeback_or_shared_memory_system
accepted_limitations:
  - target_truth_remains_inactive_until_separate_activation_decision
  - no_private_material_ingestion
  - no_broad_repository_or_external_write
  - no_automatic_methodology_promotion
  - no_production_ready_claim
  - no_claim_of_validated_architecture_optimization
  - no_claim_of_complete_Meta_level_security
  - applicable_non_FABLE_health_review_findings_remain_pending_before_pilot_or_activation
  - MA_DR_06_and_MA_DR_07_recommended_before_broad_tool_bearing_operation
activation_authorized: false
effect:
  - proposed_v0_1_becomes_owner_accepted_inactive_design_and_governance_baseline
  - designated_target_truth_path_remains_inactive_for_operational_use
  - no_pilot_or_private_material_or_automation_authority_created
change_class: Class_3_owner_authority_status_record_without_activation
version_change: none
version_change_rationale: no_requirement_method_schema_policy_or_delivery_semantics_changed
```

### MA-DEC-0008 — Cut over target truth to the dedicated Meta-Agent repository

```yaml
id: MA-DEC-0008
decision: APPROVE_DEDICATED_REPOSITORY_TARGET_TRUTH_CUTOVER
status: accepted_by_owner_effective_when_cutover_change_is_present_on_master
recorded_by_task: META-AGENT-DEDICATED-REPOSITORY-CUTOVER-001
source_ref: current_dedicated_Meta_Agent_conversation_cutover_authorization_2026_08_06
from:
  repository: 08822407d/Mnemosyne
  commit: 8ef1c43b18b8686a30ffef544ca8b32fce1ca6cb
  path: target-projects/meta-agent/current/approved-spec.md
to:
  repository: 08822407d/Meta-Agent
  branch: master
  path: current/approved-spec.md
effect:
  - Meta_Agent_repository_becomes_sole_target_truth_repository
  - Meta_Agent_repository_becomes_sole_live_writer_location
  - pinned_Mnemosyne_snapshot_becomes_immutable_historical_bootstrap_and_rollback_evidence
  - temporary_Mnemosyne_guidance_compatibility_guard_is_retired
  - operational_status_remains_inactive
not_authorized:
  - operational_activation
  - pilot
  - private_material
  - RAG
  - MCP
  - automation
  - initial_memory_system_adoption
  - prototype_or_benchmark_execution
change_class:
  - Class_3_authority_and_trust_location
  - Class_4_storage_and_repository_platform
version_change: none
version_change_rationale: repository_and_path_authority_location_changed_without_changing_requirement_method_schema_policy_delivery_or_operational_semantics
```

## 2. Current version set

```yaml
version_set:
  design_version: 0.1.0
  schema_version: 0.1.0
  policy_version: 0.1.0
  delivery_version: 0.1.0
  derived_transformation_context: project_root_flattening_for_dedicated_repository
  baseline_status: owner_accepted_with_limitations
  repository_status: dedicated_repository_authoritative_after_MA_DEC_0008_effective_condition
  operational_status: inactive_pending_separate_activation
```

Version meanings:

- `design_version`: target memory/method architecture;
- `schema_version`: object fields and relations;
- `policy_version`: authority, update, privacy and promotion rules;
- `delivery_version`: concrete target package;
- transformation context: the source root prefix was removed during the verified dedicated-repository import.

`MA-DEC-0007` records Owner acceptance state and limitations without changing the meaning of any requirement, method, schema, policy or delivery object. `MA-DEC-0008` changes only the authoritative repository/path and writer location. The version set therefore remains `0.1.0` with explicit migration lineage.

## 3. Stable ID rules and issued ranges

```yaml
ID_rules:
  format: prefix_plus_zero_padded_sequence
  stable_after_creation: true
  ID_reuse_after_retirement: prohibited
  rename_split_merge_replace_retire_requires_mapping: true
  semantic_meaning_not_encoded_too_rigidly: true

issued:
  requirements: MA-REQ-0001_through_MA-REQ-0016
  pending_requirements: MA-PEND-0001_through_MA-PEND-0008
  decisions: MA-DEC-0001_through_MA-DEC-0008
  methods: MA-METHOD-0001_through_MA-METHOD-0006
  cases: []
  feedback: []
  evaluations: []
  migrations:
    - MA-MIG-0001
    - MA-MIG-0002
```

IDs shown as schema examples in the case ledger are not issued entries. Research-gap candidate labels discussed outside target truth are not issued IDs.

## 4. Bootstrap transition — MA-MIG-0001

```yaml
migration_record:
  migration_id: MA-MIG-0001
  type: bootstrap_initialization
  status: built_and_owner_accepted_with_limitations_but_operationally_inactive

  from_state:
    repository_ref: master@8ff567c6cd5020bd05e13034866825fdb6473f4a
    target_workspace: absent
    target_runtime_truth_source: absent
    design_version: none
    schema_version: none
    policy_version: none
    delivery_version: none

  to_state:
    target_workspace: target-projects/meta-agent/
    target_file_count: 7
    designated_runtime_truth_source: target-projects/meta-agent/current/approved-spec.md
    owner_baseline_disposition: ACCEPT_WITH_LIMITATIONS
    operational_effect: inactive_pending_separate_activation
    design_version: 0.1.0
    schema_version: 0.1.0
    policy_version: 0.1.0
    delivery_version: 0.1.0

  prior_object_mappings: not_applicable_no_prior_target_objects
  created_objects:
    - META-AGENT-V0.1-APPROVED-SPEC-001
    - META-AGENT-V0.1-ACTIVE-CONTEXT-001
    - META-AGENT-V0.1-SOURCE-OWNER-MAP-001
    - META-AGENT-V0.1-CORE-METHODOLOGY-001
    - META-AGENT-V0.1-CASE-FEEDBACK-LEDGER-001
    - META-AGENT-V0.1-DECISION-VERSION-MIGRATION-LOG-001
    - META-AGENT-V0.1-HANDOFF-001

  validation_required:
    - exact_seven_file_inventory
    - MA_REQ_0001_through_MA_REQ_0016_present
    - stable_ID_uniqueness
    - version_fields_present
    - source_and_authority_roles_separated
    - prohibited_material_absent
    - no_automatic_methodology_promotion
    - handoff_and_safe_next_action_present
    - rollback_record_present

  owner_disposition: ACCEPT_WITH_LIMITATIONS
  operational_activation: not_authorized
```

No previous target runtime was migrated. The ID exists so the bootstrap transition and its rollback boundary remain traceable.

## 5. Dedicated-repository transition — MA-MIG-0002

```yaml
migration_record:
  migration_id: MA-MIG-0002
  type: repository_and_target_truth_path_cutover
  status: Owner_approved_effective_when_cutover_change_is_present_on_Meta_Agent_master
  decision_ref: MA-DEC-0008

  from_state:
    repository: 08822407d/Mnemosyne
    commit: 8ef1c43b18b8686a30ffef544ca8b32fce1ca6cb
    root: target-projects/meta-agent/
    designated_target_truth: target-projects/meta-agent/current/approved-spec.md
    authoritative: true_before_cutover
    active_writer: true_before_cutover
    operational_effect: inactive

  validated_transfer:
    source_root_subtree_sha: 4c1cd341777d46b3d6794abc62682e9c915ec46a
    source_files: 226
    byte_exact_files: 224
    transformed_live_navigation:
      - current/active-context.md
      - handoff/handoff-current.md
    missing_files: 0
    PR_1_merge_commit: 322d4d437c4df79e17de1ad7137edf0f7ad76f34
    PR_2_navigation_correction_merge_commit: d3d4c770fbef851f2d094122b22bfcb539e7a8da
    destination_only_recovery_first_run: PASS_WITH_STALE_POST_MERGE_NAVIGATION
    destination_only_recovery_rerun: PASS
    repository_T5_gate: PASS

  to_state:
    repository: 08822407d/Meta-Agent
    branch: master
    designated_target_truth: current/approved-spec.md
    authoritative: true
    active_writer: true
    operational_effect: inactive_pending_separate_activation
    previous_source_role: immutable_historical_bootstrap_and_rollback_snapshot
    previous_source_active_writer: false

  object_mapping:
    relation: moved_with_project_root_flattening
    old_prefix: target-projects/meta-agent/
    new_prefix: repository_root
    stable_IDs_preserved: true
    requirements_preserved: true
    accepted_methods_preserved: true
    operational_activation_added: false

  preserve_transform_retire:
    preserve:
      - requirements
      - accepted_methodology
      - case_and_feedback_ledger
      - research_evidence
      - candidate_specifications
      - historical_decisions
      - source_copy_verification
    transform:
      - current/approved-spec.md_repository_and_local_path_references
      - current/active-context.md
      - authority/source-and-owner-map.md
      - handoff/handoff-current.md
      - migration/source-snapshot-pointer.yaml
    retire:
      - current/meta-agent-mnemosyne-guidance-compatibility-guard.md_as_active_guard
    historical_only:
      - pinned_Mnemosyne_source_snapshot

  no_dual_writer:
    sole_authoritative_repository: 08822407d/Meta-Agent
    sole_active_writer_repository: 08822407d/Meta-Agent
    Mnemosyne_Meta_Agent_live_writes_prohibited: true

  validation_required_after_merge:
    - destination_only_fresh_session_recovers_new_repository_and_path_as_sole_target_truth
    - approved_spec_remains_effective_for_operational_use_false
    - Mnemosyne_snapshot_is_not_interpreted_as_live_authority
    - no_competing_writer_or_open_migration_PR
    - rollback_pointer_remains_readable

  rollback:
    trigger:
      - post_cutover_recovery_failure
      - conflicting_authority_or_dual_writer_detected
    action:
      - revert_the_Meta_Agent_cutover_change
      - restore_the_pinned_Mnemosyne_snapshot_as_authoritative_only_by_separate_explicit_Owner_decision
    operational_side_effect_rollback_required: false

  version_change: none
  operational_activation: not_authorized
```

## 6. Future object-mapping schema

```yaml
object_mapping:
  old_id:
  new_id_or_ids: []
  relation: unchanged | renamed | moved | reformatted | superseded | split_into | merged_from | replaced_by | retired | recomputed_from | unmappable_requires_human_review
  authority_changed: false
  source_refs_preserved: true
  rationale:
  validation_ref:
  owner_decision_ref:
```

A mapping records lineage; it does not by itself prove semantic equivalence.

## 7. Preserve, transform, recompute and retire defaults

| Artifact | Default |
|---|---|
| raw/source evidence | preserve or retain approved external pointer |
| confirmed requirements and owner decisions | preserve; supersede only explicitly |
| target execution source | controlled migration with owner review |
| current state | transform with freshness checks |
| summaries, indexes and derived profiles | recompute where practical |
| embeddings | recompute after model/chunking change |
| handoff | preserve relevant history; regenerate current handoff |
| rejected/retired candidates | preserve minimal status to prevent resurrection |
| ephemeral scratch | retire unless explicitly promoted |

## 8. Change classes

```yaml
change_classes:
  Class_0_presentation:
    minimum_gate: diff_review_and_identity_preservation
  Class_1_additive_compatible:
    minimum_gate: schema_or_delivery_version_and_backward_read_check
  Class_2_semantic_or_breaking:
    minimum_gate: MA_MIG_mapping_semantic_review_regression_owner_approval
  Class_3_authority_privacy_or_trust:
    minimum_gate: frontier_review_explicit_user_decision_mechanical_evidence_target_rollback
  Class_4_storage_or_runtime_platform:
    minimum_gate: data_and_authority_mapping_export_recovery_staged_validation_no_dual_truth
```

`MA-DEC-0007` is a Class-3 Owner-authority status record because it changes acceptance state, but it does not activate the runtime truth source or alter authority boundaries. `MA-DEC-0008` and `MA-MIG-0002` are Class-3/Class-4 changes because they move the sole target truth and writer location while preserving inactive operational semantics.

## 9. Rollback plan for MA-MIG-0001

```yaml
rollback_plan:
  rollback_id: META-AGENT-V0.1-ROLLBACK-001
  migration_ref: MA-MIG-0001
  previous_state_ref: master@8ff567c6cd5020bd05e13034866825fdb6473f4a

  before_M2_merge:
    action: close_or_replace_the_single_MNEMOSYNE_171_PR
    target_workspace_on_master: absent

  after_M2_merge_before_owner_baseline_disposition:
    action: revert_the_M2_merge_or_supersede_with_reviewed_v0_1_1
    target_runtime_truth_effective: false

  after_owner_baseline_acceptance_before_operational_activation:
    action: record_a_new_owner_decision_and_use_a_reviewed_versioned_revision_or_revert
    target_runtime_truth_effective: false
    operational_state_to_rollback: none

  after_operational_activation:
    action: use_owner_approved_MA_MIG_change_record_and_versioned_revision

  derived_artifacts_to_discard_or_rebuild: []
  non_reversible_limitations:
    - public_Git_history_cannot_be_promised_erased
    - forks_caches_or_external_copies_may_persist
  authority_during_rollback:
    - user_remains_final_authority
    - no_target_spec_is_operational_until_an_accepted_activation_scope_is_declared
  verification_after_rollback:
    - target_paths_absent_or_marked_superseded
    - no_competing_truth_source
    - current_context_and_handoff_updated
    - owner_disposition_recorded
```

“Keep a backup” alone is not a rollback plan.

## 10. Current acceptance and repository record

```yaml
v0_1_acceptance:
  repository_build: merged
  owner_design_and_governance_baseline_acceptance: ACCEPT_WITH_LIMITATIONS
  target_truth_designated: true
  target_truth_repository: 08822407d/Meta-Agent
  target_truth_path: current/approved-spec.md
  dedicated_repository_cutover: Owner_approved_effective_when_MA_MIG_0002_change_is_on_master
  target_truth_effective_for_operational_use: false
  operational_activation_authorized: false
  pilot_authorized: false
  private_material_authorized: false
  automatic_methodology_promotion_authorized: false
  initial_memory_system_adopted: false
  previous_Mnemosyne_source:
    role: immutable_historical_bootstrap_and_rollback_snapshot
    active_writer: false
  next_required_gate:
    - read_only_post_cutover_destination_recovery
    - no_dual_writer_and_Mnemosyne_source_freeze_verification
    - migration_closeout
```

The former `next_required_gate` text about the Owner-disposition recording PR is superseded by MA-DEC-0007, PR #1, PR #2, the destination-only recovery rerun and MA-DEC-0008. It remains recoverable in Git history but is no longer current state.
