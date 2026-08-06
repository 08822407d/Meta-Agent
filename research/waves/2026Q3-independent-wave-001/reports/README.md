---
artifact_role: exact_research_report_navigation
status: eight_reports_recorded_and_adjudicated
target_project_id: meta-agent
target_truth_source: false
last_updated_by_task: META-AGENT-PR249-POST-MERGE-HANDOFF-FINALIZATION-001
repair_PR: 249
repair_merge_commit: a096c3ddc24a574f90bd47a76c10af92f8999680
post_merge_finalization_PR: 251
---

# Independent Research Wave Reports

This directory preserves exact operator-exported report bytes for MA-DR-08, MA-DR-10 through MA-DR-15, including MA-DR-09.

## MA-DR-08 and MA-DR-10–15

Use the pre-existing `report-parts-manifest.yaml` entries and `identities/*.yaml`. PR #247 verified 56 transport components and reconstruction for seven reports.

## MA-DR-09 canonical transport

```text
MA-DR-09 exact UTF-8 bytes
-> bzip2 level 9
-> Base64
-> reports/MA-DR-09-report-bz2-base64/part-001.txt ... part-037.txt
```

Read `identities/MA-DR-09.yaml` for order and hashes and `identities/MA-DR-09-post-merge-verification.yaml` for the merge/readback status.

```yaml
original_bytes: 88451
original_sha256: f3a7debd08b3ff8edf89d2fb51492e03a25dfa43168a9014c9f7c1e4319912e9
pre_merge_remote_component_verification: PASS_37_OF_37
PR_249_head_to_merge_commit_changed_files: 0
merge_commit_to_master_changed_files: 0
```

The merged PR #248 path `MA-DR-09-report-parts-base64/` was incomplete and noncanonical and was removed by PR #249.

## Authority boundary

Reports are external non-execution evidence. They do not change target truth, methodology, permissions, pilot status, private-material status, or operational activation.
