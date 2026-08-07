---
review_id: META-AGENT-P0-STATIC-DESIGN-CONFORMANCE-FRONTIER-REVIEW-001
artifact_role: candidate_specification_frontier_review
status: completed_candidate_review_revision_required
target_project_id: meta-agent
reviewed_candidate: META-AGENT-P0-STATIC-DESIGN-CONFORMANCE-MVI-001
reviewed_repository: 08822407d/Meta-Agent
reviewed_master: eb71ed350e7cf1783d73580466a3656fad2a3b69
target_truth_source: false
target_truth_modified: false
methodology_modified: false
implementation_authorized: false
prototype_run_authorized: false
pilot_authorized: false
operational_activation_authorized: false
---

# P0 Static Design-Conformance MVI — Frontier Review

## 1. Disposition

```yaml
scope_disposition: ACCEPT
implementation_readiness: FAIL_REVISION_REQUIRED
overall_disposition: ACCEPT_SCOPE_WITH_REQUIRED_SPECIFICATION_REVISION_BEFORE_IMPLEMENTATION

clean_research_rerun_required: false
additional_Deep_Research_required: false
schema_freeze_authorized: false
implementation_authorized: false
prototype_run_authorized: false
```

The selected first prototype is appropriately small, offline, public/synthetic, non-operational,
and baseline-first. It is a credible way to test whether a single normative design serialization
can support deterministic static conformance checks without claiming Agent effectiveness.

The current draft is not implementation-ready. Several intended checks are not yet
machine-decidable from the specified fields, and the canonical byte-output contract is incomplete.
These are specification defects, not reasons to abandon the scope.

## 2. Reviewed material

Primary candidate:

- `candidates/p0-static-design-conformance-mvi/candidate-spec-draft-2026-08-05.md`
- `candidates/p0-static-design-conformance-mvi/README.md`

Current authority and baseline:

- `current/approved-spec.md`
- `authority/source-and-owner-map.md`
- `methodology/core-methodology.md`
- `history/decision-version-and-migration-log.md`

Candidate evidence and adjudication:

- `research/waves/2026Q3-independent-wave-001/reviews/MA-DR-08-formal-intake-review.md`
- `research/waves/2026Q3-independent-wave-001/reviews/MA-DR-10-formal-intake-review.md`
- `research/waves/2026Q3-independent-wave-001/reviews/MA-DR-12-formal-intake-review.md`
- `research/waves/2026Q3-independent-wave-001/reviews/MA-DR-15-formal-intake-review.md`
- `research/waves/2026Q3-independent-wave-001/reviews/MA-DR-08-15-cross-report-convergence-v0.1.md`

## 3. What passes

### 3.1 Scope and safety boundary

The draft correctly restricts the first prototype to:

- offline static validation;
- public or synthetic fixtures;
- no model, Agent, connector, network or external-system execution;
- no private material;
- no target-truth or accepted-methodology change;
- no pilot or operational activation.

This is proportionate to the current inactive v0.1 baseline.

### 3.2 One normative authoring source

The draft correctly uses one editable `design.yaml` and treats canonical JSON, graph/AST,
summaries and other views as deterministic non-authoritative derivatives. This directly satisfies
the MA-DR-08 reviewer correction against two independently editable truths.

### 3.3 Baseline-first topology set

The three positive fixture classes preserve the required baseline ladder:

1. deterministic workflow;
2. strong single Agent;
3. producer/reviewer multi-Agent arrangement.

This avoids treating multi-Agent structure as the default or as inherently superior.

### 3.4 Candidate semantics

The proposed representation correctly elevates the following as reviewable candidate semantics:

- Owner and sole target truth;
- role and I/O contracts;
- workflow, termination and recovery;
- state and memory roles;
- permissions, side effects and human gates;
- provenance and allowed influence;
- provider-neutral capability requirements;
- explicit backend degradation;
- deterministic evaluation hooks.

### 3.5 Promotion and claim boundaries

The draft correctly prevents research evidence, project feedback, fixture success, or prototype
results from automatically modifying target truth or accepted methodology. It also prohibits
production-readiness, backend-equivalence and architecture-superiority claims.

## 4. Blocking findings

### F-01 — Repository and path metadata are stale

**Severity:** blocking before revised candidate recording

The preserved draft still states that it is not repository-recorded and still uses the old
`target-projects/meta-agent/...` paths. After dedicated-repository cutover, the live paths are
repository-root-relative, including:

```text
current/approved-spec.md
authority/source-and-owner-map.md
methodology/core-methodology.md
history/decision-version-and-migration-log.md
candidates/p0-static-design-conformance-mvi/
research/...
```

Required correction:

- preserve the original draft as historical input;
- create a revised candidate rather than silently rewriting the historical draft;
- set the revised artifact status to repository-recorded candidate;
- replace operational references with dedicated-repository paths;
- retain the old base/ref fields only as historical provenance.

### F-02 — Canonical byte serialization is not fully specified

**Severity:** blocking before implementation

The draft requires byte-identical canonical JSON but does not fully define:

- UTF-8/BOM policy;
- Unicode normalization policy;
- newline and final-newline policy;
- JSON whitespace and separators;
- object-key ordering;
- duplicate-key rejection;
- scalar typing and YAML implicit-tag behavior;
- integer and number representation;
- escaping rules;
- multi-document YAML handling;
- parser/version compatibility;
- treatment of comments;
- canonical hash algorithm and manifest format.

Without these rules, two conforming implementations can produce different bytes.

Required correction:

- freeze a `canonicalization-contract.md`;
- use one explicit YAML subset and one explicit canonical JSON encoding;
- prohibit duplicate keys and ambiguous scalar forms;
- specify SHA-256 for all recorded content hashes;
- separate canonical deterministic output from volatile execution receipts.

### F-03 — Schema and extension governance are incomplete

**Severity:** blocking before implementation

The document gives examples of fields but does not define an exact schema or unknown-field policy.
The validator therefore cannot deterministically decide required fields, types, additional
properties, identifier formats, extension namespaces, or schema-version compatibility.

Required correction:

- add a normative machine-readable schema;
- define required/optional fields and nullability;
- define `additionalProperties` or an extension namespace;
- define ID grammar and uniqueness scope;
- define schema-version acceptance and failure behavior;
- specify whether arrays are ordered lists or set-like collections.

### F-04 — Workflow reachability and termination semantics are under-specified

**Severity:** blocking before implementation

The draft requires a reachable terminal state but does not define:

- the entry step;
- terminal-node representation;
- edge semantics;
- whether `next` and `failure_next` are single refs or lists;
- how free-text preconditions affect reachability;
- unreachable-node handling;
- what constitutes an unbounded cycle;
- whether every reachable path, or only one path, must terminate;
- how retry bounds compose with cycles.

A design can contain one reachable terminal path and still contain another reachable non-terminating
path.

Required correction:

- restrict the MVI to a finite structural graph;
- identify exactly one entry step;
- define terminal nodes explicitly;
- treat conditions as uninterpreted labels for structural analysis;
- require every reachable strongly connected component either to be terminal-free but bounded by a
  mechanically checkable retry counter, or to be rejected;
- define unreachable steps as error or warning;
- publish the exact graph algorithm and expected diagnostics.

### F-05 — Authority and permission comparison is not machine-decidable

**Severity:** blocking before implementation

`authority_ceiling`, `action`, and `resource_scope` are free-form values. The validator cannot
mechanically prove that a permission exceeds an authority ceiling or that a side effect is within a
resource scope.

Required correction:

- define a finite action taxonomy for the MVI;
- define resource-scope syntax and containment;
- define authority grants as explicit action/scope pairs;
- define permission expiry semantics;
- define deterministic grant containment;
- specify the exact rule that emits `E300_PERMISSION_EXCEEDS_AUTHORITY`.

### F-06 — Provenance freshness and backend degradation rules are not machine-decidable

**Severity:** blocking before implementation

The draft includes `freshness`, `evidence_freshness`, `mapping_status`, and `guarantee_delta`, but
does not define the data types or rules required to emit:

- `E502_STALE_HIGH_IMPACT_CAPABILITY_TREATED_AS_FEASIBLE`;
- `E501_HIDDEN_GUARANTEE_DEGRADATION`.

Required correction:

- use explicit observation and expiry timestamps or fixed synthetic freshness states;
- define impact class and the checked-at time;
- define retained/weakened/lost guarantee fields;
- reject `PRESERVED` whenever weakened or lost guarantees are non-empty;
- use a synthetic backend binding ID rather than treating a consumer-facing label as backend
  attestation.

### F-07 — The negative-fixture oracle is too permissive

**Severity:** blocking before implementation

Several negative fixtures require only “any one of” multiple errors. A defective validator that
emits many unrelated errors could pass. The current eight fixtures also do not demonstrate every
enabled diagnostic rule.

Required correction:

- define exact expected error-code multisets for every fixed fixture;
- define whether warnings are permitted;
- reject unexpected errors;
- add a rule-to-fixture coverage matrix;
- require every enabled rule to have at least one negative trigger;
- require positive fixtures to exercise valid instances of every enabled semantic area;
- either add fixtures or reduce the enabled rule set to the tested MVI subset.

### F-08 — Repeatability and run-summary boundaries are ambiguous

**Severity:** blocking before implementation

`run-summary.json` is required to be byte-identical “except declared run metadata.” This creates an
undefined exception inside the canonical artifact.

Required correction:

- make canonical result files fully deterministic;
- put timestamps, host details, elapsed time and run IDs in a separate non-canonical receipt;
- define deterministic ordering for all diagnostics and manifests;
- define SHA-256 manifests and clean-rebuild comparison rules.

### F-09 — Offline/no-call proof is not specified

**Severity:** blocking before prototype acceptance

The draft requires zero network, model and external-tool calls but does not define how this is
mechanically established. A mere self-report is insufficient under the draft's own fail-closed rule.

Required correction:

- run in a network-disabled environment or equivalent enforceable sandbox;
- define allowed local file I/O and test-runner processes;
- prohibit connector/API/model calls;
- record the enforcement mechanism in the run receipt;
- return `BLOCKED` when the boundary cannot be demonstrated.

### F-10 — Human-gate rule is broader than the evidence supports

**Severity:** blocking before schema freeze

The draft requires a human gate for every external or irreversible side effect. The research
supports immutable hard gates and human terminal judgment, but also risk-proportional assurance,
bounded session grants and calibration of approval burden.

Required correction:

For the first static MVI, use one of these explicit policies:

1. **Conservative profile:** every external write or irreversible effect requires a human gate; or
2. **Bounded preauthorization profile:** an external reversible effect may rely on an explicit,
   unexpired Owner-approved permission profile, while irreversible effects always require a human
   gate.

Do not use the ambiguous phrase “every external effect” without defining reads, writes and
externally observable side effects.

## 5. Important non-blocking revisions

### N-01 — Separate material class from confidentiality

`public` and `synthetic` are material-origin classes, not confidentiality levels. Use a
`material_class` field and omit confidentiality from this MVI unless confidentiality semantics are
actually checked.

### N-02 — Define diagnostic severity and unknown-field behavior

Specify:

- error versus warning;
- whether warnings affect PASS;
- unknown-field handling;
- stable message template IDs;
- document-path syntax.

### N-03 — Clarify positive fixture labels

“Strong single Agent” is currently descriptive but undefined. State that “strong” means a single
role-bearing Agent design that satisfies all enabled contracts, not a claim about model
capability.

### N-04 — Keep burden measurements outside conformance PASS

Authoring time, comprehension notes and reviewer burden are useful measurements but must not alter
the mechanical conformance result until the Owner later adopts thresholds.

## 6. Required revised package

The smallest implementation-ready candidate package should be:

```text
candidates/p0-static-design-conformance-mvi/
  README.md
  candidate-spec-v0.2.md
  revision-contract-v0.2.yaml
  schema/
    design.schema.json
  contracts/
    canonicalization-contract.md
    graph-and-termination-contract.md
    authority-and-permission-contract.md
    provenance-and-backend-mapping-contract.md
  fixtures/
    fixture-manifest.yaml
    expected-diagnostics.yaml
    rule-coverage-matrix.yaml
  acceptance-checks.yaml
```

No implementation, generated output, benchmark result, pilot manifest or stable target ID belongs in
the same revision PR.

## 7. Advancement gate

```yaml
next_candidate_gate:
  action: produce_candidate_spec_v0_2_and_exact_supporting_contracts
  target_truth_change: false
  methodology_change: false
  implementation: false
  prototype_run: false

implementation_may_be_requested_only_after:
  - all_F01_through_F10_closed
  - exact_schema_and_contracts_frozen
  - every_enabled_rule_covered_by_fixed_fixtures
  - frontier_re_review_returns_IMPLEMENTATION_READY
  - separate_task_local_Owner_authorization
```

## 8. Final review result

```yaml
review_result:
  prototype_scope_selected_correctly: true
  additional_research_needed: false
  current_spec_implementation_ready: false
  revision_required: true
  implementation_started: false
  target_truth_modified: false
  methodology_modified: false
  migration_or_memory_system_work_started: false
```
