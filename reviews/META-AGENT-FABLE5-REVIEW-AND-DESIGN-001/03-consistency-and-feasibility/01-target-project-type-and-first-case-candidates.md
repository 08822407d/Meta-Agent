# 目标项目类型刻画与首个真实用例候选

```yaml
track_id: META-AGENT-FABLE5-REVIEW-AND-DESIGN-001
record_type: target_project_type_and_first_case_candidates
created_by_task: META-AGENT-FABLE5-REVIEW-AND-DESIGN-001
generated_by_actor: claude-fable-5.1
generated_on_surface: claude-code-vscode
date: 2026-09-06
base_master_sha: 1fdbd7af9437f72f7c8106714ad1e64908983fb7
evidence_class: VERIFIED_REPOSITORY_FACT（JobSpecific 只读克隆 @4baaed7 2026-09-04）/ MODEL_INFERENCE（刻画与候选）
authority_level: non_execution_source_advisory
authorization: Owner 补充 #3 Q1（目标项目类型来源 = JobSpecific/需求整理；不用 MyOS2）
public_safety_rule: JobSpecific 为私有仓库；本文件只写类型层面的刻画（技术栈、结构、文档惯例、数量），不写业务内容、文件名与数据细节；详细笔记存本机私档
```

## 1. 这类项目长什么样（人话）

你指的"具体开发需求和代码库项目"，看了 JobSpecific 后是这样的：

- **一个人写的、面向 ArcGIS 兼容数据的桌面批处理小工具**：C# WinForms，ArcObjects/ArcEngine（x86、COM），处理矢量/栅格数据的质检、改名、填元数据、合并、接边、几何修正之类；数据量大、要无人值守、单条坏数据不能中断整批、要留可追查的输出。
- **数量**：源码目录下 21 个项目；"需求整理"下 11 份"当前版本完整需求"文档（每份 3–14 万字），外加 1 份跨项目的 Agent 工作流复盘（2026-08-28）。
- **你已经在做的记录实践**（这正是你 8 月 30 日说的"代码开发类 agent 要记录需求/方案/环境/bug"的现实版本）：
  - 每个项目一份 AGENTS.md；部分项目有 docs/task-context/{requirements, project-facts, worklog} 三件套；
  - 需求文档结构统一（文档定位 / 项目目标与业务范围 / 技术与运行约束 / 界面交互 / 业务规则 / 异常与降级 / 构建发布 / 待确认），并给每条要求打来源标记：**用户明确需求 / 代码反推 / 当前实现事实 / 待确认 / 复用分析建议**，来源冲突时有优先级；
  - 需求文档明写"为后续跨项目梳理常见业务、识别可沉淀到公共库的能力提供依据"——这与你 5 月 12 日"中立需求规格 → 公共库/CLI/DSL"的构想一脉相承；
  - 复盘文件把一次真实返工总结成了：先写不变量再写算法、计划/稳定化/物化分阶段、编码前设计门＋代码冻结门、分层测试矩阵、持久记录策略（requirements 记"应该怎样"、project-facts 记"现在怎样"、worklog 记过程）、多 agent 分工时机。**这就是一条已经成形的"项目反馈 → 抽象教训"，正是 Meta-Agent 该吃的第一口粮。**

[MI] 结论：这类项目是"小、多、同构、单人、有真实交付压力"的软件项目；Meta-Agent 在这里最有价值的不是给单个项目写代码，而是**把 21 个同构项目的重复流程做成可复用的 agent 工作流与记录方案，并把复盘教训沉淀成方法**。这与 MyOS2（大型内核分析、学习型、无交付压力）确实不是一类。

## 2. 首个真实用例候选（人话，供你选）

| 候选 | 一句话 | 输入已有？ | Meta-Agent 产出什么 | 大小 | 风险 |
|---|---|---|---|---|---|
| **C-A 同类小项目的标准 agent 工作流** | 以复盘文件为反馈输入，为"JobSpecific 类小项目从需求到交付"设计一套可复用的 agent 分工与工作流（岗位、门、记录方案、人工裁决点），不写代码 | 是（复盘＋11 份需求文档的结构） | 一份"工作流设计档案"＋一份可直接放进项目的 AGENTS.md 模板草案 | 小 | 低：不碰源码、不碰数据 |
| **C-B 公共库抽取的 agent 工作流** | 为"从 11 份需求文档中识别重复模式 → 决定哪些进公共库 → 派生实现/测试任务"设计 agent 组织 | 是（11 份需求） | agent 组织设计＋第一轮模式识别结果（作为方法的试跑） | 中 | 中：模式识别本身需要读业务细节，产出须留在私有仓 |
| C-C 外语教师/陪练 agent | 你的需求 B | 否（需 intake） | 后置 | 中 | 涉及个人学习数据 |

推荐 **C-A 先做，C-B 第二**：C-A 有现成的反馈材料、零数据风险、产出能马上用到下一个小项目上；C-B 需要读业务细节，其产物应放在 JobSpecific 私有仓而不是 Meta-Agent 公开仓。

## 3. 做 C-A 时的边界（提前说清）

- Meta-Agent 仓（公开）只放**设计档案与模板**，不放 JobSpecific 的业务内容；模板里出现的例子用合成样例。
- 真正的 AGENTS.md 与记录文件，由你决定是否放进 JobSpecific；Meta-Agent 不写那个仓库。
- 这一例按"候选只读试用"做：不激活 Meta-Agent、不发稳定编号、结果记入 cases ledger 作候选证据——前提是你同意开这条通道（人话版说明见 09-continuation/04）。
