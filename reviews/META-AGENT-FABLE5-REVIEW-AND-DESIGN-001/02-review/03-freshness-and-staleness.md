# 专题 03 · 新鲜度与失效纪律

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

## 1. 事实基础

全部来自 01-verification/00-verification-ledger.md §3、§5、§6（[VRF]）：13 处过期状态字段（5 处操作性）、231 处旧路径（100 处操作性，分布 15 文件）、MA-PEND-0001–0008 在仓内无定义、两条陈旧 accepted_limitations、两件退役交接文件仍标 ready、唯一安全下一步指向不存在的文件。

## 2. 模式分析 [MI]

| 模式 | 实例 | 根因 |
|---|---|---|
| "写时状态"被当作"现在状态" | `repository_recording_pending_human_merge`（5 件）、`decision_pending`、`PENDING_REPAIR_PR` | front matter 记录的是**创建时刻**的状态，没有"生效后由谁改"的约定；作者（ChatGPT 会话）在合并后无法回头改（连接器写入需要新 PR） |
| 迁移只改了"最显眼"的文件 | approved-spec 的 source_refs 加了仓库前缀，history/methodology/cases 没加；research/README 的"唯一 truth"句漏改 | cutover 任务的 transform 清单按"权威文件"划定，未做全库路径扫描（一条 `git grep` 即可发现） |
| 导航指向未来 | `next_candidate_artifact: candidate-spec-v0.2.md` | 用"将要存在的文件"做路标，而非"现在存在的契约"（revision-contract-v0.2.yaml） |
| 取代无标记 | MA-DR-09.yaml 被 post-merge-verification.yaml 取代、post-DR-09 handoff 被 handoff-current 取代、tasks/* 被执行结果取代 | 无 `superseded_by` 字段；新文件不回写旧文件 |
| 稳定 ID 无家 | MA-PEND-0001–0008 | ID 在 history 声明"已发放"，定义留在源仓；MA-PEND-0002 已实现却无人关闭 |
| 限制条款不随事实更新 | DR-06/07 recommended（已完成）；health review pending（无主） | target truth 的更新要走 §12 七步，成本高于价值，于是不改 |

这与 Mnemosyne 第二轮评审的 R2-FRESH-001/002（"活路标指向已拆桥梁"）和反模式清单 #6 是同一种病：**有创建纪律，没有失效纪律**。差别在于 Meta-Agent 仓更年轻、文件更少，修复成本目前很低（一次任务可全清）。

## 3. 风险评估

- 当前 inactive 阶段：LOW——没有运行时读这些字段。
- 新会话进入：MEDIUM——handoff 必读 10 件里 research/README 与 identities 都在，会把新会话引向旧路径或错误状态；本轨道靠工作令预警才未中招。
- 一旦有机械消费者（P0 验证器、重建脚本）：HIGH——identities 的 part 路径与 archive README 的重建命令按字面执行必失败。

## 4. Findings

| ID | 级别 | 一句话 | 证据 | 类别 |
|---|---|---|---|---|
| F2-FRESH-001 | REPAIR_RECOMMENDED | 100 处操作性旧路径与 3 组裸 Mnemosyne 路径（history/methodology/cases）；research/README.md 一句与 cutover 直接矛盾；建议一次"迁移路径同步"任务：`git grep target-projects/meta-agent` 全清，历史类加 `08822407d/Mnemosyne@8ef1c43:` 前缀，操作类改为仓内相对路径 | 台账 §6 | [VRF]＋[DR] |
| F2-FRESH-002 | REPAIR_RECOMMENDED | 建立最小失效纪律：(1) 状态类文件头加 `status_as_of` 与 `superseded_by`；(2) `safe_next_action` 只指向已存在的契约文件；(3) 退役文件移入 history/ 或加 `retired: true`；(4) 每次合并后一条机械检查（grep PENDING/pending_human_merge） | 台账 §5 | [VRF]＋[DR] |
| F2-FRESH-003 | NON_BLOCKING | MA-PEND-0001–0008 在权威仓内无定义与状态；0002 已实现未关闭；建议把 8 条 pending 需求正文迁入仓内并加状态（open/researched/realized/superseded） | 台账 §3.6–3.7 | [VRF]＋[DR] |
| F2-FRESH-004 | NON_BLOCKING | target truth 内两条 accepted_limitations 已陈旧；随下一次 §12 程序修订一并处理，不单独开任务 | 台账 §5 末两行 | [VRF] |

以上修复均须 Owner 批示另立任务；本轨道不改任何原文。

同族局限：事实层可重放；"根因"为单模型推断。
