---
ledger_id: META-AGENT-INDEPENDENT-WAVE-CANDIDATE-CONVERGENCE-001
artifact_role: candidate_only_convergence_ledger
status: candidate_only_not_owner_accepted
target_truth_source: false
stable_target_ids_issued: false
---

# Independent-Wave Candidate Convergence Ledger

No entry below is an issued `MA-REQ`, `MA-PEND`, `MA-METHOD`, `MA-MIG`, schema,
policy or runtime control. Provisional labels exist only to prevent duplicate
analysis and to support later Owner review.

| Provisional label | Type | Report support | Relationship to existing objects | Current status | Required before acceptance |
|---|---|---|---|---|---|
| `WAVE-CAND-DESIGN-IR-MVI` | schema/design object | DR-08 | Strengthens origin/influence, typed permission and backend-degradation candidates | candidate only | compact schema prototype, semantic validator, 3+ backend mappings, burden study, Owner decision |
| `WAVE-CAND-FRAME-TO-DESIGN` | method | DR-10 | Strengthens design-synthesis and alternative/baseline candidates | candidate only | representation compatibility, benchmark/ablation, cross-domain cases, Owner decision |
| `WAVE-CAND-PROMOTION-LIFECYCLE` | governance method/control | DR-11 | Strengthens promotion quarantine and anti-resurrection rollback | candidate only | case-ledger trial, negative-case preservation test, burden measurement, Owner vocabulary decision |
| `WAVE-CAND-MANAGED-AUTONOMY` | policy | DR-12 | Refines `MA-REQ-0011` and `MA-METHOD-0004` without changing them | candidate only | synthetic policy replay, false-proceed/false-escalate metrics, human-factors test, Owner thresholds |
| `WAVE-CAND-SINGLE-AUTHORITY-CORE` | product architecture principle | DR-13 | Strengthens `MA-REQ-0014` and migration rules | candidate only | manual/CLI/conversation prototypes, recovery test, migration-trigger evidence |
| `WAVE-CAND-PRIVATE-DATA-GOVERNANCE` | future feature gate | DR-14 | Extends pending private-material requirement; current prohibition remains | candidate only | synthetic local/cloud/hybrid prototypes, privacy/security review, separate Owner authorization |
| `WAVE-CAND-CAPABILITY-CLAIM-REGISTRY` | evidence/routing schema | DR-15 | Refines capability-aware routing and backend-degradation candidate | candidate only | minimum active-route schema, JIT probes, fallback drills, maintenance-budget measurement |
| `WAVE-CAND-TWO-STAGE-ROUTING` | policy integration | DR-12 + DR-15 | New integration concern | candidate only | authority/action hard-gate tests followed by executor capability/freshness routing tests |
| `WAVE-CAND-PROPORTIONAL-ASSURANCE` | method/evaluation principle | DR-10 + DR-11 + DR-12 + DR-13 | Strengthens `MA-METHOD-0005` | candidate only | Lite/Standard/high-risk profiles calibrated by defect detection and review burden |
| `WAVE-CAND-DERIVED-VIEW-REBUILDABILITY` | architecture/recovery control | DR-08 + DR-13 + DR-14 | Extends migration/rollback and anti-resurrection candidates | candidate only | clean rebuild, stale-index, deletion/restore and tombstone tests |

## Promotion rule

```text
research reports and reviewer corrections
-> candidate specification
-> competing evidence and negative-case review
-> exact acceptance criteria
-> prototype or experiment
-> version and migration impact
-> Owner decision
-> authorized target/method update
-> validation and rollback/revision record
```

Agreement among multiple reports is evidence convergence, not Owner acceptance
and not independent replication where the reports share repository inputs,
research framing or model/provider ancestry.
