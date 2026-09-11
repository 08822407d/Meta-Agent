# 专题 04 · 研究回收链质量（MA-DR-01 … MA-DR-15）

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

## 1. 链条概貌 [VRF]

| 批次 | 报告 | 时间 | 触发方式 | 裁定 |
|---|---|---|---|---|
| 基础 | DR-01–05 | 2026-07（表面 gpt-5.5 pro 扩展深度研究） | 首轮五题 | synthesis + gap analysis（P0-1…P0-4、P1-1…P1-5） |
| Batch A | DR-06、07 | 2026-08-01 | gap analysis 的"推荐研究序列" | ACCEPT_EVIDENCE_ONLY（06，仓库输入缺失）/ ACCEPT_WITH_CORRECTIONS（07） |
| Batch B / 独立波 | DR-08、10–15 | 2026-08-03/04 | Batch A 裁定 → 七题并行 | 7/7 ACCEPT_WITH_CORRECTIONS |
| DR-09 | 基准/消融/一致性/有界试点协议 | 2026-08-04 | 08 裁定后放行 | 原运行 TARGET_MAPPING_BLOCKED → 审阅者绑定附录 → ACCEPT_WITH_CORRECTIONS |

体量：15 份报告约 900KB；候选产出 31 个 label；进入 target truth 的需求/方法变更：0；Owner 决定登记：0。

## 2. 单份报告质量（抽样：DR-01、06、08、10、13 正文开头与关键节；其余以 intake review 为准）

| 报告 | 优点 | 局限（含 intake review 已指出者） |
|---|---|---|
| DR-01 | 定位清晰（人主导的设计与治理层）；近邻系统比较实在；建议第一版做"方法库＋审批执行源＋设计工作流"——与后来 v0.1 一致 | 283 个不透明引用（整批）；"部分可行"未给可证伪判据 |
| DR-06 | 诚实披露无法读仓库并降级；搜索方法与鲁棒性证据扎实 | 三张图缺失；仓库映射由审阅者补 |
| DR-08 | 分层混合表示（YAML→graph/AST→backend）论证充分；"可移植性必须可证伪"是好原则 | 建议的 MVI 字段集依旧庞大；"两个可编辑真相"由审阅者纠正 |
| DR-10 | **全链最有价值**：把产品核心缺口（frame→design→alternatives→dossier）定义清楚；表示中立；列出 9 个须 Owner 决定的问题 | 9 个问题至今无一登记；Lite/Standard/High-Assurance 档未校准 |
| DR-13 | 迁移决策树与"no-migration 是有效长期拓扑"的判断成熟 | **两天后仓库就迁移了**，MA-DEC-0008 未引用/对账该报告的触发条件（见 §4） |
| DR-09 | 分层评估、强基线、非补偿门、Tier 模板 | 工作量估算 244–638＋174–430 小时——按团队规模写的；单 Owner 不可行性未评估 |

## 3. 结构性问题

### 3.1 单族自证 [VRF]
15 份报告全部出自 ChatGPT Deep Research；15 份 intake review、3 份 cross-report 裁定、1 份 frontier review 全部由 ChatGPT 会话完成；DR-06–15 甚至未记录操作者可见的模型标签。ledger 自己承认"convergence ≠ independent replication where reports share model/provider ancestry"，但从未安排异族复核。本轨道是第一次跨族阅读（且仍是单模型）。→ 反模式 #14。

### 3.2 研究不绑定决定 [VRF]＋[MI]
每一批研究的题目来自上一批报告的"推荐序列"（gap analysis §8、Batch-B gate、independence matrix），而不是来自"Owner 要做的某个决定"。结果：DR-10 列出的 9 个 Owner 决定、DR-13 的迁移触发条件、DR-12 的策略结构、DR-15 的注册表——没有一个进入决策登记；31 个候选停在 ledger。Owner 2026-08-30 原话恰好点名此事："知道需要做哪些研究"应服务于"逻辑正确性和可行性分析"，而不是研究自我繁殖。→ 反模式 #7。

### 3.3 研究结论与实际决定脱节的实例 [VRF]
DR-13（08-04 记录）："dedicated repository **不必要**，如果 Meta-Agent 仍以低频人审文档为主、access 与 Mnemosyne 相同、无独立 release/runtime……这不是暂时凑合，而是有效的长期拓扑。" 08-06 迁移发生；MA-DEC-0008 的依据是 Owner 授权（source_ref: cutover_authorization_2026_08_06），pre-migration checkpoint 记录"user_selected_dedicated_repository_direction: true"。Owner 有权这样决定；问题在于**研究没有被拿来对照**——既没写"触发器 X 已满足"，也没写"Owner 明知不满足仍选择"。[MI] 迁移的真实动机更可能是 Mnemosyne 侧的并发/写入方隔离需求（PR #248 事故后），这恰是 DR-13 触发器表里的 "Churn/conflict" 与 "Access-boundary"——本可一句话对上。

### 3.4 规模错配 [MI]
DR-09、DR-10、DR-14 的建议按"有团队、有预算"的假设写：数百小时的基准建设、Lite/Standard/High-Assurance 三档档案、本地/云/混合三种私有存储原型。对一个用配额约束串行工作的单 Owner，这些建议的可行性从未被评估——这正是 Owner 要求的第 ② 段（可行性检查）该做的事。

### 3.5 可移植性与保全 [VRF]
DR-01–05：0 个直接 URL；DR-06/07 任务书不在两仓；DR-06–15 无表面记录；DR-06 图缺；研究对话是否归档 Alaya 未知。新模型复核时，引用链多数不可追。

### 3.6 做得好的地方 [VRF]
识别与哈希纪律完整；负面证据保留（DR-06 输入失败、DR-09 上游缺失、DR-11 短运行）；intake review 系统性剥离过度声明（每份都有 not_accepted_as）；候选不发稳定 ID；DR-10 的方法缺口识别有真实产品价值。

## 4. Findings

| ID | 级别 | 一句话 | 证据 | 类别 |
|---|---|---|---|---|
| F2-RES-001 | REPAIR_RECOMMENDED | 单族研究＋同族裁定＋同族前沿评审，零异族核验；建议对 2–3 个承重结论（设计综合缺口、IR 只作候选、激活死锁）做一次异族抽查——本轨道已部分提供，GPT 侧对本评审的回评可构成互证 | §3.1 | [VRF]＋[DR] |
| F2-RES-002 | REPAIR_RECOMMENDED | 研究不绑定决定：建议建立"研究→决定登记表"（每题：影响哪个决定、期望证据、到期处置、有效期）；先把 DR-10 的 9 题与 DR-13 的迁移对账补登记 | §3.2–3.3 | [VRF]＋[DR] |
| F2-RES-003 | NON_BLOCKING | 可移植性缺口：283 不透明引用、DR-06/07 任务书缺、DR-06–15 无表面记录、DR-06 图缺；补救需回原对话，由 Owner 决定值不值 | §3.5 | [VRF] |
| F2-RES-004 | OBSERVATION | 研究建议按团队规模写，单 Owner 可行性未评估；作为第 ② 段的显式输入 | §3.4 | [MI] |

同族局限：对 GPT 族研究链的评审为跨族单模型意见；§2 抽样未通读全部 900KB，未抽样的报告以其 intake review 为准。
