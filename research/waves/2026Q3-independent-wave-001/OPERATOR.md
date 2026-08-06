---
operator_id: META-AGENT-INDEPENDENT-RESEARCH-WAVE-001-OPERATOR
artifact_role: user_executable_parallel_Deep_Research_operator_flow
status: ready_not_executed
prepared_against_repository: 08822407d/Mnemosyne
prepared_against_master: 0865f334177e2ff0d81a3652ea9e3384e55f4259
---

# Meta-Agent Independent Research Wave — Operator Guide

## Execution intent

```yaml
execution_disposition: READY_NOT_SELECTED
current_execution_required: false
quota_authorized: false
parallel_execution_supported: true
tasks:
  - MA-DR-08
  - MA-DR-10
  - MA-DR-11
  - MA-DR-12
  - MA-DR-13
  - MA-DR-14
  - MA-DR-15
```

This package prepares seven independent research tasks. It does not request
that they be launched in the current response.

## Canonical task paths

```text
MA-DR-08:
  target-projects/meta-agent/research/batches/2026Q3-batch-a/tasks/MA-DR-08-portable-agent-design-ir-and-multi-backend-mapping.md
MA-DR-10:
  target-projects/meta-agent/research/waves/2026Q3-independent-wave-001/tasks/MA-DR-10-requirements-to-agent-workflow-design-synthesis-and-review-methodology.md
MA-DR-11:
  target-projects/meta-agent/research/waves/2026Q3-independent-wave-001/tasks/MA-DR-11-methodology-promotion-evidence-generalization-and-cross-project-learning-governance.md
MA-DR-12:
  target-projects/meta-agent/research/waves/2026Q3-independent-wave-001/tasks/MA-DR-12-dynamic-delegation-managed-autonomy-and-human-approval-policy.md
MA-DR-13:
  target-projects/meta-agent/research/waves/2026Q3-independent-wave-001/tasks/MA-DR-13-long-term-product-surface-repository-topology-and-operational-architecture.md
MA-DR-14:
  target-projects/meta-agent/research/waves/2026Q3-independent-wave-001/tasks/MA-DR-14-private-target-material-storage-access-control-and-data-governance.md
MA-DR-15:
  target-projects/meta-agent/research/waves/2026Q3-independent-wave-001/tasks/MA-DR-15-capability-matrix-provider-tool-routing-freshness-and-fallback-governance.md
```

Do not use a copied sibling report or a non-canonical task export when the
canonical repository task is readable.

## When the Owner selects execution

Run each selected task in a **separate fresh ChatGPT Deep Research
conversation**.

For every task:

1. Select the current highest-capability Deep Research/Pro option available.
2. Enable public web research.
3. Add read-only access to `08822407d/Mnemosyne` using execution-time latest `master`.
4. Supply exactly one task file.
5. Do not attach or paste reports from sibling tasks in this wave.
6. Before starting, require the following receipt:

```yaml
research_id:
research_title:
target_project: Meta-Agent
actual_repository_ref:
mandatory_paths_read: []
mandatory_paths_unavailable: []
sibling_wave_reports_used_as_input: false
repository_write_or_activation_requested: false
```

7. Review the product-generated research plan. Stop if it:
   - changes the research ID or topic;
   - makes another wave report a prerequisite;
   - collapses the task into a generic vendor/framework list;
   - omits the required portable source table;
   - requests repository write or operational activation.
8. Run the research.
9. Export one complete canonical Markdown report named `<research_id>-report.md`.
10. Return the report to the dedicated Meta-Agent conversation with:
    - visible surface/mode;
    - actual repository ref;
    - access failures;
    - plan modifications;
    - truncation, missing-image, or source-portability warnings.

## Parallelism rule

All seven tasks may run concurrently. Their prompts were designed not to depend
on one another. Do not rewrite a task because another report finishes first.

## Failure handling

Return one of:

```yaml
- COMPLETE_CANONICAL_REPORT
- INPUT_BINDING_FAILURE_WITH_EXTERNAL_LANDSCAPE_ONLY
- WRONG_TOPIC_OR_ID
- TRUNCATED_OR_INCOMPLETE_REPORT
- SOURCE_PORTABILITY_FAILURE
- CLEAN_RERUN_REQUIRED
```

Do not compensate for missing repository inputs by claiming they were read.
