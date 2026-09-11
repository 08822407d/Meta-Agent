# 阶段 0 · 定向报告

```yaml
track_id: META-AGENT-FABLE5-REVIEW-AND-DESIGN-001
record_type: orientation_report
created_by_task: META-AGENT-FABLE5-REVIEW-AND-DESIGN-001
generated_by_actor: claude-fable-5.1
generated_on_surface: claude-code-vscode
date: 2026-09-03
base_master_sha: 1fdbd7af9437f72f7c8106714ad1e64908983fb7
evidence_class: mixed_per_claim_labels   # [VRF] VERIFIED_REPOSITORY_FACT / [DOI] DIRECT_OWNER_INSTRUCTION / [MI] MODEL_INFERENCE / [DR] DESIGN_RECOMMENDATION / [UNK] UNKNOWN_REQUIRES_EVIDENCE
authority_level: non_execution_source_advisory
phase: phase_0_orientation
conclusions_in_this_file: none   # 工作令 §4 阶段 0 "无结论"；本文件只做盘点、登记与计划
session_machine_name: "meta-agent-34 [9b1e59]"
session_uuid: 5fbf7385-035e-4075-9703-5aaf05159b15
```

## 1. 本轨道是什么、现在做到哪一段

- [DOI] Owner 在 2026-09-03 的两条补充（逐字见 00-owner-work-order-verbatim.md B 节）把本轨道定为一条串行五段线：**① 复核评审＋改进意见 → ② 独立的需求/构想逻辑一致性与可行性检查并纠正 → ③ Owner 人工复核确认与补充说明（两个来源：Owner 自发补充；会话分析中判定必须由 Owner 说清的问题）→ ④ 提出须靠"深度研究"解决的问题（区分 ChatGPT 深度研究与 Claude research 的特长与用法）并由 Owner 发射研究，课题以本地文件形式生成，结论回收后归档 Alaya → ⑤ 综合以上做独立设计（独立对照组，不替代 ChatGPT 旧结果），完成后与旧结果对比、改进**。
- [DOI] 现在只做第 ① 段。Owner 授权方式为条件式开工（"没有疑问就可以自己开工"），并加硬约束"只能串行工作"。
- [MI] 第 ① 段对应工作令 §4 的阶段 0（定向）→ 阶段 1（复核）→ 阶段 2（评审，含改进意见）。本会话把三者作为一个连续单元执行，阶段 2 交付后停下等 Owner；决定登记见 09-continuation/00 §3。

## 2. 读取清单（阶段 0 实际读取；均只读）

**A 类（Meta-Agent 当前状态与权威）——工作令 §2.3-A 全部 14 项已读完**：README.md；current/approved-spec.md；authority/source-and-owner-map.md；current/active-context.md；handoff/handoff-current.md；MIGRATION-STATUS.md；candidates/p0-static-design-conformance-mvi/{README.md, frontier-review-2026-08-06.md, revision-contract-v0.2.yaml, candidate-spec-draft-2026-08-05.md}；history/decision-version-and-migration-log.md；methodology/core-methodology.md；research/README.md；research/reviews/{MA-DR-01-05-cross-report-synthesis-v0.1.md, MA-DR-01-05-gap-analysis-v0.1.md}；research/waves/2026Q3-independent-wave-001/reviews/{MA-DR-08-15-cross-report-convergence-v0.1.md, MA-DR-09-upstream-binding-addendum.md, MA-DR-09-formal-intake-review.md}；三份 candidate ledger；decision-support/Meta-Agent-v0.1-owner-disposition-decision-package.md；cases/case-and-feedback-ledger.md；handoff/receipts/handoff-receive-report-2026-08-05.md。另读了 migration/{source-snapshot-pointer.yaml, source-copy-verification.yaml}、research/meta/manifest.yaml（头部）、wave reports/README.md 与 identities/*.yaml（头部）、current/meta-agent-mnemosyne-guidance-compatibility-guard.md 的 front matter（只读状态字段，未作为指导加载）。

**B 类（Mnemosyne 第二轮方法参考；`git -C ~/projs/Mnemosyne show origin/master:<path>`，origin/master = c319397）**：FABLE5-REVIEW2-001/00-orientation/01-orientation-report.md、01-composite-review/00-phase1-summary.md、01-composite-review/04-acceptance-debt-register.md、02-triage/02-owner-decision-package.md、02-triage/03-gate3-owner-decision-record.md；FABLE5-REDESIGN-001/00-work-order.md、09-continuation/02-owner-correction-dual-channel-rules.md、09-continuation/06-archiving-institution-record.md；notes/cross-family-cooperation/foundational-agent-antipattern-checklist-v1.md；notes/registries/multi-writer-attribution-convention.md。

**未读（按工作令 C 类或阶段安排）**：Meta-Agent 内 handoff/meta-agent-post-ma-dr-09-* 两件（只登记存在与 front matter）；Mnemosyne target-projects/meta-agent/（退役桩）；Alaya 全部；Mnemosyne 第一轮（7 月）FABLE5-REVIEW-001/002/003、TRIAGE、GREENFIELD、WORK-ULTRA、PRO-SLICE 各轨道（Owner 补充 #2：不参照）；Mnemosyne 记忆系统候选设计两件与 MyOS2 接管清单（留到后段按需读）。

## 3. 仓库结构盘点 [VRF]

| 项 | 观察 |
|---|---|
| 文件总数 | 232（86 个 md/yaml 正文文件 ＋ 1 个 json ＋ 145 个研究报告传输分片）；无任何代码、schema、fixture、脚本 |
| 目录分布 | research/ 209（archive 39、batches 28、waves 139、meta 1、reviews 2、README 1）；candidates/ 4；migration/ 4；handoff/ 4；current/ 3；根 2；authority/ cases/ decision-support/ history/ methodology/ 各 1 |
| 传输分片 | DR-01–05 归档 38 片（bz2+base64）；DR-06 6 片、DR-07 8 片（明文）；DR-08 8、DR-10 7、DR-11 5、DR-12 5、DR-13 8、DR-14 6＋10（其中 part-006 为 base64 子分片）、DR-15 7（明文）；DR-09 37 片（bz2+base64） |
| 提交 | 37 个，全部在 2026-08-06（UTC 08-06/07）；author 全为 Owner 账号；committer 32 Owner ＋ 5 GitHub（合并）；**0 个提交带 Agent-*/Co-Authored-By 尾注** |
| PR | #1–#5 全部已合并（08-06 13:18Z 至 08-07 02:14Z）；0 open |
| 远端分支 | master ＋ 5 条已合并任务分支（含 `codex/follow-migration-instructions-from-repository`），各 0 个未合并提交 |
| 起草日至今 | 与工作令 pinned base 零漂移（HEAD = origin/master = 1fdbd7a；起草后 26→27 天无提交） |
| [MI] 写入方推断 | PR #1 分支名前缀 `codex/` 与 5 个 PR 的一日集中合并模式指向 ChatGPT/Codex 连接器；仓库本身无写入方记录可证实（无尾注、无 run-context）。本轨道是首个带尾注的写入方 |

## 4. 状态字段盘点 [VRF]

**4.1 四处导航口径一致**：README、active-context、handoff-current、MIGRATION-STATUS 在 target truth 路径、inactive、cutover=true、全部 *_authorized=false、"唯一安全下一步＝candidate-only P0 v0.2 规格包"上完全一致；handoff prohibited_in_same_step 恰 13 项；approved-spec §6/§9/§13、authority map §4/§7（末尾六条）与工作令引用一致。

**4.2 front matter 中停留在"待合并/待审/待决"类的状态字段（逐文件扫描，含 87 个正文文件）**：

| 文件 | 字段值 | 与当前事实的关系（阶段 1 逐项核实；此处只登记） |
|---|---|---|
| decision-support/…decision-package.md | `status: decision_pending` | MA-DEC-0007 记录 Owner 已于 2026-07-31 决定 |
| cases/case-and-feedback-ledger.md | `initialized_empty_pending_owner_acceptance` | Owner 07-31 已 ACCEPT_WITH_LIMITATIONS |
| research/meta/manifest.yaml、research/archive/README.md | `prepared_for_repository_review` | 已在 master |
| research/batches/2026Q3-batch-a/{README.md, meta/manifest.yaml, reports/README.md, reports/report-parts-manifest.yaml} | `repository_recording_pending_human_merge` | 已在 master |
| research/batches/2026Q3-batch-a/meta/repository-recording-plan.md | `executing_in_canonical_lineage_pending_human_merge` | 已在 master |
| wave decisions/PR249-post-merge-handoff-readiness.md | `pending_finalization_PR_merge` | PR #251 已合并（Mnemosyne 侧） |
| wave decisions/MA-DR-09-downstream-and-handoff-gate.md | `prepared_for_owner_and_repository_recording` | 已在 master（2026-08-05 回执已标为非阻塞陈旧） |
| wave reports/identities/MA-DR-09.yaml | `repair_PR: PENDING_REPAIR_PR`、`PENDING_FINAL_REMOTE_VERIFICATION` ×2 | 被同目录 MA-DR-09-post-merge-verification.yaml 取代（回执已标） |
| wave meta/manifest.json | `"repository": "08822407d/Mnemosyne"` | cutover 后仓库已变 |
| wave tasks/MA-DR-09-*（3 件）、tasks/MA-DR-10…15、batch-a tasks/MA-DR-08-* | `ready_not_selected` / `prepared_not_executed` / `ready_not_executed` | 对应研究均已执行并回收 |
| migration/pre-migration-preservation-checkpoint-2026-08-06.md | `preservation_checkpoint_written_to_branch_pending_review_and_merge` | 已在 master |
| candidates/…/candidate-spec-draft-2026-08-05.md | `…not_repository_recorded` | 已入库；frontier review F-01 要求保留原件不改、另立 v0.2（有意保留） |
| MIGRATION-STATUS.md | `next_candidate_artifact: candidates/…/candidate-spec-v0.2.md` | 该文件不存在（candidates 目录仅 4 件） |
| current/approved-spec.md `accepted_limitations` | `applicable_non_FABLE_health_review_findings_remain_pending…`、`MA_DR_06_and_MA_DR_07_recommended…` | DR-06/07 已完成并裁定（research/README）；health review 在 Mnemosyne 侧的状态待阶段 1 定位 |

**4.3 稳定 ID**：approved-spec 含 MA-REQ-0001–0016（16/16）；methodology 含 MA-METHOD-0001–0006（6/6）；history 含 MA-DEC-0001–0008（8/8）、MA-MIG-0001/0002。history §3 声明已发放 **MA-PEND-0001–0008**，但 Meta-Agent 仓内无任何文件定义这 8 条（仅 7 个研究任务书/矩阵引用其编号）；[UNK] 是否定义于 Mnemosyne 侧 M0 基线记录（approved-spec source_refs 之一）——阶段 1 核实。

**4.4 旧路径引用**：`target-projects/meta-agent` 字样在 41 个正文文件中出现 231 次（最多：pre-migration checkpoint 17、MA-DR-14.yaml 16、candidate-spec-draft 14）。其中相当部分是迁移出处/历史 provenance（合理保留），另一部分是操作性引用（methodology source_refs、cases 写入边界 allowed_paths、research/README "sole target truth" 句、wave OPERATOR.md、identities/*.yaml 的 part 路径）——阶段 1 按"provenance vs 操作性"分类计数。

## 5. 工作令 §8 十条线索的核实状态

| # | 线索 | 阶段 0 观察 | 状态 |
|---|---|---|---|
| 1 | 无代码，232 文件皆文档/分片；v0.1 = inactive 基线 | 与 §3 一致 | [VRF] |
| 2 | next_candidate_artifact 指向不存在文件 | 见 §4.2 末行 | [VRF] |
| 3 | 多文件仍引旧路径 | 41 文件 231 处 | [VRF]，分类留阶段 1 |
| 4 | 多份 front matter 停留 pending；`report/MA-DR-09-report.md` 不存在 | 见 §4.2；该路径确不存在，实体为 37 片 transport（08-05 回执已记） | [VRF] |
| 5 | accepted_limitations 两条未对账 | DR-06/07 已完成 [VRF]；non-FABLE health review 在 Mnemosyne 侧的实体与状态 | [UNK]→阶段 1 |
| 6 | 5 条残留分支、37 提交、无尾注、Claude Code 从未写此仓 | 全部 [VRF]；写入方来源为 [MI] | [VRF]/[MI] |
| 7 | 某 ChatGPT 对话未归档 Alaya | Alaya 私档未读 | [UNK]（默认不核） |
| 8 | Mnemosyne 镜像缺 MA-DEC-0008/MA-MIG-0002 | 8ef1c43 快照与 origin/master 的 target-projects/meta-agent/history/… 均 0 次出现（origin/master 该文件已不在退役桩中） | [VRF] |
| 9 | MyOS2 已占位首个用例 | Mnemosyne origin/master 存在 target-projects/myos2/00-intake-and-wave-001-launch.md 与 01-wave-1-intake-and-review.md | [VRF]（内容未读） |
| 10 | 31 个 candidate label | Batch-A 12 ＋ wave 10 ＋ DR09 9 = 31 | [VRF] |

**阶段 0 期间已完成的机械核验（结果详表进阶段 1 台账）**：源快照 226 文件全部在 PR #1 合并树中，224 个 blob 与 Mnemosyne@8ef1c43 相同、2 个为声明的 transform（active-context、handoff-current）[VRF]；相对当前 master 另有 5 文件被 PR #2–#5 改动（authority map、approved-spec、guard、history、candidates README）——按 PR 归因留阶段 1；DR-01–05 归档（base64/bz2/tar/10 成员/38 blob）全部哈希吻合 [VRF]；DR-09 37 片、bz2、原件 88451 字节 sha256 吻合 [VRF]；DR-06/07 明文分片重建后与 manifest 声明字节数与 sha256 吻合 [VRF]；candidate-spec-draft 17887 字节 sha256 吻合 [VRF]；approved-spec/methodology/history 指向 Mnemosyne@8ef1c43 的 7 个外部路径全部存在 [VRF]。

## 6. 证据类别分布 [VRF]（按 front matter artifact_role 归并）

| 类别 | 文件数 | 说明 |
|---|---|---|
| target truth | 1 | current/approved-spec.md（inactive） |
| 权威/方法支持 | 2 | authority map、core-methodology |
| 导航/当前状态 | 4 | README、active-context、handoff-current、MIGRATION-STATUS |
| 历史/决策 | 1 | history log |
| 迁移证据 | 4 | migration/ |
| 候选（非执行源） | 4 | candidates/（含 frontier review 与 revision contract） |
| 研究证据与裁定 | 68 正文 ＋ 145 分片 | research/（任务书、报告、intake review、convergence、ledger、manifest、decision） |
| 决策支持 | 1 | decision-support/ |
| 案例/反馈 | 1 | cases/（空） |
| 退役/历史交接 | 3 | compatibility guard、post-DR-09 handoff package、startup prompt |
| 回执 | 1 | handoff/receipts/ |

[MI] 全库 232 文件中约 92% 是研究链的载体与元数据，产品自身的规范性内容（需求、方法、权威）不足 60KB。

## 7. Mnemosyne 第二轮参照对象的确认 [VRF]

| 轨道 | 时间 | 提交数 / PR | 内容 | 本轨道处理 |
|---|---|---|---|---|
| FABLE5-REVIEW2-001 | 2026-08-22 → 08-26（PR #306 于 08-27 合并） | 32 | 定向→复合评审（8 专题、验收债台账）→分诊与 Owner 决策清单→独立设计 A/B/E→Pro 联合确认→实验 | **第 ① 段方法参照** |
| FABLE5-REDESIGN-001 | 2026-08-30 → 08-31（PR #323） | 35 | 目标登记表→一致性与可行性→研究课题（MNE-DR-020…028）→独立重设计 v1/v2→GPT-Pro 对照设计（029）→双向盲评（030/031）→综合 SYN-1/2→采纳 | **第 ②–⑤ 段方法参照** |
| FABLE5-HANDOFF-001 | 2026-08-31（PR #333） | 3 | 采纳协议下的首次真实交接 | 参考（交接包阶段） |
| 第一轮（不参照） | 2026-07-07 → 07-25 | — | FABLE5-REVIEW-001/002/003、TRIAGE-001、GREENFIELD-001、WORK-ULTRA-*、PRO-SLICE-01 | Owner 补充 #2：执行细节由 ChatGPT Pro 设计，参照会损独立性 |

[MI] Owner 所说"8 月底的第二次"按仓库历史应覆盖 REVIEW2 ＋ REDESIGN（＋HANDOFF）三条轨道；三者工作令均由 Fable 会话起草（REDESIGN 工作令头部 drafted_by: claude-fable-5；REVIEW2 起草方待阶段 1 核对一行）。若 Owner 只指其中一条，请一句话纠正。

## 8. 本轨道计划（[DR]；Owner 可增删）

### 8.1 目录结构

```text
reviews/META-AGENT-FABLE5-REVIEW-AND-DESIGN-001/
  00-orientation/                 本阶段三件
  01-verification/                第①段·复核：00-verification-ledger.md（expected/observed 逐项）、01-acceptance-debt-register.md
  02-review/                      第①段·评审：00-review-summary.md、01…09 专题、90-improvement-recommendations.md（改进意见）、99-owner-decision-package.md
  03-consistency-and-feasibility/ 第②段：需求与构想登记表、逻辑一致性与可行性检查、纠正稿、须 Owner 说清的问题清单
  04-owner-clarifications/        第③段：Owner 补充与裁定逐字登记
  05-research-questions/          第④段：课题登记表、逐题本地任务书文件（按平台特长分流）、received/（回收件与收据）
  06-independent-design/          第⑤段：独立设计稿（对照组）
  07-comparison-and-improvement/  第⑤段后半：与 ChatGPT 旧结果的对比与改进
  09-continuation/                预检/run-context、续接检查点、门记录、收口
```

### 8.2 第 ① 段的分件方案

| 文件 | 主题 | 对照对象 |
|---|---|---|
| 01-verification/00-verification-ledger.md | 迁移完整性（按 PR 归因）、研究回收链（15 份报告的编号/哈希/分片/裁定链）、决策日志 vs 文件、pending 字段、旧路径分类、稳定 ID、外部指针、Mnemosyne 侧对账项 | §4–§5 |
| 01-verification/01-acceptance-debt-register.md | BLOCKED/NOT_RUN/pending/deferred/待 Owner 决定项的台账与风险分级 | — |
| 02-review/01-owner-goals-vs-requirements.md | MA-REQ-0001–0016 与 Owner 目标（工作令 §1.1、补充）及研究共识的对应；产品定位 | approved-spec §2–§3 |
| 02-review/02-spec-and-governance-design.md | approved-spec / authority map / methodology / history 的内部一致性与治理设计的成本收益（过重/过轻） | §5–§13 |
| 02-review/03-freshness-and-staleness.md | 指针、pending、limitations 对账、导航时效、状态失效纪律 | §4.2 |
| 02-review/04-research-chain-quality.md | DR-01–15：证据类型、单族（GPT）单源、引用可移植性、"收敛≠验证"、研究由额度驱动与否 | research/ |
| 02-review/05-p0-candidate-and-frontier-review.md | P0 候选、frontier review、revision contract 的方向、粒度与实施成本 | candidates/ |
| 02-review/06-product-core-gaps.md | P0-1–P0-4 与"设计综合"缺口；零真实用例；MyOS2 占位；行为指导缺位；记忆系统搁置 | gap analysis、active-context deferred |
| 02-review/07-candidate-labels-disposition.md | 31 个 label 的去留建议 | 三份 ledger |
| 02-review/08-process-and-cost.md | 流程重量与记账占比、Owner 触碰、ChatGPT 连接器写入模式的代价（PR #248 事故、37 提交一日完成） | git 历史 |
| 02-review/09-antipattern-self-check.md | 16 条反模式清单逐条对 Meta-Agent 自检 | Mnemosyne 反模式清单 v1 |
| 02-review/90-improvement-recommendations.md | 改进意见：分级（BLOCKING/REPAIR_RECOMMENDED/NON_BLOCKING/OBSERVATION/QUESTION）、成本、依赖、不生效声明 | 全部专题 |
| 02-review/99-owner-decision-package.md | Owner 决策清单（每题背景一句＋选项＋推荐默认，人话） | — |

### 8.3 第 ②–⑤ 段（占位，待第 ① 段交付后按 Owner 批示细化）
按 FABLE5-REDESIGN-001 的骨架映射：目标/需求登记表（G/C/O/H/P 分级，新旧对照不调和）→ 一致性与可行性三档 → Owner 澄清包 → 研究课题登记表与逐题任务书（ChatGPT 深度研究 vs Claude research 分流标准另立一节）→ 独立设计（对照组、防火墙：不读 ChatGPT 旧候选包细节的方式待 Owner 定 §5.3 (a)/(b)）→ 对比与改进。

## 9. 同族局限声明

本轨道全部产出由 claude-fable-5.1 单一模型在单会话中生成。对 Meta-Agent 仓内 GPT 族产物（approved-spec、15 份研究报告与裁定、P0 候选与 frontier review）的评审具备跨族视角，但仍是单模型意见，不构成独立复核；对 Mnemosyne 侧 Fable 族产物（记忆系统候选设计、REVIEW2/REDESIGN 方法）的任何引用与评价属同族，不构成独立复核。每份评审文件固定一节重申。

## 10. 入库前脱敏核对 [MI]

- Owner 原话（工作令 §1.1、补充 #1/#2）：无与任务无关的个人信息。补充 #2 中"我还同时用 claude code 进行其他工作，为了避免飞速消耗额度"一句是串行约束的理由，与任务相关，已保留；Owner 若希望从公开仓副本中去掉此句，一句话即可（去掉后在登记处注明"经 Owner 指示删节"）。
- 工作令与回执含本机路径（/home/cheyh/…）、会话 UUID、机器名：与 Mnemosyne 公开仓既有轨道记录同类（[VRF] REVIEW2 定向报告含同类信息），已保留。
- 无密钥、token、私有源码、私档引文。

## 11. 假设与决定登记（[MI]；与 09-continuation/00 §3 同步）

串行执行、门合并、Mnemosyne 只读不 fetch、不联网、跨会话通信仅限归档规则问询、四行尾注＋Co-Authored-By。

## 12. 返回契约（阶段 0）

```yaml
base_master_sha: 1fdbd7af9437f72f7c8106714ad1e64908983fb7
branch: meta-agent-fable5-review-and-design-001
changed_paths_this_phase:
  - reviews/META-AGENT-FABLE5-REVIEW-AND-DESIGN-001/00-orientation/00-owner-work-order-verbatim.md
  - reviews/META-AGENT-FABLE5-REVIEW-AND-DESIGN-001/00-orientation/00-startup-receipt.md
  - reviews/META-AGENT-FABLE5-REVIEW-AND-DESIGN-001/00-orientation/01-orientation-report.md
  - reviews/META-AGENT-FABLE5-REVIEW-AND-DESIGN-001/09-continuation/00-batch-01-preflight-and-run-context.md
protected_paths_untouched: 工作令 §5.2 一律不改清单全部；未创建 CLAUDE.md/AGENTS.md/.claude/；未写 Mnemosyne/MyOS2/Alaya
validation_method:
  - 逐字存档段以 awk 抽取后 sha256 与 Downloads 原件比对：三段均 PASS
  - 机械核验命令可重放（迁移 blob 比对、分片重建、外部路径 cat-file -e）
known_limitations:
  - 单模型同族（§9）
  - 未读 Alaya；Mnemosyne 只读到 origin/master c319397（未 fetch）
  - 本阶段无结论；§4–§5 的"关系"列为登记而非裁定
next: 阶段 1 复核台账与验收债台账（不停等）；阶段 2 评审包＋改进意见＋Owner 决策清单后停等 Owner
```
