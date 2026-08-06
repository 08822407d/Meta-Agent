---
review_id: MA-DR-09-FORMAL-INTAKE-REVIEW-001
artifact_role: per_report_evidence_adjudication
status: completed_non_execution_review
research_id: MA-DR-09
target_project_id: meta-agent
original_run_disposition: ACCEPT_EXTERNAL_LANDSCAPE_TARGET_MAPPING_BLOCKED
post_addendum_disposition: ACCEPT_WITH_CORRECTIONS_AS_NON_EXECUTION_SOURCE_EVIDENCE
clean_rerun_required: false
target_truth_source: false
target_truth_modified: false
methodology_modified: false
pilot_authorized: false
operational_activation_authorized: false
stable_target_ids_issued: false
---

# MA-DR-09 Formal Intake Review

## 1. Executive disposition

```yaml
identity_gate: PASS
topic_binding: PASS
canonical_report_completeness: PASS
visible_truncation: false
source_portability: PASS_WITH_WARNINGS
execution_time_repository_binding: PASS_FOR_BASELINE_FILES
seven_exact_upstream_reports_available_during_run: false
formal_upstream_convergence_available_during_run: false

original_run_disposition:
  ACCEPT_EXTERNAL_LANDSCAPE_TARGET_MAPPING_BLOCKED

reviewer_binding_addendum:
  completed: true
  inputs:
    - MA-DR-08
    - MA-DR-10
    - MA-DR-11
    - MA-DR-12
    - MA-DR-13
    - MA-DR-14
    - MA-DR-15
    - MA-DR-08-15 cross-report convergence
    - independent-wave candidate convergence ledger

final_combined_disposition:
  ACCEPT_WITH_CORRECTIONS_AS_NON_EXECUTION_SOURCE_EVIDENCE

clean_rerun_required: false
```

The report is a complete and technically useful benchmark/ablation/conformance
protocol. Its own disclosure is correct: at research time it read the
repository baseline and task definitions, but it did not receive the seven
completed reports or their formal convergence package. Consequently, its
Meta-Agent-specific schema and component binding was parameterized rather than
fully target-bound.

This is not repaired by pretending those inputs were present. It is repaired by
the separate reviewer binding addendum prepared after PR #247 placed the exact
reports and formal convergence on `master`.

## 2. Exact report identity

```yaml
research_id: MA-DR-09
title: Meta-Agent Benchmark, Ablation, Conformance, and Bounded-Pilot Protocol
bytes: 88451
lines: 1493
sha256: f3a7debd08b3ff8edf89d2fb51492e03a25dfa43168a9014c9f7c1e4319912e9
code_fences_balanced: true
visible_truncation: false
direct_URLs_observed: 18
product_native_web_citation_groups_observed: 40
repository_file_citation_groups_observed: 23
```

The exact operator-exported Markdown is preserved as
`report/MA-DR-09-report.md`.

## 3. Task coverage

The report materially covers every required output family:

- evaluation claim map and units of analysis;
- public/synthetic case taxonomy and manifest;
- B0–B7 strong-baseline fairness contract;
- component-removal, replacement and interaction ablations;
- outcome, robustness, authority/security, operations and human metrics;
- generic IR/backend conformance layers and normalized trace properties;
- adversarial/security fixtures;
- prospective registration, small-N and reproducibility protocol;
- Tier-0, Tier-1 and Tier-2 bounded-pilot manifests;
- stop, incident, rollback and anti-resurrection rules;
- case-ledger and methodology-promotion mapping;
- administrative-burden estimates with uncertainty;
- open Owner decisions;
- portable source table;
- final disposition matrix.

The report did not execute any benchmark, pilot, repository write, private-data
operation, target change or method promotion.

## 4. Strong contributions

1. **Claims are decomposed by unit.** Static design artifact, normalized runtime
   trace, human review session and evidence-to-disposition record are not
   collapsed into one system score.
2. **Hard gates precede scoring.** Authority, privacy, permission and
   irreversible-action failures remain non-compensable.
3. **Baselines are strong.** B2 strong single Agent and B4 same-workflow
   single-Agent simulation prevent weak-baseline inflation.
4. **Ablation includes burden.** Each component must show defects prevented and
   ceremony/latency/review burden introduced.
5. **Conformance is layered.** Canonicalization, structural validation,
   semantic validation, authority checks, mapping loss, traces, migration and
   rollback are distinct.
6. **Security and benign utility are co-measured.** Prompt injection,
   source laundering, permission inflation, rollback resurrection and
   over-defense are all represented.
7. **Pilot manifests remain non-operational.** Tier-0/1/2 each require separate
   Owner gates and never auto-transition.
8. **Negative evidence is preserved.** Missing, blocked, abandoned,
   contradictory and invalid runs cannot be counted as success.
9. **LLM judges are treated as noisy instruments.** Deterministic checks,
   hidden tests and independent human adjudication remain necessary.
10. **The report keeps Meta-Agent inactive.** Completion is not activation.

## 5. Primary-source spot check

| Claim used by the report | Primary source | Review result | Required scope limit |
|---|---|---|---|
| Homogeneous multi-Agent workflows require a same-workflow strong single-Agent baseline. | *Rethinking the Value of Multi-Agent Workflow: A Strong Single Agent Baseline*, arXiv:2601.12307 | Supported by the paper abstract across seven benchmark families. | 2026 preprint; does not prove all heterogeneous systems lack value. |
| Agent evaluation benefits from multiple interactive environments and failure-mode analysis. | *AgentBench*, arXiv:2308.03688 | Supported: eight environments and long-term reasoning/decision/instruction-following failures. | Benchmark and model set age quickly. |
| Real-world assistant tasks can use held-out answers and tool-use requirements. | *GAIA*, arXiv:2311.12983 | Supported: 466 questions with 300 answers retained for leaderboard use. | Not a Meta-Agent design benchmark. |
| Frequently refreshed, objective-ground-truth benchmarks reduce contamination risk. | *LiveBench*, arXiv:2406.19314 | Supported as a design strategy. | “Contamination-free” is operational, not an absolute guarantee. |
| Joint security and utility evaluation is practical for tool-using Agents. | *AgentDojo*, arXiv:2406.13352 | Supported: 97 tasks and 629 security cases. | Bounded tasks, tools, attacks and defenses. |
| Canonical JSON can stabilize hashing/signing inputs. | RFC 8785, JSON Canonicalization Scheme | Supported. | Informational RFC; canonical bytes do not prove semantic correctness. |
| JSON Schema provides structural assertion/validation mechanisms. | JSON Schema Draft 2020-12 | Supported. | Does not prove runtime, authority or safety semantics. |
| AI RMF is a flexible risk-management framework. | NIST AI 100-1, AI RMF 1.0 | Supported. | Voluntary and use-case agnostic; not target acceptance criteria. |
| LLM judges show position, verbosity and self-enhancement biases while sometimes agreeing with humans. | arXiv:2306.05685 | Supported. | Chat-preference evaluation does not establish design-artifact ground truth. |
| Exact paired-permutation tests exist for a family of structured statistics. | ACL Anthology 2022.naacl-main.360 | Supported. | Applicability and exchangeability/statistical assumptions remain case-specific. |

This is a load-bearing source audit, not experimental reproduction.

## 6. Required corrections

### C1 — Preserve the original input-binding failure

The report must never be summarized as though the seven exact upstream reports
were available during the research run. The original run remains:

```yaml
target_mapping_at_run_time: BLOCKED_PENDING_EXACT_INPUTS
```

The separate binding addendum is reviewer work performed later.

### C2 — Candidate numbers are not policy

The following remain calibration candidates, not accepted values:

- 20 base cases;
- domain caps and 40/40/20 splits;
- repeat/seed counts;
- B0–B7 applicability for every case;
- 244–638 setup hours;
- 174–430 campaign hours;
- quality, non-inferiority, utility, risk and burden thresholds.

### C3 — One baseline matrix, case-specific applicability

B0–B7 is a useful universe of baselines. The protocol must preregister which
baselines apply to each fixture; it must not force irrelevant human,
multi-Agent or backend conditions merely to fill a table.

### C4 — Conformance is property-scoped

Backend comparison may claim only specifically tested normalized properties
under pinned versions, fixtures, budgets and observation rules. It cannot claim
universal behavioral equivalence.

### C5 — Tier manifests do not authorize a pilot

The Tier-0/1/2 documents are templates for a future Owner decision package.
Current status remains:

```yaml
Tier_0_run_authorized: false
Tier_1_run_authorized: false
Tier_2_run_authorized: false
```

### C6 — Offline prototype readiness is specification readiness

The report supports preparing an offline prototype specification for public and
synthetic fixtures. It does not authorize implementation until a task-local
implementation scope, acceptance checks, write boundaries and Owner
authorization exist.

### C7 — Health-review dependency remains external

Applicable non-FABLE health-review findings remain a separately owned blocker.
This report cannot silently clear or waive that dependency.

## 7. Final disposition

```yaml
disposition:
  result: ACCEPT_WITH_CORRECTIONS_AS_NON_EXECUTION_SOURCE_EVIDENCE
  original_run_mapping_status: blocked
  reviewer_binding_addendum: completed
  rerun_required: false

ready_for:
  - repository_evidence_preservation
  - candidate_benchmark_specification
  - offline_prototype_decision_package_preparation
  - Tier_0_decision_package_preparation_after_remaining_gates

not_ready_for:
  - actual_Tier_0_run
  - Tier_1_or_Tier_2
  - real_repository_or_external_write
  - private_material
  - methodology_promotion
  - operational_activation
```
