# Meta-Agent

This repository is the dedicated authoritative home for the Meta-Agent project.

```yaml
repository_status: dedicated_repository_authoritative_migration_complete_operationally_inactive
migration_closeout:
  task_id: META-AGENT-DEDICATED-REPOSITORY-MIGRATION-CLOSEOUT-001
  effective_condition: this_closeout_change_is_present_on_master

current_target_truth:
  repository: 08822407d/Meta-Agent
  branch: master
  path: current/approved-spec.md
  authoritative: true
  active_writer: true
  effective_for_operational_use: false

previous_bootstrap_source:
  repository: 08822407d/Mnemosyne
  commit: 8ef1c43b18b8686a30ffef544ca8b32fce1ca6cb
  root: target-projects/meta-agent/
  role:
    - immutable_historical_bootstrap_snapshot
    - migration_evidence
    - rollback_source
  authoritative: false
  active_writer: false
  Meta_Agent_writes_prohibited: true
  source_retirement_PR: 261
  source_retirement_merge_commit: c85ebba5425da4daf6f3344690778682b9f79d66

target_truth_cutover: true
post_cutover_recovery: PASS
no_dual_writer: PASS
operational_activation: false
pilot_authorized: false
private_material_authorized: false
RAG_authorized: false
MCP_authorized: false
automation_authorized: false
initial_memory_system_adopted: false
```

The repository migration changes only the authoritative repository, path and live-writer location. It does not activate Meta-Agent, authorize a pilot, adopt the initial memory system, or authorize private material, RAG, MCP, automation, prototype or benchmark execution.

The current product-build task is the candidate-only P0 Static Design-Conformance MVI v0.2 specification revision. See `current/active-context.md` and `handoff/handoff-current.md` for the exact next action, and `MIGRATION-STATUS.md` for closed migration evidence.
