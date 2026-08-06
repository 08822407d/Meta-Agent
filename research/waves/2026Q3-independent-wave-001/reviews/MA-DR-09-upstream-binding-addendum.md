---
addendum_id: MA-DR-09-UPSTREAM-BINDING-ADDENDUM-001
artifact_role: reviewer_supplied_target_binding_addendum
status: completed_non_execution_addendum
research_id: MA-DR-09
target_truth_source: false
upstream_reports:
  - MA-DR-08
  - MA-DR-10
  - MA-DR-11
  - MA-DR-12
  - MA-DR-13
  - MA-DR-14
  - MA-DR-15
target_truth_modified: false
methodology_modified: false
---

# MA-DR-09 Upstream Binding Addendum

## 1. Purpose

MA-DR-09 completed a broad external benchmark and pilot-protocol study but did
not receive the seven completed upstream reports. PR #247 subsequently placed
the exact reports, formal reviews and convergence record on `master`.

This addendum binds the parameterized MA-DR-09 protocol to those reviewed
upstream inputs without rewriting the original report or pretending the inputs
were available during the run.

## 2. Frozen upstream bindings

### MA-DR-08 — Candidate design object and conformance

Bind MA-DR-09 to the following candidate rules:

- one normative, versioned serialized design source;
- deterministic graph/AST normalization rather than a second editable truth;
- first-class roles, typed inputs/outputs, workflow, state/memory, authority,
  permissions, side effects, human gates, provenance and allowed influence;
- provider-neutral capability requirements separated from backend binding;
- mapping status vocabulary:
  `PRESERVED`, `EMULATED_WITH_RUNTIME_GUARD`, `DEGRADED_EXPLICIT`,
  `UNSUPPORTED_BLOCK`, `NOT_TESTED`;
- static, runtime, evidence and human checks remain distinct;
- generated artifacts carry source design identity, adapter identity and loss
  declarations;
- semantic diff, migration, tombstone and clean-rebuild tests are required.

MA-DR-09's RFC 8785/JSON Schema/normalized-trace suite is therefore bound as a
validator architecture for this candidate, not as proof that the IR is already
accepted.

### MA-DR-10 — Frame-to-Design and baseline package

Bind benchmark fixtures to:

```text
approved problem frame
-> operationalized requirements
-> simplest viable design
-> roles/contracts/state/permissions
-> termination/recovery/evaluation
-> strong alternatives and baselines
-> trace/rationale/evidence dossier
-> hard-gate review
```

The protocol must measure both design defects prevented and the burden of the
dossier. Lite/Standard/High-Assurance profiles remain experiment-calibrated.

### MA-DR-11 — Evidence generalization and promotion

Bind case-ledger outputs to:

- target-specific lesson versus scoped candidate versus general default;
- explicit confounders and competing explanations;
- positive, negative, neutral, blocked, abandoned, missing and contradictory
  evidence;
- narrowing, deprecation, retirement, tombstones and reopening;
- no automatic promotion from benchmark gain;
- no universal sample-size or promotion threshold;
- Owner decision for every authority-changing promotion.

### MA-DR-12 — Delegation and approval

Bind action-level metrics to a policy that first decides:

```text
PROCEED | VERIFY | ASK | ABSTAIN | ESCALATE
```

Capability does not enlarge authority. The M0–M6 ladder, NetVOI-like reasoning,
session grants and thresholds remain candidate policies to be calibrated.

### MA-DR-15 — Provider/tool routing

After MA-DR-12 establishes that an action is permitted, route execution through:

```text
authority/privacy/permission hard gates
-> required capability and freshness feasibility
-> current account/region/quota availability
-> scored preferences among feasible routes
-> explicit fallback guarantee delta
```

Capability facts are dated atomic claims. Unknown/stale high-impact capability
is infeasible until verified. Visible labels do not attest hidden backend
identity.

### MA-DR-13 — Product and execution surfaces

Bind the protocol to one authority core with replaceable conversation, CLI,
repository, local-service or hosted-service surfaces. Logical control,
evidence, state and execution planes do not require immediate microservice
separation.

Repository-first/manual degraded operation remains a valid baseline.
Dedicated-repository or service migration requires measured triggers.

### MA-DR-14 — Private-material boundary

All benchmark and pilot fixtures remain public or synthetic.

```yaml
real_private_data: prohibited
credentials: prohibited
customer_or_production_material: prohibited
cross_project_sharing: prohibited_by_default
private_connector_access: not_authorized
```

Local/cloud/hybrid private-data profiles are future candidates requiring
separate privacy, storage, legal/contract and Owner decisions.

## 3. Integrated two-stage evaluation architecture

```text
Frame and design candidate
  -> normative design serialization and semantic validation
  -> action authority/delegation gate
  -> provider/tool capability and freshness routing
  -> selected replaceable execution surface
  -> public/synthetic material boundary
  -> outcome/security/cost/human evidence
  -> case-ledger disposition and promotion quarantine
```

## 4. Candidate-specific benchmark obligations

The future harness should test:

1. simplest mechanism and B2/B3/B4 before multi-Agent claims;
2. one normative design object and deterministic normalization;
3. authority, permission and private-data invariants as non-compensable;
4. explicit `DEGRADED_EXPLICIT` and `UNSUPPORTED_BLOCK` behavior;
5. fresh-session reconstruction and derived-view rebuildability;
6. negative and contradictory evidence preservation;
7. false proceed, false escalate and missed escalation;
8. capability freshness, outage and fallback guarantee deltas;
9. review burden, comprehension, appropriate reliance and learning value;
10. tombstone and anti-resurrection behavior after rollback.

## 5. Remaining unresolved items

The addendum does not decide:

- final IR/schema;
- exact fixture count, split or seed count;
- effect-size, utility, risk or burden thresholds;
- which candidate becomes an accepted method;
- product surface or repository migration;
- private-storage implementation;
- whether a Tier-0 pilot should be authorized;
- applicable non-FABLE health-review disposition;
- operational activation.

## 6. Addendum effect

```yaml
original_report_rewritten: false
original_input_failure_hidden: false
target_mapping_completed_by_reviewer: true
stable_target_ids_issued: false
target_truth_or_method_change: false
pilot_or_activation: false
```
