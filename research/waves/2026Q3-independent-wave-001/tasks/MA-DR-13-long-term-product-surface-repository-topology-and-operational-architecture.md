---
research_id: MA-DR-13
wave_id: META-AGENT-INDEPENDENT-RESEARCH-WAVE-001
title: Long-Term Product Surface, Repository Topology, and Operational Architecture
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

# MA-DR-13 — 长期产品形态、仓库拓扑与运行架构选项

## 0. Identity and output contract

Open the report with:

```yaml
research_id: MA-DR-13
research_title: Long-Term Product Surface, Repository Topology, and Operational Architecture
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

Meta-Agent currently exists as a file-based, human-reviewed target project
inside the Mnemosyne repository. Pending questions include its long-term
product surface, whether it should migrate to a dedicated repository, and how
conversation surfaces, local tools, repositories, services, retrieval,
connectors, and execution should be separated.

This task compares architecture options and migration paths. It must not choose
a final product, storage system, or provider. Private-data details and
provider-routing policies are treated as external interfaces so this study
remains independent of MA-DR-14 and MA-DR-15.


## 2. Decisions this research can inform

1. Which product-surface families deserve prototyping.
2. Whether and when Meta-Agent should migrate to a dedicated repository.
3. How control plane, evidence plane, state plane, and execution plane should be separated.
4. What staged architecture profiles fit bootstrap, personal production, and later expansion.
5. What portability, disaster-recovery, and vendor-exit requirements should guide later implementation.

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
notes/first-target-project-intake-records/meta-agent/meta-agent-v0.1-M0-requirements-and-authority-baseline.md
```

If a listed path is a research review or candidate ledger, preserve its
non-execution role. Do not treat it as target truth.

## 4. Research questions

### RQ1 — Product-surface taxonomy

Compare conversational Project/custom configuration, repository-first manual
workflow, local CLI/coding Agent, desktop application, local or hosted service,
API/orchestrator, and hybrid arrangements. Distinguish user interface from
durable truth, evidence, automation, and execution.


### RQ2 — Control-plane and execution-plane separation

Define responsibilities for product intent, methodology, target truth,
current state, evidence, scheduling, credentials, tool execution, audit, and
rollback. Identify where co-location is useful and where separation reduces
risk or coupling.


### RQ3 — Repository topology

Compare current monorepo bootstrap, dedicated Meta-Agent repository,
multi-repository target-project layout, submodules/subtrees, package/artifact
publishing, and external storage pointers. Analyze authority clarity, atomic
changes, migration, access control, CI, discoverability, and operational burden.


### RQ4 — State and truth topology

Research single-truth, materialized views, caches, indexes, event logs, and
derived state. Define how to avoid dual truth across chats, Git, databases,
local state, and runtime services.


### RQ5 — Staged optional capabilities

Place retrieval/indexing, local search, vector retrieval, connectors, MCP-like
interfaces, scheduled jobs, webhooks, and writeback into modular capability
profiles. Study prerequisites and failure containment without selecting a
specific implementation.


### RQ6 — Portability and vendor exit

Define export/import, open formats, provider replacement, offline recovery,
backup, reproducible configuration, and degradation when a subscription,
connector, or platform becomes unavailable.


### RQ7 — Operational quality attributes

Compare options on cost, latency, reliability, security, maintainability,
observability, testability, migration burden, human review load, and suitability
for one technically sophisticated Owner.


### RQ8 — Migration and prototype ladder

Propose minimal bootstrap, bounded personal-production, and expanded-service
profiles, with triggers and stop conditions for moving between them. Include
a no-migration option and explain when a dedicated repository is unnecessary.


## 5. Mandatory comparative and decision-support outputs

1. A product-surface and architecture-option matrix.
2. A control/evidence/state/execution plane responsibility model.
3. A repository-topology comparison and migration decision tree.
4. Three staged architecture profiles with triggers and exit criteria.
5. A portability, backup, recovery, and vendor-exit checklist.
6. A prototype plan that does not require private data or operational activation.
7. Owner decisions separated from externally researchable facts.

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

- Do not select one permanent product surface or repository topology.
- Do not assume RAG, MCP, connectors, or writeback are necessary.
- Do not create a second target truth source.
- Do not treat product convenience as authority or storage approval.
- Do not hide migration or maintenance cost behind a generic 'hybrid' recommendation.

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

1. What architecture families are viable for this one-owner Meta-Agent?
2. Which planes should be separated and why?
3. When is a dedicated repository worth its migration cost?
4. How can optional automation be staged without becoming assumed infrastructure?
5. What prototypes would distinguish the leading options?
