# 专题 02 · 规范与治理设计：内部一致性与成本收益

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

## 1. 评审对象

approved-spec §1、§4–§13；authority/source-and-owner-map.md；methodology/core-methodology.md；history/decision-version-and-migration-log.md；以及它们在 87 个正文文件中的落地方式。

## 2. 治理装置清单 [VRF]

| 装置 | 位置 | 规模 |
|---|---|---|
| 冲突优先级 | spec §6（9 级）；authority map §4（10 级） | 两份清单措辞与级数不同 |
| 来源类别 | map §3 | 12 类 |
| 材料类别 | spec §9、map §5–§6 | 允许 7 类 / 禁止 10 类 |
| 写入上下文最小集 | spec §9、map §7 | 8–11 字段 ＋ 6 条规则 |
| 变更类别 | history §8 | 5 类，各带最低门 |
| 版本号 | spec §11 | 4 个（design/schema/policy/delivery），全部 0.1.0 |
| 更新程序 | spec §12 | 7 步 |
| 激活门 | spec §1、§13 | 4 前置 ＋ 4 禁止的隐式过渡 |
| 能力分工 | spec §10 | 4 档 |
| 否认声明 | 几乎每个文件 | README 11 个 *_authorized:false；抽样 40+ 文件末尾含"does not authorize…"段 |

产品内容（§2 定位、§3 16 条需求、§7 方法引用、§8 促进规则）约 60 行；治理内容约 300 行；比例约 1:5。

## 3. 内部一致性

| # | 项 | 观察 | 级别 |
|---|---|---|---|
| 3.1 | spec §6 与 map §4 的优先级清单 | 级数不同（9 vs 10）；map 多出"activated spec for operational scope after activation"一级并把 approved_target_change_manifest 与 MA-DEC 分列；spec 把 handoff/active-context 放在 evidence 之上、map 相同——语义一致，文本双轨 | NON_BLOCKING |
| 3.2 | artifact_role 词表 | 87 个正文文件的 artifact_role 值约 40 种、自由文本（如 `per_report_evidence_adjudication`、`non_execution_phase_boundary_and_handoff_readiness_decision`）；spec §5 只给 7 个文件定义角色；map §9 只定义 5 个 role_labels | NON_BLOCKING：角色是治理的关键变量却无受控词表 |
| 3.3 | MA-REQ-0014 | 需求文本不变、语义经"cutover 解释段"改变（Mnemosyne 从"design archive/control plane"变为"historical bootstrap only"）；spec §3 自身规定 ID 不得"semantically changed"——这次改变是显式的但无版本变动 | NON_BLOCKING/QUESTION：稳定 ID 的语义漂移应记 version 还是 mapping？ |
| 3.4 | cutover 的 policy 追加 | §6 新增一级、§9 新增两条规则、known_limits 新增一条——按 §11 的定义属 policy_version 范围，却记 version_change none | NON_BLOCKING（与 3.3 同根：版本装置与实际操作脱节） |
| 3.5 | §9 写入规则 vs 仓库自身写入 | 规则要求每次写入带 task_id/actor/surface/authorization/preflight；仓库 37 个提交 0 尾注、无 run-context 文件、PR 描述无 execution_context 块；PR #248 事故正是"PR 描述≠合并内容"无机械核验 | **REPAIR_RECOMMENDED**：规则从未对自己生效 |
| 3.6 | §10 能力分工 | "validated_next_tier_execution"从未有任何次级模型被验证或使用；所有工作由前沿模型完成 | OBSERVATION |
| 3.7 | §13 激活前置"applicable health review findings checked or deferred" | 依赖无主（台账 D-04） | 见 F2-DEP-001 |
| 3.8 | methodology 六法 | 仅 0006（交接）被实际执行过两次（08-05 回执、本轨道）；0001–0005 无应用实例；0004 的 source_refs 引用 Mnemosyne 的 open question | OBSERVATION |
| 3.9 | history §8 变更类别 | MA-DEC-0007 记为 Class 3、MA-DEC-0008 记为 Class 3/4：分类被使用；但 Class 3 要求的"frontier_review"在 0008 无记录（Owner 直接授权） | OBSERVATION |
| 3.10 | 三处"唯一"声明 | spec §1、map §2、README 一致；research/README.md 仍称旧路径为唯一 truth（专题 03） | 见 F2-FRESH-001 |

## 4. 成本收益

**收益（[VRF] 已兑现）**：治理的三个核心不变量——单一 truth、无隐式激活、无私有材料——在 232 文件、5 个 PR、一次事故、一次迁移中零次被突破；证据、候选、真相三层从未混淆；迁移做到了字节级可核。

**成本（[VRF]＋[MI]）**：
1. 每个新产物都要重复整套否认声明，导致状态字段在 13 处过期而无人刷新（专题 03）——否认块越多，需要同步的地方越多。
2. 每一步都要"separate task-local Owner authorization"＋人工合并：Meta-Agent 建设期（07-26→08-06）约 12 个任务号、Mnemosyne 侧 24+ 个合并、专属仓 5 个合并，全部经 Owner 手；之后 27 天零进展——吞吐被 Owner 的批示带宽锁死（反模式 #8）。
3. 治理装置为多写入方、多表面、多协作者场景设计，而现实是 1 个 Owner、1 个连接器写入方、0 协作者、0 代码。四个版本号从未移动、能力分工从未用到、5 类变更只用过 2 类。
4. 对新会话的负担：handoff 必读 10 件约 90KB；若要理解"为什么"，还得读 900KB 研究链。

[MI] 结论：治理**不变量是对的，装置过重**。过重的根因不是规则太严，而是"每份文件各自承载全套治理声明"的**分布式重复**，加上"任何动作都要单独授权"的**统一门禁强度**（不分风险档）。研究链自己给出了解药——WAVE-CAND-PROPORTIONAL-ASSURANCE（按风险分档）——但从未应用到仓库自身。

## 5. Findings

| ID | 级别 | 一句话 | 证据 | 类别 |
|---|---|---|---|---|
| F2-GOV-001 | REPAIR_RECOMMENDED | 写入规则从未对仓库自身生效（0 尾注、无 run-context、PR 描述无核验）；要么加最小机械预检（本轨道已示范：fetch→钉住→open PR→变更集⊆授权路径→尾注），要么把规则降为建议 | §3.5；台账 §9 | [VRF]＋[DR] |
| F2-GOV-002 | REPAIR_RECOMMENDED | 治理装置过重且分布式重复：建议把全套否认/授权状态收敛到**一个** canonical 状态文件（现有 MIGRATION-STATUS/README/active-context 三处已重复），其他文件只放指针；对 candidate-only 工作定义"轻量档"（按 WAVE-CAND-PROPORTIONAL-ASSURANCE） | §2、§4 | [MI]＋[DR] |
| F2-GOV-003 | NON_BLOCKING | spec §6 与 map §4 优先级清单双轨；artifact_role 无受控词表；spec §5 只覆盖 7/87 文件 | §3.1–3.2 | [VRF] |
| F2-GOV-004 | NON_BLOCKING | 版本装置未被使用：MA-REQ-0014 语义漂移、cutover 的 policy 追加均 version none；要么用起来（policy 0.1.1）要么简化为单一版本号 | §3.3–3.4 | [VRF]＋[MI] |
| F2-GOV-005 | OBSERVATION | 能力分工（§10）与次级模型执行从未发生；本轨道 Owner 的"串行/额度"约束说明成本问题真实存在，但解法未必是次级模型 | §3.6 | [VRF] |
| F2-GOV-006 | OBSERVATION | 六法中仅 0006 被实际执行；0004 以他仓 open question 为源；方法库的价值尚无案例证明（自认 initial incomplete） | §3.8 | [VRF] |

同族局限：本专题评审对象为 GPT 族起草、Owner 接受的文本；判断为单模型跨族意见。§4 的"过重"判断依赖本会话对单 Owner 场景的推断 [MI]，Owner 若认为多表面风险仍高，可推翻。
