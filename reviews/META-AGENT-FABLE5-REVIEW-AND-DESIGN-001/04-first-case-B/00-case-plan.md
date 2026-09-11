# 首个真实用例 B · 用例计划（候选只读试用）

```yaml
track_id: META-AGENT-FABLE5-REVIEW-AND-DESIGN-001
record_type: first_real_case_plan
case_label: CASE-B-LIBRARY-EXTRACTION-WORKFLOW   # 非稳定编号；MA-CASE 编号由 Owner 定
created_by_task: META-AGENT-FABLE5-REVIEW-AND-DESIGN-001
generated_by_actor: claude-fable-5.1
generated_on_surface: claude-code-vscode
date: 2026-09-06
base_master_sha: 1fdbd7af9437f72f7c8106714ad1e64908983fb7
evidence_class: DIRECT_OWNER_INSTRUCTION（边界）/ DESIGN_RECOMMENDATION（计划）
authority_level: candidate_only_trial_use   # Owner 补充 #7 允许；不启用 Meta-Agent、不发稳定编号、不写目标仓库
owner_decisions: 补充 #7（首例 = B；允许试用）；09-continuation/05
method_basis: MA-DR-10 Frame-to-Design 档案循环（候选方法，非已接受方法论）；比例档 = Lite
public_safety_rule: 本目录（公开仓）只放不含业务内容的设计与模板；含业务细节的产物放 Owner 本机 Downloads 私档
```

## 1. 这个用例要回答的问题（人话）

你有二十来个同一类型的桌面数据处理小工具，每个项目的需求文档末尾都已经由编码 agent 写了一节"哪些能力可以抽成公共库"。现在缺的不是再识别一遍，而是：**谁来把这十份清单合并、按什么规则判断该不该进公共库、由谁拍板、拍板后怎么变成能交给编码 agent 的任务、做完怎么回收经验。** 用例 B 就是让 Meta-Agent 按它的候选方法，为这条流程设计一套 agent 分工与工作流，并把第一步（合并十份清单）实际跑一遍作为方法试跑。

Meta-Agent 自己被检验的是：它的"从需求到设计"方法能不能在真实材料上产出一份你看得懂、能直接用的设计，而不是又一份规范。

## 2. 边界

| 项 | 规定 |
|---|---|
| 状态 | 候选只读试用（Owner 补充 #7）。Meta-Agent 仍 inactive；本用例不构成启用。 |
| 读 | JobSpecific 私有仓（只读克隆于本机临时目录）；Meta-Agent 仓；Mnemosyne 只读。 |
| 写 | 只写本轨道目录（公开、不含业务）与 Owner 本机 Downloads（私档）。不写 JobSpecific、不写公共库仓库。 |
| 编号 | 不发 MA-CASE/MA-FEEDBACK 稳定编号；用例标签为临时。 |
| 产物入账 | 结果以候选证据形式记入本轨道；正式进 cases ledger 需 Owner 另授权。 |
| 模型分工 | 本会话（前沿档）做设计与判断；计划里标出哪些步骤将来可交次一档模型。 |

## 3. 输入

- 10 份"当前版本完整需求"文档各自的"可抽取为公共库"节（私有）；1 份跨项目 agent 工作流复盘（私有）。
- 各文档"自研库复用原则/内部依赖"节里对现有公共库（三个 legacy 库 + 一个栅格库）的描述（私有）。
- Owner 2026-05-12 的构想（中立需求规格 → 公共库/CLI/DSL；测试套件生成；权属隔离；两条产品线）——私档 S-00。
- Owner 2026-08-30 消息二（代码类 agent 的记录清单；从项目需求记录中找线索形成自用代码库）。
- 方法依据：MA-DR-10 的阶段门、停止条件、最小档案内容模型、基线阶梯；Mnemosyne 反模式清单。

## 4. 产物

| 产物 | 位置 | 内容 |
|---|---|---|
| 01-design-dossier.md | 本目录（公开） | agent 组织设计档案：问题框架、需求、最简可行设计与基线阶梯、角色与阶段、记录与真相源、权限、人类决策点、评估与假成功检查、备选方案、风险、未决问题、处置 |
| 02-templates.md | 本目录（公开） | 跨项目候选登记表 schema、决策包模板、派生任务书模板（合成示例） |
| 私档 · 跨项目公共库候选汇总 v0.1 | Owner 本机 ~/Downloads/startup-packages-2026-09-02/receipts/ | 第一步"合并十份清单"的实际试跑结果：能力族、出现项目数、现有库对应与缺口、层次、参数化项、不应抽取项、风险标记；供门 G1 的决策包草案 |

## 5. 阶段与门（对应设计档案 §7）

S1 汇总（本用例实际执行）→ S2 归并与评估（本用例实际执行，产出决策包草案）→ **门 G1：Owner 决定哪些能力族进公共库、进哪一层** → S3 派生任务书 → **门 G2：Owner 授权在公共库/项目仓库执行** → S4 回收 → S5 反馈与教训。本用例做到 S2 为止；G1 由 Owner 在方便时拍板，不催。

## 6. 成功判据（预先定，不事后改）

1. 设计档案能被 Owner 不借助本会话上下文读懂（守则第 3 条）。
2. 私档汇总表每一行都能追溯到某份需求文档的具体小节；覆盖全部 10 份文档的公共库节，无遗漏。
3. 决策包草案每题带背景/意思/后果，且 Owner 用 ≤30 分钟能答完。
4. 本用例过程中 Owner 触碰次数 ≤ 1（即 G1）。
5. 试跑暴露的方法缺陷如实记入 §8 而不是掩盖。

## 7. 与 Meta-Agent 自身的关系

- 这是 Meta-Agent 首次对真实需求产出设计；结果用于第 ⑤ 段独立设计时校准"方法到底该长什么样"。
- 用例中出现的"仓库内 agent 上下文模板"一类候选属于 Meta-Agent/Mnemosyne 的职责而非代码公共库，将路由回本轨道原候选 A。
