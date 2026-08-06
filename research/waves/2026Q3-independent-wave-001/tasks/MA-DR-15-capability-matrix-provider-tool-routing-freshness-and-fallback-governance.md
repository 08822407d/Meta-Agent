---
research_id: MA-DR-15
wave_id: META-AGENT-INDEPENDENT-RESEARCH-WAVE-001
title: Capability Matrix, Provider/Tool Routing, Freshness, and Failure/Fallback Governance
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

# MA-DR-15 — 能力矩阵、模型／工具路由、时效性与故障降级治理

## 0. Identity and output contract

Open the report with:

```yaml
research_id: MA-DR-15
research_title: Capability Matrix, Provider/Tool Routing, Freshness, and Failure/Fallback Governance
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

Meta-Agent must route work by capability, risk, permission, cost, and evidence
rather than permanently assigning brands. Earlier research established that
principle, but the project still lacks a durable method for maintaining
time-sensitive capability facts, handling non-attestable backend identity,
validating routing claims, and degrading safely when providers or tools change.

This task is not a one-time vendor ranking. It studies the governance system
that keeps a provider/tool matrix useful despite rapid change.


## 2. Decisions this research can inform

1. What provider-neutral capability ontology and evidence schema Meta-Agent should use.
2. How capability claims are verified, dated, scoped, and expired.
3. How tasks are routed under uncertainty, cost, latency, security, and availability constraints.
4. How fallback, substitution, and degraded guarantees are declared.
5. What lightweight ongoing tests are worth maintaining.

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

### RQ1 — Provider-neutral capability ontology

Define capabilities for reasoning, coding, research, multimodality, context,
structured output, tools, repository operations, long-running tasks,
determinism, security, privacy, latency, cost, observability, and human
interaction. Separate required, preferred, prohibited, and unknown capability.


### RQ2 — Evidence classes for capability claims

Compare official documentation, visible product behavior, controlled local
test, benchmark, user observation, provider claim, model self-report, and
third-party evaluation. Define confidence, scope, date, version, subscription/
surface, and reproducibility fields.


### RQ3 — Freshness and drift

Research TTLs, event-triggered revalidation, release/version tracking,
capability regression, silent backend changes, subscription differences,
regional variation, rate/usage limits, and how unknown backend identity should
constrain conclusions.


### RQ4 — Routing under uncertainty

Compare rule-based routing, constraint satisfaction, multi-criteria decision
analysis, contextual bandits, empirical policy learning, and human selection.
Preserve authority and permission as hard gates. Explain when routing should
choose a cheaper model, a stronger model, another tool, or no automation.


### RQ5 — Failure, fallback, and graceful degradation

Define retry, provider substitution, local/manual fallback, reduced-scope
mode, no-tool mode, stale-capability warning, unavailable-feature behavior,
and stop conditions. Require explicit degraded guarantees instead of silent
approximation.


### RQ6 — Tool and connector routing

Model read versus write, side effects, trust boundary, data exposure,
authentication, schema quality, idempotency, rollback, auditability, and
current availability. Treat tool descriptions as untrusted capability claims
until verified.


### RQ7 — Multi-model review and heterogeneity

Study when independent review, diversity, or competing proposals provide
measurable value; when homogeneous models only duplicate cost; and how to
avoid fake independence caused by shared data, shared evaluator, or the same
underlying backend.


### RQ8 — Maintenance and validation program

Propose a lightweight matrix update workflow, change log, test suite,
sampling schedule, evidence expiry, and exception process. Estimate
administrative burden and identify capability facts that should be resolved
just-in-time rather than permanently tracked.


## 5. Mandatory comparative and decision-support outputs

1. A provider-neutral capability taxonomy.
2. A capability-claim evidence and freshness schema.
3. A routing policy framework with hard gates and scored preferences.
4. A fallback/degraded-guarantee model.
5. A tool/connector capability and permission matrix.
6. A minimal recurring validation suite and update workflow.
7. A worked example showing routing under incomplete or conflicting evidence.

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

- Do not publish a timeless ranking of current providers.
- Do not infer exact backend identity from UI selection, latency, style, or self-report.
- Do not let cost or benchmark score override authority, privacy, or tool permissions.
- Do not assume two named models provide independent review without evidence.
- Do not require continuous exhaustive benchmarking of every provider.

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

1. What durable capability model survives provider churn?
2. What evidence is sufficient for a routing claim and when does it expire?
3. How should routing behave when capabilities are unknown, stale, or conflicting?
4. How are fallback and degraded guarantees made explicit?
5. What maintenance program is useful without consuming more effort than it saves?
