---
package_id: META-AGENT-RESEARCH-BATCH-A-ADJUDICATION-001
artifact_role: target_specific_research_batch_adjudication_and_followup_preparation
status: repository_recording_pending_human_merge
target_project_id: meta-agent
target_truth_source: false
created_by_task: META-AGENT-RESEARCH-BATCH-A-ADJUDICATION-001
prepared_against_master: f690209dfc71e6d235f398589eb7b1aa52b0df71
canonical_recording_branch: meta-agent-research-batch-a-adjudication-001
canonical_recording_PR: 242
repository_write_performed: true
operational_activation_performed: false
pilot_authorized: false
stable_target_IDs_issued: false
---

# Meta-Agent Research Batch A — Adjudication Package

## 1. Role and authority

This directory preserves and adjudicates:

- `MA-DR-06` — Automated Agentic System Design and Robust Workflow Search;
- `MA-DR-07` — Meta-Agent Security Threat Model and Adversarial Evaluation.

It also contains the Batch-A cross-report adjudication, candidate-change ledger, the Batch-B gate, one prepared `MA-DR-08` task package, and a deferred input contract for `MA-DR-09`.

Nothing in this directory is Meta-Agent target truth. It cannot override:

```text
target-projects/meta-agent/current/approved-spec.md
```

No artifact here activates Meta-Agent, authorizes a pilot, expands the accepted methodology, issues stable target IDs, permits private material, enables tools, or authorizes external research quota.

## 2. Current result

```yaml
MA_DR_06:
  identity: PASS
  report_completeness: PASS_WITH_WARNINGS
  repository_input_binding: BLOCKED_BY_MISSING_TARGET_INPUTS
  report_disposition: ACCEPT_EVIDENCE_ONLY_TARGET_MAPPING_BLOCKED
  reviewer_supplied_target_mapping: completed_separately
  rerun_required: false

MA_DR_07:
  identity: PASS
  report_completeness: PASS
  repository_input_binding: PASS
  report_disposition: ACCEPT_WITH_CORRECTIONS_AS_NON_EXECUTION_SOURCE_EVIDENCE
  rerun_required: false

cross_report_verdict: ACCEPT_BATCH_A_AS_NON_EXECUTION_SOURCE_EVIDENCE_WITH_CORRECTIONS
v0_1_rollback_required: false
target_truth_change_authorized: false
methodology_change_authorized: false
operational_activation_supported: false
pilot_authorized: false
stable_target_IDs_issued: false
```

## 3. Batch-B gate

```yaml
MA_DR_08:
  task_status: READY_NOT_SELECTED
  execution_requested_now: false
  execution_required_now: false
  quota_authorized: false
  operator: tasks/MA-DR-08-OPERATOR.md
  task: tasks/MA-DR-08-portable-agent-design-ir-and-multi-backend-mapping.md
  return_contract: tasks/MA-DR-08-return-and-adjudication-contract.md

MA_DR_09:
  status: DEFERRED_UNTIL_MA_DR_08_ADJUDICATION
  runnable_task_present: false
  input_contract: deferred/MA-DR-09-input-contract.md
```

Readiness is not selection. The presence of the MA-DR-08 files does not request a run or authorize quota.

## 4. Contents

```text
target-projects/meta-agent/research/batches/2026Q3-batch-a/
  README.md
  meta/
    manifest.yaml
    repository-recording-plan.md
  reports/
    README.md
    report-parts-manifest.yaml
    MA-DR-06-report-parts/
      MA-DR-06-report.part-001-of-006.md
      ...
      MA-DR-06-report.part-006-of-006.md
    MA-DR-07-report-parts/
      MA-DR-07-report.part-001-of-008.md
      ...
      MA-DR-07-report.part-008-of-008.md
  reviews/
    MA-DR-06-intake-review.md
    MA-DR-07-intake-review.md
    MA-DR-06-07-cross-report-adjudication.md
  candidates/
    Batch-A-candidate-change-ledger.md
  decisions/
    Batch-B-gate-decision.md
  tasks/
    MA-DR-08-portable-agent-design-ir-and-multi-backend-mapping.md
    MA-DR-08-OPERATOR.md
    MA-DR-08-return-and-adjudication-contract.md
  deferred/
    MA-DR-09-input-contract.md
```

## 5. Evidence and portability limits

- Both reports are preserved as ordered UTF-8 Markdown parts whose lexical concatenation reproduces the exact operator-exported bytes.
- `MA-DR-06` includes three references to Deep Research sandbox images that were not included in the Markdown export:
  - `aflow_average_performance.png`;
  - `oneflow_cost_reduction.png`;
  - `robustflow_robustness.png`.
- The report states the load-bearing values and interpretations in text, so the argument remains recoverable without the images.
- `MA-DR-06` did not obtain the mandatory repository files; its target mapping is supplied by the separate intake/cross-report review.
- `MA-DR-07` successfully bound itself to the then-current Meta-Agent repository inputs.
- Current/preprint quantitative claims remain subject to version and freshness review.

## 6. Candidate boundary

The candidate ledger contains no issued `MA-REQ`, `MA-PEND`, `MA-METHOD`, `MA-MIG`, control, schema, or runtime object. Promotion requires:

```text
research evidence
-> target mapping and competing evidence
-> candidate specification
-> acceptance criteria and version impact
-> Owner decision
-> authorized target/method update
-> validation and rollback/revision record
```

## 7. Update rule

Future reports may add evidence, correct the reviews, supersede the Batch-B gate, or propose target changes. They may not silently rewrite report originals, current target truth, methodology, owner authority, activation state, or execution permissions.
