# 专题 09 · 基础 Agent 反模式清单 v1 逐条自检（对 Meta-Agent 仓）

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

清单来源：Mnemosyne notes/cross-family-cooperation/foundational-agent-antipattern-checklist-v1.md（MNEMOSYNE-254，两族复盘收敛，Owner adjudication pending）。用法：逐条答"是否已防"；答"否"须写明理由。评判对象：Meta-Agent 仓 @1fdbd7a。

| # | 反模式 | 是否命中 | 证据 [VRF] | 备注 [MI] |
|---|---|---|---|---|
| 1 | 没有产品拉动就建流程 | **命中** | 0 真实用例；12 任务号全部为流程/研究/迁移；Owner 真实需求绕行 | 最重的一条（F2-CORE-001） |
| 2 | 结果验收被格式验收替代 | **命中** | 全部 PASS 是身份/哈希/完整性/绑定检查；无任何效用或 Owner 成本维度 | 迁移这类事格式验收是对的；产品层无结果验收 |
| 3 | 规则/记忆只增不减 | 部分命中 | spec/map/methodology 自 07-28 未增；但否认段随文件数线性增长，无整编 | 早期形态 |
| 4 | 事故→全局规则反射 | 未命中（处理良好） | PR #248 → 新任务号修复 ＋ 临时 guard → cutover 时退役 guard | 有局部性判断 |
| 5 | 建设期无全局规则冻结窗口 | 不适用 | 尚无真实闭环可冻结 | — |
| 6 | "活"状态无失效规则 | **命中** | 13 处过期状态；无 superseded/valid_until | 专题 03 |
| 7 | 研究由额度调度、无采纳/过期/关闭闭环 | **命中** | 15 报告 → 31 候选 → 0 决定；无有效期；下一批题目来自上一批推荐 | 专题 04 |
| 8 | 人做搬运（Owner 当消息总线） | **命中** | 15 次 OPERATOR 复制粘贴发射；每 PR 人工合并；连接器无法回写 | 专题 08 |
| 9 | 记账开销无上限 | **命中** | 过程:产品 ≈ 7:1；无占比阈值 | 专题 08 |
| 10 | 主导 agent 无"方向质疑"义务 | **命中** | 无任何文件问"这一步对 Owner 目标推进了什么"；P0 选择无方向论证记录 | 专题 05 |
| 11 | 对 authority conflict 敏感、对 purpose drift 不敏感 | **命中** | 9–10 级冲突优先级、6 条写入规则；0 条目的核查停止条件 | 专题 02 |
| 12 | 在未验证执行面上签逐字节过程合同 | 部分命中 | PR #248 即此；之后以终态式合同（manifest＋哈希）纠正 | 已学到 |
| 13 | 一条超长主线充当总线 | 部分命中 | "dedicated Meta-Agent conversation"承担研究路由、裁定、迁移、P0 草案；08-05 回执显示交接依赖专用对话 | 对话未归档 Alaya（D-17 UNK） |
| 14 | 同族自证独立性 | **命中** | GPT 研究 → GPT 裁定 → GPT 前沿评审 GPT 草案；Owner 接受 | 专题 04；本轨道为首次跨族阅读 |
| 15 | 平台限制沉淀为核心规则 | 未命中 | 切片传输规则留在 manifest（平台事实层）；MA-REQ-0008 的"无 RAG/MCP"是范围选择而非平台限制 | 良好 |
| 16 | 把"不知道"当待补字段 | 基本未命中 | BLOCKED/UNKNOWN 用法正确（DR-06、DR-09）；小瑕疵：PENDING_* 占位符长期停留 | 良好 |

## 汇总

```yaml
hit: 9        # 1,2,6,7,8,9,10,11,14
partial: 3    # 3,12,13
not_hit: 3    # 4,15,16
not_applicable: 1   # 5
```

## 值得延续（清单末节"两族一致"项在本仓的落实）[VRF]

执行源/证据/候选/历史分层：**落实**。fail-closed ＋ expected/observed ＋ 不编造：**落实**（DR-06/09 处理是范例）。任务绑定交接：**落实**（handoff-current）。fresh-context 负向测试：**部分**（08-05 回执与本轨道启动仪式各一次）。档案重建法评估交接效果：**未做**。事故保全、可回滚、禁静默修复：**落实**（PR #248）。挂账诚实与披露文化：**落实**。

## Findings

| ID | 级别 | 一句话 | 类别 |
|---|---|---|---|
| F2-AP-001 | OBSERVATION | 16 条反模式命中 9、部分 3；命中的 9 条集中在"无产品拉动、无失效纪律、无方向质疑、同族自证"四个根因，与 Mnemosyne 两个月复盘的诊断一致——说明这是这套方法族（GPT 主导的治理式建设）的系统性倾向，而非 Meta-Agent 个案 | [VRF]＋[MI] |

同族局限：清单本身是 Fable＋GPT 两族收敛产物，Owner 尚未 adjudicate；本自检为单模型。
