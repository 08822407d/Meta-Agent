---
contract_id: MA-DR-09-RETURN-AND-ADJUDICATION-001
artifact_role: report_return_and_adjudication_contract
status: ready_not_executed
target_truth_source: false
---

# MA-DR-09 Return and Adjudication Contract

## Identity gate

Verify exact research ID/title, one complete canonical report, actual repository
ref, seven-report input availability, portable sources, no pilot execution, no
repository write and no stable-ID claim.

Allowed dispositions:

```yaml
- ACCEPT_AS_NON_EXECUTION_SOURCE_EVIDENCE
- ACCEPT_WITH_CORRECTIONS_AS_NON_EXECUTION_SOURCE_EVIDENCE
- ACCEPT_EXTERNAL_LANDSCAPE_TARGET_MAPPING_BLOCKED
- BOUNDED_ADDENDUM_REQUIRED
- CLEAN_RERUN_REQUIRED
- REJECT
```

## Required substantive review

Assess:

- strength and fairness of baselines;
- case diversity and cross-domain coverage;
- IR/backend conformance precision;
- ablation identifiability;
- metric validity and anti-Goodhart safeguards;
- small-N/statistical assumptions;
- adversarial/security completeness;
- human workload and learning-value measurement;
- pilot-tier safety and rollback;
- administrative burden;
- source freshness and reproducibility;
- case-ledger and methodology-promotion boundary.

## Downstream boundary

The report may support an Owner decision package or offline prototype proposal.
It cannot itself authorize implementation, a pilot, private data, operational
activation or methodology promotion.

## Current receipt status

```yaml
external_report_received_by_dedicated_conversation: true
formal_identity_and_evidence_adjudication_completed: false
repository_preservation_authorized_in_this_task: false
duplicate_run_required: false_unless_later_adjudication_says_otherwise
```
