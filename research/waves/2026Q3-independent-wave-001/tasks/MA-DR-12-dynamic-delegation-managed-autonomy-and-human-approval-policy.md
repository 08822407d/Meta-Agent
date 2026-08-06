---
research_id: MA-DR-12
wave_id: META-AGENT-INDEPENDENT-RESEARCH-WAVE-001
title: Dynamic Delegation, Managed Autonomy, and Human Approval Policy
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

# MA-DR-12 — 动态委派、受控自主性与人工审批策略

## 0. Identity and output contract

Open the report with:

```yaml
research_id: MA-DR-12
research_title: Dynamic Delegation, Managed Autonomy, and Human Approval Policy
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

Meta-Agent currently routes work by capability demand and reserves product
purpose, authority, privacy, methodology promotion, and operational acceptance
for the Owner. The remaining gap is a dynamic policy for deciding when an
Agent may continue, gather evidence, use a bounded tool, downgrade, abstain,
pause, or escalate.

This task studies delegation policy independently of any particular Agent IR,
provider, or runtime. It must treat autonomy as a controlled decision variable,
not a synonym for model intelligence.


## 2. Decisions this research can inform

1. How to classify actions by reversibility, impact, uncertainty, authority, and evidence quality.
2. When an Agent should proceed, ask, verify, abstain, downgrade, or escalate.
3. How approval burden can be reduced without silently expanding authority.
4. How to separate capability confidence from permission and value judgments.
5. How to evaluate delegation quality, human workload, and over/under-escalation.

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

### RQ1 — Agency, autonomy, delegation, and authority

Define these concepts separately. Distinguish task competence, initiative,
decision authority, tool permission, side-effect scope, and methodology/
product authority. Build a taxonomy usable across single-Agent, workflow, and
multi-Agent arrangements.


### RQ2 — Risk-adaptive action classification

Study frameworks based on reversibility, blast radius, uncertainty,
information sensitivity, external side effects, legal/financial/security
impact, detectability, time pressure, and cost of delay. Separate hard
prohibitions from risk-adjusted approval.


### RQ3 — Uncertainty, abstention, and selective prediction

Review calibrated uncertainty, selective prediction, conformal or empirical
confidence, self-consistency limits, out-of-distribution detection, and
abstention. Explain why model self-confidence alone is insufficient.


### RQ4 — Value of information and evidence gathering

Define when the system should request clarification, perform another check,
consult an independent reviewer, run a cheap test, or stop. Compare the cost
of more evidence with the expected reduction in decision loss.


### RQ5 — Human approval patterns

Compare per-action approval, scoped session approval, capability grants,
two-person or independent-review gates, exception expiry, reversible preview,
dry-run, policy-as-code, and post-hoc audit. Identify conditions where each
pattern fails or becomes burdensome.


### RQ6 — Trust calibration and human factors

Study automation bias, algorithm aversion, overreliance, alert fatigue,
approval fatigue, skill atrophy, and handoff quality. Include learning-value
preservation as one constraint without duplicating a full pedagogy or learner
model study.


### RQ7 — Adaptive delegation without silent authority growth

Research how historical performance may adjust routing or review intensity
while immutable Owner decisions, privacy, credentials, target truth, and
irreversible actions remain outside autonomous adaptation.


### RQ8 — Evaluation and failure analysis

Define metrics for false proceed, false escalate, missed escalation, human
review time, decision quality, rework, delay, recovery, and user comprehension.
Propose public/synthetic scenarios covering benign, ambiguous, and adversarial
requests.


## 5. Mandatory comparative and decision-support outputs

1. A managed-autonomy ladder and action-risk taxonomy.
2. A proceed/verify/ask/abstain/escalate decision framework.
3. An approval-pattern comparison matrix.
4. A human-workload and trust-calibration model.
5. A synthetic evaluation suite and metrics.
6. A candidate policy profile for read-only, reversible-write, and irreversible scopes.
7. A list of Owner-only decisions that must never be learned away.

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

- Do not equate high model capability with expanded authority.
- Do not propose self-issued permissions or self-approved irreversible actions.
- Do not require human approval for every low-risk deterministic step.
- Do not use model self-confidence as the sole escalation signal.
- Do not import or implement a persistent learner/cognitive profile.

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

1. What factors determine the correct autonomy level for an action?
2. How can the system gather evidence or abstain before asking the user?
3. How are permission, competence, and value judgment kept separate?
4. How is approval burden controlled without expanding authority silently?
5. What experiments could validate the proposed policy?
