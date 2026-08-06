---
artifact_id: META-AGENT-BATCH-A-REPORT-PARTS-README-001
artifact_role: exact_report_reconstruction_and_reading_instructions
status: repository_recording_pending_human_merge
target_project_id: meta-agent
target_truth_source: false
---

# MA-DR-06 / MA-DR-07 Exact Report Parts

## Storage model

The two complete operator-exported Markdown reports are preserved as ordered, UTF-8-valid Markdown parts to keep each repository write small and independently verifiable.

```yaml
MA_DR_06:
  original_filename: MA-DR-06-report.md
  original_bytes: 52711
  original_sha256: a02278ae871a2cf5b7716df52b0b8f4631dc2557d265ab8846af379349cc1452
  part_count: 6

MA_DR_07:
  original_filename: MA-DR-07-report.md
  original_bytes: 72539
  original_sha256: 264ac917af37ce77e605790bb8dbe2ef2ad25a65d418c9475af11c9519f794a0
  part_count: 8
```

Each part ends exactly where the original report was split at a line boundary. No separator is added during reconstruction.

## Reading

A human or Agent may read each report in lexical filename order:

```text
MA-DR-06-report-parts/MA-DR-06-report.part-001-of-006.md
...
MA-DR-06-report-parts/MA-DR-06-report.part-006-of-006.md

MA-DR-07-report-parts/MA-DR-07-report.part-001-of-008.md
...
MA-DR-07-report-parts/MA-DR-07-report.part-008-of-008.md
```

Do not start target-specific adjudication after reading only a subset. The intake reviews and cross-report adjudication remain separate derived artifacts.

## Exact reconstruction

From this directory:

```bash
cat MA-DR-06-report-parts/MA-DR-06-report.part-*.md > MA-DR-06-report.md
cat MA-DR-07-report-parts/MA-DR-07-report.part-*.md > MA-DR-07-report.md

sha256sum MA-DR-06-report.md MA-DR-07-report.md
```

Expected SHA-256 values:

```text
a02278ae871a2cf5b7716df52b0b8f4631dc2557d265ab8846af379349cc1452  MA-DR-06-report.md
264ac917af37ce77e605790bb8dbe2ef2ad25a65d418c9475af11c9519f794a0  MA-DR-07-report.md
```

`report-parts-manifest.yaml` records every part's byte count and SHA-256.

## Authority boundary

The parts are report originals/exports and non-execution-source evidence. Their storage format does not promote their claims, recommendations, local IDs or candidate schemas into Meta-Agent target truth or methodology.
