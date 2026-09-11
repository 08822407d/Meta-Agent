# 专题 01 · Owner 目标 vs 需求基线（MA-REQ-0001–0016）与产品定位

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

## 1. 评审对象与方法

对象：approved-spec §2–§3（产品定位与 16 条需求）、M0 基线（Mnemosyne@8ef1c43）、研究共识（DR-01–05 synthesis §3、DR-06/07 §2、DR-08–15 convergence §3）。
对照物：Owner 关于 Meta-Agent 的全部可得原话（[DOI]）：
- A. 谱系起点（Owner 口述 2026-08-28，Mnemosyne 目标登记表 O-01）：为工作代码项目建一组 AI agent 做高度自动化开发 → 细化组织形式 → Meta-Agent 构想 → 上下文有限、交接麻烦 → Mnemosyne。
- B. 2026-08-22 门 3 批示："meta-agent 那边还没足够的建设和验证，两个具体需求得用来实测 meta-agent。"
- C. 2026-08-30 三条消息（Mnemosyne raw/owner-intent-records）：Owner 关注的是效果与目标而非实现；Owner 在 LLM 架构上的构想是猜想、在程序/库开发上的架构意见有权重；今后协作对话须对 Owner 输入分类分级；核心目标（交接、忠实记录需求与构想、逻辑/可行性分析、知道该做什么研究、沟通不可行、实验验证、新模型可用时回头重评、反馈全材料记录、定期测试）；代码类 agent 与学习类 agent 的记录清单；输出方式偏好；记录须能被 agent 利用；Mnemosyne 摸清"如何记录、如何简便套用"供 Meta-Agent 与项目 agent 套用；Mnemosyne 为具体 agent 设计"持久记忆系统"= 一组提示词/行为约束/记录方案/文件组织。
- D. 2026-08-31（工作令 §1.1 另一处）："这个任务（MyOS2 分析规划）原本计划是等 meta-agent 基本建成后由 meta-agent 来规划的。"
- E. 2026-08-31 N-17：行为规范库现集中于 Mnemosyne，Meta-Agent 成型后整体迁移。
- F. 2026-09-02/03 工作令与补充：复核/评审/独立设计；独立对照组；深度研究课题按平台特长分流。

[VRF] Meta-Agent 仓内没有任何一条 Owner 逐字原话（approved-spec §2 与 M0 §1 均为 GPT 会话转述）。以上 A–E 全部来自 Mnemosyne 仓，F 来自本轨道。

## 2. Owner 目标（会话归纳，[MI]，待第 ② 段登记表正式化）

| # | Owner 目标（人话） | 出处 |
|---|---|---|
| G-1 | Meta-Agent 拿到一个具体项目/需求，就能规划出该项目该用什么 agent 组织、怎么分工、怎么记忆与交接、用什么提示词与约束 | A、D |
| G-2 | 它要在真实需求上被实测（工作代码库 A、外语教师 B、MyOS2） | B、D |
| G-3 | 它要忠实记录 Owner 各阶段的需求原文与构想，并对 Owner 输入分类分级（目标 / 约束 / 观察 / 猜想 / 偏好） | C |
| G-4 | 它要做逻辑一致性与可行性分析，知道该做哪些研究，把不可行的原因讲给 Owner 听并给替代方案，对采纳与不确定的部分设计实验 | C |
| G-5 | 挂起的构想在新尖端模型可用时要回头重评；不追求一次做完美 | C |
| G-6 | 反馈连同材料完整记录、定期测试、按历史对话分析问题 | C |
| G-7 | 面向人的输出要人看得懂：操作清单置顶、正文无内部术语 | C |
| G-8 | 记录要能被 agent 用起来；套用要简便 | C |
| G-9 | 它将成为行为规范库的家 | E |
| G-10 | 由 Fable 与 GPT-Pro 在宽松条件下重新设计，作为独立对照 | C、F |

## 3. 16 条需求逐条对照

| ID | 需求要旨 | 对 Owner 目标的覆盖 | Owner 出处可追溯？ | 评注 |
|---|---|---|---|---|
| 0001 | 为具体目标设计 agent/workflow/方法 | G-1 ✓ | A、D（转述） | 核心，成立 |
| 0002 | 单/多 agent，多不是默认 | 工程原则 | 无 Owner 原话；Owner 起点是"一组 agent"（A） | 原则本身合理（研究共识 DR-02/06/10），但"多不是默认"是 GPT 侧价值判断；Owner 未表态 [UNK] |
| 0003 | 通用 ＋ 软件工程孵化 | G-1 部分 | A（工作代码）、C（代码类/学习类 agent 都提到） | Owner 的实际项目全是软件/系统/学习；"general-purpose"是 GPT 的抽象。QUESTION（见 F2-CORE-005） |
| 0004 | 设计内容含角色/工作流/记忆/交接/路由/评估/人类边界 | G-1 ✓ | C（记忆、交接、提示词、约束） | 成立 |
| 0005 | 减少重复劳动但保留 Owner 的学习/架构/工程/管理/高风险判断机会 | 无对应 Owner 目标 | **无**；Owner 起点是"高度自动化开发"（A） | 与 Owner 原话方向有张力：Owner 说"我不关心也不可能理解实现细节"（C 消息一），但又说程序领域意见有权重。0005 是否 Owner 意愿 [UNK] → 须 Owner 一句话 |
| 0006 | 反馈不能自动改写方法论 | G-6 ✓、O-02"两阶段：AI 起草人确认" | Mnemosyne 05-12 构想 | 成立 |
| 0007 | 七类材料可区分 | G-3 ✓（原文 vs 经检查内容） | C 消息三 | 成立；但仓内实际缺"Owner 原文"这一类的实例 |
| 0008 | v0.1 文件化、人审、无 RAG/MCP/自动回写 | 与 C 消息三"记忆系统＝提示词/约束/记录方案/文件组织"一致 | C | 成立 |
| 0009 | 公开仓只放安全材料 | 约束 | Mnemosyne 既定 | 成立 |
| 0010 | 稳定 ID/版本/迁移/回滚 | G-5 部分（可重评需可追溯） | 无直接原话 | 机制合理；实际使用度低（四个版本号从未变动，见专题 02） |
| 0011 | 按能力需求分工：前沿模型 vs 次级模型 vs 机械核验 | 无对应目标 | **无**；[MI] 源自 Mnemosyne 的模型能力规划 open question | 从未验证过任何次级模型；是否 Owner 意愿 [UNK] |
| 0012 | 案例只作有范围的证据 | G-6 ✓ | C | 成立 |
| 0013 | Owner 最终权威 | 约束 ✓ | 全部 | 成立 |
| 0014 | 唯一 truth source；Mnemosyne 不是第二个 | 约束 ✓ | — | 成立；但 Meta-Agent↔Mnemosyne 的**功能边界**（谁为谁设计记忆系统、规范库归属 E）两仓都没定义 → F2-CORE-003 |
| 0015 | 新会话可从 truth+context+handoff 恢复 | G-8 ✓、Mnemosyne 核心目标 | C | 成立；2026-08-05 回执与本轨道启动仪式各验证一次 |
| 0016 | 重要方法变更要证据/验收/回归 | G-6 ✓ | C | 成立 |

覆盖统计：16 条中 11 条有 Owner 原话或既定构想支撑；2 条（0005、0011）无 Owner 出处；3 条（0002、0003、0010）为合理工程原则但属 GPT 侧抽象。

## 4. Owner 目标中**没有任何需求覆盖**的部分

| Owner 目标 | 现状 | 缺口性质 |
|---|---|---|
| G-3 记录并分级 Owner 输入 | MA-METHOD-0001 第 1 步"preserve the user's wording"存在，但仓内 0 条原话；无分级制度 | **需求缺口 ＋ 实践缺口** |
| G-4 知道该做什么研究、沟通不可行、设计实验 | 研究由上一批报告的"推荐序列"驱动（专题 04）；无"研究绑定决定"的要求；无实验记录 | 需求缺口 |
| G-5 新模型可用时回头重评 | 无任何触发机制、无有效期字段 | 需求缺口 |
| G-7 输出方式 | 全部产品文件为英文 YAML 密集体；无面向人的摘要层 | 偏好未登记 |
| G-9 行为规范库的家 | Meta-Agent 自身无行为指导（D-03） | 需求缺口 |
| G-2 真实需求实测 | cases ledger 规定"操作接受前不加案例"；activation 又要 pilot 证据 | **结构性死锁**（见专题 06，F2-CORE-001） |

## 5. 产品定位评审

[VRF] approved-spec §2："long-lived, versioned, general-purpose Agent-design and methodology system"；DR-01："由人主导的代理设计与治理层"。
[MI] 这个定位与 Owner 的 A/D 相符，但把重心放在了"methodology system"而非"设计出可用的东西"。Owner 的原话（D）期待的是一个会**规划具体项目**的元 agent；仓库交付的是一个**管理自己如何被修改**的治理框架。两者不矛盾，但 27 天零动作、零用例说明当前重心偏向后者。

## 6. Findings

| ID | 级别 | 一句话 | 证据 | 类别 |
|---|---|---|---|---|
| F2-CORE-002 | REPAIR_RECOMMENDED | Owner 目标未以原话入库；G-3/G-4/G-5/G-7/G-9 无需求覆盖；0005/0011 无 Owner 出处 | 本文 §1–§4；台账 §7.5 | [VRF] 事实＋[MI] 缺口判断 |
| F2-CORE-003 | QUESTION | Meta-Agent 与 Mnemosyne 的功能边界未定义：谁为谁设计记忆系统；规范库归属（E）；平台事实归属（Mnemosyne platform-guides vs WAVE-CAND-CAPABILITY-CLAIM-REGISTRY） | MA-REQ-0014 解释段；N-17 | [MI] |
| F2-CORE-005 | QUESTION | "general-purpose"是否 Owner 意愿：Owner 的实际项目全在软件/系统/学习域，且 Owner 自认只在程序域有权重意见；v0.x 是否应显式收窄 | approved-spec §2；C 消息一 | [MI] |

同族局限：本专题对 GPT 族产物（spec、M0）的评审是跨族单模型意见；对 Owner 原话的归纳（§2）是本会话的转述，须在第 ② 段由 Owner 逐条准/改/驳。
