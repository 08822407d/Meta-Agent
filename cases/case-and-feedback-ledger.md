---
target_project_id: meta-agent
artifact_id: META-AGENT-V0.1-CASE-FEEDBACK-LEDGER-001
artifact_role: case_feedback_evidence_and_candidate_ledger
status: initialized_empty_pending_owner_acceptance
authority_level: evidence_and_candidate_only
target_runtime_truth_source: false
created_by_task: MNEMOSYNE-171
schema_version: 0.1.0
source_refs:
  - target-projects/meta-agent/current/approved-spec.md
  - target-projects/meta-agent/methodology/core-methodology.md
known_limits:
  - no_real_cases_or_feedback_ingested
  - public_workspace_excludes_private_case_material
---

# Meta-Agent Case and Feedback Ledger v0.1

## 1. Bootstrap state

```yaml
ledger_state:
  real_case_entries: []
  feedback_entries: []
  approved_methodology_promotions: []
  fabricated_or_reconstructed_cases: prohibited
```

The bootstrap build contains **no real case** and no claim that previous Mnemosyne work is a Meta-Agent production case. New entries require task-local authorization and material-safety review.

## 2. Case record schema

```yaml
case_record:
  case_id: MA-CASE-NNNN
  status: proposed | active | completed | reviewed | archived | rejected
  target_or_project_scope:
  user_goal:
  problem_frame_ref:
  requirement_refs: []
  method_refs: []
  design_output_refs: []
  product_surface_and_visible_selection:
  backend_status: unknown_or_not_attestable
  tools_and_permissions:
  authority_and_truth_source:
  material_sensitivity_and_storage_route:
  result_summary:
  acceptance_criteria:
  observed_evidence_refs: []
  producer_claims: []
  verifier_findings: []
  limitations_and_confounds: []
  target_specific_lessons: []
  generalization_status: not_reviewed | target_specific | candidate_general | rejected
  redaction_or_external_pointer_refs: []
  owner_disposition_ref:
```

## 3. Feedback record schema

```yaml
feedback_record:
  feedback_id: MA-FEEDBACK-NNNN
  case_ref:
  source_actor_or_artifact:
  observed_at:
  feedback_type: defect | friction | success | preference | safety | capability | evaluation | other
  observation:
  interpretation_candidates: []
  evidence_refs: []
  scope:
  severity:
  confidence: qualitative_with_rationale
  contradictory_evidence_refs: []
  review_status: new | triaged | needs_more_evidence | reviewed | rejected | promoted_candidate
  lesson_candidates:
    - statement:
      target_specificity:
      evidence_strength:
      risks_and_counterexamples:
  candidate_method_change_ref:
  owner_decision_ref:
```

## 4. Promotion gate

```text
MA-FEEDBACK observation
  -> evidence and source review
  -> competing explanations and target scope
  -> lesson candidate
  -> candidate change to an existing MA-METHOD or proposed new method
  -> impact, version and regression/semantic review
  -> explicit user decision
  -> approved methodology update
```

Required before promotion:

- evidence-bearing feedback;
- clear target/project scope;
- contradictory and negative evidence retained;
- reason the finding is not merely model-, tool-, provider- or project-specific;
- privacy and redaction review;
- candidate method delta and affected requirement/method IDs;
- acceptance criteria;
- rollback/revision plan;
- user confirmation.

## 5. Prohibited promotion behavior

- no automatic global method update;
- no inference from a single fluent or successful interaction;
- no conversion of a user preference into a universal rule;
- no promotion of sensitive target details into shared methodology;
- no deletion of failed or contradictory cases to improve apparent success;
- no use of a newer model's summary as proof that the older record is wrong;
- no self-approval by the Agent that produced the design.

## 6. Case and feedback write boundary

A write requires:

```yaml
case_feedback_write_context:
  task_id:
  exact_case_or_feedback_scope:
  user_authorization_ref:
  material_preflight_ref:
  allowed_paths:
    - target-projects/meta-agent/cases/case-and-feedback-ledger.md
  prohibited:
    - target_truth_change_without_separate_authorization
    - private_payload_in_public_Git
    - automatic_methodology_promotion
```

Large, private or raw case material remains outside Git or is represented by an approved safe pointer/redacted excerpt.

## 7. Evaluation linkage

Case evaluations may issue `MA-EVAL-*` IDs in a later approved revision. v0.1 defines the prefix but issues no evaluation object.

```yaml
evaluation_linkage:
  issued_MA_EVAL_IDs: []
  future_minimum:
    - case_ref
    - criteria_fixed_before_review
    - evidence_refs
    - result_semantics
    - limitations
    - reviewer_relation_to_producer
    - owner_disposition
```

## 8. Current safe next action

Do not add a real case until the Meta-Agent v0.1 package is operationally accepted and a specific public/synthetic/redacted case scope is authorized.
