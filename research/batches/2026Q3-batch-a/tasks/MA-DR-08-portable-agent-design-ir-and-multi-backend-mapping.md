---
research_id: MA-DR-08
batch_id: META-AGENT-RESEARCH-BATCH-B-001
title: Portable Agent Design IR and Multi-Backend Mapping
artifact_role: ready_to_run_Deep_Research_task
status: prepared_not_executed
target_project_id: meta-agent
target_truth_source: false
research_execution_authority: user_retained
required_output: one_complete_canonical_report
report_language: Chinese_with_English_technical_terms_and_source_titles_preserved
---

# MA-DR-08 — Portable Agent Design IR 与 Multi-Backend Mapping

## 0. Identity and output contract

Open the report with:

```yaml
research_id: MA-DR-08
research_title: Portable Agent Design IR and Multi-Backend Mapping
target_project: Meta-Agent
report_role: external_research_evidence_non_execution_source
```

Produce one complete, structured canonical report with portable direct-source references. Do not modify a repository, select an implementation, issue target IDs, activate Meta-Agent or claim that a proposed schema is already accepted.

## 1. Project context

Meta-Agent is an Owner-governed, general-purpose Agent-design and methodology system. Its v0.1 design/governance baseline is accepted with limitations but remains operationally inactive.

Batch A found that the useful near-term product is not autonomous Agent search. It is:

```text
approved problem frame
-> structured Agent/workflow specification
-> bounded alternatives and strong baselines
-> comparison/evidence package
-> explicit Owner decision
```

A future design representation must preserve provider independence and prevent backend mapping from silently losing authority, privacy, permission, provenance, evaluation or rollback semantics.

## 2. Decisions this research can inform

1. Whether Meta-Agent needs a formal Agent Design IR.
2. The smallest useful core schema versus optional extensions.
3. Whether the primary representation should be typed YAML/JSON, a graph/AST, a DSL, or a layered hybrid.
4. Which fields are portable across runtimes and which are backend-specific.
5. How to validate, version, diff, migrate and compare designs.
6. How to express hard constraints for bounded design search.
7. How to declare unsupported/degraded semantics during backend mapping.
8. What later benchmark/conformance work must test.

It cannot authorize implementation, operation, tools, private material or target-truth changes.

## 3. Required Meta-Agent inputs

Read the execution-time latest `master` of `08822407d/Mnemosyne` and record the actual ref. Required paths:

```text
target-projects/meta-agent/current/approved-spec.md
target-projects/meta-agent/current/active-context.md
target-projects/meta-agent/authority/source-and-owner-map.md
target-projects/meta-agent/methodology/core-methodology.md
target-projects/meta-agent/history/decision-version-and-migration-log.md
target-projects/meta-agent/research/batches/2026Q3-batch-a/reports/README.md
target-projects/meta-agent/research/batches/2026Q3-batch-a/reports/report-parts-manifest.yaml
target-projects/meta-agent/research/batches/2026Q3-batch-a/reports/MA-DR-06-report-parts/
target-projects/meta-agent/research/batches/2026Q3-batch-a/reports/MA-DR-07-report-parts/
target-projects/meta-agent/research/batches/2026Q3-batch-a/reviews/MA-DR-06-07-cross-report-adjudication.md
target-projects/meta-agent/research/batches/2026Q3-batch-a/candidates/Batch-A-candidate-change-ledger.md
```

If the Batch-A repository PR is not merged, use the two complete report exports supplied directly by the operator. If reading from GitHub, all ordered report parts must be read; a subset is an input-binding failure. If mandatory inputs are unavailable, stop target-specific mapping and return an explicit input-binding failure; do not infer unseen repository content.

## 4. Research questions

### RQ1 — What is the IR's purpose and authority?

Distinguish:

- design truth/candidate versus runtime truth;
- portable core versus backend extension;
- declarative specification versus generated implementation;
- human-authored versus model-generated fields;
- target requirements versus derived design;
- evidence/provenance versus authoritative decisions;
- static design versus runtime state.

Define what the IR may and may not govern.

### RQ2 — Core object model

Develop a candidate object model covering at least:

- identity, purpose, scope and version;
- requirements and non-goals;
- roles and responsibilities;
- typed inputs/outputs and evidence contracts;
- workflow nodes, edges, branches, loops, retries, timeouts and termination;
- state and memory stores, read/write/retention/promotion/deletion;
- model/tool capability requirements;
- tools, permissions, authority ceilings and external side effects;
- human gates, escalation and exception expiry;
- security invariants;
- evaluation, adversarial tests and independent verification;
- incident response, rollback and anti-resurrection;
- search metadata and allowed mutations;
- deployment/runtime constraints;
- provenance, origin and allowed-influence metadata;
- backend mapping, unsupported semantics and degraded guarantees.

Identify mandatory versus optional fields and compositional relations.

### RQ3 — Representation alternatives

Compare:

- typed YAML/JSON plus JSON Schema;
- graph/AST representation;
- purpose-built DSL;
- BPMN/DMN-like workflow model;
- code-first representation;
- dual representation: normative declarative IR plus generated code;
- profile/extension mechanism.

Evaluate expressiveness, readability, static validation, diffability, security, round-trip fidelity, tooling burden, portability, search compatibility and migration.

### RQ4 — Existing specifications and adjacent systems

Use primary specifications, papers and official repositories. Required seed coverage includes:

- AgentSPEX;
- Oracle Open Agent Specification / Agent Spec;
- current declarative Agent workflow languages;
- COVENANT or similar natural-language-to-workflow compilation research;
- GPTSwarm/graph representations;
- DSPy declarative programs;
- workflow standards such as BPMN/DMN where relevant;
- interface/schema standards such as OpenAPI, JSON Schema and Protocol Buffers where relevant;
- policy systems such as OPA/Rego or Cedar where relevant;
- provenance/supply-chain approaches such as SLSA/in-toto where relevant.

For each, state reusable lessons and why it is not automatically the Meta-Agent IR.

### RQ5 — Provider-neutral capability and backend binding

Define a two-stage model:

```text
portable capability requirement
-> backend binding / deployment mapping
```

Research how to express:

- model capabilities without permanent provider names;
- required versus preferred capabilities;
- tool contracts and side-effect classes;
- context/state limits;
- streaming, parallelism and checkpoint support;
- structured output and tool-call semantics;
- sandbox/network/filesystem constraints;
- data residency/retention constraints;
- unavailable or weakened backend semantics.

A mapping must declare capability loss rather than silently approximate.

### RQ6 — Authority and security semantics

Use Batch-A security findings to define first-class fields for:

- Owner-only decisions;
- source priority;
- delegated authority ceiling;
- prohibited delegations;
- read/write separation;
- origin/role/scope/freshness;
- `may_influence_fields`;
- credential identity without storing secrets;
- side-effect classification;
- approval state and expiry;
- security invariants and enforcement points;
- independent verifier;
- judge isolation;
- contamination/quarantine state;
- rollback dependencies and semantic tombstones;
- unsupported/degraded security semantics.

Explain which rules are statically checkable, runtime-enforceable, evidence-only or human decisions.

### RQ7 — Search and optimization compatibility

The IR should support bounded proposal generation/search without giving the optimizer authority over hard constraints.

Define:

- mutable versus immutable fields;
- operator/mutation allowlists;
- candidate lineage;
- reproducibility bundle;
- constraint solver/static validator;
- semantic-diff categories;
- Pareto metrics;
- safe fallback;
- no-write execution profile.

Discuss how to prevent optimizer output from becoming target truth.

### RQ8 — Validation and conformance

Propose:

- schema validation;
- semantic validation;
- authority/permission checks;
- reachability, loop and termination checks;
- state/memory flow checks;
- evidence/source completeness;
- backend capability compatibility;
- mapping loss report;
- round-trip serialization tests;
- cross-backend conformance tests;
- security regression and adversarial fixtures;
- semantic equivalence limits;
- version/migration compatibility.

Distinguish deterministic checks from model- or human-reviewed checks.

### RQ9 — Versioning, migration and extension

Define:

- IR version versus design-instance version;
- stable IDs and references;
- additive versus breaking changes;
- profiles and vendor extensions;
- deprecation/retirement;
- object mapping for rename/split/merge;
- preservation, transform, recompute and retire rules;
- compatibility declarations;
- rollback and rebuild.

### RQ10 — Minimum viable IR

Recommend the smallest useful Meta-Agent IR for the next stage, not a complete universal standard.

State:

- mandatory core;
- deferred extensions;
- one compact illustrative example;
- one backend-mapping example;
- one mapping-failure/degraded-semantics example;
- implementation burden;
- validation plan;
- open Owner decisions.

## 5. Mandatory comparative outputs

### A. Comparison matrix

| Approach/spec | Normative representation | Agent/workflow coverage | Authority/security semantics | Backend portability | Static validation | Runtime coupling | Maturity | Reusable lessons | Gaps |
|---|---|---|---|---|---|---|---|---|---|

### B. Field-status matrix

```yaml
field_status:
  portable_core: []
  optional_profile: []
  backend_binding: []
  evidence_only: []
  runtime_state_not_design_IR: []
  Owner_decision_not_machine_selected: []
  deferred: []
```

### C. Validation matrix

| Rule | Static | Runtime | Evidence review | Human decision | Failure behavior |
|---|---|---|---|---|---|

### D. Backend mapping examples

Use at least three materially different backend/runtime styles. Do not claim exact current support without current official sources.

## 6. Evidence standards

Prioritize:

1. peer-reviewed papers and primary preprints;
2. official specifications and schemas;
3. official reference implementations;
4. conformance/test suites;
5. official framework documentation;
6. high-quality engineering case studies.

Important conclusions must distinguish:

```text
VERIFIED_PRIMARY_EVIDENCE
OFFICIAL_SPECIFICATION_FACT
MULTI_SOURCE_PATTERN
TARGET_SPECIFIC_INFERENCE
RECOMMENDATION
UNRESOLVED
```

Actively seek negative findings:

- insufficient semantics;
- framework lock-in;
- lossy mappings;
- impossible round-trip;
- security fields not enforced;
- user-study limits;
- schema complexity and administrative burden;
- DSL/runtime drift;
- extension fragmentation;
- false portability claims.

## 7. Required report structure

1. Executive verdict;
2. Target/repository input-binding receipt;
3. IR purpose, authority and non-goals;
4. Existing specifications and adjacent systems;
5. Candidate core object model;
6. Representation alternatives and decision matrix;
7. Capability requirement and backend-binding model;
8. Authority/security/provenance semantics;
9. Search/optimization compatibility;
10. Static, runtime, evidence and human validation;
11. Versioning, migration and extension model;
12. Multi-backend mapping examples and loss declarations;
13. Minimum viable IR;
14. Candidate schema/example;
15. Conformance and future experiment plan;
16. Administrative burden and failure modes;
17. Implications for current Meta-Agent baseline and candidate methods;
18. Inputs frozen for later MA-DR-09;
19. Open Owner decisions;
20. Portable source table;
21. Final disposition matrix:

```yaml
recommended_portable_core: []
recommended_optional_profiles: []
recommended_backend_binding_fields: []
requires_experiment_or_prototype: []
defer: []
reject_or_avoid: []
```

## 8. Portable source table

| Source ID | Title/specification | Authors/organization | Date/version | Type | Direct URL/DOI | Claims supported | Limitations |
|---|---|---|---|---|---|---|---|

Do not rely only on product-native citation markers.

## 9. Prohibited conclusions/actions

Do not:

- select a permanent implementation language/provider;
- present one vendor framework as the universal standard;
- treat generated code as the sole target truth;
- omit authority/privacy/security fields for simplicity;
- claim backend equivalence without loss analysis;
- auto-issue `MA-REQ`, `MA-PEND` or `MA-METHOD` IDs;
- modify GitHub;
- activate Meta-Agent;
- generate or execute MA-DR-09;
- use visible model labels as backend attestation.

## 10. Completion criteria

The report is complete only if it lets the Meta-Agent owner/reviewer decide:

1. whether a formal IR is worth adopting as a candidate;
2. its minimum portable core;
3. how authority/security and allowed influence are represented;
4. how backend mapping declares loss;
5. which checks are mechanical versus runtime/human;
6. what prototype/conformance work is needed;
7. what inputs are now frozen enough to generate MA-DR-09.
