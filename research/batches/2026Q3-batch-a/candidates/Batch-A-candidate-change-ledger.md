---
ledger_id: META-AGENT-BATCH-A-CANDIDATE-CHANGE-LEDGER-001
artifact_role: candidate_change_ledger
status: candidate_only_not_owner_accepted
target_project_id: meta-agent
target_truth_source: false
stable_target_IDs_issued: false
---

# Batch-A Candidate Change Ledger

No item below is an issued `MA-REQ`, `MA-PEND`, `MA-METHOD`, `MA-MIG` or accepted control.

| Candidate label | Object type | Current overlap | Evidence | Proposed scope | Dependency before acceptance |
|---|---|---|---|---|---|
| `CAND-DESIGN-SYNTHESIS` | method | Between `MA-METHOD-0002` and `0005` | DR-06 + cross-review | Build a typed, traceable design spec from approved requirements without execution | DR-08 IR result; Owner decision |
| `CAND-ALTERNATIVE-BASELINE-COMPARISON` | method | Extends `MA-METHOD-0002/0005` | DR-06 / OneFlow / RobustFlow | Generate direct Agent, deterministic workflow, same-workflow single-Agent and multi-Agent alternatives | DR-09 protocol; controlled experiment |
| `CAND-CONSTRAINT-PRESERVING-SEARCH` | future feature gate | Not in current v0.1 runtime | DR-06 + DR-07 | Offline proposal-only search over allowlisted variables | IR hard constraints; adversarial suite; Owner authorization |
| `CAND-ORIGIN-ALLOWED-INFLUENCE` | IR/security control | Extends `MA-METHOD-0003` | DR-07 | Record origin, role, freshness, scope and fields an artifact may influence | DR-08 |
| `CAND-TYPED-PERMISSION-SIDE-EFFECT` | IR/security control | Supports `MA-REQ-0013/0014` | DR-07 | Typed tools, authority ceiling, external side effects, expiry and rollback semantics | DR-08 |
| `CAND-BACKEND-DEGRADED-SEMANTICS` | IR/mapping control | New mapping concern | DR-07 | A backend mapping must declare unsupported or weakened security/authority semantics | DR-08 |
| `CAND-PARAPHRASE-STABILITY` | evaluation instrument | Extends `MA-METHOD-0001/0005` | RobustFlow evidence | Canonical paraphrase/noise/conflict clusters and topology/outcome stability | DR-09 |
| `CAND-STRONG-SIMPLE-BASELINES` | evaluation instrument | Strengthens `MA-METHOD-0002/0005` | OneFlow + DR-06 | Require fixed template, strong single Agent, deterministic workflow and same-workflow simulation | DR-09 |
| `CAND-SECURITY-UTILITY-DUAL-GATE` | evaluation instrument | Extends `MA-METHOD-0005` | DR-07 / AgentDojo pattern | Critical security zero-failure classes plus a benign utility floor | Risk-tier design; DR-09 |
| `CAND-PROMOTION-QUARANTINE` | method/control | Strengthens `MA-REQ-0006/0012` | DR-07 | Case/feedback/research candidates cannot affect methodology until origin and contradictory evidence review | Owner decision; later cases |
| `CAND-ANTI-RESURRECTION-ROLLBACK` | migration/control | Extends `MA-REQ-0010/0016` | DR-07 | Dependency graph, semantic tombstones and rebuild from clean authority after contamination | Future memory/runtime design |
| `CAND-REPRODUCIBLE-SEARCH-BUNDLE` | evidence schema | New experiment support | DR-06 | Model/tool versions, prompts, seed, budget, dataset split, candidate lineage and evaluators | DR-09 |

## Promotion rule

A candidate may advance only through:

```text
research evidence
-> target mapping and competing evidence
-> candidate specification
-> acceptance criteria and version impact
-> Owner decision
-> authorized target/method update
-> validation and rollback/revision record
```
