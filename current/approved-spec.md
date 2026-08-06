---
target_project_id: meta-agent
artifact_id: META-AGENT-V0.1-APPROVED-SPEC-001
artifact_role: target_execution_source
status: owner_accepted_v0_1_inactive_design_and_governance_baseline
authority_level: target_execution_source
target_runtime_truth_source_designated: true
target_runtime_truth_source_effective: false
effective_for_operational_use: false
created_by_task: MNEMOSYNE-171
last_updated_by_task: META-AGENT-OWNER-DISPOSITION-001
design_version: 0.1.0
schema_version: 0.1.0
policy_version: 0.1.0
delivery_version: 0.1.0
owner: user
owner_disposition: ACCEPT_WITH_LIMITATIONS
owner_disposition_recorded_at: 2026-07-31
source_refs:
  - notes/first-target-project-intake-records/meta-agent/meta-agent-v0.1-M0-requirements-and-authority-baseline.md
  - notes/first-target-project-intake-records/meta-agent/meta-agent-v0.1-M1-workspace-safety-build-manifest.md
  - notes/first-target-minimum-upgrade-contract-v0.1.md
  - notes/first-target-minimum-upgrade-contract-advisory-pilot-checklist-v0.1.md
  - target-projects/meta-agent/decision-support/Meta-Agent-v0.1-owner-disposition-decision-package.md
known_limits:
  - accepted_as_inactive_design_and_governance_baseline_only
  - operational_activation_requires_separate_explicit_owner_decision
  - applicable_non_FABLE_health_review_findings_remain_pending_before_pilot_or_activation
  - this_file_does_not_authorize_private_material_or_automatic_writeback
  - pending_requirements_remain_pending
---

# Meta-Agent v0.1 Approved Spec — Owner-Accepted Inactive Baseline

## 1. Authority, Owner disposition and activation

This file is the **designated sole Meta-Agent v0.1 runtime truth-source path**. The Owner has accepted its current requirements, initial method references and governance structure as an inactive design and governance baseline. It is **not** effective for operational use.

```yaml
owner_disposition:
  decision: ACCEPT_WITH_LIMITATIONS
  decision_task: META-AGENT-OWNER-DISPOSITION-001
  recorded_at: 2026-07-31
  accepted_as:
    - repository_backed_Meta_Agent_v0_1_design_and_governance_baseline
    - MA_REQ_0001_through_MA_REQ_0016
    - MA_METHOD_0001_through_MA_METHOD_0006_as_initial_incomplete_method_library
    - sole_target_truth_path_designation
    - authority_source_and_memory_role_separation
    - stable_ID_version_migration_and_rollback_baseline
  not_accepted_as:
    - production_ready_system
    - unrestricted_operational_Meta_Agent
    - empirically_validated_Agent_architecture_optimizer
    - secure_autonomous_self_improving_system
    - provider_neutral_Agent_compiler_or_complete_design_IR
    - private_material_capable_system
    - RAG_MCP_auto_writeback_or_shared_memory_system
  activation_authorized: false
```

```yaml
activation:
  designated_truth_source_path: target-projects/meta-agent/current/approved-spec.md
  owner: user
  current_status: owner_accepted_v0_1_inactive_design_and_governance_baseline
  effective_for_operational_use: false
  separate_activation_decision_required: true
  activation_requires:
    - explicit_target_scoped_owner_activation_authorization
    - latest_active_context_has_no_undeferred_operational_blocker
    - applicable_health_review_P0_P1_equivalent_findings_checked_or_explicitly_deferred
    - exact_operational_or_bounded_pilot_scope_and_acceptance_stop_rollback_criteria
  no_implicit_activation_from_owner_baseline_acceptance: true
  no_implicit_activation_from_file_or_PR_merge: true
```

The Owner disposition makes this file the accepted repository-backed design and governance baseline within the stated limitations. It does not authorize execution, private material, a pilot, broad writes, advanced automation or a production claim. Mnemosyne's `current/human-approved-spec.md` governs Mnemosyne process and safety only; it is not Meta-Agent runtime truth.

## 2. Identity, purpose and scope

Meta-Agent is a long-lived, versioned, general-purpose Agent-design and methodology system owned by the user.

Its purpose is to help design, review and evolve:

- a single specialized Agent when one Agent is sufficient;
- a multi-Agent or team arrangement when role separation, parallelism, independent review, tool separation or coordination needs justify it;
- workflows, memory structures, handoff rules, model/tool routing, evaluation and human-decision boundaries.

Software engineering is the dominant early incubation domain, not the whole identity of Meta-Agent.

## 3. Confirmed v0.1 requirements

The following requirement IDs are Owner-accepted target requirements for the current design and governance baseline. They must not be silently renumbered, reused or semantically changed. Operational application remains gated by the inactive status of this target truth source.

| ID | Requirement |
|---|---|
| `MA-REQ-0001` | Meta-Agent designs AI Agents, workflows and supporting methodology for concrete user goals. |
| `MA-REQ-0002` | It may design one specialized Agent or a multi-Agent/team arrangement; multi-Agent is not the default. |
| `MA-REQ-0003` | It remains general-purpose while using software engineering as a heavy early incubation domain. |
| `MA-REQ-0004` | Designs may include roles, workflows, memory structures, handoff rules, model/tool routing, evaluation and human-decision boundaries. |
| `MA-REQ-0005` | It should reduce repetitive work without removing the user's valuable learning, architecture, engineering, performance, management or high-risk judgment opportunities. |
| `MA-REQ-0006` | Project feedback cannot automatically rewrite general methodology; it must pass through review, abstraction, candidate improvement, user confirmation and an approved update. |
| `MA-REQ-0007` | General methodology, target-specific cases, research evidence, current state, raw/source evidence, candidate ideas and approved target truth remain distinguishable. |
| `MA-REQ-0008` | v0.1 is file-based and human-reviewed; it assumes no RAG, MCP, auto-indexing, auto-writeback, autonomous self-modification or multi-Agent runtime coordination. |
| `MA-REQ-0009` | The public bootstrap repository stores only public, synthetic, explicitly redacted or safe-pointer material; private originals remain outside Git unless separately approved. |
| `MA-REQ-0010` | v0.1 includes stable identity, compact versions, migration mapping, validation and rollback so later improvements can be applied without rebuilding from scratch. |
| `MA-REQ-0011` | Work is split by capability demand: bounded routine execution may use a validated next-tier model; novel, ambiguous, authority-changing or high-impact work escalates to a frontier model and human decision. |
| `MA-REQ-0012` | Project cases may inform methodology only as scoped evidence; target-specific lessons do not silently become global methods. |
| `MA-REQ-0013` | The user is owner and final authority for product purpose, target truth, methodology promotion, privacy, repository/write scope and operational acceptance. |
| `MA-REQ-0014` | Meta-Agent has exactly one declared runtime truth source; Mnemosyne is design archive/control plane, not a second runtime truth source. |
| `MA-REQ-0015` | A fresh qualified session can resume from target truth, current context and handoff without hidden prior-conversation assumptions. |
| `MA-REQ-0016` | Important methodology changes require evidence, acceptance criteria, issue/postmortem records where relevant and regression or semantic review proportionate to impact. |

## 4. v0.1 non-goals and accepted limitations

v0.1 does not claim or authorize:

- a production-grade autonomous Meta-Agent runtime;
- automatic methodology rewrite or autonomous self-improvement;
- automatic cross-project or cross-Agent memory sharing;
- a persistent global user, learner, cognitive or psychological profile;
- learner-state or GPT Live module implementation;
- a universal HO-GUIDANCE policy;
- full event sourcing, dual-write, shadow cutover or bitemporal storage;
- RAG, MCP, vector storage, auto-indexing or auto-writeback;
- private source, secrets, credentials, customer or confidential material in public Git;
- reconstruction of the lost original Meta-Agent conversation as fact;
- research reports, Mnemosyne current files, handoff or model inference as target runtime truth;
- completion of every Mnemosyne TODO before Meta-Agent use;
- empirical validation of Agent-architecture optimization;
- complete Meta-level security;
- a provider-neutral Agent compiler or complete Agent Design IR.

```yaml
accepted_limitations:
  - target_truth_remains_inactive_until_separate_activation_decision
  - no_private_material_ingestion
  - no_broad_repository_or_external_write
  - no_automatic_methodology_promotion
  - no_production_ready_claim
  - no_claim_of_validated_architecture_optimization
  - no_claim_of_complete_Meta_level_security
  - applicable_non_FABLE_health_review_findings_remain_pending_before_pilot_or_activation
  - MA_DR_06_and_MA_DR_07_recommended_before_broad_tool_bearing_operation
```

## 5. Target file roles

```yaml
target_file_roles:
  target-projects/meta-agent/current/approved-spec.md:
    role: sole_target_execution_source_after_separate_activation
  target-projects/meta-agent/current/active-context.md:
    role: non_execution_current_state_and_safe_next_action
  target-projects/meta-agent/authority/source-and-owner-map.md:
    role: owner_source_priority_material_and_write_authority_support
  target-projects/meta-agent/methodology/core-methodology.md:
    role: initial_incomplete_method_library_accepted_only_as_referenced_here
  target-projects/meta-agent/cases/case-and-feedback-ledger.md:
    role: evidence_candidate_and_feedback_only
  target-projects/meta-agent/history/decision-version-and-migration-log.md:
    role: reviewed_history_lineage_migration_and_rollback
  target-projects/meta-agent/handoff/handoff-current.md:
    role: non_execution_fresh_session_navigation
```

No file acquires authority merely because it is newer, longer, or placed under `current/`.

## 6. Conflict precedence

```yaml
conflict_precedence:
  - current_explicit_user_Meta_Agent_decision_recorded_in_an_authorized_change
  - this_approved_spec_within_its_owner_accepted_inactive_scope
  - user_approved_target_build_or_change_manifest_within_exact_scope
  - user_approved_target_decision_record
  - methodology_objects_referenced_by_this_spec
  - active_context_and_handoff_for_navigation_only
  - reviewed_evidence_and_research
  - model_inference_marked_as_inference
```

If a current user instruction conflicts with this spec, the Agent must identify the conflict, stop affected execution, and create or request an authorized change record. It must not silently rewrite target truth.

## 7. Initial accepted methodology references

The initial method library consists of:

```yaml
methodology_refs:
  - MA-METHOD-0001
  - MA-METHOD-0002
  - MA-METHOD-0003
  - MA-METHOD-0004
  - MA-METHOD-0005
  - MA-METHOD-0006
methodology_file: target-projects/meta-agent/methodology/core-methodology.md
methodology_status: owner_accepted_as_initial_incomplete_library
```

Methods are general design aids. They do not override requirements, authority or a target-specific user's decisions. This disposition does not add `MA-METHOD-0007` or later methods.

## 8. Case, feedback and methodology-promotion rule

```text
project outcome or feedback
  -> MA-FEEDBACK record with evidence and scope
  -> review and competing explanations
  -> scoped lesson candidate
  -> candidate methodology improvement
  -> user decision
  -> authorized method update with version and validation
```

Prohibited:

- automatically converting a successful or failed case into global methodology;
- treating one provider/model behavior as a permanent law;
- removing contradictory cases from the evidence record;
- promoting target-specific private details into shared methodology.

## 9. Safe input and repository-write boundary

Allowed in the public bootstrap workspace only after applicable preflight:

- public information;
- synthetic material;
- explicitly redacted excerpts with a redaction manifest;
- safe external pointers;
- high-level user-confirmed requirements or decisions assessed as non-sensitive;
- reviewed non-sensitive research or method summaries.

Prohibited:

- secrets, credentials, tokens or account material;
- private source code;
- customer/confidential material;
- unredacted personal, learning, voice or chat records;
- invented reconstructions of lost material;
- unverified current product/model facts presented as stable truth.

```yaml
repository_write_rule:
  platform_permission_is_not_task_authorization: true
  every_repository_or_target_write_requires:
    - task_id
    - actor_and_surface
    - exact_target_and_path_scope
    - user_authorization_ref
    - allowed_actions
    - prohibited_actions
    - expiry_with_task
  private_original_default: outside_git
```

## 10. Capability-aware work split

```yaml
capability_split:
  frontier_reasoning_and_human_decision:
    - ambiguous_or_conflicting_core_requirements
    - product_purpose_scope_or_non_goal_change
    - owner_truth_source_authority_privacy_or_trust_boundary_change
    - novel_methodology_without_accepted_basis
    - promotion_of_case_feedback_to_general_methodology
    - high_impact_validation_failure_or_exception
  validated_next_tier_execution:
    - implement_frozen_and_self_contained_specs
    - maintain_bounded_current_state_and_handoff
    - apply_approved_low_risk_additive_updates
  mechanical_verification:
    - exact_path_allowlist
    - required_sections_and_front_matter
    - stable_ID_uniqueness
    - version_and_source_ref_checks
    - forbidden_material_scan
    - diff_and_format_checks
  human_only:
    - operational_activation_or_acceptance
    - target_truth_or_authority_change
    - sensitive_material_approval
```

No provider or named model is permanently assigned to a tier. Visible selection is recorded when available; hidden backend identity is not inferred from speed, style or self-report.

## 11. Versioning, migration and rollback

```yaml
version_set:
  design_version: 0.1.0
  schema_version: 0.1.0
  policy_version: 0.1.0
  delivery_version: 0.1.0

owner_disposition_version_effect:
  version_change: none
  rationale: status_and_owner_acceptance_record_only_no_requirement_method_schema_policy_or_delivery_semantics_changed

upgrade_contract:
  contract_id: META-AGENT-V0.1-UPGRADE-CONTRACT-001
  profile: standard
  ID_reuse_prohibited: true
  breaking_or_authority_change_requires:
    - MA-MIG_record
    - old_to_new_mapping
    - preserve_transform_recompute_retire_decisions
    - compatibility_statement
    - validation
    - owner_decision
    - rollback_or_revision_plan
  derived_views: rebuildable_and_non_authoritative_where_practical
```

The canonical decision, version, migration and rollback details are recorded in `history/decision-version-and-migration-log.md`.

## 12. Update and supersession rule

An update to target truth requires:

1. explicit target-scoped user authorization;
2. identified object and path scope;
3. source and authority review;
4. version change, or a recorded no-version-change rationale;
5. validation and rollback/revision plan;
6. an updated decision/migration record;
7. current context and handoff synchronization.

Stable IDs are never reused. Rename, split, merge, replacement and retirement require explicit lineage mapping.

## 13. Operational activation gate

```yaml
operational_acceptance:
  baseline_disposition: ACCEPT_WITH_LIMITATIONS
  baseline_accepted: true
  target_truth_effective_for_operational_use: false
  operational_activation_authorized: false
  merge_of_this_recording_PR_alone: records_owner_decision_but_does_not_authorize_operation
  next_activation_or_pilot_decision_requires:
    - separate_explicit_owner_authorization
    - applicable_non_FABLE_health_review_findings_checked_or_explicitly_deferred
    - exact_bounded_scope_or_pilot_manifest
    - acceptance_stop_and_rollback_criteria
    - latest_context_and_handoff_review
  prohibited_implicit_transitions:
    - baseline_acceptance_to_operational_activation
    - research_recommendation_to_methodology_change
    - repository_permission_to_task_authority
```

Until a separate Owner decision activates this spec for an exact scope, Meta-Agent must not be represented as operational, production-ready, approved for private material or authorized for a pilot.
