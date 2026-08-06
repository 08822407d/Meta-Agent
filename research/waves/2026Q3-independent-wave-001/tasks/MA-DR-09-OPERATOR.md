---
operator_id: MA-DR-09-OPERATOR-001
artifact_role: user_executable_Deep_Research_operator_guide
status: ready_not_selected
quota_authorized: false
---

# MA-DR-09 Operator Guide

## Prepared execution intent

```yaml
execution_disposition: READY_NOT_SELECTED
current_execution_requested: false
current_execution_required: false
quota_authorized: false
```

This guide records the preparation state of the task. A later external run may
be selected by the Owner without changing the authority of this artifact.

## When the Owner selects RUN

1. Start a fresh ChatGPT Deep Research conversation.
2. Select the highest-capability current Pro/Deep Research option.
3. Enable public web research.
4. Provide read-only access to `08822407d/Mnemosyne` at execution-time latest `master`.
5. Provide the MA-DR-09 task file as the research request.
6. Ensure the seven reports and formal convergence package are available either on `master` or as explicit attachments.
7. Before research begins, require this receipt:

```yaml
research_id: MA-DR-09
research_title: Meta-Agent Benchmark, Ablation, Conformance, and Bounded-Pilot Protocol
target_project: Meta-Agent
actual_repository_ref:
mandatory_paths_read: []
mandatory_paths_unavailable: []
seven_report_inputs_available:
repository_write_or_pilot_execution_requested: false
```

8. Stop if the plan:
   - changes the topic to generic model benchmarking;
   - proposes to run a real pilot;
   - omits strong baselines, ablation, IR conformance, human burden or security;
   - requests private data or real writes;
   - treats another report as target truth.
9. Export one complete Markdown report named `MA-DR-09-report.md`.
10. Return it to the dedicated Meta-Agent conversation with the actual ref, access failures, plan modifications and source-portability warnings.

## Current post-run note

As of the repository-recording task, the Owner has reported that an external
MA-DR-09 run completed and returned a report. That report is not accepted or
recorded by this task and requires a separate formal intake. Do not launch a
duplicate run unless a later adjudication explicitly requires it.
