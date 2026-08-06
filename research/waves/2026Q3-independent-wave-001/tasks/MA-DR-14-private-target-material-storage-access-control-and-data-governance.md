---
research_id: MA-DR-14
wave_id: META-AGENT-INDEPENDENT-RESEARCH-WAVE-001
title: Private Target Material Storage, Access Control, and Data Governance
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

# MA-DR-14 — 私有目标材料存储、访问控制与数据治理

## 0. Identity and output contract

Open the report with:

```yaml
research_id: MA-DR-14
research_title: Private Target Material Storage, Access Control, and Data Governance
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

The public bootstrap repository intentionally excludes secrets, private source,
confidential/customer material, and unredacted personal records. Future
Meta-Agent use may need private project inputs, but no storage or access method
has been approved.

This task develops options and governance requirements for private material.
It is independent of the final product surface: each storage pattern must be
described through portable security, authority, lifecycle, and access
properties rather than one chosen platform.


## 2. Decisions this research can inform

1. Which private-material storage patterns deserve a prototype.
2. What data classification, consent, access, retention, deletion, and audit controls are mandatory.
3. How public metadata/pointers may refer to private originals safely.
4. What conditions permit retrieval, connector access, or cross-Agent use.
5. What remains prohibited until a separate operational and privacy decision.

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
notes/first-target-project-intake-records/meta-agent/meta-agent-v0.1-M1-workspace-safety-build-manifest.md
```

If a listed path is a research review or candidate ledger, preserve its
non-execution role. Do not treat it as target truth.

## 4. Research questions

### RQ1 — Data classes and threat model

Define public, internal, private, confidential, credential, regulated,
personal, voice/chat, source-code, customer, and derived-summary classes.
Identify owners, processors, attackers, accidental exposure paths, and
cross-project contamination risks.


### RQ2 — Storage-pattern comparison

Compare encrypted local filesystem, private Git, encrypted archive, password/
secret manager, private cloud object store, managed database, local database,
secure workspace/project storage, content-addressed pointer store, and
hybrid approaches. Analyze recovery, deletion limits, searchability, audit,
availability, and lock-in.


### RQ3 — Identity, authentication, and least privilege

Study user identity, service identity, workload identity, short-lived
credentials, role/capability-based access, read/write separation, approval
scope, revocation, and delegated authority ceilings. Credentials must be
referenced without embedding secrets in design records.


### RQ4 — Encryption and key management

Compare encryption at rest/in transit, client-side encryption, envelope
encryption, hardware-backed keys, recovery keys, rotation, sharing, backup,
and the consequences of key loss or compromised writers.


### RQ5 — Lifecycle, retention, deletion, and backup

Define collection minimization, purpose limitation, retention classes,
legal/contractual holds where relevant, version history, backup retention,
secure deletion limits, export, migration, revocation, and handling of forks/
caches or derived summaries.


### RQ6 — Safe retrieval and connector use

Research prompt injection, provenance, taint/allowed-influence tracking,
retrieval poisoning, content quarantine, redaction, data-loss prevention,
egress controls, logging privacy, and minimum exposure for Agent/tool access.


### RQ7 — Cross-Agent and cross-project boundaries

Define default isolation, explicit sharing grants, purpose-bound access,
sanitized summaries, separate memory namespaces, revocation, and prevention of
private target details entering general methodology.


### RQ8 — Operational profiles and decision gate

Propose no-private-data, local-private, bounded-cloud-private, and higher-risk
profiles. For each, state prerequisites, residual risks, prohibited actions,
incident response, and evidence needed before Owner approval.


## 5. Mandatory comparative and decision-support outputs

1. A data-classification and handling matrix.
2. A storage-pattern comparison with threat assumptions and deletion limits.
3. An identity/access/key-management control model.
4. A private/public pointer and redaction policy.
5. A retrieval/connector safety model.
6. Risk-tiered private-material operating profiles.
7. A prototype and validation plan using synthetic data only.

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

- Do not authorize or ingest actual private material.
- Do not treat a private repository as sufficient security by itself.
- Do not store credentials or secret values in the proposed metadata.
- Do not promise complete erasure from Git history, caches, backups, or external copies.
- Do not enable cross-Agent or cross-project sharing by default.

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

1. Which storage patterns are viable under the project's authority and portability needs?
2. What controls are mandatory before any private material is used?
3. How are private originals, public pointers, and derived summaries separated?
4. How are access, revocation, retention, deletion, and incident response handled?
5. What synthetic prototype can validate the leading options safely?
