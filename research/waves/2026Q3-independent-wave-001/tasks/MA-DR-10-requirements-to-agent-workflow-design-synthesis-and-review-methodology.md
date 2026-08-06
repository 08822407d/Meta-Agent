---
research_id: MA-DR-10
wave_id: META-AGENT-INDEPENDENT-RESEARCH-WAVE-001
title: Requirements-to-Agent/Workflow Design Synthesis and Review Methodology
artifact_role: ready_to_run_independent_Deep_Research_task
status: prepared_not_executed
target_project_id: meta-agent
prepared_against_repository: 08822407d/Mnemosyne
prepared_against_master: 0865f334177e2ff0d81a3652ea9e3384e55f4259
target_truth_source: false
research_execution_authority: user_retained
required_output: one_complete_canonical_report
report_language: Chinese_with_English_technical_terms_and_source_titles_preserved
independent_of_sibling_wave_tasks: true
---

# MA-DR-10 — 从需求到 Agent／Workflow 设计的综合与审阅方法论

## 0. Identity and output contract

Open the report with:

```yaml
research_id: MA-DR-10
research_title: Requirements-to-Agent/Workflow Design Synthesis and Review Methodology
target_project: Meta-Agent
report_role: external_research_evidence_non_execution_source
independence_contract_observed: true
```

## Shared independence and repository-binding contract

This task belongs to `META-AGENT-INDEPENDENT-RESEARCH-WAVE-001`. It is intentionally **independent of every
other task in the same wave**.

Use only:

1. the execution-time latest `master` of `08822407d/Mnemosyne`;
2. the mandatory repository inputs listed in this task;
3. public external sources independently found for this task.

Do **not** require, wait for, or use the conclusions of MA-DR-08, MA-DR-10,
MA-DR-11, MA-DR-12, MA-DR-13, MA-DR-14, or MA-DR-15 as task inputs. A sibling
report may later be compared during convergence, but it must not alter this
task's research question, scope, evidence standard, or output contract.

Record the actual repository commit/ref read. If mandatory target inputs are
unavailable, disclose the failure and continue only with the external
landscape portion where useful; mark target-specific mapping
`BLOCKED_BY_MISSING_TARGET_INPUTS`. Never infer unseen repository content.

This task is research only. It does not authorize repository writes, target
truth changes, methodology promotion, private-material ingestion, operational
activation, pilot execution, or quota use beyond the separately selected
Deep Research run.


## 1. Project context

Meta-Agent currently has accepted methods for requirement framing, topology
selection, authority/source separation, capability-aware decomposition,
evaluation, and handoff. Batch A identified a missing representation-neutral
step between topology selection and evaluation:

```text
approved problem frame
-> coherent Agent/workflow design
-> alternatives and strong baselines
-> review/evidence package
```

This task studies the **method of designing**, not the future IR syntax and not
automated architecture search. Its output must remain useful whether the final
representation is Markdown, YAML/JSON, a graph, a DSL, or another format.


## 2. Decisions this research can inform

1. Whether Meta-Agent needs a new explicit design-synthesis method.
2. What a minimal, reviewable Agent/workflow design dossier must contain.
3. How alternatives, assumptions, design rationale, and non-goals should be generated and reviewed.
4. Which design choices require human judgment, frontier review, bounded execution, or mechanical checks.
5. What later prototypes should test before any method is promoted.

It cannot make those decisions on behalf of the Owner.

## 3. Mandatory Meta-Agent inputs

Read the execution-time latest `master` of `08822407d/Mnemosyne` and record the actual ref:

```text
target-projects/meta-agent/current/approved-spec.md
target-projects/meta-agent/current/active-context.md
target-projects/meta-agent/authority/source-and-owner-map.md
target-projects/meta-agent/methodology/core-methodology.md
target-projects/meta-agent/history/decision-version-and-migration-log.md
target-projects/meta-agent/research/reviews/MA-DR-01-05-cross-report-synthesis-v0.1.md
target-projects/meta-agent/research/reviews/MA-DR-01-05-gap-analysis-v0.1.md
target-projects/meta-agent/research/batches/2026Q3-batch-a/reviews/MA-DR-06-07-cross-report-adjudication.md
target-projects/meta-agent/research/batches/2026Q3-batch-a/candidates/Batch-A-candidate-change-ledger.md
```

If a listed path is a research review or candidate ledger, preserve its
non-execution role. Do not treat it as target truth.

## 4. Research questions

### RQ1 — A representation-neutral design-synthesis lifecycle

Develop a staged process from approved problem frame to implementation-neutral
design package. Distinguish requirements, assumptions, constraints, roles,
workflow, state/memory, tools, permissions, evaluation, deployment,
observability, fallback, and rollback. Identify entry/exit criteria, iteration
loops, stop conditions, and escalation points.


### RQ2 — Applicable design and requirements-engineering traditions

Compare contract-based design, architecture trade-off analysis, ADRs,
requirements traceability, safety cases, hazard analysis, socio-technical
systems design, human-centered design, workflow/process design, protocol
design, and software architecture review. Explain what transfers to Agent
systems and what does not.


### RQ3 — Agent-specific design failure modes

Study role proliferation, prompt cargo culting, hidden shared state,
ambiguous authority, unverifiable handoffs, circular delegation, tool
overgranting, missing termination, evaluator/executor coupling, brittle
context assumptions, memory contamination, and premature multi-Agent
decomposition.


### RQ4 — Alternative generation and counterfactual baselines

Define how a designer should construct and compare fixed mechanisms, direct
Agent, strong single-Agent, deterministic workflow, same-workflow
single-Agent simulation, human-authored design, and genuinely heterogeneous
multi-Agent alternatives without making complexity the objective.


### RQ5 — Traceability and design rationale

Research how every role, tool, memory, permission, and workflow decision can
trace back to requirements, evidence, risk, or an explicit Owner preference.
Define how rejected alternatives and unresolved assumptions should be
preserved without becoming target truth.


### RQ6 — Human–AI co-design and learning-value preservation

Identify which design activities can be drafted by AI, which should be
candidate generation plus human judgment, and which should remain human-only.
Address explanation, design-rationale visibility, and preservation of the
user's architecture/engineering judgment without duplicating the separate
learner/adaptive-explanation research route.


### RQ7 — Design-review rubric and acceptance evidence

Propose a review rubric covering correctness, completeness, authority,
security, simplicity, testability, observability, portability, maintainability,
administrative burden, learning value, and explicit uncertainty. Separate
hard gates from scored trade-offs.


### RQ8 — Minimal method candidate for Meta-Agent

Produce a compact candidate method with inputs, process, outputs, stop/
escalation conditions, validation, failure modes, and one worked synthetic
example. It must not assume or define the canonical Agent Design IR.


## 5. Mandatory comparative and decision-support outputs

1. A lifecycle diagram and stage-gate table.
2. A minimal design-dossier content model expressed conceptually, not as the canonical IR.
3. A design-failure taxonomy and review checklist.
4. An alternative/baseline-generation procedure.
5. A traceability and rationale model.
6. A candidate Meta-Agent method with explicit evidence and limitations.
7. A list of questions that must wait for MA-DR-08, MA-DR-09, or real pilots.

## Evidence and source standards

Prioritize:

1. peer-reviewed research and high-quality primary preprints;
2. official specifications, schemas, standards, and reference implementations;
3. official platform or framework documentation for current capability facts;
4. reproducible benchmarks, datasets, test suites, and public code;
5. high-quality engineering case studies;
6. secondary summaries only for discovery.

For load-bearing claims distinguish:

```text
VERIFIED_PRIMARY_EVIDENCE
OFFICIAL_SPECIFICATION_OR_DOCUMENTATION_FACT
MULTI_SOURCE_PATTERN
INDUSTRY_PRACTICE
TARGET_SPECIFIC_INFERENCE
RECOMMENDATION
UNRESOLVED
```

Actively seek negative evidence, failed deployments, strong counterexamples,
maintenance burden, lock-in, security limits, and conditions under which a
recommended practice should not be used.

The report must include a portable source table with direct URLs, DOI/arXiv
identifiers, version/date, claims supported, and limitations. Do not rely only
on product-native citation markers.


## 6. Required report structure

1. Executive verdict;
2. target/repository input-binding receipt;
3. definitions, scope, and non-goals;
4. primary evidence landscape;
5. comparison of major approaches;
6. failure modes and negative evidence;
7. Meta-Agent-specific mapping;
8. candidate decision framework;
9. implementation or experiment dependencies;
10. administrative, cost, and maintenance burden;
11. unresolved questions and Owner decisions;
12. portable source table;
13. final disposition matrix separating adoptable design principles, candidate
    items, experiment-gated items, deferred items, and rejected approaches.

## 7. Task-specific prohibited conclusions

- Do not turn this into an Agent DSL or IR-selection study.
- Do not assume multi-Agent is the natural output of the method.
- Do not equate a polished specification with validated design quality.
- Do not prescribe one provider or framework as the default implementation.
- Do not issue MA-METHOD-0007 or modify the existing method library.

## General output and authority boundary

Produce one complete canonical report in Chinese, preserving English technical
terms, source titles, standards, and identifiers.

Open the report with the exact research identity requested by this task.

The report may propose candidate options and decision criteria. It must not:

- claim that any recommendation is already Meta-Agent target truth;
- issue stable `MA-REQ`, `MA-PEND`, `MA-METHOD`, `MA-MIG`, schema, or runtime IDs;
- silently select a permanent provider, framework, storage product, or runtime;
- modify GitHub or another external system;
- authorize private material, operational activation, or a pilot;
- infer an exact served backend from a visible model label or model self-report.


## 8. Completion criteria

The report is complete only if it lets the Meta-Agent Owner/reviewer answer:

1. What repeatable method fills the gap between topology choice and evaluation?
2. What artifacts and review gates are minimally necessary?
3. How should alternatives and rationale be generated without overbuilding?
4. Which parts can be automated safely, and which remain human decisions?
5. What evidence would justify later promotion into the method library?
