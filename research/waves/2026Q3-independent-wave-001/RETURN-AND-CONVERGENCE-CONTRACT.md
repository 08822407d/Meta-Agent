---
contract_id: META-AGENT-INDEPENDENT-RESEARCH-WAVE-001-RETURN-AND-CONVERGENCE
artifact_role: multi_report_return_review_and_convergence_contract
status: prepared_not_executed
target_truth_source: false
automatic_promotion: prohibited
---

# Meta-Agent Independent Research Wave — Return and Convergence Contract

## 1. Per-report gate

For every returned report verify:

- exact research ID/title;
- one complete canonical report;
- actual repository ref;
- mandatory input receipt;
- sibling-wave reports were not prerequisites;
- portable direct-source table;
- no repository write, activation, or stable-ID claim;
- no visible truncation.

Allowed dispositions:

```yaml
- ACCEPT_AS_PRIMARY_NON_EXECUTION_SOURCE_EVIDENCE
- ACCEPT_WITH_CORRECTIONS_AS_NON_EXECUTION_SOURCE_EVIDENCE
- ACCEPT_EVIDENCE_ONLY_TARGET_MAPPING_BLOCKED
- BOUNDED_ADDENDUM_REQUIRED
- CLEAN_RERUN_REQUIRED
- REJECT
```

## 2. Independence audit

Before cross-report synthesis, check whether a report silently relied on a
sibling report, adopted a sibling conclusion as fact, or changed scope because
of another result. Such dependence does not automatically invalidate the
external evidence, but it must be recorded and may require a bounded addendum
or rerun.

## 3. Cross-report convergence

After all selected reports are adjudicated:

1. map findings to `MA-REQ-0001–0016`, `MA-PEND-0001–0008`,
   `MA-METHOD-0001–0006`, and the Batch-A candidate ledger;
2. identify consensus, contradictions, duplicated recommendations, and value
   choices;
3. separate design principle, candidate requirement/method, prototype
   requirement, experiment question, and Owner-only decision;
4. preserve negative evidence and unresolved alternatives;
5. assess whether any task generated a real prerequisite for another future
   task;
6. determine whether MA-DR-09 can now be generated after MA-DR-08 adjudication.

## 4. Promotion boundary

No report or convergence result may automatically:

- change target truth or methods;
- issue stable IDs;
- select the product surface, provider, private store, or runtime;
- authorize operational use, private data, pilot, or writeback;
- import another conversation's route.

Any repository recording or target change requires a separate task-local
authorization and canonical PR.
