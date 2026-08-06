# Meta-Agent 专属仓库快速迁移任务书

```yaml
任务编号: META-AGENT-DEDICATED-REPOSITORY-SHADOW-IMPORT-001
任务类型: 机械复制与建立单一Draft_PR
当前主线: META_AGENT_PRODUCT_BUILD
源仓库: 08822407d/Mnemosyne
源提交: 8ef1c43b18b8686a30ffef544ca8b32fce1ca6cb
源目录: target-projects/meta-agent/
源文件数: 226
目标仓库: 08822407d/Meta-Agent
目标基础分支: master
目标迁移分支: meta-agent-shadow-migration-001
目标仓库当前状态: 已初始化但非权威
```

## 目标

尽快把已经妥善保存的 Meta-Agent 项目文件从 Mnemosyne 的临时目录复制到 Meta-Agent 专属仓库，并建立一个可审阅的非权威 shadow Draft PR。

本任务不再进行 226 个文件的语义重审，也不再扩展 Mnemosyne 迁移准备体系。

## 必须执行

1. 在 `08822407d/Meta-Agent` 的最新 `master` 上开始。
2. 确认不存在 `meta-agent-shadow-migration-001` 分支，也不存在同 head 的 open PR。
3. 执行：

   ```bash
   bash migration-staging/import-from-mnemosyne.sh
   ```

4. 脚本必须从固定源提交复制 226 个文件，并将源目录前缀去掉：

   ```text
   target-projects/meta-agent/current/approved-spec.md
   -> current/approved-spec.md
   ```

5. 除以下两个当前导航文件外，其余 224 个源文件必须逐字节保持一致：

   ```text
   current/active-context.md
   handoff/handoff-current.md
   ```

6. 上述两个文件只允许为目标仓库 shadow 状态重新生成；不得修改 `current/approved-spec.md`、authority、methodology、case ledger 或 history 的内容。
7. 创建并推送唯一分支 `meta-agent-shadow-migration-001`。
8. 创建至多一个 Draft PR，base 为 `master`。
9. 返回 PR 号、URL、head SHA、源文件计数、逐字节验证计数和两个 transformed path。
10. 完成后停止，等待 Owner 审阅。

## 明确排除

本次不得导入：

- PR #258 后来生成的 `target-projects/meta-agent/migration/source-inventory/` 控制文件；
- Mnemosyne 根目录中的 migration taskbook、adjudication、task result；
- Mnemosyne 未合并分支 `meta-agent-dedicated-repository-mapping-resume-001` 的文件；
- `notes/memory-system-designs/meta-agent-initial-memory-system-design-v0.1.md`；
- initial-memory-system alignment、artifact-role registry、memory envelope、load profiles、active-memory index；
- RAG、MCP、automation、private material、prototype、pilot 或 activation 内容。

## 记忆系统工作的处置

“Mnemosyne 为 Meta-Agent 建立初步记忆系统”已经在此前准备过程中混入迁移讨论，但它只应作为迁移后的候选工作。

```yaml
initial_memory_system:
  migrate_now: false
  adopt_now: false
  validate_now: false
  resume_after:
    - shadow_PR_reviewed
    - destination_only_recovery_passed
    - Owner_cutover_completed_or_explicitly_scheduled
```

当前已有的 target truth、authority、methodology、history、research、case/feedback ledger 与 handoff 属于 Meta-Agent 现有项目文件，应当迁移；它们不等同于新增的 memory-foundation 建设。

## 权威边界

在 Owner 明确 cutover 前：

```yaml
Mnemosyne_source:
  authoritative: true
  active_writer: true
Meta_Agent_destination:
  authoritative: false
  active_writer: false
  status: shadow_copy
```

合并 shadow PR 也不自动改变 target truth 位置或 operational activation 状态。

## 禁止事项

- 不写入或修改 Mnemosyne；
- 不创建第二个迁移分支；
- 不使用 `git add .`、`git add -A` 或 `git add --all`；
- 不自动合并或启用 auto-merge；
- 不重新运行 E0 全量 inventory；
- 不重新进行 Pro/frontier 语义分析；
- 不建设初始记忆系统；
- 不执行 cutover、activation、private material、RAG、MCP 或 automation。
