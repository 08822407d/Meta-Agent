---
target_project_id: meta-agent
artifact_id: META-AGENT-V0.1-SOURCE-OWNER-MAP-001
artifact_role: source_and_owner_authority_map
status: owner_accepted_v0_1_inactive_support_record_after_repository_cutover
authority_level: owner_accepted_support_record
target_runtime_truth_source: false
created_by_task: MNEMOSYNE-171
last_updated_by_task: META-AGENT-DEDICATED-REPOSITORY-CUTOVER-001
policy_version: 0.1.0
source_refs:
  - current/approved-spec.md
  - history/decision-version-and-migration-log.md
  - migration/source-snapshot-pointer.yaml
  - 08822407d/Mnemosyne@8ef1c43b18b8686a30ffef544ca8b32fce1ca6cb:notes/first-target-project-intake-records/meta-agent/meta-agent-v0.1-M0-requirements-and-authority-baseline.md
  - 08822407d/Mnemosyne@8ef1c43b18b8686a30ffef544ca8b32fce1ca6cb:notes/first-target-project-intake-records/meta-agent/meta-agent-v0.1-M1-workspace-safety-build-manifest.md
known_limits:
  - does_not_grant_permission_by_itself
  - platform_permission_is_not_task_authorization
  - target_truth_remains_inactive_for_operational_use
  - Meta_Agent_owned_behavior_guidance_not_yet_adopted
---

# Meta-Agent Source and Owner Map v0.1

## 1. Owner and final authority

```yaml
target_owner:
  actor: user
  final_authority_for:
    - product_purpose_scope_and_non_goals
    - target_runtime_truth
    - methodology_promotion
    - privacy_and_material_use
    - repository_and_write_scope
    - migration_and_operational_acceptance
```

No Agent, model, research report, repository path or tool permission can replace the user's authority.

## 2. Runtime truth and repository roles

```yaml
runtime_truth:
  repository: 08822407d/Meta-Agent
  branch: master
  designated_path: current/approved-spec.md
  authoritative: true
  active_writer: true
  current_effect: owner_accepted_inactive_design_and_governance_baseline_not_effective_for_operational_use
  entire_repository_is_truth_source: false
  entire_current_directory_is_truth_source: false

previous_Mnemosyne_bootstrap_source:
  repository: 08822407d/Mnemosyne
  pinned_commit: 8ef1c43b18b8686a30ffef544ca8b32fce1ca6cb
  previous_path: target-projects/meta-agent/current/approved-spec.md
  role:
    - immutable_historical_bootstrap_snapshot
    - rollback_source
    - migration_evidence_reference
  target_runtime_truth: false
  active_writer: false
  Meta_Agent_writes_prohibited: true
  Mnemosyne_maintenance_authority_over_Meta_Agent: false

cutover:
  task_id: META-AGENT-DEDICATED-REPOSITORY-CUTOVER-001
  owner_decision: APPROVE_DEDICATED_REPOSITORY_TARGET_TRUTH_CUTOVER
  effective_condition: this_cutover_change_is_present_on_master
  operational_activation: false
```

`08822407d/Meta-Agent/current/approved-spec.md` is the sole Meta-Agent target-truth path after the cutover change reaches `master`. The Owner has accepted its requirements and governance baseline with limitations, but it remains inactive for operational use. Other files provide methods, evidence, current state, history, migration support or navigation only.

The Mnemosyne snapshot is retained for historical provenance and rollback. It is not a second truth source, a live writer, a product control plane, or authority for current Meta-Agent work.

## 3. Source classes

| Source class | Examples | Authority and permitted use |
|---|---|---|
| `target_truth` | owner-accepted `current/approved-spec.md` | Governs the accepted design/governance baseline now; governs operational behavior only after separate activation. |
| `current_user_decision` | explicit target-scoped user instruction with authorization record | Highest target authority; must be recorded through an approved change when it changes truth. |
| `approved_target_decision` | `MA-DEC-*` record accepted by user | Supports and explains target truth. |
| `approved_method` | `MA-METHOD-*` referenced by target truth | General method library; cannot override requirements or owner decisions. |
| `current_state` | `current/active-context.md` | Operational navigation; may be stale and is not execution source. |
| `handoff` | `handoff/handoff-current.md` | Fresh-session navigation only. |
| `case_or_feedback_evidence` | `MA-CASE-*`, `MA-FEEDBACK-*` | Scoped evidence/candidate input; no automatic methodology promotion. |
| `research_evidence` | reviewed reports and evidence ledgers | Supports decisions; never target truth by itself. |
| `historical_bootstrap_or_rollback_evidence` | pinned Mnemosyne snapshot and migration records | Provenance and rollback only; cannot override current target truth. |
| `raw_or_external_evidence` | public, redacted, pointer or outside-Git material | Historical evidence subject to safety and authority review. |
| `model_inference` | analysis not confirmed by user/evidence | Low authority; must be labeled and revisable. |
| `platform_or_tool_fact` | official current documentation or observed surface state | Time-sensitive evidence; requires freshness checks. |

## 4. Source priority and conflict handling

```yaml
source_priority:
  - current_explicit_user_decision_with_target_scope
  - owner_accepted_inactive_target_spec_within_design_and_governance_scope
  - activated_target_approved_spec_for_operational_scope_after_separate_activation
  - approved_target_change_manifest_within_scope
  - approved_MA_DEC_record
  - approved_methodology_referenced_by_spec
  - current_state_and_handoff_for_navigation_only
  - reviewed_case_feedback_and_research_evidence
  - pinned_historical_bootstrap_and_rollback_evidence
  - model_inference

conflict_rule:
  mark_conflict: required
  stop_affected_action: required
  silent_resolution_or_promotion: prohibited
  user_decision_required_for:
    - requirement_or_non_goal_change
    - target_truth_change
    - owner_or_authority_change
    - privacy_or_material_scope_change
    - methodology_promotion
```

A newer artifact is not automatically more authoritative. A historical source does not regain authority because it contains the original wording or an older path.

## 5. Allowed material classes

```yaml
allowed_after_applicable_preflight:
  - public_information
  - synthetic_material
  - explicitly_redacted_excerpt_with_manifest
  - safe_external_pointer
  - outside_git_reference
  - high_level_non_sensitive_user_confirmed_requirement_or_decision
  - reviewed_non_sensitive_research_or_method_summary
```

The default route for private or large originals is `outside_git`.

## 6. Prohibited material classes

```yaml
prohibited_in_public_Git:
  - secrets
  - credentials
  - tokens_or_account_material
  - private_source_code
  - customer_or_confidential_material
  - unredacted_personal_or_sensitive_learning_records
  - raw_voice_or_chat_transcripts_without_separate_approval
  - sensitive_payload_hidden_inside_a_pointer
  - invented_reconstruction_of_lost_material
  - unverified_platform_or_model_claim_as_stable_truth
```

Ownership does not equal storage authorization.

## 7. Repository and target action authority

Every write must have a canonical task-local action context.

```yaml
repository_action_context_minimum:
  task_id:
  actor:
  product_surface:
  exact_repository_or_target:
  base_ref:
  allowed_paths: []
  allowed_actions: []
  prohibited_paths_or_actions: []
  user_authorization_ref:
  safety_preflight_ref:
  expires_with_task: true
```

Rules:

1. App connection, persistent permission, approval card or repository access does not authorize the current action.
2. Read authorization does not imply write authorization.
3. Authorization for `08822407d/Meta-Agent` does not imply authorization for `08822407d/Mnemosyne`, and the reverse is also true.
4. After cutover, new Meta-Agent target-truth, current-state and handoff writes belong only in `08822407d/Meta-Agent` unless the Owner explicitly authorizes a rollback.
5. One task's authorization is not precedent for a later task.
6. Ambiguous path or authority scope is a stop condition.

## 8. Write and promotion authority by object

| Object/action | Who may propose | Required approval |
|---|---|---|
| target truth update | Agent or user | explicit user authorization and validated change record |
| current-context/handoff sync | bounded executor | task-local authorization; must remain consistent with truth |
| new methodology | Agent/research/user | frontier review when novel; user acceptance before approved status |
| case/feedback entry | bounded executor or user | evidence/source review; no automatic promotion |
| methodology promotion | reviewer/Agent candidate | user confirmation and policy/version update |
| private material use | user | explicit material and storage approval |
| operational activation | user | separate explicit Owner activation decision after applicable blockers, exact scope and acceptance/stop/rollback gates are addressed |
| migration or rollback | Agent/user proposal | approved `MA-MIG-*`, validation, no-dual-writer check and rollback plan |

## 9. Evidence, support, candidate and inference labeling

```yaml
role_labels:
  evidence:
    meaning: observed_or_sourced_material_supporting_a_claim
  support:
    meaning: navigation_process_or_non_authoritative_structure
  candidate:
    meaning: proposed_requirement_method_or_change_not_yet_accepted
  inference:
    meaning: model_generated_interpretation_with_uncertainty
  approved_target_truth:
    meaning: only_content_accepted_in_the_designated_target_truth_source
```

A role change requires an explicit decision; it cannot be implied by moving or copying a file.

## 10. Freshness and external facts

- Tool, product and model capabilities must carry a date/source when material to a decision.
- Consumer UI labels record operator-visible selection, not exact served backend.
- Response speed, style and model self-identification are not backend attestation.
- Stale or conflicting external facts are marked unknown and must not drive high-impact execution.

## 11. Review and supersession

This map is reviewed whenever:

- owner or runtime-truth arrangement changes;
- repository visibility or storage policy changes;
- a new material class is introduced;
- cross-Agent sharing or private storage is proposed;
- a migration, rollback or new authoritative repository is considered.

`META-AGENT-DEDICATED-REPOSITORY-CUTOVER-001` supersedes the prior live repository/path designation while preserving the v0.1 requirements, methodology references, inactive operational status and Owner authority. Further changes require versioning or an explicit no-version-change rationale, source review and an Owner decision.
