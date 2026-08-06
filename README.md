# Meta-Agent

This repository is the dedicated authoritative home for the Meta-Agent project.

```yaml
repository_status: dedicated_repository_authoritative_operationally_inactive
cutover:
  task_id: META-AGENT-DEDICATED-REPOSITORY-CUTOVER-001
  owner_decision: APPROVE_DEDICATED_REPOSITORY_TARGET_TRUTH_CUTOVER
  effective_condition: this_cutover_change_is_present_on_master

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
  path: target-projects/meta-agent/current/approved-spec.md
  role: immutable_historical_bootstrap_and_rollback_snapshot
  authoritative: false
  active_writer: false
  Meta_Agent_writes_prohibited: true

target_truth_cutover: true
operational_activation: false
pilot_authorized: false
private_material_authorized: false
RAG_authorized: false
MCP_authorized: false
automation_authorized: false
initial_memory_system_adopted: false
```

The repository cutover changes only the authoritative repository and target-truth path. It does not activate Meta-Agent, authorize a pilot, adopt the initial memory system, or authorize private material, RAG, MCP, automation, prototype or benchmark execution.

See `MIGRATION-STATUS.md` for migration evidence and `current/active-context.md` for the current safe next action.
