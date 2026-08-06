---
target_project_id: meta-agent
artifact_id: META-AGENT-V0.1-HANDOFF-001
artifact_role: fresh_session_handoff
status: post_merge_navigation_synchronized_recovery_rerun_pending
authority_level: non_execution_navigation
target_runtime_truth_source: false
last_updated_by_task: META-AGENT-POST-MERGE-NAVIGATION-CORRECTION-001
---

# Meta-Agent Handoff — Post-Merge Recovery Rerun Pending

## Authority boundary

The Meta-Agent project files are now present on the dedicated repository `master`, but the sole active target truth remains in Mnemosyne until a separate explicit Owner cutover:

```text
08822407d/Mnemosyne@8ef1c43b18b8686a30ffef544ca8b32fce1ca6cb
target-projects/meta-agent/current/approved-spec.md
```

The dedicated-repository candidate is:

```text
08822407d/Meta-Agent
current/approved-spec.md
```

The destination remains non-authoritative and operationally inactive.

## Verified migration facts

```yaml
route: META_AGENT_PRODUCT_BUILD

PR_1:
  merged: true
  head_commit: 1e18dfb341d9371171cf8c8ac44064d02e6030cc
  merge_commit: 322d4d437c4df79e17de1ad7137edf0f7ad76f34
  merge_tree_preserved: true

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

destination_only_recovery_first_run:
  task_id: META-AGENT-DESTINATION-ONLY-FRESH-SESSION-RECOVERY-001
  receiver_capability: PASS
  result: PASS_WITH_STALE_POST_MERGE_NAVIGATION
  demonstrated_defect: previous_live_navigation_still_required_review_of_already_merged_PR_1
  correction_task: META-AGENT-POST-MERGE-NAVIGATION-CORRECTION-001
  rerun_required: true

authority:
  source_authoritative: true
  destination_authoritative: false
  destination_active_writer: false
  target_truth_cutover: false
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

1. `MIGRATION-STATUS.md` — execution-time migration phase and recovery status;
2. `current/approved-spec.md` — preserved target-truth candidate, still inactive;
3. `authority/source-and-owner-map.md` — Owner and authority classes;
4. `current/active-context.md` — current phase, completed and pending work;
5. `handoff/handoff-current.md` — this recovery navigation;
6. `history/decision-version-and-migration-log.md` — historical decisions; stale historical next-gate text is not current state;
7. `methodology/core-methodology.md`;
8. `cases/case-and-feedback-ledger.md`;
9. `migration/source-snapshot-pointer.yaml`;
10. `migration/source-copy-verification.yaml`;
11. `research/README.md` and only the research manifests or formal reviews required by the current task.

The copied `current/meta-agent-mnemosyne-guidance-compatibility-guard.md` remains temporary process/safety evidence only. It must not import Mnemosyne maintenance state. Meta-Agent-owned behavior guidance and the initial memory-system foundation remain deferred and are not adopted by this correction.

## Supersession

This handoff supersedes the pre-merge instructions to review the shadow PR. PR #1 has already merged. The first destination-only recovery successfully reconstructed the project but correctly failed the freshness gate because the previous navigation had not recorded that merge.

## Exactly one safe next action

```yaml
safe_next_action: run_a_read_only_destination_only_fresh_session_recovery_after_this_navigation_correction_reaches_master
success_path:
  - confirm_current_phase_and_safe_next_action_are_recovered_without_Mnemosyne
  - return_the_result_to_the_Owner
  - prepare_a_separate_explicit_cutover_decision_if_the_rerun_passes
prohibited_in_same_step:
  - target_truth_cutover
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
