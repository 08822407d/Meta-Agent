---
target_project_id: meta-agent
artifact_id: META-AGENT-V0.1-HANDOFF-001
artifact_role: fresh_session_handoff
status: dedicated_repository_shadow_import_ready_for_review
authority_level: non_execution_navigation
target_runtime_truth_source: false
last_updated_by_task: META-AGENT-DEDICATED-REPOSITORY-SHADOW-IMPORT-001
---

# Meta-Agent Handoff — Dedicated Repository Shadow Import

## Authority boundary

The sole active Meta-Agent target truth remains in Mnemosyne until a separate Owner cutover:

```text
08822407d/Mnemosyne@8ef1c43b18b8686a30ffef544ca8b32fce1ca6cb
target-projects/meta-agent/current/approved-spec.md
```

The candidate destination path is:

```text
08822407d/Meta-Agent
current/approved-spec.md
```

The destination copy is shadow-only, non-authoritative and operationally inactive.

## Required reading order in the destination shadow

1. `current/approved-spec.md` — preserved target-truth candidate, still inactive;
2. `authority/source-and-owner-map.md`;
3. `current/active-context.md`;
4. `handoff/handoff-current.md`;
5. `history/decision-version-and-migration-log.md`;
6. `methodology/core-methodology.md`;
7. `cases/case-and-feedback-ledger.md`;
8. `migration/source-snapshot-pointer.yaml`;
9. relevant research manifests, formal reviews and candidate ledgers only as required by the current task.

The copied `current/meta-agent-mnemosyne-guidance-compatibility-guard.md` remains temporary process/safety evidence. It must not import Mnemosyne maintenance state. A Meta-Agent-owned behavior-guidance design may be considered after repository migration; it is not adopted by this shadow import.

## Current state

```yaml
route: META_AGENT_PRODUCT_BUILD
shadow_branch: meta-agent-shadow-migration-001
base_source_files: 226
byte_exact_files: 224
transformed_files: 2
source_authoritative: true
destination_authoritative: false
target_truth_cutover: false
operational_activation: false
initial_memory_system_work: deferred
```

## Exactly one safe next action

Review and mechanically verify the one destination shadow pull request. Do not build the initial memory system, initialize another branch, activate Meta-Agent or change target truth in the same step.
