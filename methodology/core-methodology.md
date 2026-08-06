---
target_project_id: meta-agent
artifact_id: META-AGENT-V0.1-CORE-METHODOLOGY-001
artifact_role: approved_method_library_only_as_referenced_by_target_spec
status: owner_accepted_v0_1_initial_incomplete_method_library
authority_level: method_support
target_runtime_truth_source: false
created_by_task: MNEMOSYNE-171
last_updated_by_task: META-AGENT-SUPPORT-METADATA-SYNC-001
design_version: 0.1.0
policy_version: 0.1.0
source_refs:
  - target-projects/meta-agent/current/approved-spec.md
  - target-projects/meta-agent/history/decision-version-and-migration-log.md
  - notes/first-target-project-intake-records/meta-agent/meta-agent-v0.1-M0-requirements-and-authority-baseline.md
  - notes/first-target-project-intake-records/meta-agent/meta-agent-v0.1-M1-workspace-safety-build-manifest.md
  - notes/first-target-project-intake-records/meta-agent/controlled-dry-run-results/META-AGENT-CONTROLLED-NO-TARGET-WRITE-DRY-RUN-001-result.md
known_limits:
  - initial_compact_method_set
  - not_a_complete_agent_engineering_theory
  - target_specific_cases_must_not_be_encoded_as_universal_rules
  - target_truth_remains_inactive_for_operational_use
---

# Meta-Agent Core Methodology v0.1

## 1. Method-library rule

The six methods below are the compact initial method set accepted by the Owner as an incomplete method library and referenced by the inactive Meta-Agent v0.1 target spec.

```yaml
method_status_rule:
  owner_accepted_as_initial_incomplete_library: true
  accepted_by_decision: MA-DEC-0007
  target_truth_effective_for_operational_use: false
  execution_source: false
  may_not_override:
    - user_decision
    - target_approved_spec
    - target_specific_authority_or_privacy_boundary
```

This status synchronization does not change any method semantics or issue additional methods. A method change requires a stable ID, source/evidence review, version decision and user acceptance proportionate to impact.

---

## MA-METHOD-0001 — Requirement and problem framing

```yaml
id: MA-METHOD-0001
name: requirement_and_problem_framing
purpose: convert_an_initial_request_or_symptom_into_a_bounded_reviewable_problem_frame
source_refs:
  - MA-REQ-0001
  - MA-REQ-0005
  - MA-REQ-0007
  - MA-REQ-0013
status: owner_accepted_v0_1_method_as_referenced_by_inactive_spec
```

### Inputs

- user goal and current problem description;
- confirmed constraints, non-goals and authority;
- available evidence and artifacts;
- pending questions, unknowns and unsupported assumptions.

### Process

1. Preserve the user's wording or a safe source reference.
2. Separate goal, symptom, proposed solution and inferred root cause.
3. Identify competing problem models when evidence is weak.
4. Separate confirmed requirements, pending requirements, unknowns and unsupported assumptions.
5. Identify irreversible, authority-changing or high-risk decisions.
6. State what evidence would confirm or falsify the leading problem model.
7. Obtain user confirmation before treating a reconstructed problem as target truth.

### Outputs

- problem frame;
- requirements/status split;
- assumptions and evidence gaps;
- candidate options;
- user-decision points;
- stop/escalation conditions.

### Stop or escalate when

- core purpose is ambiguous;
- user statements conflict materially;
- sensitive material or authority changes are required;
- the Agent would need to invent missing facts;
- a novel architecture decision has high impact.

### Validation

A fresh reviewer should be able to distinguish what the user said, what evidence shows, what the Agent inferred and what remains undecided.

---

## MA-METHOD-0002 — Single-Agent versus multi-Agent decision

```yaml
id: MA-METHOD-0002
name: single_Agent_vs_multi_Agent_decision
purpose: choose_the_simplest_arrangement_that_reliably_satisfies_the_task
source_refs:
  - MA-REQ-0002
  - MA-REQ-0004
  - MA-REQ-0011
status: owner_accepted_v0_1_method_as_referenced_by_inactive_spec
```

### Default

Use one Agent or one bounded workflow unless separation provides a concrete benefit that exceeds coordination cost.

### Reasons that may justify separation

- different tools, permissions or trust boundaries;
- independent review or adversarial checking;
- substantially different expertise or context sets;
- safe parallel work on decomposable tasks;
- long-running execution that should not hold all design context;
- explicit writer/verifier or planner/executor roles.

### Costs to account for

- duplicated work;
- state drift and conflicting outputs;
- hidden shared-memory assumptions;
- handoff and merge overhead;
- unclear decision authority;
- greater privacy and injection surface;
- more difficult provenance and debugging.

### Output

```yaml
arrangement_decision:
  selected: single_agent | workflow | multi_agent_team | unknown_requires_experiment
  task_decomposition:
  role_boundaries:
  shared_state_and_truth_source:
  handoff_and_conflict_rule:
  human_decision_points:
  expected_benefit:
  coordination_cost:
  evidence_and_assumptions:
```

### Stop or escalate when

A proposed team changes privacy, write authority, truth sources or introduces autonomous coordination not covered by current policy.

### Validation

Compare against the simplest viable single-Agent/workflow baseline; multi-Agent is not accepted merely for sophistication.

---

## MA-METHOD-0003 — Authority, source and memory-role separation

```yaml
id: MA-METHOD-0003
name: authority_source_and_memory_role_separation
purpose: prevent_evidence_context_and_inference_from_becoming_runtime_truth
source_refs:
  - MA-REQ-0006
  - MA-REQ-0007
  - MA-REQ-0009
  - MA-REQ-0013
  - MA-REQ-0014
status: owner_accepted_v0_1_method_as_referenced_by_inactive_spec
```

### Process

1. Identify owner and final decision authority.
2. Identify the single runtime truth source.
3. Classify every artifact as target truth, decision, method, evidence, current state, handoff, candidate, raw/source or inference.
4. Define source priority and conflict handling.
5. Define material sensitivity and storage route.
6. Define task-local read/write authority separately from platform permissions.
7. Require explicit promotion when an artifact changes role.

### Invariants

- one runtime truth source;
- raw evidence does not automatically override approved truth;
- newer derived views are not automatically authoritative;
- current context and handoff are navigation, not execution source;
- Mnemosyne is not a second target truth source;
- private material does not enter public Git without explicit approval and safety preflight.

### Validation

Trace each load-bearing target claim to an authority or evidence source and verify that role changes are explicit.

---

## MA-METHOD-0004 — Capability-aware work decomposition and escalation

```yaml
id: MA-METHOD-0004
name: capability_aware_work_decomposition_and_escalation
purpose: concentrate_scarce_frontier_reasoning_and_make_bounded_execution_portable
source_refs:
  - MA-REQ-0011
  - MA-REQ-0016
  - current/model-capability-aware-work-planning-open-question.md
status: owner_accepted_v0_1_method_as_referenced_by_inactive_spec
```

### Task classification

```yaml
task_classes:
  - mechanical_or_exact_transformation
  - bounded_rule_application
  - localized_judgment
  - multi_source_synthesis
  - architecture_or_policy_adjudication
  - open_ended_research_or_novel_design
```

### Decomposition

- frontier reasoning: ambiguous, novel, authority-changing or high-impact decisions;
- next-tier execution: frozen inputs, exact scope, explicit acceptance and stop conditions;
- mechanical verification: IDs, paths, versions, sources, forbidden material and diffs;
- human decision: purpose, truth, sensitive material, methodology promotion and operational acceptance.

### Executor contract

A bounded executor receives:

- self-contained inputs;
- exact allowed paths/actions;
- explicit prohibited actions;
- authority/source map;
- acceptance checks;
- stop-on-ambiguity rule;
- escalation target.

### Validation

Measure output correctness, boundary adherence, escalation behavior and human rework. Delegation is not beneficial if verification/rework consumes more scarce reasoning than it saves.

### Provenance limit

Visible model selection and behavior do not attest the hidden backend.

---

## MA-METHOD-0005 — Evaluation, feedback and methodology-promotion gate

```yaml
id: MA-METHOD-0005
name: evaluation_feedback_and_methodology_promotion_gate
purpose: learn_from_projects_without_contaminating_general_methodology
source_refs:
  - MA-REQ-0006
  - MA-REQ-0012
  - MA-REQ-0016
status: owner_accepted_v0_1_method_as_referenced_by_inactive_spec
```

### Required pipeline

```text
case result or feedback
  -> evidence-bearing MA-FEEDBACK record
  -> review and competing explanations
  -> scoped lesson candidate
  -> candidate method change
  -> acceptance criteria and regression/semantic review
  -> user decision
  -> authorized MA-METHOD update and version record
```

### Evaluation principles

- define success before inspecting the preferred answer where practical;
- separate producer claims from verifier evidence;
- record PASS, PASS_WITH_WARNINGS, FAIL and BLOCKED distinctly;
- preserve negative and contradictory evidence;
- assess authority/state correctness, not artifact polish alone;
- identify target-specific versus generalizable findings;
- record source/model/tool context and limitations.

### No automatic promotion

One successful case, one failure, one user preference or one model's behavior is insufficient to change general methodology automatically.

### Validation

Every approved method change must cite feedback/evaluation evidence, user decision, version impact and rollback/revision path.

---

## MA-METHOD-0006 — Handoff and fresh-session continuity

```yaml
id: MA-METHOD-0006
name: handoff_and_fresh_session_continuity
purpose: allow_a_qualified_fresh_session_to_resume_without_hidden_prior_context
source_refs:
  - MA-REQ-0015
  - MA-REQ-0016
status: owner_accepted_v0_1_method_as_referenced_by_inactive_spec
```

### Handoff minimum

- target identity and owner;
- sole runtime truth source and whether it is active;
- current version and stage;
- required reading order;
- completed, pending, unknown and blocked items;
- authority, privacy and write boundaries;
- one safe next action;
- stale-context and contradiction warning;
- explicit statement that handoff is not execution source.

### Receive sequence

1. Read handoff as navigation only.
2. Load the target truth source separately.
3. Load authority/source map and current context.
4. Verify repository/ref freshness and unresolved blockers.
5. Report what was loaded and what remains unavailable.
6. Stop before substantive continuation unless the task is authorized.

### Validation

A fresh session must recover the same authority, current stage, boundaries and safe next action without relying on hidden memory.

---

## 2. Methodology evolution boundary

```yaml
methodology_update:
  required:
    - evidence_or_case_feedback_refs
    - candidate_change
    - scope_and_generalizability_review
    - user_decision
    - design_or_policy_version_decision
    - validation_and_rollback_or_revision_plan
  prohibited:
    - silent_rewrite
    - automatic_case_to_method_promotion
    - model_self_approval
    - removal_of_conflicting_evidence
```
