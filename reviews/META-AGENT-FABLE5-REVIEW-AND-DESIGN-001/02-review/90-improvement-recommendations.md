# 改进意见（第 ① 段交付；分级、成本、依赖、Owner 决定点）

```yaml
track_id: META-AGENT-FABLE5-REVIEW-AND-DESIGN-001
record_type: improvement_recommendations
created_by_task: META-AGENT-FABLE5-REVIEW-AND-DESIGN-001
generated_by_actor: claude-fable-5.1
generated_on_surface: claude-code-vscode
date: 2026-09-03
base_master_sha: 1fdbd7af9437f72f7c8106714ad1e64908983fb7
evidence_class: DESIGN_RECOMMENDATION   # 每条引用的事实见各专题与阶段 1 台账
authority_level: non_execution_source_advisory
adoption_gate: 不生效、不采纳；每条修复都须 Owner 批示并另立任务；本轨道不改任何既有文件
cost_scale: S（一次会话内、≤1 次 Owner 批示）/ M（一个任务号、1–2 次批示）/ L（多任务或需外部输入）
```

## 0. 一句话

Meta-Agent 仓**没有坏掉的东西**，有的是**走不通的路**：治理把"不出错"做到了极致，却没给"第一次真正用起来"留门。改进意见的核心只有一条——开一条候选只读试用通道，拿一个真实需求手工走一遍设计方法；其余都是让这条路走得更省的配套。

## 1. 六个修复束（按优先级）

### 束 1 · 方向：从"再写一份规格"改为"先用一次"（F2-CORE-001、F2-P0-001、F2-CORE-004）

- 建议：在 active-context 增设**第二条安全下一步**——"候选只读试用"：Meta-Agent 以候选方法（Frame-to-Design 档案循环，DR-10）对一个 Owner 指定的真实需求出一份设计档案；条件：不激活、不写目标仓库、不碰私有原件（用公开/合成/Owner 明示允许的材料）、产出入 cases ledger 作 candidate-only 证据、静态 MVI 的 8 个不变量作为人工检查单附在档案后。
- 首例候选：MyOS2 接管清单第 4 项（学习 agent 组设计）；备选：真实需求 B 的去敏 intake。
- 静态 MVI v0.2 规格包：退为束 1 完成后的可选项，用首例的真实字段需求校准其 schema。
- 成本：规则改动 S（一句话进 active-context，须 Owner 授权）；首例 M（一个任务号，本轨道后段或新会话）。
- 依赖：Owner 决定（决策清单 Q1、Q2）。
- 为什么是 BLOCKING：其他所有改进在"永远用不上"的前提下都没有回报。

### 束 2 · Owner 原话与需求基线（F2-CORE-002、F2-CORE-003、F2-CORE-005）

- 建议：(1) 在仓内建立 Owner 原话逐字登记（先从 Mnemosyne 已有的 08-22/08-30/08-31 三处原话与本轨道工作令/补充复制，标出处与日期）；(2) 对 16 条需求逐条标"Owner 出处 / GPT 抽象 / 待确认"，把 0005、0011 提交 Owner 一句话定；(3) 把 G-3（Owner 输入分级）、G-4（研究绑定决定、沟通不可行）、G-5（新模型触发重评）、G-7（输出方式）、G-9（规范库的家）写成候选需求，编号由 Owner 定；(4) Meta-Agent↔Mnemosyne 边界作为第 ③ 段问题。
- 成本：M（本轨道第 ②/③ 段即是）。
- 依赖：Owner 允许从 Alaya 抽取原话（Q7）。

### 束 3 · 治理减重与自我执行（F2-GOV-001、F2-GOV-002、F2-GOV-003、F2-GOV-004、F2-PROC-001、F2-LANG-001）

- 建议：(1) 一个 canonical 状态文件承载全套授权/否认状态，其他文件改为一行指针（现有 README/MIGRATION-STATUS/active-context 三处重复先合一）；(2) 按 WAVE-CAND-PROPORTIONAL-ASSURANCE 定义两档：**轻量档**（candidate-only、路径隔离、本地表面、五步预检、四行尾注、每轨道一 Draft PR、每阶段 ≤1 次 Owner 批示）与**标准档**（现行）；(3) 写入规则要么以预检清单自我执行（本轨道示范），要么降为建议；(4) 优先级双轨、role 词表、版本号：选"用起来"或"简化掉"，不留半用状态；(5) 面向人的文件（决策包、报告、README 首段）中文优先、面向模型的规则可英文但带中文摘要头。
- 成本：案文起草 M；应用另需 Owner 逐条批。
- 依赖：Q5 预倾向。

### 束 4 · 失效纪律与路径同步（F2-FRESH-001…004、F2-DEP-001）

- 建议：一次"迁移收口补遗"任务：`git grep target-projects/meta-agent` 全清（历史类加仓库@提交前缀、操作类改相对路径）；13 处状态字段刷新并加 `status_as_of`/`superseded_by`；safe_next_action 改指向 revision-contract；退役交接件标 retired；MA-PEND-0001–0008 正文迁入并加状态；health review 依赖三选一（作废 / 指定人与期限 / 改为 pilot 前有界检查）。
- 成本：S–M（机械性强，一个任务号）。
- 依赖：Q3（health review）。

### 束 5 · 研究→决定闭环（F2-RES-001…004、F2-CAND-001）

- 建议：建"研究→决定登记表"（每题：影响哪个决定、期望证据、到期处置、有效期、被取代者）；先登记 DR-10 的 9 题、DR-13 迁移对账、31 候选的处置（专题 07）；对 2–3 个承重结论做一次异族抽查（GPT 回评本评审即可算一次）；可移植性缺口由 Owner 决定是否回原对话补救。
- 成本：登记 S；异族抽查 M（需 Owner 发射）。
- 依赖：Q6。

### 束 6 · Meta-Agent 行为守则 v0.1（候选）（F2-GUIDE-001 ＋ 束 3 的轻量档 ＋ 束 2 的输出偏好）

- 建议：起草一份不生效的守则：启动/接收协议（MA-METHOD-0006 落成清单）、写入预检与尾注、回复双频道、证据类别标签、目的核查（每轮一行"对 Owner 目标推进了什么"）、材料边界指针、Owner 输入分级规则、PROCEED/VERIFY/ASK/ABSTAIN/ESCALATE 词表。作为 N-17 规范库迁入前的容器。
- 成本：M。
- 依赖：Q4。

## 2. 全部 30 条发现索引

| ID | 级别 | 一句话 | 修复方向 | 成本 | 依赖 | 需 Owner 决定 |
|---|---|---|---|---|---|---|
| F2-CORE-001 | **BLOCKING** | 激活死锁：无从 inactive 到首次真实使用的路径 | 束 1 | S+M | — | **是**（Q1、Q2） |
| F2-P0-001 | REPAIR | 首个原型选了 IR 地基而非真实设计一例 | 束 1 | M | CORE-001 | **是**（Q1） |
| F2-CORE-002 | REPAIR | Owner 原话未入库；5 项目标无需求覆盖；0005/0011 无出处 | 束 2 | M | Q7 | 是 |
| F2-GUIDE-001 | REPAIR | Meta-Agent 无自有行为指导 | 束 6 | M | — | 是（Q4） |
| F2-DEP-001 | REPAIR | health review 依赖无主 | 束 4 | S | — | 是（Q3） |
| F2-GOV-001 | REPAIR | 写入规则从未自我执行 | 束 3 | S | — | 否（案文即可） |
| F2-GOV-002 | REPAIR | 治理装置过重、分布式重复 | 束 3 | M | Q5 | 是 |
| F2-FRESH-001 | REPAIR | 100 处操作性旧路径；research/README 与 cutover 矛盾 | 束 4 | S | — | 否（授权任务即可） |
| F2-FRESH-002 | REPAIR | 无失效纪律；13 处过期状态；导航指向不存在文件 | 束 4 | S | — | 否 |
| F2-RES-001 | REPAIR | 单族研究＋同族裁定，零异族核验 | 束 5 | M | Owner 发射 | 是 |
| F2-RES-002 | REPAIR | 研究不绑定决定；DR-10 九题未登记；DR-13 未对账 | 束 5 | S | — | 是（Q6） |
| F2-PROC-001 | REPAIR | 建立轻量档工作通道与 Owner-touch 预算 | 束 3 | S | — | 是（Q5） |
| F2-GOV-003 | NON_BLOCKING | 优先级双轨；role 词表失控；§5 只覆盖 7/87 | 束 3 | S | — | 否 |
| F2-GOV-004 | NON_BLOCKING | 版本装置未用；0014 语义漂移无版本 | 束 3 | S | — | 否 |
| F2-FRESH-003 | NON_BLOCKING | MA-PEND 无定义无状态 | 束 4 | S | — | 否 |
| F2-FRESH-004 | NON_BLOCKING | 两条陈旧 accepted_limitations | 束 4 | S | 随 spec 修订 | 否 |
| F2-RES-003 | NON_BLOCKING | 引用可移植性缺口 | 束 5 | L | 回原对话 | 是（值不值） |
| F2-P0-002 | NON_BLOCKING | 编号撞名；candidate 标签低估工程量 | 束 1 | S | — | 否 |
| F2-CAND-001 | NON_BLOCKING | 31 label 处置建议 | 束 5 | S | — | 是（逐条准/改/驳） |
| F2-LANG-001 | NON_BLOCKING | 面向人的文件无中文层；Owner 输出偏好未登记 | 束 3/6 | S | — | 是（偏好确认） |
| F2-CORE-004 | OBSERVATION | 设计综合缺口识别三次行动零次 | 束 1 | — | — | — |
| F2-GOV-005 | OBSERVATION | 能力分工/次级模型从未发生 | — | — | — | — |
| F2-GOV-006 | OBSERVATION | 六法仅 0006 被执行 | 束 1 | — | — | — |
| F2-RES-004 | OBSERVATION | 研究建议按团队规模写 | 第 ② 段输入 | — | — | — |
| F2-P0-003 | OBSERVATION | 前沿评审技术质量高、方向同族 | — | — | — | — |
| F2-PROC-002 | OBSERVATION | PR #248 根因是写入表面 | 平台事实 | — | — | — |
| F2-PROC-003 | OBSERVATION | 过程:产品 ≈ 7:1 | 束 3 | — | — | — |
| F2-AP-001 | OBSERVATION | 反模式命中 9/16，四个根因 | — | — | — | — |
| F2-CORE-003 | QUESTION | Meta-Agent↔Mnemosyne 边界；规范库与平台事实归属 | 第 ③ 段 | — | — | **是** |
| F2-CORE-005 | QUESTION | "general-purpose"是否 Owner 意愿 | 第 ③ 段 | — | — | **是** |

计数：BLOCKING 1 / REPAIR_RECOMMENDED 11 / NON_BLOCKING 8 / OBSERVATION 8 / QUESTION 2。

## 3. 建议顺序 [DR]

1. Owner 答决策清单（99）中的 Q1–Q3（方向、通道、依赖）——其余问题可稍后。
2. 本轨道继续第 ②–③ 段（束 2），把 Owner 原话与需求登记做实，这是第 ⑤ 段独立设计的唯一合法输入。
3. 授权一个"迁移收口补遗"任务（束 4）——纯机械，可由任何会话做，与本轨道并行不冲突（路径无交集）。
4. 首例真实用例（束 1）在第 ③ 段之后启动，可与第 ④ 段研究并行。
5. 束 3、束 6 的案文随第 ⑤ 段独立设计一并交付（它们本来就是设计题）。

## 4. 不该改的东西（保留清单）

- 单一 target truth、无隐式激活、无私有材料入公开仓、候选不发稳定 ID——四条不变量在 232 文件中零次被破，是仓库的信用基础。
- fail-closed ＋ expected/observed ＋ 负面证据保留（DR-06/DR-09 的处理方式）。
- 迁移与研究传输的字节级可核纪律（本轨道 15/15、226/226 全部重放通过）。
- 事故处置纪律（新任务号、新分支、不改历史）。

## 5. 同族局限

全部由 claude-fable-5.1 单会话产出。对 GPT 族产物的评审为跨族单模型意见；束 1 的方向判断与 DR-10（GPT）结论一致但与 P0 选择（GPT）不一致——同一族内部也有分歧，说明这不是族间偏见而是路线选择。建议 Owner 让 GPT 侧对本文件回评一次（反模式 #14 的对冲）。
