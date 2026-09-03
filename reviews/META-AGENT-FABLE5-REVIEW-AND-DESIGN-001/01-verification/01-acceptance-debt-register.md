# 阶段 1 · 验收债台账

```yaml
track_id: META-AGENT-FABLE5-REVIEW-AND-DESIGN-001
record_type: acceptance_debt_register
created_by_task: META-AGENT-FABLE5-REVIEW-AND-DESIGN-001
generated_by_actor: claude-fable-5.1
generated_on_surface: claude-code-vscode
date: 2026-09-03
base_master_sha: 1fdbd7af9437f72f7c8106714ad1e64908983fb7
evidence_class: mixed_per_claim_labels
authority_level: non_execution_source_advisory
phase: phase_1_verification
risk_scale: [HIGH, MEDIUM, LOW]
definition: 验收债 = 仓库中处于 pending / deferred / not_yet / BLOCKED / 等 Owner 决定 / 未关闭的依赖 状态、且未被显式关闭或显式接受为永久状态的事项。挂账诚实是优点；本台账让 Owner 一览全部欠账并决定"还、销、或显式永久接受"。
```

## 正面前提

[VRF] 这个仓库**没有质量类欠账**：自称的机械事实全部核实为真（见 00-verification-ledger.md），迁移与研究回收链的保全纪律优于多数人工项目。全部欠账都是**决策债、方向债与失效纪律债**——做完了等拍板、或该指定的事没人指定、或"活"状态无人刷新。

## 台账（按风险降序）

| # | 债项 | 状态 | 风险 | 证据 | 处置建议（供评审/Owner） |
|---|---|---|---|---|---|
| D-01 | **唯一声明的下一步（candidate-only P0 v0.2 规格包，12 文件）27 天无动作**；它是仓库四处导航一致指向的"唯一安全下一步" | pending | **HIGH**（方向级：整个仓库的"现在该做什么"只有这一条，而它停了） | active-context Pending 1–4；revision-contract required_package；git log 无提交 | 先由本轨道评审判断该步骤本身是否仍是正确的下一步（专题 05/06），再由 Owner 决定：继续 / 改道 / 显式挂起 |
| D-02 | **零真实用例**；case ledger 空并规定"操作接受前不加案例"；而 Owner 期待的首个用例（MyOS2 内核分析规划）已由 Mnemosyne 会话代为启动并留下 5 项"留给 meta-agent 的接管清单" | 结构性 | **HIGH**（方向级：Owner 2026-08-22 原话"两个具体需求得用来实测 meta-agent"；Owner 2026-08-31 原话"这个任务原本计划是等 meta-agent 基本建成后由 meta-agent 来规划的"） | cases ledger §1/§8；Mnemosyne target-projects/myos2/00-…launch.md §4 | 本轨道专题 06 评审；Owner 决定 Meta-Agent 与 MyOS2 接管清单的关系 |
| D-03 | **Meta-Agent 自有行为指导缺位**：authority map known_limits 自认 `Meta_Agent_owned_behavior_guidance_not_yet_adopted`；active-context 列 deferred 且 separate_owner_review_required；仓库无任何给 agent 的启动/行为规范（旧 guard 已退役、post-DR-09 startup prompt 引用退役指令） | deferred | **HIGH**（任何新会话进入此仓都无规则可载；本轨道靠 Owner 工作令临时补位） | authority map front matter；active-context deferred；handoff-current "guard 不得加载" | 工作令 §11 第 6 问；建议作为改进意见首位候选 |
| D-04 | **non-FABLE health review 依赖**：approved-spec accepted_limitations、activation_requires、P0 README、downstream gates、DR-06/07 tier-3、DR-09 C7 等 ≥7 处把它列为 pilot/activation 前置；Mnemosyne 侧只有 2026-07-20 的交接包，未见 findings；无 owner、无到期条件 | 外部未决依赖 | **MEDIUM**（当前 inactive 阶段不阻塞；一旦要 pilot 即成为"无人能关闭的门"） | 台账 §7.3 | Owner 一句话三选一：显式作废该依赖 / 指定谁何时做 / 改为"pilot 前做一次有界健康检查"并写清范围 |
| D-05 | **MA-PEND-0001–0008 无生命周期**：8 条 pending 需求在权威仓内无定义、无状态；其中 0002（专属仓库）已实现未关闭，0001（产品表面）/0005（私有材料）/0006（路由矩阵）/0008（自动化）已被 DR-13/14/15 研究但无处置记录 | 生命周期缺口 | **MEDIUM** | 台账 §3.6–3.7 | 建议在评审改进意见中提出"pending 需求登记与状态机"；发放/关闭须 Owner 授权 |
| D-06 | **31 个 candidate label 零处置**：三份 ledger 全部 candidate_only；active-context P1 "review candidate method bundles" 无动作；DR-10 明确列出 9 个需 Owner 决定的问题无一登记 | pending | **MEDIUM**（研究投入的回报停在 ledger） | 三份 ledger；DR-10 §"Unresolved questions and Owner decisions" | 专题 07 给去留建议；Owner 决策清单打包 |
| D-07 | **初始记忆系统基础**：deferred_to_separate_post_migration_Owner_review；Mnemosyne 侧有 Fable 族候选设计（25 节，未采纳） | deferred | MEDIUM | active-context deferred；source-snapshot-pointer memory_foundation | 工作令 §1.2 候选项；本段不评（同族） |
| D-08 | **Owner 原话不在仓内**：Meta-Agent 的目的、范围、非目标全部为 GPT 会话转述；Owner 关于 Meta-Agent 的逐字表述散在 Mnemosyne（08-22/08-30/08-31）与 Alaya | 输入缺口 | **MEDIUM→HIGH（对本轨道第 ② 段）** | 台账 §7.5 | 第 ② 段前由 Owner 决定是否允许从 Alaya 抽取（≤200 字/处）或由 Owner 重述目标 |
| D-09 | **13 处"自称当前"的过期状态字段**（decision_pending、pending_human_merge、PENDING_REPAIR_PR、repository: Mnemosyne 等） | 失效纪律缺口 | MEDIUM（合计；单项 LOW）：新会话按 front matter 判断状态会误判 | 台账 §5 | 改进意见：状态失效纪律（last_updated / superseded_by / valid_until）；修订本身须另任务 |
| D-10 | **100 处操作性旧路径**（identities part 路径、archive 重建命令、manifest chunk_glob、OPERATOR、methodology/cases/history 的裸 Mnemosyne 路径、research/README 的"唯一 target truth"句） | 迁移收口遗漏 | MEDIUM（重建/引用按字面执行会失败；research/README 一句与 cutover 矛盾） | 台账 §6 C 类、§3.4 | 一次"迁移路径同步"任务可全部解决；本轨道只登记 |
| D-11 | **两条陈旧 accepted_limitations**（DR-06/07 recommended；health review pending）留在 target truth 内 | 程序债 | LOW（历史记录性质；但 target truth 内的过期条款每轮都要解释） | approved-spec §4 | 随下一次 spec 修订按 §12 程序更新 |
| D-12 | **研究链可移植性**：DR-01–05 283 个不透明引用、0 URL；DR-06/07 任务书不在两仓；DR-06–15 无表面/模型记录；DR-06 三张图未保留 | 证据保全债 | LOW-MEDIUM（新模型复核时引用不可追） | 台账 §2.2 | 登记；补救成本高（需回原对话），由 Owner 决定是否值得 |
| D-13 | **retired 交接件仍以 ready 状态在 handoff/**（post-DR-09 package + startup prompt） | 陈旧文件 | LOW-MEDIUM（误读风险） | 台账 §5 | 标 superseded 或移入 history；须另任务 |
| D-14 | **Tier-0 Owner 决策包**：worthwhile_in_principle true、prepare_now false | deferred | LOW（by design，等 MVI 结果） | candidates README | 无需动作 |
| D-15 | 5 条已合并远端分支未删 | 保留 | LOW（各 0 未合并提交；closeout 已钉住清理时点） | 台账 §1.9 | Owner 顺手删或永久保留均可 |
| D-16 | history §10 旧 next_required_gate、MA-DR-09.yaml PENDING 字段等已被取代的记录 | 历史 | LOW | 台账 §3.8、§5 | 无需动作（已有取代件） |
| D-17 | P0/迁移的 ChatGPT 对话是否已归档 Alaya | UNKNOWN | LOW-MEDIUM（研究链复核依赖原对话） | 工作令 §8.7 | Owner 一句话确认 |
| D-18 | **31 个候选与 15 份研究的"采纳/过期/关闭"闭环缺失**（与 D-06 同根但更广）：研究 README 称 archive_eligible，但无任何"研究结论有效期/被取代"字段 | 闭环缺口 | MEDIUM | research/README；反模式清单 #7 | 改进意见 |

## 结构观察 [MI]

1. **两项 HIGH 都是方向债**：D-01（唯一下一步停摆）与 D-02（零用例、首个用例已旁落）。它们互为因果——下一步被定义为"再写一份规格"，而不是"拿一个真实用例试"。这与 Mnemosyne 反模式清单 #1（没有产品拉动就建流程）、#2（格式验收替代结果验收）直接对应，留专题 06/09 论证。
2. **失效纪律缺口是系统性的**：13 处过期状态、100 处操作性旧路径、8 条无生命周期的 pending 需求、31 个无处置的候选、2 条陈旧限制——同一根因：仓库有创建纪律没有失效纪律（反模式 #6、#7）。
3. **外部依赖无主**：non-FABLE health review 被 ≥7 处引用为门，却没有人、没有期限、没有 findings。这是"在未验证的前提上签合同"的一种变体（反模式 #12）。
4. **诚实度极高**：抽查的所有状态文件都如实标注未完成态；PR #248 事故被完整记录而非掩盖；DR-06/DR-09 的输入失败被保留而非伪装。这是仓库可信度的基石，任何简化都应保留它。

## 小结

18 项：3 HIGH（D-01、D-02、D-03）＋ 1 条件 HIGH（D-08 对本轨道）、8 MEDIUM、6 LOW。无质量类 BLOCKING 债。建议分诊时把 D-01/D-02/D-03/D-04/D-08 打包进 Owner 决策清单。
