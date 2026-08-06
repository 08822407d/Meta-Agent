#!/usr/bin/env bash
set -euo pipefail

SOURCE_REPOSITORY="08822407d/Mnemosyne"
SOURCE_COMMIT="8ef1c43b18b8686a30ffef544ca8b32fce1ca6cb"
SOURCE_ROOT="target-projects/meta-agent"
EXPECTED_FILE_COUNT="226"
DESTINATION_REPOSITORY="08822407d/Meta-Agent"
BASE_BRANCH="master"
SHADOW_BRANCH="meta-agent-shadow-migration-001"

fail() {
  echo "BLOCKED: $*" >&2
  exit 1
}

command -v git >/dev/null || fail "未找到 git"
command -v gh >/dev/null || fail "未找到 gh CLI"

repo_root="$(git rev-parse --show-toplevel 2>/dev/null)" || fail "当前目录不在 Git 仓库中"
cd "$repo_root"

origin_url="$(git remote get-url origin)"
case "$origin_url" in
  *08822407d/Meta-Agent*) ;;
  *) fail "当前 checkout 不是 08822407d/Meta-Agent：$origin_url" ;;
esac

if [[ -n "$(git status --porcelain)" ]]; then
  fail "工作区不是干净状态"
fi

current_branch="$(git branch --show-current)"
if [[ "$current_branch" != "$BASE_BRANCH" ]]; then
  fail "必须从 $BASE_BRANCH 开始，当前为 $current_branch"
fi

git fetch origin "$BASE_BRANCH"
git merge --ff-only "origin/$BASE_BRANCH"

if git ls-remote --exit-code --heads origin "$SHADOW_BRANCH" >/dev/null 2>&1; then
  fail "远端已存在 $SHADOW_BRANCH，拒绝创建重复迁移分支"
fi

existing_pr="$(gh pr list --repo "$DESTINATION_REPOSITORY" --state open --head "$SHADOW_BRANCH" --json number --jq '.[0].number // empty')"
if [[ -n "$existing_pr" ]]; then
  fail "已经存在使用 $SHADOW_BRANCH 的 open PR #$existing_pr"
fi

work_dir="$(mktemp -d)"
trap 'rm -rf "$work_dir"' EXIT
source_checkout="$work_dir/mnemosyne"
payload_dir="$work_dir/payload"
mkdir -p "$payload_dir"

echo "[1/8] 获取固定源快照"
git clone --filter=blob:none --no-checkout "https://github.com/${SOURCE_REPOSITORY}.git" "$source_checkout"
git -C "$source_checkout" checkout --detach "$SOURCE_COMMIT"

[[ -d "$source_checkout/$SOURCE_ROOT" ]] || fail "固定源目录不存在"
cp -a "$source_checkout/$SOURCE_ROOT/." "$payload_dir/"

source_count="$(find "$payload_dir" -type f | wc -l | tr -d ' ')"
[[ "$source_count" == "$EXPECTED_FILE_COUNT" ]] || fail "复制前文件数为 $source_count，预期为 $EXPECTED_FILE_COUNT"

ls_tree_count="$(git -C "$source_checkout" ls-tree -r --name-only "$SOURCE_COMMIT" -- "$SOURCE_ROOT/" | wc -l | tr -d ' ')"
[[ "$ls_tree_count" == "$EXPECTED_FILE_COUNT" ]] || fail "Git tree 文件数为 $ls_tree_count，预期为 $EXPECTED_FILE_COUNT"

source_subtree_sha="$(git -C "$source_checkout" rev-parse "$SOURCE_COMMIT:$SOURCE_ROOT")"
[[ "$source_subtree_sha" == "4c1cd341777d46b3d6794abc62682e9c915ec46a" ]] || fail "源子树 SHA 不匹配：$source_subtree_sha"

echo "[2/8] 建立唯一 shadow 分支"
git checkout -b "$SHADOW_BRANCH"
cp -a "$payload_dir/." ./
mkdir -p current handoff migration

echo "[3/8] 仅重新生成目标仓库当前导航与 handoff"
cat > current/active-context.md <<'EOF'
---
target_project_id: meta-agent
artifact_id: META-AGENT-V0.1-ACTIVE-CONTEXT-001
artifact_role: non_execution_current_state
status: dedicated_repository_shadow_import_ready_for_review
authority_level: operational_support
target_runtime_truth_source: false
last_updated_by_task: META-AGENT-DEDICATED-REPOSITORY-SHADOW-IMPORT-001
design_version: 0.1.0
---

# Meta-Agent Active Context — Dedicated Repository Shadow Import

```yaml
route: META_AGENT_PRODUCT_BUILD
phase: dedicated_repository_shadow_import_review
owner_disposition: ACCEPT_WITH_LIMITATIONS

source_authority:
  repository: 08822407d/Mnemosyne
  commit: 8ef1c43b18b8686a30ffef544ca8b32fce1ca6cb
  target_truth_path: target-projects/meta-agent/current/approved-spec.md
  remains_authoritative_until_explicit_cutover: true

destination_shadow:
  repository: 08822407d/Meta-Agent
  branch: meta-agent-shadow-migration-001
  target_truth_path_candidate: current/approved-spec.md
  authoritative: false
  active_writer: false
  effective_for_operational_use: false

migration_payload:
  source_root: target-projects/meta-agent/
  base_files_imported: 226
  byte_exact_files: 224
  transformed_live_navigation:
    - current/active-context.md
    - handoff/handoff-current.md
  path_mapping: project_root_flattening

initial_memory_system_foundation:
  status: deferred_until_after_migration_and_destination_only_recovery
  adopted_by_this_import: false

pilot_authorized: false
private_material_authorized: false
RAG_authorized: false
MCP_authorized: false
automation_authorized: false
operational_activation_authorized: false
```

## Completed

- The frozen 226-file Meta-Agent source snapshot has been copied into the dedicated repository on one non-authoritative shadow branch.
- Existing target truth, authority, methodology, case/feedback ledger, history, research evidence, candidates, decision support and historical handoff evidence are preserved.
- Only current navigation and the current handoff are regenerated for the destination shadow context.
- The later Mnemosyne initial-memory-system candidate and the unmerged migration-preparation branch artifacts are not adopted or imported.

## Remaining migration work

1. Review the one destination shadow pull request.
2. Mechanically verify the imported path set and the 224 byte-exact files against the frozen source snapshot.
3. Run destination-only fresh-session recovery using a next-tier model.
4. Correct only demonstrated migration defects; do not add a memory foundation during this migration.
5. Ask the Owner for an explicit target-truth repository/path cutover decision.
6. After cutover, freeze the old Mnemosyne target root as historical bootstrap evidence and an immutable pointer.

## Exactly one safe next action

```yaml
safe_next_action: human_and_mechanical_review_of_the_destination_shadow_pull_request
no_automatic_cutover: true
no_automatic_operational_activation: true
```
EOF

cat > handoff/handoff-current.md <<'EOF'
---
target_project_id: meta-agent
artifact_id: META-AGENT-V0.1-HANDOFF-001
artifact_role: fresh_session_handoff
status: dedicated_repository_shadow_import_ready_for_review
authority_level: non_execution_navigation
target_runtime_truth_source: false
last_updated_by_task: META-AGENT-DEDICATED-REPOSITORY-SHADOW-IMPORT-001
---

# Meta-Agent Handoff — Dedicated Repository Shadow Import

## Authority boundary

The sole active Meta-Agent target truth remains in Mnemosyne until a separate Owner cutover:

```text
08822407d/Mnemosyne@8ef1c43b18b8686a30ffef544ca8b32fce1ca6cb
target-projects/meta-agent/current/approved-spec.md
```

The candidate destination path is:

```text
08822407d/Meta-Agent
current/approved-spec.md
```

The destination copy is shadow-only, non-authoritative and operationally inactive.

## Required reading order in the destination shadow

1. `current/approved-spec.md` — preserved target-truth candidate, still inactive;
2. `authority/source-and-owner-map.md`;
3. `current/active-context.md`;
4. `handoff/handoff-current.md`;
5. `history/decision-version-and-migration-log.md`;
6. `methodology/core-methodology.md`;
7. `cases/case-and-feedback-ledger.md`;
8. `migration/source-snapshot-pointer.yaml`;
9. relevant research manifests, formal reviews and candidate ledgers only as required by the current task.

The copied `current/meta-agent-mnemosyne-guidance-compatibility-guard.md` remains temporary process/safety evidence. It must not import Mnemosyne maintenance state. A Meta-Agent-owned behavior-guidance design may be considered after repository migration; it is not adopted by this shadow import.

## Current state

```yaml
route: META_AGENT_PRODUCT_BUILD
shadow_branch: meta-agent-shadow-migration-001
base_source_files: 226
byte_exact_files: 224
transformed_files: 2
source_authoritative: true
destination_authoritative: false
target_truth_cutover: false
operational_activation: false
initial_memory_system_work: deferred
```

## Exactly one safe next action

Review and mechanically verify the one destination shadow pull request. Do not build the initial memory system, initialize another branch, activate Meta-Agent or change target truth in the same step.
EOF

cat > migration/source-snapshot-pointer.yaml <<'EOF'
record_id: META-AGENT-DEDICATED-REPOSITORY-SOURCE-SNAPSHOT-001
artifact_role: migration_source_identity_and_scope_pointer
target_truth_source: false
source:
  repository: 08822407d/Mnemosyne
  commit: 8ef1c43b18b8686a30ffef544ca8b32fce1ca6cb
  root: target-projects/meta-agent/
  root_subtree_sha: 4c1cd341777d46b3d6794abc62682e9c915ec46a
  file_or_blob_count: 226
mapping:
  rule: strip_target-projects/meta-agent_prefix
  byte_exact_files: 224
  transformed_live_navigation:
    - current/active-context.md
    - handoff/handoff-current.md
excluded_from_this_import:
  - PR_258_source_inventory_generator_and_control_manifests_added_after_the_frozen_snapshot
  - Mnemosyne_root_taskbooks_adjudications_and_task_result_records_outside_the_source_root
  - meta-agent-dedicated-repository-mapping-resume-001_unmerged_branch_artifacts
  - Mnemosyne_initial_memory_system_candidate_and_alignment_work
memory_foundation:
  adopted: false
  deferred_until: migration_complete_and_destination_only_recovery_passes
cutover:
  authorized: false
  operational_activation: false
EOF

cat > migration/source-copy-verification.yaml <<EOF
verification_id: META-AGENT-DEDICATED-REPOSITORY-SOURCE-COPY-VERIFICATION-001
source_repository: $SOURCE_REPOSITORY
source_commit: $SOURCE_COMMIT
source_root: $SOURCE_ROOT/
source_subtree_sha: $source_subtree_sha
source_file_count: $source_count
mapping_rule: strip_source_root_prefix
byte_exact_expected: 224
transformed_paths:
  - current/active-context.md
  - handoff/handoff-current.md
result_before_commit: pending_file_by_file_comparison
EOF

cat > MIGRATION-STATUS.md <<'EOF'
# Meta-Agent Repository Migration Status

```yaml
status: shadow_import_ready_for_review
repository: 08822407d/Meta-Agent
shadow_branch: meta-agent-shadow-migration-001
source_snapshot:
  repository: 08822407d/Mnemosyne
  commit: 8ef1c43b18b8686a30ffef544ca8b32fce1ca6cb
  root: target-projects/meta-agent/
  files: 226
  byte_exact_files: 224
  transformed_files: 2
current_authoritative_target_truth:
  repository: 08822407d/Mnemosyne
  path: target-projects/meta-agent/current/approved-spec.md
destination_candidate_target_truth:
  path: current/approved-spec.md
  authoritative: false
  effective_for_operational_use: false
target_truth_cutover: false
operational_activation: false
initial_memory_system_foundation:
  status: deferred_until_after_migration
  adopted: false
```

The immediate task is review and mechanical verification of the shadow import. No memory foundation, RAG, MCP, automation, private-material support, prototype, pilot or operational activation is part of this migration pull request.
EOF

echo "[4/8] 逐文件核验 224 个 byte-exact 文件"
source_paths="$work_dir/source-relative-paths.txt"
git -C "$source_checkout" ls-tree -r --name-only "$SOURCE_COMMIT" -- "$SOURCE_ROOT/" \
  | sed "s#^${SOURCE_ROOT}/##" \
  | LC_ALL=C sort > "$source_paths"

byte_exact_count=0
missing_count=0
while IFS= read -r relative_path; do
  [[ -n "$relative_path" ]] || continue
  if [[ ! -f "$relative_path" ]]; then
    echo "缺少目标文件：$relative_path" >&2
    missing_count=$((missing_count + 1))
    continue
  fi

  case "$relative_path" in
    current/active-context.md|handoff/handoff-current.md)
      ;;
    *)
      cmp --silent "$payload_dir/$relative_path" "$relative_path" \
        || fail "文件内容不一致：$relative_path"
      byte_exact_count=$((byte_exact_count + 1))
      ;;
  esac
done < "$source_paths"

[[ "$missing_count" == "0" ]] || fail "存在 $missing_count 个缺失文件"
[[ "$byte_exact_count" == "224" ]] || fail "byte-exact 文件数为 $byte_exact_count，预期为 224"

python3 - "$byte_exact_count" <<'PY'
from pathlib import Path
import sys
path = Path("migration/source-copy-verification.yaml")
text = path.read_text(encoding="utf-8")
text = text.replace("result_before_commit: pending_file_by_file_comparison", f"byte_exact_verified: {sys.argv[1]}\nmissing_files: 0\nresult_before_commit: PASS")
path.write_text(text, encoding="utf-8")
PY

echo "[5/8] 确认未混入迁移后记忆系统建设"
[[ ! -e memory ]] || fail "出现未授权 memory/ 目录"
[[ ! -e migration/initial-memory-system-alignment-v0.1.md ]] || fail "混入 initial-memory-system alignment"
[[ ! -e migration/initial-memory-system-alignment-v0.1.yaml ]] || fail "混入 initial-memory-system alignment"
[[ ! -e current/meta-agent-behavior-guidance-candidate.md ]] || fail "混入未采用 behavior guidance candidate"
[[ ! -e commands/load-meta-agent-guidance-candidate.md ]] || fail "混入未采用 loader candidate"

rm -rf migration-staging

echo "[6/8] 暂存明确路径并提交"
git config user.name "Codex migration executor"
git config user.email "codex@users.noreply.github.com"

git add -- \
  README.md MIGRATION-STATUS.md \
  current authority methodology cases history handoff research candidates decision-support migration \
  migration-staging

[[ -n "$(git diff --cached --name-only)" ]] || fail "没有可提交变化"

git commit -m "Import frozen Meta-Agent source snapshot as non-authoritative shadow"
git push origin "$SHADOW_BRANCH"

head_sha="$(git rev-parse HEAD)"

echo "[7/8] 创建唯一 Draft PR"
pr_body="$work_dir/pr-body.md"
cat > "$pr_body" <<EOF
## 目的

把 Mnemosyne 中已经保存的 Meta-Agent 项目树复制到专属仓库，作为**非权威 shadow copy**供审阅和机械验证。

## 固定源

- repository: \`$SOURCE_REPOSITORY\`
- commit: \`$SOURCE_COMMIT\`
- root: \`$SOURCE_ROOT/\`
- subtree: \`$source_subtree_sha\`
- source files: $source_count
- byte-exact files: $byte_exact_count
- transformed live-navigation files: 2

## 路径映射

去掉 \`target-projects/meta-agent/\` 前缀，使项目内容直接位于专属仓库根目录。

## 仅有的转换

- \`current/active-context.md\`
- \`handoff/handoff-current.md\`

其余 224 个源文件已逐字节比较通过。

## 明确未导入

- PR #258 后生成的 E0 inventory 控制文件；
- Mnemosyne 根目录 taskbook、adjudication 和 task result；
- 未合并的 \`meta-agent-dedicated-repository-mapping-resume-001\` 分支内容；
- Mnemosyne 初始记忆系统候选及 alignment；
- RAG、MCP、automation、private material、prototype、pilot 或 activation。

## 权威边界

在 Owner 显式 cutover 前，Mnemosyne 的原 target-truth path 仍是唯一权威来源。本 PR 的目标内容保持非权威且 operationally inactive。

## 下一步

人工审阅、次一档模型机械校验和 destination-only fresh-session recovery。合并本 PR 不自动执行 target-truth cutover 或 operational activation。
EOF

pr_url="$(gh pr create \
  --repo "$DESTINATION_REPOSITORY" \
  --draft \
  --base "$BASE_BRANCH" \
  --head "$SHADOW_BRANCH" \
  --title "Meta-Agent: import preserved project tree as non-authoritative shadow" \
  --body-file "$pr_body")"

pr_number="$(gh pr view "$pr_url" --repo "$DESTINATION_REPOSITORY" --json number --jq '.number')"

echo "[8/8] 完成"
printf '%s\n' \
  "PR_NUMBER=$pr_number" \
  "PR_URL=$pr_url" \
  "PR_HEAD_SHA=$head_sha" \
  "SOURCE_FILES=$source_count" \
  "BYTE_EXACT_FILES=$byte_exact_count" \
  "TRANSFORMED_FILES=2"
