---
research_id: MA-DR-11
wave_id: META-AGENT-INDEPENDENT-RESEARCH-WAVE-001
title: Methodology Promotion, Evidence Generalization, and Cross-Project Learning Governance
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

# MA-DR-11 — 方法论晋升、证据泛化与跨项目经验治理

## 0. Identity and output contract

Open the report with:

```yaml
research_id: MA-DR-11
research_title: Methodology Promotion, Evidence Generalization, and Cross-Project Learning Governance
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

Meta-Agent must learn from project outcomes without allowing one project,
one model, or one persuasive narrative to rewrite general methodology.
Current v0.1 already requires review, abstraction, candidate change, Owner
approval, versioning, and rollback, but it does not define how much or what
kind of evidence supports generalization, rejection, retirement, or reopening.

This task develops a small-N, evidence-aware governance framework. It must
explicitly identify which thresholds cannot be settled by literature and
require future case data.


## 2. Decisions this research can inform

1. How project evidence should be classified before it may influence general methodology.
2. What evidence diversity, replication, contradiction, and scope-condition checks are needed.
3. How to handle small-N personal-project evidence without pretending statistical certainty.
4. When a candidate method should be promoted, retained, narrowed, rejected, retired, or reopened.
5. What records and review gates are worth their administrative cost.

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
target-projects/meta-agent/cases/case-and-feedback-ledger.md
```

If a listed path is a research review or candidate ledger, preserve its
non-execution role. Do not treat it as target truth.

## 4. Research questions

### RQ1 — Evidence types and inferential strength

Build a taxonomy of anecdote, observation, controlled comparison, repeated
case, cross-project replication, negative case, counterexample, expert
judgment, benchmark, postmortem, and causal evidence. Explain what each can
and cannot support.


### RQ2 — Generalization under small-N conditions

Examine case-based reasoning, analytic generalization, Bayesian/sequential
updating, qualitative comparative analysis, evidence-based software
engineering, safety-case reasoning, and organizational learning. Avoid
pretending that personal project histories provide population-level proof.


### RQ3 — Confounders and competing explanations

Define how model/version changes, task difficulty, operator behavior,
prompt changes, tool availability, novelty, selection bias, survivorship,
regression to the mean, and measurement error can mimic a method effect.


### RQ4 — Negative evidence and publication-bias controls

Research how to preserve failed cases, neutral outcomes, abandoned methods,
contradictory evidence, and missing data. Propose controls against success-only
case ledgers and narrative laundering.


### RQ5 — Scope conditions and counterexamples

Define how a method should carry applicability conditions, excluded domains,
known counterexamples, required capabilities, risk assumptions, and expiry or
freshness conditions instead of being promoted as a universal rule.


### RQ6 — Promotion, retirement, and reopening lifecycle

Develop statuses and gates for candidate, trial, conditionally accepted,
accepted, deprecated, retired, rejected, and reopened. Explain evidence and
Owner decisions required at each transition, including rollback and prevention
of accidental resurrection.


### RQ7 — Decision thresholds without false precision

Compare qualitative gates, Bayesian decision thresholds, sequential tests,
minimum evidence diversity, replication requirements, and risk-adjusted
standards. State which numerical thresholds should remain experiment-derived.


### RQ8 — Minimal governance model for Meta-Agent

Propose a practical promotion dossier, review rubric, and evidence ledger
schema that remains usable by one Owner and a small number of AI-assisted
projects. Measure likely review burden and define when a lighter path is
acceptable.


## 5. Mandatory comparative and decision-support outputs

1. An evidence-strength and generalizability matrix.
2. A confounder and competing-explanation checklist.
3. A lifecycle for candidate promotion, narrowing, rejection, retirement, and reopening.
4. A small-N decision framework with explicit uncertainty.
5. A minimal promotion dossier and review rubric.
6. A list of evidence thresholds that must be calibrated through real cases rather than adopted from literature.
7. A worked synthetic example with contradictory evidence.

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

- Do not set arbitrary universal sample-size thresholds.
- Do not equate repeated success in one project with cross-domain generality.
- Do not remove contradictory cases to simplify a method narrative.
- Do not treat an LLM evaluator consensus as independent replication.
- Do not issue or promote a new Meta-Agent method.

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

1. What evidence can justify a target-specific lesson, a scoped general method, or no promotion?
2. How should small-N uncertainty and confounders be represented?
3. How are negative cases and counterexamples preserved?
4. When should a method be narrowed, retired, or reopened?
5. What minimal governance is rigorous without becoming administratively unusable?
