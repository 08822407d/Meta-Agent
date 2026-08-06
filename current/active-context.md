---
target_project_id: meta-agent
artifact_id: META-AGENT-V0.1-ACTIVE-CONTEXT-001
artifact_role: non_execution_current_state
status: dedicated_repository_shadow_import_ready_for_review
authority_level: operational_support
target_runtime_truth_source: false
last_updated_by_task: META-AGENT-DEDICATED-REPOSITORY-SHADOW-IMPORT-001
design_version: 0.1.0
---

# Meta-Agent Active Context — Dedicated Repository Shadow Import

```yaml
route: META_AGENT_PRODUCT_BUILD
phase: dedicated_repository_shadow_import_review
owner_disposition: ACCEPT_WITH_LIMITATIONS

source_authority:
  repository: 08822407d/Mnemosyne
  commit: 8ef1c43b18b8686a30ffef544ca8b32fce1ca6cb
  target_truth_path: target-projects/meta-agent/current/approved-spec.md
  remains_authoritative_until_explicit_cutover: true

destination_shadow:
  repository: 08822407d/Meta-Agent
  branch: meta-agent-shadow-migration-001
  target_truth_path_candidate: current/approved-spec.md
  authoritative: false
  active_writer: false
  effective_for_operational_use: false

migration_payload:
  source_root: target-projects/meta-agent/
  base_files_imported: 226
  byte_exact_files: 224
  transformed_live_navigation:
    - current/active-context.md
    - handoff/handoff-current.md
  path_mapping: project_root_flattening

initial_memory_system_foundation:
  status: deferred_until_after_migration_and_destination_only_recovery
  adopted_by_this_import: false

pilot_authorized: false
private_material_authorized: false
RAG_authorized: false
MCP_authorized: false
automation_authorized: false
operational_activation_authorized: false
```

## Completed

- The frozen 226-file Meta-Agent source snapshot has been copied into the dedicated repository on one non-authoritative shadow branch.
- Existing target truth, authority, methodology, case/feedback ledger, history, research evidence, candidates, decision support and historical handoff evidence are preserved.
- Only current navigation and the current handoff are regenerated for the destination shadow context.
- The later Mnemosyne initial-memory-system candidate and the unmerged migration-preparation branch artifacts are not adopted or imported.

## Remaining migration work

1. Review the one destination shadow pull request.
2. Mechanically verify the imported path set and the 224 byte-exact files against the frozen source snapshot.
3. Run destination-only fresh-session recovery using a next-tier model.
4. Correct only demonstrated migration defects; do not add a memory foundation during this migration.
5. Ask the Owner for an explicit target-truth repository/path cutover decision.
6. After cutover, freeze the old Mnemosyne target root as historical bootstrap evidence and an immutable pointer.

## Exactly one safe next action

```yaml
safe_next_action: human_and_mechanical_review_of_the_destination_shadow_pull_request
no_automatic_cutover: true
no_automatic_operational_activation: true
```
