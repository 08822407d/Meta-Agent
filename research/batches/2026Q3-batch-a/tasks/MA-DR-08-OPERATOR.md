---
operator_id: MA-DR-08-OPERATOR-001
artifact_role: user_executable_Deep_Research_operator_flow
status: ready_not_executed
research_id: MA-DR-08
---

# MA-DR-08 Operator Guide

## Execution intent

```yaml
execution_disposition: READY_NOT_SELECTED
current_execution_required: false
quota_authorized: false
```

This package prepares MA-DR-08. The user retains the decision to run it.

## When selected

1. Open a fresh ChatGPT Deep Research conversation.
2. Select the current highest-capability Deep Research/Pro option available.
3. Enable public web research.
4. Add read-only access to `08822407d/Mnemosyne`, using execution-time latest `master`.
5. Supply `MA-DR-08-portable-agent-design-ir-and-multi-backend-mapping.md`.
6. Input route:
   - after the Batch-A repository package is merged, require the run to read both complete ordered report-part folders, `reports/README.md`, `report-parts-manifest.yaml`, the cross-report adjudication and the candidate-change ledger;
   - if the repository package is not merged or the connector cannot reliably read all parts, attach the two complete Markdown report exports plus the cross-report adjudication and candidate-change ledger directly.
7. Before research starts, require a receipt showing:
   - `research_id: MA-DR-08`;
   - exact title;
   - actual repository ref;
   - mandatory paths and every ordered report part actually readable;
   - no repository write or target activation.
8. Review the proposed research plan. Stop if it collapses the task into a generic framework comparison.
9. Run the research.
10. Export the one complete canonical report as Markdown, suggested filename `MA-DR-08-report.md`.
11. Return it to the dedicated Meta-Agent conversation with:
    - visible surface/mode;
    - actual repository ref;
    - access failures;
    - plan modifications;
    - truncation/source warnings.

## Stop conditions

```yaml
stop_conditions:
  - wrong_research_ID_or_topic
  - mandatory_Batch_A_inputs_missing_without_disclosure
  - generic_vendor_framework_list_instead_of_IR_semantics
  - no_portable_source_table
  - repository_write_or_target_activation_requested
  - backend_equivalence_claimed_without_loss_analysis
```
