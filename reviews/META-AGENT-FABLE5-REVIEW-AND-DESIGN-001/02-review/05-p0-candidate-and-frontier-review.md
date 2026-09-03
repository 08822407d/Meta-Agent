# 专题 05 · P0 候选（静态设计一致性 MVI）、前沿评审与修订契约

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

## 1. 对象 [VRF]

- candidate-spec-draft-2026-08-05.md（635 行）：离线静态验证器——一份规范性 design.yaml（8 个顶层对象、约 40 字段族）→ 规范化 JSON → 结构/真相/工作流/权限/来源/能力映射六类 21 个错误码 → 8 个 fixture（3 正 5 负）→ A01–A10 验收。
- frontier-review-2026-08-06.md：scope ACCEPT；implementation FAIL_REVISION_REQUIRED；F-01…F-10 阻塞项；N-01…N-04 非阻塞。
- revision-contract-v0.2.yaml：10 项 closure；required_package 12 文件（schema/design.schema.json、4 份 contract、3 份 fixture 清单、acceptance-checks、spec v0.2、README、contract 本身）。
- 状态：27 天无动作。

## 2. 技术质量 [MI]

前沿评审的 F-02（规范字节序列化未定义）、F-04（可达/终止语义）、F-05（权限比较不可判定）、F-06（新鲜度类型）、F-07（fixture oracle 过宽）、F-08（run-summary 例外）都是**真实且致命**的验证器规范缺陷；纠正方向正确。作为一份"如何把 YAML 设计文件做成可机械检查"的规范评审，它是高质量的。

## 3. 方向质量 [MI]——这是本专题的重点

问题不在"做得对不对"，在"该不该先做这个"。

| 视角 | 观察 |
|---|---|
| 它测什么 | "一个设计序列化能否被确定性规范化并检查 8 个结构不变量"——测的是**未来 IR 的地基**（DR-08/DR-09 线） |
| 它不产出什么 | 任何真实项目的任何设计。fixture 是合成的；三个正例共享一个合成 problem frame |
| 它需要什么才能跑 | 12 文件规格包 →（再一次前沿评审）→ Owner 实施授权 → 验证器实现（代码）→ 离线运行 → 结果评审 → Tier-0 决策包。按仓库自身的门禁，至少 4 个 Owner 门、3 个任务号 |
| 它与 Owner 目标的距离 | Owner（B、D）：用真实需求实测；让 Meta-Agent 规划 MyOS2。静态 MVI 完成后，Meta-Agent 仍不会规划任何东西 |
| 与研究共识的关系 | DR-10（产品核心缺口＝设计综合方法，表示中立、**不依赖 IR**）与 DR-13（repository-first manual 是有效基线）都指向"先手工走一遍方法"，而 P0 选了 IR 工具链一侧 |
| 选择过程 | active-context 08-05 记 P0 为"select_one_minimum_offline_prototype_scope"——在候选中选了"最小可机械验证"的，而不是"最小可产生真实价值"的；选择由 ChatGPT 会话作出、同族前沿评审 ACCEPT，Owner 未见有决定记录 [UNK] |

[MI] 换句话说：P0 优化的目标函数是"可确定性验收"，Owner 的目标函数是"能用在我的项目上"。两者不冲突，但顺序反了：先做手工 Frame-to-Design 一例（零代码、零激活、candidate-only），既验证 DR-10 方法，又为 IR 提供真实字段需求；静态 MVI 的 8 个不变量可以先作为**人工检查单**用在这一例上。

## 4. 细节问题

| # | 观察 | 级别 |
|---|---|---|
| 4.1 | fixture 编号 N01–N05 与前沿评审非阻塞项 N-01–N-04 在同一包内撞名 | NON_BLOCKING |
| 4.2 | revision contract 的"candidate-only"标签掩盖了规格包的工程量：JSON Schema ＋ 4 份契约（规范化、图/终止、权限代数、来源/后端映射）是数周级设计工作；候选≠小 | NON_BLOCKING |
| 4.3 | candidate-spec §11 与 README 的 Tier-0 前置含"non-FABLE health review dependency reconciled" | 见 F2-DEP-001 |
| 4.4 | 8 个 fixture 中 P02"strong single agent"的"strong"无定义（N-03 已指出） | 已由前沿评审覆盖 |
| 4.5 | 草案 §5 的字段集（roles/contracts/workflow/state/actions/provenance/capability_mapping/evaluation_hooks）与 DR-10 的最小档案内容模型高度重叠——两者未对齐，之后会出现"档案字段"与"IR 字段"两套词表 | OBSERVATION |

## 5. Findings

| ID | 级别 | 一句话 | 证据 | 类别 |
|---|---|---|---|---|
| F2-P0-001 | REPAIR_RECOMMENDED（方向） | 首个原型选错了先后：建议先做"手工 Frame-to-Design 一例"（MyOS2 接管清单第 4 项或真实需求 A/B 之一；candidate-only；不写代码；把静态 MVI 的 8 个不变量当检查单），静态 MVI v0.2 规格包退为其后的可选项；由 Owner 决定 | §3 | [MI]＋[DR] |
| F2-P0-002 | NON_BLOCKING | 编号撞名（N01–N05 vs N-01–N-04）；"candidate-only"标签低估工程量；档案字段与 IR 字段两套词表风险 | §4 | [VRF]＋[MI] |
| F2-P0-003 | OBSERVATION | 前沿评审在验证器语义上质量高，但 scope ACCEPT 是同族判断；本专题的方向异议即其跨族对照 | §2 | [MI] |

同族局限：本专题的"方向反了"是单模型判断，且本会话与 DR-10 报告同为"方法优先"倾向，可能存在偏好一致性偏差；Owner 可要求 GPT 侧回评。
