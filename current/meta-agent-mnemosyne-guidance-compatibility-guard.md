---
guard_id: META-AGENT-MNEMOSYNE-GUIDANCE-COMPATIBILITY-001
artifact_role: retired_target_local_process_compatibility_guard_and_historical_evidence
status: retired_after_dedicated_repository_cutover
target_project_id: meta-agent
target_truth_source: false
activated_by_merge_PR: 249
retired_by_task: META-AGENT-DEDICATED-REPOSITORY-CUTOVER-001
retirement_effective_condition: this_cutover_change_is_present_on_master
replacement_behavior_guidance_status: not_yet_adopted
---

# Meta-Agent — Retired Mnemosyne Guidance Compatibility Guard

## 1. Retirement decision

This file is retained only as historical evidence of the temporary process and repository-safety compatibility layer used while Meta-Agent was physically hosted inside `08822407d/Mnemosyne`.

When `META-AGENT-DEDICATED-REPOSITORY-CUTOVER-001` is present on the Meta-Agent `master` branch:

```yaml
Meta_Agent_repository: 08822407d/Meta-Agent
Meta_Agent_target_truth: current/approved-spec.md
Mnemosyne_guidance_compatibility_guard_active: false
Mnemosyne_maintenance_route_imported: false
Mnemosyne_guidance_loaded_by_default_for_Meta_Agent: false
Meta_Agent_owned_behavior_guidance_adopted: false
```

The former augmented Mnemosyne-guidance load command is no longer an active Meta-Agent instruction. Its original text remains recoverable from Git history for audit purposes.

## 2. Post-cutover boundaries

After cutover:

- Mnemosyne maintenance guidance, current state, TODOs, open questions and handoff are not Meta-Agent action plans or behavior authority.
- The pinned Mnemosyne source snapshot is historical bootstrap and rollback evidence only.
- Repository access or platform permission never replaces task-local Owner authorization.
- Meta-Agent product truth comes only from `08822407d/Meta-Agent/current/approved-spec.md`.
- This retirement does not activate Meta-Agent, authorize private material, adopt the initial memory system, or authorize RAG, MCP, automation, prototype, benchmark or pilot work.
- Until Meta-Agent-owned behavior guidance is separately reviewed and adopted, project-specific repository-operation guidance must come from explicit task-local Owner instructions, the approved spec, the authority map, and applicable platform/tool safety requirements.

## 3. Historical role

The compatibility layer previously prevented physical co-location from merging Meta-Agent with the Mnemosyne maintenance route. That objective is now satisfied structurally by the dedicated repository and the Owner-approved cutover. This file must not be loaded as an active guard or used to reintroduce Mnemosyne maintenance constraints as Meta-Agent product authority.
