---
guard_id: META-AGENT-MNEMOSYNE-GUIDANCE-COMPATIBILITY-001
artifact_role: target_local_non_execution_process_compatibility_guard
status: active_temporary_compatibility_guard
target_project_id: meta-agent
target_truth_source: false
activated_by_merge_PR: 249
effective_until:
  - Meta_Agent_moves_to_a_dedicated_repository
  - Meta_Agent_adopts_its_own_owner_approved_behavior_guidance
review_on_migration: required
---

# Meta-Agent — Mnemosyne Guidance Compatibility and Route-Isolation Guard

## 1. Purpose

Meta-Agent currently resides physically inside the Mnemosyne repository but is not the Mnemosyne maintenance project. Until Meta-Agent moves to a dedicated repository and adopts its own behavior guidance, Mnemosyne guidance may be used only as a temporary process/repository-safety compatibility layer.

Physical co-location does not merge project identity, target truth, authority, current state, handoff route, or maintenance work.

## 2. Canonical augmented load command

Whenever a Meta-Agent conversation is instructed to refresh Mnemosyne guidance, use the following form rather than the bare shortcut alone:

```text
@GitHub 加载 Mnemosyne 指导约束，但只作为 Meta-Agent bootstrap 审阅、
交接正确性和仓库操作的流程／安全约束刷新。

防误解附加要求：
- 当前对话的唯一工作主线是 META_AGENT_PRODUCT_BUILD，不是 Mnemosyne maintenance；
- 不导入、继续或接管 Mnemosyne maintenance route；
- 不把 Mnemosyne 的 current/active-context.md、handoff/handoff-current.md、
  current/todo.md 或 current/open-questions.md 当作本对话行动计划，
  除非某个 Meta-Agent 任务独立、明确要求读取它们；
- 不把 Mnemosyne 指导、维护状态、研究状态或 handoff 当作 Meta-Agent target truth；
- Meta-Agent 唯一 target truth 仍是
  target-projects/meta-agent/current/approved-spec.md；
- 加载指导只刷新行为、交接和仓库安全约束，不启动 handoff、研究、
  prototype、benchmark、pilot、activation 或仓库写入；
- 不因两个项目共用同一仓库而推断项目身份、权威、路线或当前任务合并；
- 如果 Mnemosyne 指导与 Meta-Agent Owner 已批准的 target-local 规则冲突，
  停止并报告冲突，不静默覆盖 Meta-Agent；
- 该兼容层在 Meta-Agent 迁入专属仓库或建立自身行为指导后必须重新审阅、
  迁移或退休。
```

## 3. Required refresh receipt

After loading, the conversation should return:

```yaml
mnemosyne_guidance_refresh_for_Meta_Agent:
  operation: process_and_repository_safety_refresh
  current_conversation_mainline: META_AGENT_PRODUCT_BUILD
  current_conversation_task_preserved: true
  Mnemosyne_maintenance_route_imported: false
  Mnemosyne_live_state_used_as_action_plan: false
  handoff_started: false
  external_task_started: false
  repository_write_authorized_by_load_command: false
  Meta_Agent_target_truth:
    path: target-projects/meta-agent/current/approved-spec.md
  Mnemosyne_execution_source_role:
    path: current/human-approved-spec.md
    role: temporary_process_and_repository_safety_constraints_only
```

## 4. Boundaries

This guard does not:
- modify Meta-Agent target truth;
- make Mnemosyne an authority over Meta-Agent product decisions;
- authorize repository writes or external execution;
- import Mnemosyne maintenance tasks;
- permanently adopt Mnemosyne guidance after repository migration.
