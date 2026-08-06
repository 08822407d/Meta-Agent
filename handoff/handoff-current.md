---
target_project_id: meta-agent
artifact_id: META-AGENT-V0.1-HANDOFF-001
artifact_role: fresh_session_handoff
status: dedicated_repository_authoritative_inactive_post_cutover_verification_pending
authority_level: non_execution_navigation
target_runtime_truth_source: false
last_updated_by_task: META-AGENT-DEDICATED-REPOSITORY-CUTOVER-001
---

# Meta-Agent Handoff — Dedicated Repository Authoritative, Operationally Inactive

## Authority boundary

When `META-AGENT-DEDICATED-REPOSITORY-CUTOVER-001` is present on `master`, the sole Meta-Agent target truth is:

```text
08822407d/Meta-Agent
current/approved-spec.md
```

The previous bootstrap source is pinned only as historical and rollback evidence:

```text
08822407d/Mnemosyne@8ef1c43b18b8686a30ffef544ca8b32fce1ca6cb
target-projects/meta-agent/current/approved-spec.md
```

It is no longer authoritative, is not an active writer, and must not receive new Meta-Agent live-state writes unless the Owner explicitly authorizes a rollback.

The repository cutover does not make the approved spec effective for operational use.

## Verified migration and recovery facts

```yaml
route: META_AGENT_PRODUCT_BUILD
owner: user
owner_disposition: ACCEPT_WITH_LIMITATIONS

PR_1_shadow_import:
  merged: true
  merge_commit: 322d4d437c4df79e17de1ad7137edf0f7ad76f34

PR_2_navigation_correction:
  merged: true
  merge_commit: d3d4c770fbef851f2d094122b22bfcb539e7a8da

source_snapshot:
  repository: 08822407d/Mnemosyne
  commit: 8ef1c43b18b8686a30ffef544ca8b32fce1ca6cb
  root: target-projects/meta-agent/
  root_subtree_sha: 4c1cd341777d46b3d6794abc62682e9c915ec46a

copy_verification:
  source_files: 226
  byte_exact_files: 224
  transformed_files:
    - current/active-context.md
    - handoff/handoff-current.md
  missing_files: 0
  result: PASS

destination_only_recovery:
  first_run_result: PASS_WITH_STALE_POST_MERGE_NAVIGATION
  rerun_task: META-AGENT-DESTINATION-ONLY-FRESH-SESSION-RECOVERY-RERUN-001
  rerun_evaluated_master: d3d4c770fbef851f2d094122b22bfcb539e7a8da
  rerun_result: PASS
  repository_T5_gate: PASS
  authority_recovery: PASS
  safe_next_action_recovery: PASS

cutover:
  task_id: META-AGENT-DEDICATED-REPOSITORY-CUTOVER-001
  owner_decision: APPROVE_DEDICATED_REPOSITORY_TARGET_TRUTH_CUTOVER
  effective_condition: this_cutover_change_is_present_on_master
  target_truth_repository: 08822407d/Meta-Agent
  target_truth_path: current/approved-spec.md
  destination_authoritative: true
  destination_active_writer: true
  effective_for_operational_use: false
  operational_activation: false

initial_memory_system_work: deferred
private_material_authorized: false
RAG_authorized: false
MCP_authorized: false
automation_authorized: false
prototype_or_pilot_authorized: false
```

## Required reading order

1. `README.md` — repository identity and cutover boundary;
2. `MIGRATION-STATUS.md` — migration evidence and current verification state;
3. `current/approved-spec.md` — sole target truth, still operationally inactive;
4. `authority/source-and-owner-map.md` — Owner, source priority, material and write authority;
5. `current/active-context.md` — current phase, completed, pending and deferred work;
6. `handoff/handoff-current.md` — this non-execution navigation;
7. `history/decision-version-and-migration-log.md` — decisions, migration lineage and rollback;
8. `methodology/core-methodology.md`;
9. `cases/case-and-feedback-ledger.md`;
10. `migration/source-snapshot-pointer.yaml`;
11. `migration/source-copy-verification.yaml`;
12. `research/README.md` and only the research manifests or formal reviews required by the current task.

Historical `target-projects/meta-agent/...` paths inside preserved evidence or old decisions do not override the current repository/path designation. `current/meta-agent-mnemosyne-guidance-compatibility-guard.md` is retired historical evidence and must not be loaded as active guidance.

## Current state

```yaml
completed:
  - source_snapshot_preserved
  - destination_shadow_import_merged
  - post_merge_navigation_defect_corrected
  - destination_only_recovery_rerun_passed
  - Owner_cutover_decision_recorded_in_this_change

pending:
  - read_only_post_cutover_destination_recovery
  - no_dual_writer_and_Mnemosyne_source_freeze_verification
  - migration_closeout
  - separate_Meta_Agent_owned_behavior_guidance_review

deferred:
  - initial_memory_system_foundation
  - RAG
  - MCP
  - automation
  - private_material
  - prototype
  - benchmark
  - pilot
  - operational_activation
```

## Exactly one safe next action

```yaml
safe_next_action: perform_read_only_post_cutover_destination_recovery_and_no_dual_writer_verification
success_path:
  - confirm_fresh_session_recovers_Meta_Agent_current_approved_spec_as_sole_truth
  - confirm_Mnemosyne_snapshot_is_historical_and_not_a_live_writer
  - return_result_to_Owner_for_migration_closeout
prohibited_in_same_step:
  - operational_activation
  - initial_memory_system_foundation
  - RAG
  - MCP
  - automation
  - private_material
  - prototype
  - benchmark
  - pilot
```
