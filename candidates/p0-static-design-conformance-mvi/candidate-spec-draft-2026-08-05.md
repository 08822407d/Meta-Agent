---
candidate_id: META-AGENT-P0-STATIC-DESIGN-CONFORMANCE-MVI-001
artifact_role: candidate_specification_draft
status: candidate_only_local_draft_not_owner_accepted_not_repository_recorded
target_project_id: meta-agent
base_ref: master@ca0926a9d67f10e60d8e97373370daa792c6eacb
target_truth_source: false
target_truth_modified: false
methodology_modified: false
stable_target_ids_issued: false
implementation_authorized: false
benchmark_or_pilot_authorized: false
private_material_authorized: false
operational_activation_authorized: false
created_in_surface: ChatGPT_connected_GitHub_read_only_analysis
---

# Meta-Agent P0 Candidate Specification Draft  
## Static Design-Conformance MVI

## 1. Decision

```yaml
prototype_scope_selection:
  selected: STATIC_DESIGN_CONFORMANCE_MVI
  provisional_label: P0-CAND-STATIC-DESIGN-CONFORMANCE-MVI
  purpose:
    - test_one_normative_design_serialization
    - test_deterministic_normalization
    - test_structural_authority_permission_provenance_and_mapping_checks
    - test_same_minimum_semantics_across_deterministic_single_agent_and_multi_agent_topologies
  execution_model: offline_static_validation_only
  agent_or_tool_execution: prohibited
  network_access: prohibited
  external_system_write: prohibited
  repository_write_during_prototype_run: prohibited
  material_class: public_or_synthetic_only
```

This is the minimum first prototype because it tests a shared dependency of the candidate
Frame-to-Design, Agent Design IR, permission/side-effect, provenance/allowed-influence,
backend-degradation, conformance, rebuildability, and strong-baseline proposals without
claiming that an Agent architecture works, without running an Agent, and without requiring
private material or operational activation.

It is not an accepted schema, method, runtime architecture, benchmark result, or pilot.

## 2. Evidence and authority basis

The draft is bounded by the current inactive Meta-Agent v0.1 target truth and draws only
candidate-level support from the completed research cycle.

```yaml
target_truth:
  - target-projects/meta-agent/current/approved-spec.md

authority_and_method_support:
  - target-projects/meta-agent/authority/source-and-owner-map.md
  - target-projects/meta-agent/methodology/core-methodology.md
  - target-projects/meta-agent/history/decision-version-and-migration-log.md

candidate_evidence:
  - target-projects/meta-agent/research/batches/2026Q3-batch-a/candidates/Batch-A-candidate-change-ledger.md
  - target-projects/meta-agent/research/waves/2026Q3-independent-wave-001/reviews/MA-DR-08-formal-intake-review.md
  - target-projects/meta-agent/research/waves/2026Q3-independent-wave-001/reviews/MA-DR-10-formal-intake-review.md
  - target-projects/meta-agent/research/waves/2026Q3-independent-wave-001/reviews/MA-DR-08-15-cross-report-convergence-v0.1.md
  - target-projects/meta-agent/research/waves/2026Q3-independent-wave-001/candidates/independent-wave-candidate-convergence-ledger.md
  - target-projects/meta-agent/research/waves/2026Q3-independent-wave-001/reviews/MA-DR-09-formal-intake-review.md
  - target-projects/meta-agent/research/waves/2026Q3-independent-wave-001/reviews/MA-DR-09-upstream-binding-addendum.md
  - target-projects/meta-agent/research/waves/2026Q3-independent-wave-001/candidates/MA-DR-09-candidate-impact-ledger.md
  - target-projects/meta-agent/research/waves/2026Q3-independent-wave-001/decisions/MA-DR-09-downstream-and-handoff-gate.md
```

Research agreement is evidence convergence only. It does not constitute Owner acceptance
or independent replication.

## 3. Prototype question

The prototype answers only this question:

> Can a small set of public/synthetic Meta-Agent design candidates be represented in one
> normative, human-reviewable serialization and deterministically checked for a fixed set
> of structural and safety invariants, with derived views rebuilt byte-identically?

It does not answer:

- whether the represented design is effective;
- whether one topology outperforms another;
- whether the field set is complete;
- whether the review burden is acceptable;
- whether a backend can faithfully execute the design;
- whether Meta-Agent should be activated.

## 4. Normative and derived artifact contract

### 4.1 Normative authoring source

Each fixture has exactly one normative file:

```text
design.yaml
```

Rules:

1. The file uses a JSON-compatible YAML 1.2 subset.
2. YAML anchors, aliases, merge keys, custom tags, implicit timestamps, and non-finite
   numbers are prohibited.
3. Mapping keys are strings.
4. The normative file is the only editable design source.
5. A graph, AST, canonical JSON form, index, summary, generated prompt, or visualization
   is a derived artifact and must never be marked normative.
6. The validator is read-only with respect to the normative input.

### 4.2 Derived outputs

For each fixture, a conforming validator produces:

```text
normalized/<fixture-id>.canonical.json
diagnostics/<fixture-id>.diagnostics.json
```

A complete run additionally produces:

```text
run-summary.json
```

The canonical JSON representation must be deterministically generated from the normative
YAML. Mapping keys are ordered lexicographically, array order is preserved unless the
schema explicitly declares a set-like collection, and scalar normalization is fixed by the
normalization contract. A repeated run over identical bytes must produce identical output
bytes.

### 4.3 Derived-view rebuildability

Deleting all generated files and rebuilding from the normative fixture set must reproduce
the same canonical JSON bytes, diagnostics bytes, and recorded hashes.

## 5. Minimum candidate design model

Every normative design fixture contains the following required top-level objects.

```yaml
meta:
  candidate_document_id:
  schema_version: "0.1-candidate"
  status: candidate_only
  material_class: public | synthetic
  source_refs: []

problem:
  problem_frame_ref:
  goal:
  non_goals: []
  assumptions: []
  unknowns: []

authority:
  owner:
  sole_target_truth_ref:
  artifact_roles: []
  authority_ceiling:

design:
  topology: deterministic_workflow | single_agent | multi_agent
  roles: []
  contracts: []
  workflow: []
  termination:
  recovery:

state_and_memory:
  state_objects: []
  memory_roles: []
  derived_views: []

actions:
  tools: []
  permissions: []
  side_effects: []
  human_gates: []

provenance:
  sources: []
  allowed_influence_rules: []

capability_mapping:
  capability_requirements: []
  backend_bindings: []

evaluation_hooks:
  claims: []
  deterministic_checks: []
  measurements: []
```

### 5.1 Role contract

Each role has:

```yaml
role_id:
purpose:
inputs: []
outputs: []
may_read: []
may_write: []
may_call_tools: []
authority_limit:
```

Every workflow step references exactly one declared role or the explicit mechanical
validator actor.

### 5.2 Input/output contract

Each contract has:

```yaml
contract_id:
producer_role:
consumer_role:
payload_type:
required_fields: []
confidentiality: public | synthetic
failure_behavior:
```

Private, customer, credential, secret, or production material classes are invalid in this
prototype.

### 5.3 Workflow and termination

Each workflow step has:

```yaml
step_id:
actor_ref:
input_refs: []
output_refs: []
preconditions: []
next:
failure_next:
retry:
```

The design must contain at least one reachable terminal state. Retries require an explicit
finite bound and a failure transition.

### 5.4 Authority, permissions, side effects, and human gates

Each permission has:

```yaml
permission_id:
subject_ref:
action:
resource_scope:
authority_basis_ref:
expires:
```

Each side effect has:

```yaml
side_effect_id:
action_ref:
external: true | false
reversible: true | false
permission_ref:
human_gate_ref:
rollback_or_compensation:
```

Rules:

- undeclared actions are denied;
- a permission may not exceed the declared authority ceiling;
- every external or irreversible side effect requires an explicit permission and human gate;
- every declared side effect requires rollback, compensation, or an explicit
  `irreversible_requires_owner_decision` disposition;
- the prototype fixtures themselves may not execute side effects.

### 5.5 State, memory, and truth roles

Exactly one `sole_target_truth_ref` is required.

Every other state or memory artifact declares one role:

```text
decision
method
evidence
current_state
handoff
candidate
raw_source
inference
derived_view
```

A `derived_view`, `current_state`, `handoff`, `candidate`, `evidence`, or `inference` object
may not be declared as the target truth source.

### 5.6 Provenance and allowed influence

Each source has:

```yaml
source_id:
origin:
role:
freshness:
scope:
```

Each allowed-influence rule has:

```yaml
source_ref:
may_influence: []
may_not_influence: []
requires_human_promotion: true | false
```

Research evidence and project feedback may support a candidate but may not directly
modify target truth or accepted methodology.

### 5.7 Capability and backend mapping

Each capability requirement is provider-neutral.

Each backend binding has:

```yaml
binding_id:
capability_ref:
backend_label:
evidence_freshness:
mapping_status:
guarantee_delta: []
```

Allowed mapping statuses:

```text
PRESERVED
EMULATED_WITH_RUNTIME_GUARD
DEGRADED_EXPLICIT
UNSUPPORTED_BLOCK
NOT_TESTED
```

A missing status, a stale high-impact capability claim treated as feasible, or a weakened
guarantee represented as `PRESERVED` is invalid.

Consumer-facing model labels do not attest the hidden backend.

## 6. Exact fixture manifest

The first prototype uses exactly eight public/synthetic fixtures.

| Fixture ID | Expected | Purpose |
|---|---:|---|
| `P01-DETERMINISTIC-WORKFLOW` | PASS | Minimal deterministic workflow baseline |
| `P02-STRONG-SINGLE-AGENT` | PASS | Minimal strong single-Agent design |
| `P03-REVIEWER-MULTI-AGENT` | PASS | Minimal producer/reviewer separation with explicit handoff |
| `N01-DUAL-TARGET-TRUTH` | FAIL | Two objects claim target-truth authority |
| `N02-UNAUTHORIZED-SIDE-EFFECT` | FAIL | External write lacks valid permission, human gate, or rollback |
| `N03-SOURCE-INFLUENCE-LAUNDERING` | FAIL | Research evidence directly changes target truth |
| `N04-HIDDEN-BACKEND-DEGRADATION` | FAIL | Lost guarantee is reported as preserved |
| `N05-NO-TERMINATION` | FAIL | Reachable cycle has no finite retry bound or terminal path |

The three positive fixtures share one synthetic problem frame so the prototype compares
representational coverage rather than outcome quality. They do not execute.

## 7. Deterministic diagnostics contract

Diagnostics are sorted by:

```text
fixture_id -> document_path -> error_code -> message_template_id
```

Minimum error vocabulary:

```yaml
structural:
  E001_REQUIRED_FIELD_MISSING:
  E002_INVALID_ENUM_VALUE:
  E003_DUPLICATE_ID:
  E004_UNRESOLVED_REFERENCE:
  E005_SCHEMA_VERSION_UNSUPPORTED:

truth_and_role:
  E100_TARGET_TRUTH_COUNT_NOT_ONE:
  E101_NON_TRUTH_ARTIFACT_MARKED_AS_TRUTH:
  E102_DERIVED_VIEW_MARKED_NORMATIVE:

workflow:
  E200_WORKFLOW_ACTOR_UNDECLARED:
  E201_NO_REACHABLE_TERMINATION:
  E202_UNBOUNDED_RETRY:

authority_and_effect:
  E300_PERMISSION_EXCEEDS_AUTHORITY:
  E301_EXTERNAL_EFFECT_WITHOUT_PERMISSION:
  E302_EXTERNAL_OR_IRREVERSIBLE_EFFECT_WITHOUT_HUMAN_GATE:
  E303_EFFECT_WITHOUT_ROLLBACK_OR_OWNER_DISPOSITION:

provenance:
  E400_SOURCE_ORIGIN_MISSING:
  E401_ALLOWED_INFLUENCE_VIOLATION:
  E402_RESEARCH_OR_FEEDBACK_DIRECTLY_MODIFIES_TRUTH:

capability_mapping:
  E500_MAPPING_STATUS_MISSING:
  E501_HIDDEN_GUARANTEE_DEGRADATION:
  E502_STALE_HIGH_IMPACT_CAPABILITY_TREATED_AS_FEASIBLE:

material:
  E600_PROHIBITED_MATERIAL_CLASS:
```

Messages may include fixture-specific values, but their templates and error codes are
stable for the prototype run.

## 8. Deterministic acceptance checks

A prototype implementation may be accepted for this candidate experiment only if all
checks below pass.

```yaml
acceptance_checks:
  A01_input_inventory:
    expected_fixtures: 8
    result: exact_match_required

  A02_positive_fixture_results:
    fixtures:
      - P01-DETERMINISTIC-WORKFLOW
      - P02-STRONG-SINGLE-AGENT
      - P03-REVIEWER-MULTI-AGENT
    required:
      validation_status: PASS
      error_count: 0

  A03_negative_fixture_results:
    N01-DUAL-TARGET-TRUTH:
      required_error: E100_TARGET_TRUTH_COUNT_NOT_ONE
    N02-UNAUTHORIZED-SIDE-EFFECT:
      required_any_errors:
        - E301_EXTERNAL_EFFECT_WITHOUT_PERMISSION
        - E302_EXTERNAL_OR_IRREVERSIBLE_EFFECT_WITHOUT_HUMAN_GATE
        - E303_EFFECT_WITHOUT_ROLLBACK_OR_OWNER_DISPOSITION
    N03-SOURCE-INFLUENCE-LAUNDERING:
      required_any_errors:
        - E401_ALLOWED_INFLUENCE_VIOLATION
        - E402_RESEARCH_OR_FEEDBACK_DIRECTLY_MODIFIES_TRUTH
    N04-HIDDEN-BACKEND-DEGRADATION:
      required_error: E501_HIDDEN_GUARANTEE_DEGRADATION
    N05-NO-TERMINATION:
      required_any_errors:
        - E201_NO_REACHABLE_TERMINATION
        - E202_UNBOUNDED_RETRY

  A04_repeatability:
    runs: 3
    requirement:
      canonical_output_bytes_identical: true
      diagnostics_output_bytes_identical: true
      run_summary_bytes_identical_except_declared_run_metadata: true

  A05_clean_rebuild:
    delete_all_derived_outputs_before_rebuild: true
    requirement:
      rebuilt_hashes_equal_original_hashes: true

  A06_read_only_source:
    requirement:
      normative_input_bytes_unchanged: true

  A07_offline_boundary:
    requirement:
      network_calls: 0
      model_calls: 0
      external_tool_calls: 0
      repository_writes: 0
      external_system_writes: 0

  A08_material_boundary:
    requirement:
      all_fixture_material: public_or_synthetic
      credentials_or_secrets: 0
      private_or_customer_material: 0

  A09_truth_and_method_boundary:
    requirement:
      target_truth_files_modified: 0
      accepted_methodology_files_modified: 0
      stable_target_IDs_issued: 0

  A10_claim_boundary:
    prohibited_claims:
      - proven_architecture_superiority
      - production_readiness
      - operational_safety
      - backend_equivalence
      - methodology_acceptance
      - pilot_authorization
```

A missing mechanical proof yields `BLOCKED`, not an inferred PASS.

## 9. Measurements collected without acceptance thresholds

The prototype records these measurements, but no threshold is accepted in advance:

```yaml
burden_and_utility_measurements:
  - normative_lines_and_bytes_per_fixture
  - required_field_count
  - authoring_time_if_observed
  - reviewer_comprehension_notes
  - deterministic_checks_triggered
  - true_positive_and_false_positive_observations_on_fixed_fixtures
  - normalization_and_validation_runtime
  - number_of_manual_corrections
  - fields_repeated_across_topologies
  - fields_that_produced_no_decision_or_defect_detection_value
```

These measurements support later Lite/Standard/High-Assurance calibration. They do not
automatically promote or remove fields.

## 10. Explicit non-goals

The first prototype excludes:

- Agent, workflow, model, or tool execution;
- generated prompts used against a live model;
- repository or external-system writes;
- outcome-quality scoring;
- architecture optimization;
- runtime traces from a real backend;
- provider routing or fallback execution;
- private-data storage or connectors;
- security claims beyond the fixed static invariants;
- human-subject studies;
- Tier-0, Tier-1, or Tier-2 execution;
- target-truth or methodology changes;
- stable target IDs;
- production UI or service architecture;
- dedicated-repository migration;
- automatic candidate or methodology promotion.

## 11. Tier-0 Owner decision-package disposition

```yaml
Tier_0_decision_package:
  worthwhile_in_principle: true
  prepare_now: false
  current_disposition: DEFER_UNTIL_STATIC_MVI_RESULT_AND_REMAINING_GATE_REVIEW
  prerequisites:
    - this_candidate_spec_is_reviewed_for_experiment_scope
    - prototype_implementation_receives_separate_task_local_authorization
    - deterministic_acceptance_result_exists
    - review_burden_measurements_are_available
    - applicable_non_FABLE_health_review_dependency_is_reconciled_or_explicitly_scoped
    - exact_Tier_0_scope_stop_and_rollback_conditions_are_owner_reviewed
  actual_Tier_0_run_authorized: false
```

The static MVI is a pre-pilot specification and prototype candidate. It is not itself a
Tier-0 run.

## 12. Candidate advancement gates

```text
candidate specification review
-> task-local implementation authorization
-> offline static prototype implementation
-> deterministic fixture run
-> result and burden review
-> decide whether to prepare Tier-0 Owner package
-> Owner decision
```

No transition is automatic.

## 13. Proposed repository recording package

This local draft has not been written to GitHub. If separately authorized, the smallest
repository recording package should be:

```text
target-projects/meta-agent/candidates/
  p0-static-design-conformance-mvi/
    README.md
    candidate-spec.md
    fixture-manifest.yaml
    expected-diagnostics.yaml
    acceptance-checks.yaml
```

Prototype implementation files, schema files, fixtures, and run results should be placed in
a later, separately authorized task rather than mixed into the candidate-spec recording
change.

Suggested recording task identity:

```yaml
task_id: META-AGENT-P0-STATIC-DESIGN-CONFORMANCE-SPEC-001
change_class: candidate_only_non_execution_repository_record
target_truth_change: false
methodology_change: false
implementation: false
pilot: false
```

## 14. Current disposition

```yaml
current_result:
  P0_scope_selected: true
  exact_candidate_specification_drafted: true
  deterministic_acceptance_checks_defined: true
  Tier_0_package_value_decided: true
  Tier_0_package_prepare_now: false
  implementation_started: false
  repository_recorded: false
  Owner_acceptance_requested_by_this_draft: false
```
