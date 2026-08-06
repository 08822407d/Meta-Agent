---
matrix_id: META-AGENT-INDEPENDENT-RESEARCH-WAVE-001-INDEPENDENCE-MATRIX
artifact_role: research_scope_independence_and_exclusion_audit
status: prepared_not_executed
prepared_against_master: 0865f334177e2ff0d81a3652ea9e3384e55f4259
---

# Meta-Agent Independent Research Wave — Scope and Independence Matrix

## Included tasks

| ID | Core question | Why it is worthwhile now | Independence boundary | Priority |
|---|---|---|---|---|
| MA-DR-08 | Portable Agent Design IR and backend mapping | Blocks stable design objects and later conformance/benchmark work | Uses already-merged Batch A only | P0 |
| MA-DR-10 | Requirements-to-design synthesis method | Current method library lacks the construction step after topology selection | Representation-neutral; does not require DR-08 | P0 |
| MA-DR-11 | Evidence generalization and methodology promotion | Current promotion gate lacks evidence-strength and retirement rules | Uses cases/evidence theory, not any new IR | P1 |
| MA-DR-12 | Dynamic delegation and managed autonomy | Current capability split is qualitative and approval burden is unresolved | Provider- and IR-neutral policy research | P0/P1 |
| MA-DR-13 | Product surface, repository topology, and operational architecture | MA-PEND-0001/0002 and staged automation architecture remain open | Treats data/routing as interfaces, not dependencies | P1 |
| MA-DR-14 | Private material storage and data governance | MA-PEND-0005 blocks any future private project use | Compares portable controls, not a chosen product surface | P0 before private use |
| MA-DR-15 | Capability matrix and routing governance | MA-PEND-0006 remains time-sensitive and operationally central | Studies governance schema, not the result of other wave tasks | P1 |

## Shared frozen inputs

All tasks may use the same execution-time latest Meta-Agent repository baseline.
They do not consume sibling-wave reports. This means all seven may be launched
in parallel in separate fresh Deep Research conversations.

## Deliberately excluded or deferred

### MA-DR-09 — deferred, not independent

`MA-DR-09` remains dependent on the adjudicated MA-DR-08 result for:

- canonical design-object representation;
- backend mapping and degraded semantics;
- conformance/equivalence;
- design serialization for baseline comparison and ablation.

Generating it now would violate the user's no-dependency requirement.

### Better handled by controlled experiments

The following should not receive another broad Deep Research task now:

- exact single-Agent to multi-Agent thresholds;
- exact rubric weights and sample sizes;
- whether SQLite is needed;
- exact memory-layer count;
- seven-file or artifact burden;
- approval-point density;
- real cross-domain transfer;
- real next-tier rework, cost, latency, and review tolerance.

Literature can suggest variables. Meta-Agent-specific experiments must decide them.

### Separately owned routes

Not included here:

- learner/adaptive explanation/GPT Live and persistent learner models;
- the non-FABLE health-review route;
- Mnemosyne repository-concurrency and maintenance-route design.

### MA-PEND-0008 treatment

RAG, MCP, indexing, connectors, and writeback do not receive a separate task in
this wave because broad memory, routing, and security evidence already exists.
Their architecture-level adoption gates are covered by MA-DR-13, MA-DR-14,
and MA-DR-15. Concrete implementation remains prototype- and activation-gated.

## Repository freshness note

This package was recorded after merged PR #245. PR #245 modified only the
separate Mnemosyne frontier-clarification/Fable route and did not modify any
`target-projects/meta-agent/` path. The wave therefore reuses the current
Meta-Agent baseline without importing that maintenance route.
