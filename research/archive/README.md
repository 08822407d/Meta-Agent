---
target_project_id: meta-agent
artifact_id: META-AGENT-DR-01-05-ARCHIVE-README-001
artifact_role: exact_archive_reconstruction_instructions
status: prepared_for_repository_review
target_runtime_truth_source: false
created_by_task: META-AGENT-RESEARCH-EVIDENCE-REPAIR-003
---

# DR-01–05 Exact Archive Reconstruction

## Physical representation

```yaml
archive_id: META-AGENT-DR-01-05-EVIDENCE-002
logical_members: 10
physical_chunks: 38
chunk_order: lexical_filename_order
normal_chunk_Base64_characters: 2000
last_chunk_Base64_characters: 1172
each_chunk_has_final_LF: true
```

## Reconstruction

From the repository root:

```bash
cat target-projects/meta-agent/research/archive/META-AGENT-DR-01-05-EVIDENCE-002.tar.bz2.base64.chunk-*.txt   | tr -d '\r\n'   | base64 --decode   > /tmp/META-AGENT-DR-01-05-EVIDENCE-002.tar.bz2

bzip2 --decompress --stdout /tmp/META-AGENT-DR-01-05-EVIDENCE-002.tar.bz2   > /tmp/META-AGENT-DR-01-05-EVIDENCE-002.tar

mkdir -p /tmp/meta-agent-dr-01-05
tar -xf /tmp/META-AGENT-DR-01-05-EVIDENCE-002.tar -C /tmp/meta-agent-dr-01-05
```

Verify the tar, bzip2, Base64 and member SHA-256 values against:

```text
target-projects/meta-agent/research/meta/manifest.yaml
```

## Deterministic construction

The logical archive uses:

```yaml
tar_format: GNU
root: meta-agent-dr-01-05/
member_order:
  - prompts_MA_DR_01_through_05
  - reports_MA_DR_01_through_05
mtime: 0
uid: 0
gid: 0
uname: ""
gname: ""
file_mode: "0644"
compression: bzip2_level_9
Base64_wrapping: none_before_2000_character_chunking
physical_chunk_final_LF: true
```

## Authority

The archive is research evidence only. Reconstructing it does not activate Meta-Agent, change target truth, authorize a pilot, or make any research conclusion an approved method.
