# 专题 06 · 产品核心缺口：设计综合、零用例、行为指导、记忆系统与激活死锁

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

## 1. P0-1 … P0-4 的现状 [VRF]

| gap analysis 的 P0 缺口 | 研究覆盖 | 当前状态 |
|---|---|---|
| P0-1 自动化设计搜索 | DR-06 | 研究结论：**推迟**；候选 CAND-CONSTRAINT-PRESERVING-SEARCH 挂起 |
| P0-2 Meta-Agent 专属基准/消融 | DR-09 | 协议成文（数百小时量级）；无 fixture、无运行、Tier-0 未授权 |
| P0-3 可移植设计 IR | DR-08 | ADOPT_FORMAL_IR_AS_CANDIDATE；P0 静态 MVI 是其第一步（专题 05） |
| P0-4 元级安全 | DR-07 | 威胁模型成文；13 个对抗测试族候选；无实现 |

四个 P0 缺口在 15 份研究后全部停在"候选"。真正被三次独立识别的产品核心缺口不是这四个，而是 **设计综合方法**（gap analysis §6、DR-06/07 §4、DR-10 全篇）：

```text
approved problem frame → coherent design → alternatives & strong baselines → dossier → review/experiment
```

它被识别三次、被行动零次（F2-CORE-004）。

## 2. 激活死锁 [VRF]＋[MI]

仓库规则链：
1. cases ledger §8："Do not add a real case until the Meta-Agent v0.1 package is operationally accepted and a specific … case scope is authorized."
2. approved-spec §1 activation_requires："applicable_health_review_P0_P1_equivalent_findings_checked_or_explicitly_deferred" ＋ "exact_operational_or_bounded_pilot_scope_and_acceptance_stop_rollback_criteria"。
3. P0 README required_before_Tier_0_package："deterministic_fixture_results、clean_rebuild、review_burden_measurements、non_FABLE_health_review_dependency_reconciled…"。
4. health review 无主（D-04）。
5. 唯一安全下一步 = P0 v0.2 规格包（不产出用例）。

推论：**在现有规则下，不存在一条从"inactive 基线"到"第一次真实使用"的路径**——用例要等激活，激活要等试点证据，试点证据要等 Tier-0，Tier-0 要等 MVI 结果与一个无主的外部评审。Owner 的真实需求于是绕开了 Meta-Agent：MyOS2 分析规划由 Mnemosyne 会话代做（08-31/09-01），留下 5 项"留给 meta-agent"的接管清单；真实需求 A/B 在 Mnemosyne 门 3 被 Owner 挂起等 Meta-Agent。

这不是安全规则本身错了（不隐式激活、不碰私有材料都对），而是规则集里缺一个**"候选只读试用"通道**：Meta-Agent 以候选方法、在 Owner 视线内、对公开/合成或 Owner 明示允许的材料、不激活、不写目标仓库地"做一次设计"，产出作为 candidate-only 证据入 cases ledger。研究链自己也提到了这条通道（DR-06/07 §6 tier_1_proposal_only_design_synthesis：side_effects none；DR-13：repository-first manual 是有效基线），但没落成规则。

## 3. 首个真实用例的候选 [VRF]＋[DR]

| 候选 | 来源 | 适配度 [MI] |
|---|---|---|
| MyOS2 接管清单第 4 项："需求⑤（学习 agent 组）正式设计，009 预研为其证据输入" | Mnemosyne target-projects/myos2 §4 | **最高**：正是"为一个具体需求设计 agent 组"；输入（009 预研）已在路上；公开仓；Owner 已表达期待（D） |
| MyOS2 接管清单第 1 项：第二波交叉综合 → 学习主攻清单 | 同上 | 中：更像分析任务而非 agent 设计 |
| 真实需求 A（工作代码库）| Mnemosyne 门 3 | 低（现在）：涉私有材料，触 MA-REQ-0009/MA-PEND-0005 |
| 真实需求 B（外语教师/陪练）| 同上 | 中：个人学习数据敏感；可先做合成/去敏版 intake |
| Meta-Agent 自己（为本仓设计行为守则与记忆布局）| 本轨道 | 中：自举用例，同族自证风险，但零材料风险 |

## 4. 行为指导缺位 [VRF]

authority map known_limits 自认 `Meta_Agent_owned_behavior_guidance_not_yet_adopted`；退役 guard 之后仓内无任何面向 agent 的行为文件；MA-METHOD-0006 定义了接收序列但没有可执行的启动文件；spec §9 的写入规则无预检载体；Owner 的输出偏好（G-7）无处登记。本轨道能安全进入完全依赖 Owner 手写的工作令——这不可复用。N-17 说规范库将来迁到 Meta-Agent，那么 Meta-Agent 至少需要"自己的最小守则"作为接收容器。

最小守则（候选内容，供 Q6 决定后起草）：启动/接收协议（把 0006 落成可执行清单）、写入预检五步与尾注、回复双频道规则（人话回复 / 文件承载仪式）、证据类别标签、目的核查（每轮"对 Owner 目标推进了什么"）、材料边界指针。

## 5. 记忆系统 [VRF]＋[MI]

- 状态：deferred_to_separate_post_migration_Owner_review；Mnemosyne 侧有 Fable 族候选设计（25 节）与采纳/验证方案（同族，本轨道不评其内容）。
- Meta-Agent 的"记忆"目前就是仓库布局本身：232 文件里 92% 是研究链载体；产品规范性内容不足 60KB；handoff 用 10 件必读把新会话导向正确文件——这是**靠导航纪律弥补信息架构**。
- Owner 消息三给了记忆系统的定义（一组提示词/行为约束/记录方案/文件组织）；按此定义，Meta-Agent 的记忆系统 ＝ 行为守则（§4）＋ 记录方案（Owner 原话/需求登记/研究→决定登记/案例账）＋ 文件组织（耐久核心 vs 可再生层）。这三者在本评审里分别对应 F2-GUIDE-001、F2-CORE-002/F2-RES-002、F2-GOV-002——记忆系统不必另起炉灶。

## 6. Meta-Agent ↔ Mnemosyne 边界 [MI]

- Mnemosyne：为具体 agent 设计持久记忆系统（Owner 消息三）；同时是 Meta-Agent 的谱系源与方法源；行为规范库暂居于此（N-17）。
- Meta-Agent：为具体项目设计 agent 组织（含记忆结构，MA-REQ-0004）。
- 交叉：Meta-Agent 设计的 agent 的记忆系统由谁设计？Meta-Agent 自己的记忆系统由 Mnemosyne 设计（候选已存在）还是自设？规范库迁移后 Mnemosyne 还剩什么？平台事实（platform-guides）归谁？
- 两仓都没有回答。这是第 ③ 段必须由 Owner 说清的问题（F2-CORE-003）。

## 7. Findings

| ID | 级别 | 一句话 | 证据 | 类别 |
|---|---|---|---|---|
| F2-CORE-001 | **BLOCKING（方向）** | 激活死锁：现有规则下不存在从 inactive 基线到第一次真实使用的路径；唯一下一步不产出用例；Owner 的真实需求已绕开 Meta-Agent。须由 Owner 决定开一条"候选只读试用"通道或改道，其他改进才有意义 | §2 | [VRF] 规则链＋[MI] 死锁判断 |
| F2-CORE-004 | OBSERVATION | 设计综合方法缺口被识别三次、行动零次 | §1 | [VRF] |
| F2-GUIDE-001 | REPAIR_RECOMMENDED | 起草"Meta-Agent 行为守则 v0.1（候选，不生效）"作为规范库迁入前的最小容器 | §4 | [VRF]＋[DR] |
| F2-DEP-001 | REPAIR_RECOMMENDED | non-FABLE health review 依赖：给它 owner/范围/期限，或显式作废，或改为"pilot 前一次有界健康检查" | §2 第 4 条；台账 D-04 | [VRF]＋[DR] |

同族局限：§2 的"死锁"是对规则文本的推断，不是对 Owner 意图的推断——Owner 随时可以用一句授权打破它；本专题的价值在于指出"需要那一句"。
