---
target_project_id: meta-agent
artifact_id: META-AGENT-DR-01-05-GAP-ANALYSIS-001
artifact_role: target_specific_research_gap_analysis
status: review_candidate_non_execution_source
target_runtime_truth_source: false
created_by_task: META-AGENT-RESEARCH-EVIDENCE-REPAIR-003
---

# Meta-Agent DR-01–05 Gap Analysis v0.1

## 1. Overall assessment

The first five reports are a strong landscape and governance baseline. They should be preserved and synthesized, not rerun wholesale merely because a stronger model is available.

The major omissions concern the distinctive product core of Meta-Agent: how it constructs, searches, compares, validates and safely improves designs for other Agents and workflows.

## 2. P0 research gaps

### P0-1 — Automated Agentic System Design and robust workflow search

The reports discuss frameworks and topology choice, but barely examine systems that automatically or semi-automatically invent Agent architectures.

Relevant primary research includes:

- Automated Design of Agentic Systems / Meta Agent Search — https://arxiv.org/abs/2408.08435
- AFlow: Automating Agentic Workflow Generation — https://arxiv.org/abs/2410.10762
- RobustFlow: Towards Robust Agentic Workflow Generation — https://arxiv.org/abs/2509.21834
- Rethinking the Value of Multi-Agent Workflow: A Strong Single Agent Baseline — https://arxiv.org/abs/2601.12307

Research questions:

- What is the design/search space?
- Which objectives include quality, cost, latency, robustness, permissions, human burden and learning value?
- How is benchmark overfitting prevented?
- How stable is a generated architecture under paraphrase and equivalent requirements?
- When should automated search be rejected in favour of a simple template or strong single-Agent baseline?
- How well do designs transfer across domains, models and tools?
- What human approval and stop rules bound the search?

### P0-2 — Meta-Agent-specific benchmark, baselines and ablation

Generic Agent evaluation is insufficient. Meta-Agent must be compared with:

- fixed human-authored template;
- strong single-Agent design baseline;
- explicit workflow baseline;
- Meta-Agent-selected design;
- homogeneous multi-Agent design;
- genuinely heterogeneous design;
- human expert design where available.

Measures should include:

- task outcome;
- cost and latency;
- coordination and handoff burden;
- human review/rework;
- permission and authority correctness;
- evidence completeness and false-success rate;
- robustness to paraphrase and underspecification;
- cross-domain transfer;
- user learning-value preservation.

Ablation should remove memory design, routing, review and feedback-promotion gates separately.

### P0-3 — Portable Agent Design intermediate representation

The product goal requires tasks, roles and acceptance criteria to outlive individual providers. The reports do not define a portable design object.

Relevant primary research:

- AgentSPEX: An Agent SPecification and EXecution Language — https://arxiv.org/abs/2604.13346

A candidate design IR would need to express:

- purpose and role graph;
- input/output contracts;
- workflow graph, branches, loops and parallelism;
- state and memory roles;
- capability requirements;
- tools, permissions and trust boundaries;
- approval and escalation;
- observability and evaluation hooks;
- runtime/deployment constraints;
- backend mapping and capability-loss declarations.

The research should compare approaches without prematurely adopting one DSL.

### P0-4 — Meta-level security and adversarial evaluation

A system that designs other systems has a wider blast radius than one task Agent.

Relevant primary research:

- AgentDyn — https://arxiv.org/abs/2602.03117
- MemMorph — https://arxiv.org/abs/2605.26154
- Securing LLM-Agent Long-Term Memory Against Poisoning — https://arxiv.org/abs/2606.24322

Threats include:

- poisoned target requirements;
- indirect prompt injection in research/repository material;
- memory poisoning and origin laundering;
- malicious project feedback that attempts methodology promotion;
- capability-matrix tampering;
- tool/MCP-description supply-chain attacks;
- generated over-privileged designs;
- confused-deputy and cross-Agent authority escalation;
- project-specific data leaking into general methodology;
- unsafe design propagation across future projects.

The output should be a Meta-Agent-specific threat model, adversarial suite, safe defaults, stop conditions and residual-risk register.

## 3. P1 gaps

### P1-1 — Evidence threshold for methodology promotion

The current gated pipeline is necessary but not sufficient. It needs rules for:

- competing explanations and confounders;
- contradictory/negative cases;
- cross-project replication;
- minimum evidence diversity;
- applicability conditions and counterexamples;
- rejection, retirement and reopening;
- publication-bias prevention.

This is better calibrated through case evidence than broad literature alone.

### P1-2 — Dynamic delegation and managed autonomy

Human boundaries remain mostly qualitative. Future design should consider uncertainty, reversibility, loss magnitude, evidence quality, human burden and historical performance when deciding to continue, gather evidence, downgrade, stop or escalate.

### P1-3 — Learning-value preservation

The product requirement to preserve the user's learning opportunities is accepted, but measurement is missing. Candidate measures include independent transfer, delayed retention, reasoning ownership, dependency, maintenance burden and scaffolding/fading.

This overlaps with separately owned learner/adaptive-explanation work and must not be silently imported.

### P1-4 — Administrative burden and proportionality

Pilots should measure artifact creation/review time, duplicated entry, stale-state incidence, verification cost, next-tier rework and whether the current file/gate structure is proportionate.

### P1-5 — Cross-domain transfer

At least three structurally different cases should be used:

- software development;
- learning/tutoring;
- research or personal knowledge work.

The goal is to identify general methods, domain adapters and non-transferable practices.

## 4. Work that should be experimental rather than another broad report

- exact single-to-multi-Agent thresholds;
- whether SQLite is needed;
- exact number of memory layers;
- rubric weights and test-set size;
- current seven-file burden;
- approval-point density.

Literature can suggest candidates. Meta-Agent-specific experiments must decide them.

## 5. Recommended staged program

```yaml
Batch_A:
  parallel:
    - MA-DR-06_automated_Agentic_system_design_and_robust_workflow_search
    - MA-DR-07_Meta_Agent_security_threat_model_and_adversarial_evaluation
  execution_authority: Owner_required
  research_surface_and_quota: Owner_selected

Batch_B_after_A_adjudication:
  - MA-DR-08_portable_Agent_Design_IR_and_multi_backend_mapping
  - MA-DR-09_Meta_Agent_benchmark_ablation_and_bounded_pilot_protocol
```

## 6. v0.1 implication

No evidence here requires rollback of the current v0.1 baseline. The gaps prevent broad claims of proven architecture optimization, secure autonomous self-improvement, portable compilation or production readiness.

Candidate additions remain non-authoritative until separately reviewed and accepted.
