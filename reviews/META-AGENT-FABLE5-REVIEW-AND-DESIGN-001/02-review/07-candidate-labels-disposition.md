# 专题 07 · 31 个候选 label 的去留建议

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

## 0. 规则

- 处置词表：**KEEP_NOW**（进入下一步工作的输入）、**MERGE**（并入另一 label，保留别名防复活）、**CLOSE_REALIZED**（已被既有决定实现，记录映射后关闭）、**DEFER**（挂起，写明重开条件）。
- 全部为 [DR]，不发放稳定 ID、不改 ledger 原文；Owner 逐条准/改/驳后才有效。
- 评判轴：(a) 与 Owner 目标 G-1…G-10 的距离；(b) 是否需要先有真实用例才能校准；(c) 是否已被现实实现。

## 1. 处置表

| # | Label | 类型 | 处置 | 理由 / 并入对象 / 重开条件 |
|---|---|---|---|---|
| 1 | CAND-DESIGN-SYNTHESIS | 方法 | **MERGE→#14** | 与 WAVE-CAND-FRAME-TO-DESIGN 同一对象（DR-10 已统一） |
| 2 | CAND-ALTERNATIVE-BASELINE-COMPARISON | 方法 | **MERGE→#14** | 强基线阶梯是 Frame-to-Design 的一步 |
| 3 | CAND-CONSTRAINT-PRESERVING-SEARCH | 未来功能门 | DEFER | 研究自身建议推迟；重开条件：有 IR 与离线沙箱 |
| 4 | CAND-ORIGIN-ALLOWED-INFLUENCE | IR/安全控制 | **KEEP_NOW（作为记录规则）** | 不必等 IR：现在就可作为仓库文件的证据类别/影响范围标注规则（本轨道已在用 [VRF]/[MI] 标签） |
| 5 | CAND-TYPED-PERMISSION-SIDE-EFFECT | IR 字段族 | MERGE→#13 | IR 字段族，随 IR |
| 6 | CAND-BACKEND-DEGRADED-SEMANTICS | IR/映射控制 | MERGE→#13 | 同上 |
| 7 | CAND-PARAPHRASE-STABILITY | 评估工具 | DEFER | 需基准；重开：DR-09 协议启动 |
| 8 | CAND-STRONG-SIMPLE-BASELINES | 评估工具 | MERGE→#14 | 同 #2 |
| 9 | CAND-SECURITY-UTILITY-DUAL-GATE | 评估工具 | MERGE→#28 后 DEFER | 与 DR09-CAND-SECURITY-UTILITY-GATE 重复 |
| 10 | CAND-PROMOTION-QUARANTINE | 方法/控制 | MERGE→#15 | 同一生命周期 |
| 11 | CAND-ANTI-RESURRECTION-ROLLBACK | 迁移/控制 | DEFER | 需运行时；重开：有可回滚的运行对象 |
| 12 | CAND-REPRODUCIBLE-SEARCH-BUNDLE | 证据 schema | DEFER | 随 #3 |
| 13 | WAVE-CAND-DESIGN-IR-MVI | schema/设计对象 | DEFER（次序调整） | 在"手工 Frame-to-Design 一例"之后重开，用真实字段需求校准（专题 05） |
| 14 | WAVE-CAND-FRAME-TO-DESIGN | 方法 | **KEEP_NOW，首位** | 产品核心缺口；不依赖 IR；可在真实用例上手工执行 |
| 15 | WAVE-CAND-PROMOTION-LIFECYCLE | 治理方法 | **KEEP_NOW** | 并入 #10、#31；且应扩展适用于研究结论与候选本身（台账 D-18） |
| 16 | WAVE-CAND-MANAGED-AUTONOMY | 策略 | DEFER（保留词表） | PROCEED/VERIFY/ASK/ABSTAIN/ESCALATE 词表可直接进行为守则；阈值等用例 |
| 17 | WAVE-CAND-SINGLE-AUTHORITY-CORE | 架构原则 | **CLOSE_REALIZED** | 已由 MA-REQ-0014 ＋ MA-DEC-0008 实现；记映射后关闭 |
| 18 | WAVE-CAND-PRIVATE-DATA-GOVERNANCE | 未来功能门 | DEFER | 重开条件：真实需求 A 或 B 立项 |
| 19 | WAVE-CAND-CAPABILITY-CLAIM-REGISTRY | 证据/路由 schema | DEFER＋QUESTION | Mnemosyne platform-guides 已在做同一件事；先答"平台事实归谁"（F2-CORE-003） |
| 20 | WAVE-CAND-TWO-STAGE-ROUTING | 策略集成 | MERGE→#16 | — |
| 21 | WAVE-CAND-PROPORTIONAL-ASSURANCE | 方法/评估原则 | **KEEP_NOW** | 直接对应治理减重（F2-GOV-002）：先用在仓库自身 |
| 22 | WAVE-CAND-DERIVED-VIEW-REBUILDABILITY | 架构/恢复控制 | **KEEP_NOW（已在实践）** | 传输分片重建即其实例；作为记录规则保留 |
| 23 | DR09-CAND-EVALUATION-CLAIM-MAP | 评估 schema | DEFER | 随基准 |
| 24 | DR09-CAND-CASE-MANIFEST | 基准 fixture schema | DEFER | 随基准 |
| 25 | DR09-CAND-BASELINE-FAIRNESS | 评估策略 | MERGE→#14 | 基线阶梯已含 |
| 26 | DR09-CAND-IR-CONFORMANCE | 验证套件 | DEFER | 随 #13 |
| 27 | DR09-CAND-ABLATION-REGISTRY | 实验 schema | DEFER | 随基准 |
| 28 | DR09-CAND-SECURITY-UTILITY-GATE | 评估策略 | DEFER | 重开：tier-2 以上 |
| 29 | DR09-CAND-HUMAN-PROTOCOL | 评估 schema | DEFER（保留一个指标） | "Owner-touch 次数 / 审阅负担"现在就该计，无需协议 |
| 30 | DR09-CAND-TIER-MANIFESTS | 试点模板 | DEFER | 随 Tier-0 决策 |
| 31 | DR09-CAND-PROMOTION-MAPPING | 治理链接 | MERGE→#15 | — |

## 2. 汇总

```yaml
KEEP_NOW: 5   # 14 Frame-to-Design（首位）、15 Promotion lifecycle、21 Proportional assurance、4 Origin/allowed influence（作为记录规则）、22 Derived-view rebuildability（作为记录规则）
CLOSE_REALIZED: 1   # 17
MERGE: 9   # 1,2,5,6,8,9,10,20,25,31 → 实际 10（9 并入后 DEFER 计入 DEFER）
DEFER: 16
```

（计数说明：#9 先 MERGE 再随 #28 DEFER，按 MERGE 计；MERGE 合计 10、DEFER 15；总 31。）

## 3. 与本轨道后段的关系 [DR]

- KEEP_NOW 五项即第 ② 段"需求与构想登记表"里"研究已给出候选"的那一列；第 ⑤ 段独立设计对它们是"可参考但不得直接采纳"的既有方案（独立对照组规则）。
- DEFER 项各自的重开条件应进入"研究→决定登记表"（F2-RES-002）。

## 4. Findings

| ID | 级别 | 一句话 | 类别 |
|---|---|---|---|
| F2-CAND-001 | NON_BLOCKING（[DR]） | 31 label → 5 KEEP_NOW / 1 CLOSE_REALIZED / 10 MERGE / 15 DEFER；Owner 逐条准/改/驳后登记 | [DR] |

同族局限：处置判断为单模型意见；GPT 侧 ledger 作者可能有不同优先级。
