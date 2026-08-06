---
contract_id: MA-DR-08-RETURN-ADJUDICATION-001
artifact_role: report_return_and_adjudication_contract
status: prepared_not_executed
research_id: MA-DR-08
target_truth_source: false
---

# MA-DR-08 Return and Adjudication Contract

## Identity/input gate

Verify:

- exact research ID/title;
- actual repository ref;
- mandatory Meta-Agent and Batch-A inputs;
- complete canonical report;
- portable direct-source table;
- no repository write or activation claim.

## Evidence review

Assess:

- primary specification/paper coverage;
- version/freshness;
- negative findings and lock-in;
- core versus extension separation;
- authority/security semantics;
- mapping-loss analysis;
- validation/conformance;
- version/migration;
- minimum viable scope;
- administrative burden;
- target-specific mapping.

## Required adjudication outputs

1. report disposition;
2. source/evidence calibration;
3. candidate IR field ledger;
4. unresolved representation conflicts;
5. Owner-value questions;
6. prototype/conformance requirements;
7. changes, if any, to Batch-A candidates;
8. MA-DR-09 generation gate;
9. separately gated repository-recording proposal.

## Allowed dispositions

```yaml
- ACCEPT_AS_PRIMARY_NON_EXECUTION_SOURCE_EVIDENCE
- ACCEPT_WITH_CORRECTIONS_AS_NON_EXECUTION_SOURCE_EVIDENCE
- ACCEPT_EVIDENCE_ONLY_TARGET_MAPPING_BLOCKED
- BOUNDED_ADDENDUM_REQUIRED
- CLEAN_RERUN_REQUIRED
- REJECT
```

No report disposition issues stable target IDs, adopts a schema, activates Meta-Agent or authorizes implementation.
