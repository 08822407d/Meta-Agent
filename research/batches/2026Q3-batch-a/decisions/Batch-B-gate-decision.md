---
decision_id: META-AGENT-BATCH-B-GATE-001
artifact_role: non_authoritative_research_staging_decision
status: DR_08_prepared_DR_09_deferred
target_project_id: meta-agent
target_truth_source: false
research_execution_authorized: false
---

# Batch-B Gate Decision

## Decision

```yaml
Batch_B_gate: GENERATE_DR_08_ONLY

MA_DR_08:
  title: Portable Agent Design IR and Multi-Backend Mapping
  task_preparation: authorized_by_current_planning_context
  execution: not_authorized
  quota_trigger: Owner_retained

MA_DR_09:
  title: Meta-Agent Benchmark, Ablation and Bounded-Pilot Protocol
  task_generation: deferred
  reason:
    - final_IR_object_and_mapping_semantics_are_upstream_inputs
    - security_degradation_and_conformance_rules_may_change_the_benchmark
    - avoid_generating_a_likely_invalidated_downstream_task
```

## Why DR-08 is ready

Batch A has frozen enough input to research:

- core versus backend-specific design fields;
- declarative/typed/diffable representation;
- roles, I/O, workflow, state/memory and termination;
- capability requirements rather than provider assignment;
- authority, permissions, external side effects and human gates;
- provenance and allowed influence;
- evaluation hooks;
- search-space mutation constraints;
- backend mapping, unsupported semantics and degraded guarantees;
- versioning, migration and conformance testing.

## Why DR-09 remains deferred

A benchmark/pilot protocol can already list broad baselines and threat families, but it still lacks a reviewed answer to:

- what the canonical design object is;
- how semantically equivalent designs are represented;
- how backend loss is declared;
- which fields can be statically validated;
- how conformance and equivalence are tested;
- how a candidate design is serialized for ablation.

Generating a final runnable MA-DR-09 task now risks rework after DR-08.

## Re-entry gate for MA-DR-09

Generate MA-DR-09 only after:

1. MA-DR-08 passes identity/source/completeness review;
2. its IR and mapping conclusions are adjudicated;
3. Owner-value questions are separated from external research questions;
4. the benchmark can remain public/synthetic;
5. non-FABLE health-review dependencies relevant to a pilot are checked or explicitly left as pre-pilot gates.

No pilot or activation follows automatically from DR-08 or DR-09.
