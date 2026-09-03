# 专题 08 · 流程重量、成本与写入表面

```yaml
track_id: META-AGENT-FABLE5-REVIEW-AND-DESIGN-001
record_type: composite_review_theme_report
created_by_task: META-AGENT-FABLE5-REVIEW-AND-DESIGN-001
generated_by_actor: claude-fable-5.1
generated_on_surface: claude-code-vscode
date: 2026-09-03
base_master_sha: 1fdbd7af9437f72f7c8106714ad1e64908983fb7
evidence_class: mixed_per_claim_labels   # [VRF]/[DOI]/[MI]/[DR]/[UNK]
authority_level: non_execution_source_advisory
phase: phase_2_composite_review
finding_levels: [BLOCKING, REPAIR_RECOMMENDED, NON_BLOCKING, OBSERVATION, QUESTION]
adoption_gate: 本文件任何建议均不生效、不采纳；修复须经 Owner 批示另立任务
```

## 1. 过程量 [VRF]

| 指标 | 值 | 来源 |
|---|---|---|
| Mnemosyne 时期含 meta-agent 的合并 PR | 30（2026-07-01 → 08-06） | git log --merges 主题检索 |
| 专属仓提交 / PR | 37 / 5，全部 2026-08-06/07 UTC | git log；gh |
| 出现在 front matter 的任务号 | 12（META-AGENT-* 11 ＋ MNEMOSYNE-171） | 台账 §7.4 |
| 正文文件按功能 | 产品规范 7（60KB）；导航 4；候选 4；迁移证据 4；研究报告裁定/manifest/契约/decision/receipt 等过程类约 55；研究综述 6；退役 3；回执 1 | 定向报告 §6 [MI 归类] |
| 过程类 : 产品类 | 约 7 : 1（按文件数） | 同上 |
| 研究链体量 | 15 份约 900KB ＋ 145 传输分片 | 台账 §2 |
| 事故与修复 | PR #248（合并内容≠描述）→ #249 修复 → #251 收尾 → #252 关闭：1 起事故 3 个修复 PR | wave decisions |
| 起草后空转 | 27 天 0 提交 | git log |
| Owner 触碰 | 每个 PR 人工合并；每个研究经 OPERATOR 流程由 Owner 复制粘贴发射（8 份 wave ＋ 2 batch-a ＋ 5 首轮）；每步"separate task-local authorization" | OPERATOR.md；spec §9 |

## 2. 写入表面的代价 [VRF]＋[MI]

Meta-Agent 至今的全部写入经 ChatGPT GitHub 连接器与 Codex 完成（分支名 `codex/…`；destination-access-verification 记录连接器安装与权限探测；pre-migration checkpoint 记"ChatGPT 连接器能否建分支/开 PR"曾是风险）。该表面的特点：
- 无本地校验：PR #248 把 17 个 base64 segment 合并上 master，PR 描述却声称含 11 件其他产物——写入方看不到自己写了什么；
- 无提交尾注/run-context：37 提交 0 署名信息；
- 每个 PR 必须 Owner 合并；连接器不能在合并后回写状态 → 13 处"pending_human_merge"永久停留（专题 03 根因之一）；
- 大文件须切片传输（38＋37＋10 片 base64）——这些片本身就是 145 个文件，占仓库 62%。

Mnemosyne 侧 2026-08 已实证 Claude Code 本地直写＋预检脚本＋尾注可行（多写入方署名惯例 §6 给"较可靠"）；本轨道即其在 Meta-Agent 仓的首个实例。[MI] 仓库过程重量的相当部分是**为连接器写入表面付的税**，不是治理本身的必需。

## 3. 记账占比与"仪式换产出" [MI]

- 12 个任务号里，产出可被 Owner 项目直接使用的内容：0。产出"关于如何做"的内容：全部。
- 每份研究裁定文件末尾的否认段、每份决策文件的 authority boundary 段、每个 PR 的 required/prohibited 清单，是同一段话的 40 多份复制。
- 与 Mnemosyne 第二轮评审（R2-COST-001/006："规则只有加法没有整合"）同病；Meta-Agent 由于起点更晚，尚未累积 guard 层，但否认段的复制已是同类症状的早期形态。

## 4. 对本轨道自身的成本约束 [DOI]

Owner 补充 #2：串行、控额度。本轨道到此为止的成本：单会话、单线程、0 子代理、0 外部调用；写入 15 文件、7 提交。这一"轻量档"本身就是 F2-PROC-001 的可行性证据。

## 5. Findings

| ID | 级别 | 一句话 | 证据 | 类别 |
|---|---|---|---|---|
| F2-PROC-001 | REPAIR_RECOMMENDED | 建立"轻量档"工作通道：本地 Claude Code 表面 ＋ 五步预检 ＋ 四行尾注 ＋ candidate-only 路径隔离 ＋ 每轨道一个 Draft PR；配 Owner-touch 预算（每阶段 ≤1 次批示）；作为候选规则写入行为守则 | §1–§4 | [VRF]＋[DR] |
| F2-PROC-002 | OBSERVATION | PR #248 事故的根因是写入表面无本地校验；修复纪律良好（新任务号、新分支、不改历史）；教训应进"平台事实"而非核心规则（反模式 #15） | §2 | [VRF]＋[MI] |
| F2-PROC-003 | OBSERVATION | 过程:产品 ≈ 7:1；研究 900KB vs 规范 60KB；新会话理解成本高；否认段 40+ 处复制 | §1、§3 | [VRF]＋[MI] |

同族局限：成本判断带有本会话（Claude Code 本地表面）的立场；GPT 侧对连接器表面的评价可能不同。
