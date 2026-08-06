---
research_id: MA-DR-09
title: Meta-Agent Benchmark, Ablation, Conformance, and Bounded-Pilot Protocol
artifact_role: ready_to_run_Deep_Research_task
status: ready_not_selected
target_project_id: meta-agent
target_truth_source: false
research_execution_authority: user_retained
current_execution_requested: false
current_execution_required: false
quota_authorized: false
required_output: one_complete_canonical_report
report_language: Chinese_with_English_technical_terms_and_source_titles_preserved
---

# MA-DR-09 — Meta-Agent Benchmark、Ablation、Conformance 与 Bounded-Pilot Protocol

## 0. Identity and authority contract

Open the report with:

```yaml
research_id: MA-DR-09
research_title: Meta-Agent Benchmark, Ablation, Conformance, and Bounded-Pilot Protocol
target_project: Meta-Agent
report_role: external_research_evidence_non_execution_source
```

Produce one complete, structured, source-portable canonical report. This task
designs an evaluation and pilot protocol; it does not run a pilot, implement an
IR, modify GitHub, issue target IDs, authorize private material, or activate
Meta-Agent.

## 1. Frozen project context

Meta-Agent v0.1 is an Owner-accepted but operationally inactive design and
governance baseline. Independent-wave research has supplied candidate inputs:

- MA-DR-08: candidate IR, backend mapping, semantic loss and conformance;
- MA-DR-10: Frame-to-Design dossier method and strong baselines;
- MA-DR-11: evidence generalization and methodology-promotion governance;
- MA-DR-12: delegation, abstention, approval and human-workload metrics;
- MA-DR-13: product surfaces, authority core, recovery and migration profiles;
- MA-DR-14: no-private-data default and synthetic privacy/security profiles;
- MA-DR-15: capability claims, freshness, routing and explicit fallback loss.

These are non-execution research inputs. None is target truth.

## 2. Decisions this research may inform

1. What Meta-Agent claims are actually testable now.
2. What benchmark cases and strong baselines are needed.
3. How to test the candidate IR and backend mappings.
4. Which components add value through ablation.
5. How to measure quality, security, robustness, cost, human burden and learning.
6. What bounded, public/synthetic pilot tiers are defensible.
7. What evidence would justify candidate promotion, revision, rejection or continued deferral.
8. What must remain Owner-only or untested.

It cannot make those Owner decisions.

## 3. Mandatory repository inputs

Read the execution-time latest `master` of `08822407d/Mnemosyne` and record the actual commit/ref. At minimum read:

```text
target-projects/meta-agent/current/approved-spec.md
target-projects/meta-agent/current/active-context.md
target-projects/meta-agent/authority/source-and-owner-map.md
target-projects/meta-agent/methodology/core-methodology.md
target-projects/meta-agent/history/decision-version-and-migration-log.md
target-projects/meta-agent/cases/case-and-feedback-ledger.md

target-projects/meta-agent/research/batches/2026Q3-batch-a/reviews/MA-DR-06-07-cross-report-adjudication.md
target-projects/meta-agent/research/batches/2026Q3-batch-a/candidates/Batch-A-candidate-change-ledger.md

target-projects/meta-agent/research/waves/2026Q3-independent-wave-001/
```

The operator should also supply or expose the seven exact reports and the formal adjudication/convergence package if they are not yet on `master`.

If any mandatory input is missing, clearly separate external benchmark landscape from blocked Meta-Agent-specific protocol design.

## 4. Research questions

### RQ1 — Evaluation claims and units

Define precisely what is being evaluated:

- requirement framing;
- design synthesis;
- design representation/IR;
- backend mapping;
- delegation and approval policy;
- model/tool routing;
- architecture/product surface;
- private-data boundary handling;
- case/generalization governance;
- end-to-end design assistance.

Separate design quality, runtime behavior, process quality, human outcome and governance correctness. Define unit of analysis, estimand, observation window and evidence needed for every claim.

### RQ2 — Case taxonomy and benchmark suite

Design a public/synthetic case suite spanning at least:

- software development;
- source-code learning;
- learning-system design;
- long-term research;
- personal long conversation/context migration;
- single specialized Agent;
- deterministic workflow;
- justified multi-Agent/team candidate;
- ambiguous/conflicting requirements;
- stale capability facts;
- malicious or poisoned evidence;
- private-material request that must remain blocked;
- provider/tool outage and degraded mode;
- migration/rollback and anti-resurrection.

Include easy, medium, hard, benign, ambiguous and adversarial cases. Prevent the software-engineering majority from becoming the whole benchmark.

### RQ3 — Strong baselines

The protocol must compare, where applicable:

```text
B0 fixed template or manual checklist
B1 direct Agent
B2 strong single Agent
B3 deterministic workflow with bounded Agent steps
B4 same-workflow single-Agent simulation
B5 human-authored design
B6 homogeneous multi-Agent design
B7 genuinely heterogeneous design
```

Do not weaken baselines to make Meta-Agent look better. Define fairness rules, shared information, budgets, tools, time, retries, evaluator access and human support.

### RQ4 — Candidate IR and conformance

Using the adjudicated MA-DR-08 candidate, define tests for:

- canonical serialization and normalization;
- structural and semantic validation;
- reference resolution;
- semantic diff;
- authority and permission invariants;
- workflow reachability, loops, retries and termination;
- state/memory lifecycle;
- provenance and allowed influence;
- backend capability binding;
- unsupported/degraded semantics;
- generated artifact identity;
- runtime trace normalization;
- rollback/tombstone/clean rebuild.

Compare at least three materially different backend styles. Do not claim universal behavioral equivalence.

### RQ5 — Ablation program

Design ablations for the marginal value and burden of:

- Frame-to-Design dossier;
- typed IR versus structured Markdown;
- strong baseline generation;
- traceability and rationale;
- hard authority/security gates;
- delegation ladder and verification policy;
- capability-claim registry and freshness checks;
- explicit fallback guarantee delta;
- provenance/allowed-influence fields;
- promotion quarantine and negative-case ledger;
- derived index/search;
- independent verifier;
- human approval placement.

Include component-removal, component-replacement, lighter-profile and interaction ablations. Measure added ceremony as well as defects prevented.

### RQ6 — Metrics

At minimum include:

**Outcome and design**
- requirement coverage and defects;
- design coherence and orphan responsibilities;
- baseline superiority;
- false-success rate;
- reviewer disagreement;
- maintainability and portability.

**Robustness**
- paraphrase/noise/conflict stability;
- model/tool/provider drift;
- context truncation;
- fresh-session reconstruction;
- cross-domain transfer.

**Authority and security**
- unauthorized action;
- permission inflation;
- source laundering;
- memory/feedback poisoning;
- judge/evaluator manipulation;
- private-data boundary violations;
- rollback resurrection;
- over-defense and benign utility.

**Operations**
- cost, latency, retries, fallback frequency;
- success-adjusted cost;
- recovery time;
- administrative burden;
- artifact count and stale-record incidents.

**Human**
- review time and rework;
- false proceed / false escalate / missed escalation;
- appropriate reliance;
- comprehension;
- learning-value preservation;
- decision ownership.

Keep raw dimensions visible. Do not collapse authority or privacy into a compensable total score.

### RQ7 — Statistical and reproducibility protocol

Research appropriate methods for small-N, repeated, heterogeneous evaluation:

- pre-registration or prospective case registration;
- multiple seeds/runs where stochasticity matters;
- confidence/credible intervals where assumptions permit;
- paired comparisons;
- hierarchical or mixed-effects models where data support them;
- qualitative process tracing and competing explanations;
- missing/blocked/abandoned outcomes;
- correction for multiple comparisons;
- hidden tests and contamination controls;
- versioned fixtures, prompts, tools and source snapshots;
- reproducibility bundles and exact report identity.

Do not invent universal sample-size or significance thresholds. State which parameters need pilot calibration.

### RQ8 — Risk-tiered bounded-pilot protocol

Develop at least three non-operational pilot tiers:

```yaml
Tier_0_design_only:
  data: public_or_synthetic
  tools: none_or_read_only
  external_writes: none

Tier_1_bounded_read_and_local_validation:
  data: public_or_synthetic
  tools: allowlisted_read_only_and_local_mechanical
  external_writes: none

Tier_2_isolated_synthetic_reversible_write:
  data: synthetic_only
  environment: disposable_sandbox
  writes: exact_allowlisted_reversible
  external_real_system: prohibited
```

For each define entry criteria, exact scope, acceptance, stop, rollback, incident handling, human gates, evidence capture, expiry and prohibited actions.

Do not design a real private-data or production-write pilot.

### RQ9 — Methodology-promotion evidence

Define how benchmark/pilot evidence enters the case ledger:

- target-specific lesson;
- scoped candidate;
- conditionally accepted candidate;
- no promotion;
- narrowing;
- rejection;
- retirement/reopening.

Require contradictory and negative evidence, confounders, scope conditions, review burden and Owner decision. Benchmark gain alone cannot promote a method.

### RQ10 — Decision and exit gates

Produce explicit gates for:

- proceed to synthetic prototype;
- revise candidate spec;
- bounded addendum;
- repeat evaluation;
- defer;
- reject;
- prepare an Owner decision package;
- remain inactive.

## 5. Mandatory outputs

1. Evaluation claim map.
2. Case taxonomy and public/synthetic benchmark manifest.
3. Strong-baseline fairness contract.
4. IR/backend conformance suite.
5. Ablation matrix.
6. Metric definitions and evidence schema.
7. Statistical/reproducibility plan.
8. Adversarial/security suite.
9. Human-burden and learning-value protocol.
10. Tier-0/1/2 bounded-pilot manifests.
11. Stop, rollback, incident and anti-resurrection rules.
12. Case-ledger and methodology-promotion mapping.
13. Administrative-cost estimate with uncertainty.
14. Open Owner decisions.
15. Portable source table.
16. Final disposition matrix:

```yaml
ready_for_offline_prototype: []
ready_for_Tier_0: []
requires_addendum_or_revision: []
requires_more_evidence: []
defer: []
reject_or_prohibit: []
Owner_decisions: []
```

## 6. Evidence standards

Prioritize primary benchmark/evaluation papers, official standards/specs, official test suites and repositories, reproducible code/data, and high-quality negative findings. Current platform facts must be freshness-checked.

Distinguish:

```text
VERIFIED_PRIMARY_EVIDENCE
OFFICIAL_SPECIFICATION_OR_DOCUMENTATION_FACT
MULTI_SOURCE_PATTERN
TARGET_SPECIFIC_INFERENCE
RECOMMENDATION
UNRESOLVED
```

Include direct URLs/DOIs/arXiv IDs and limitations.

## 7. Prohibited conclusions/actions

Do not:

- run a pilot or experiment;
- modify GitHub;
- activate Meta-Agent;
- use private material;
- authorize real external writes;
- issue stable target IDs;
- promote a method;
- use one opaque aggregate score as the acceptance authority;
- treat LLM judge agreement as independent ground truth;
- weaken strong baselines;
- infer hidden backend identity;
- select a permanent provider, framework, database or product surface;
- claim universal backend equivalence;
- turn report completion into pilot authorization.

## 8. Completion criterion

The report is complete only if the Owner can decide, without inventing missing details, which candidate components are ready for offline implementation, which bounded synthetic pilot tier is defensible, what evidence is still missing, and what remains prohibited.
