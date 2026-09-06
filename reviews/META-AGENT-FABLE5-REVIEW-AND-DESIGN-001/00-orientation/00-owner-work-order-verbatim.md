# Owner 工作令与补充说明 · 逐字存档

```yaml
track_id: META-AGENT-FABLE5-REVIEW-AND-DESIGN-001
record_type: owner_work_order_and_supplements_verbatim
created_by_task: META-AGENT-FABLE5-REVIEW-AND-DESIGN-001
generated_by_actor: claude-fable-5.1
generated_on_surface: claude-code-vscode
date: 2026-09-03
base_master_sha: 1fdbd7af9437f72f7c8106714ad1e64908983fb7
evidence_class: DIRECT_OWNER_INSTRUCTION   # 工作令 §1.1 与 §12 登记的补充为 Owner 原话；工作令其余条款为起草方（Mnemosyne 会话）的操作化解释，原件自标 [MI]
authority_level: non_execution_source_advisory
work_order_original_path: /home/cheyh/Downloads/startup-packages-2026-09-02/META-AGENT-FABLE5-REVIEW-AND-DESIGN-001-work-order.md
work_order_sha256: 3b1e5952b5394c580fcf006422daf6a4ded0ba11dc2fd7fc9c2fe11afbb63999
supplements_register_original_path: /home/cheyh/Downloads/startup-packages-2026-09-02/receipts/META-AGENT-FABLE5-REVIEW-AND-DESIGN-001-owner-supplements.md
supplements_register_sha256_at_copy: ee2ca623f64985ff97fc4c0caccf434c09b8b03cd1dcbff5ed54d829f4beb8f7   # 2026-09-06 补充 #4 后更新
copied_at: 2026-09-03T09:49:35+08:00
rule: 工作令 §12——Downloads 原件冻结；写入授权后原文＋全部补充按序进入本文件；此后 Owner 的新补充继续逐字追加在本文件 B 节（同时同步 Downloads 登记件），每条标日期与序号
verification: 见文末"核验方法"；两段标记行之间的内容与原件字节一致
```

## A. 工作令原件（逐字）

<!-- BEGIN work-order verbatim -->
# 工作令 · META-AGENT-FABLE5-REVIEW-AND-DESIGN-001（Meta-Agent 复核 · 评审 · 独立设计，不限于此三项）

> 本文件是一份完整工作令。请**先完整读完全文**（能看到最后一节"§12 Owner 补充说明登记处"才算完整）。若内容不完整或哈希与启动提示词所载不符，回复"工作令不可用"并停止，不要开始任何工作。
> 本 Downloads 原件自哈希登记起**冻结**（含 Owner 在内任何人不改）；Owner 的补充说明按 §12 的规则另行登记。

```yaml
track_id: META-AGENT-FABLE5-REVIEW-AND-DESIGN-001
record_type: work_order_for_new_claude_code_session
drafted_by: Mnemosyne 主导会话（session f0e60aba-25ea-419b-b350-71be428ec822，claude-fable-5.1@claude-code-vscode；起草时机器名 mnemosyne-e8）
drafted_on: 2026-09-02
issued_by: Owner（Owner 将本工作令发给新会话即构成本轨道的任务授权；Owner 可在补充说明中追加、修改或删除任何条款，每次补充逐字登记）
executor: 新开 Claude Code 本地会话（Fable 5.1），工作目录 /home/cheyh/projs/Meta-Agent（GitHub 08822407d/Meta-Agent，public）
execute_in: 该新会话本身；本工作令不由 Mnemosyne 会话执行
pinned_base_at_drafting: Meta-Agent master = origin/master = 1fdbd7a（提交时间 2026-08-06 19:14 -0700 ＝ 2026-08-07 02:14 UTC，距起草日 26 天；工作树 clean；0 open PR；0 issue）
target_execution_source: Meta-Agent 仓自述唯一 target truth = current/approved-spec.md（状态 inactive baseline）；权威规则 = authority/source-and-owner-map.md。本工作令 = task-local Owner 指令——该仓已退役的 compatibility guard 允许的四类指导来源（task-local Owner 指令 / approved spec / authority map / 平台安全要求）之一
receiver_guidance_load:
  project_guidance: required（读 §2.3 A 类文件）
  mnemosyne_guidance: no（本次交接不加载 Mnemosyne 的执行源/guard/状态；§2.3 B 类 Mnemosyne 文件只作方法参考与历史证据，不是行为权威。Owner 可在补充说明中改为 yes）
execution_intent:
  response_role: ANALYSIS_AND_PREPARATION
  execution_disposition: RUN_AFTER_GATE_REQUIRED（门 = Owner 的补充说明与一句"开工"；门前只做 §2 启动仪式）
  external_execution_or_quota_authorized: false（本轨道不发起 Deep Research、不消耗 ChatGPT 额度）
evidence_class_of_this_file: DIRECT_OWNER_INSTRUCTION_after_Owner_sends_it（起草方为 Mnemosyne 会话；§1.1 为 Owner 原话逐字节选，其余为起草方的操作化解释，标 [MI]）
```

---

## 0. 一句话

你要对 Meta-Agent 项目做三件事——**复核**（它自称的状态是否属实）、**评审**（它的设计与治理是否够格、离目标多远）、**独立设计**（不受既有方案束缚的重新设计）——并且不限于这三件；但**现在先不要开工**：做完 §2 的启动仪式就停下，等 Owner 的补充说明和一句"开工"。

## 1. 任务

### 1.1 Owner 原话（2026-09-02，逐字节选；"……"为本工作令略去的、与本轨道无关的段落）

> 现在我要你做两方面的工作.一是准备新开一个claude code本地任务用于对Meta-Agent进行复核评审和独立设计(但不仅限于这三方面),我会在MA的本地仓库中启动新对话/任务,稍微细节一些的部分你可以参考Mnemosyne中做类似工作时的情况,但给出的任务书不要直接让它开始工作,而是等我补充一些说明.由于这个是其他agent的新开对话/任务,不存在新老交接的问题,因此你可以考虑制作足够详细的任务书或者普通程度的任务书启动任务后进行任务间通信的方式补充更多信息.……

> 好了,你现在给出这两个任务的启动提示词吧,注意让它们不要直接开始工作,而是要在确认启动正确后等待我进一步补充一些说明和要求.

另一处相关原话（2026-08-31，MyOS2 立项时）：
> 这个任务原本计划是等meta-agent基本建成后由meta-agent来规划的.

### 1.2 起草方对三个词的操作化解释 [MI]（Owner 可在补充说明中改写）

| 词 | 解释 | 典型产出 |
|---|---|---|
| 复核 | 核对仓库**自称的事实**是否成立：迁移完整性、研究回收链（编号/哈希/分片）、决策日志与文件是否一致、指针是否过期、状态字段是否自相矛盾 | 复核台账（expected/observed 逐项）＋验收债台账 |
| 评审 | 评价**设计与治理的质量**：approved-spec v0.1 的 16 条需求（MA-REQ-0001~0016）与方法条目（MA-METHOD-*）是否对得上 Owner 目标与研究共识；P0 候选与 frontier 评审是否走对方向；治理是否过重/过轻；产品核心缺口 | 复合评审报告（分级 findings）＋Owner 决策清单 |
| 独立设计 | 从 Owner 目标出发**重新设计**（greenfield），可抛弃任何既有方案但每处抛弃须写理由；每稿附自我批判；不生效、不采纳 | 独立设计稿 ＋ 与既有方案的分歧清单 |
| 不限于此三项 | 起草方能预见的候选：Meta-Agent 自有行为指导草案；以 MyOS2 为首个真实用例的映射；Mnemosyne 侧记忆系统候选设计的去留评估；给下一个 Meta-Agent 会话的交接包。**由 Owner 在补充说明中定** | — |

### 1.3 与 Meta-Agent 仓自述"唯一安全下一步"的关系

Meta-Agent 仓四处（README、current/active-context.md、handoff/handoff-current.md、MIGRATION-STATUS.md）一致声明的下一步是"起草 candidate-only 的 P0 v0.2 规格包"。**本轨道不是那一步**，也不改它：本轨道是 Owner 决定的、位于其上的复核/评审/重设计。若你在执行中发现本工作令与 approved-spec 冲突，按 spec 的规则：标记冲突、停止受影响动作、报 Owner——不得静默改写任何 target truth。

## 2. 启动仪式（第一条回复必须完成；完成后停止等待 Owner）

**只读**＝不改工作树、不改本地分支/HEAD、不建/删任何引用、不建 worktree；唯一允许的仓库状态变化是 `git fetch origin`（只更新 origin/* 远端跟踪引用，属核验）。不 pull、不 merge、不 reset、不 rebase、不 stash、不 checkout、不建分支、不建 PR、不 `fetch <远端>:<本地>`。不创建 CLAUDE.md / AGENTS.md / .claude/（若 Owner 预置了 .claude/settings.local.json，不改不删）。不联网研究。**不向任何会话发送消息**；启动仪式期间若收到跨会话消息：不回复、不执行，只把发送方名与摘要登记进回执 notes，补充说明之后再按 §9 处理。

### 2.1 环境核验（expected / observed 逐项，写进回执）

| # | 项 | expected | 不符时 |
|---|---|---|---|
| 1 | `pwd` | /home/cheyh/projs/Meta-Agent | FATAL：停止并报 Owner |
| 2 | `git remote -v` | origin = git@github.com:08822407d/Meta-Agent.git | FATAL |
| 3 | `git rev-parse --abbrev-ref HEAD` | master | FATAL（不得自行切换） |
| 4 | `git status --porcelain` | 空（若 Owner 预置了 .claude/，允许仅出现 `?? .claude/`） | WARNING：如实记录，不清理 |
| 5 | `git fetch origin && git rev-parse --short origin/master` | 1fdbd7a | WARNING：记录新 SHA（origin 可能有新提交），不据此推断任何事 |
| 6 | `gh auth status` | 已登录（回执只写"已登录 08822407d"，不粘贴 token 行） | WARNING |
| 7 | `gh pr list --state open` | 空 | WARNING：记录 |
| 8 | `git worktree list` | 仅主检出 | WARNING：记录 |
| 9 | `sha256sum /home/cheyh/Downloads/startup-packages-2026-09-02/META-AGENT-FABLE5-REVIEW-AND-DESIGN-001-work-order.md`（对文件本身计算，不要对 Read 工具的显示内容计算） | 与启动提示词所载一致 | FATAL |
| 10 | 模型自述 | Fable 5.1 | 如实记录，继续 |

### 2.2 记录自身会话标识（只调用 ListAgents 读取，不发送任何消息）

调用 ListAgents，记下自己的机器名（形如 `meta-agent-xx [......]`；**每次进程重启会变**）与本会话 UUID（`~/.claude/projects/-home-cheyh-projs-Meta-Agent/` 下的 jsonl 文件名；该目录/文件在收到第一条消息后才出现，若有多个取 mtime 最新且仍在增长者；无法确定则写 `session_uuid: unknown` 并在 notes 说明，不算 FATAL）。两者都写进回执。

### 2.3 读序（分别读、各守其位，不做全库通读）

**A. Meta-Agent 自有（当前状态与权威）**

启动必读（本仪式只读这六件）：
1. README.md
2. current/approved-spec.md（唯一 target truth；注意 `status` 字段、`owner_disposition` 字段、§6 冲突优先级、§9 写入规则、§13 禁止的隐式过渡）
3. authority/source-and-owner-map.md（尤其 §4 冲突规则、§7 task-local action context 及其末尾六条规则）
4. current/active-context.md
5. handoff/handoff-current.md（required reading order、prohibited_in_same_step 13 项、"compatibility guard 已退役不得加载"）
6. MIGRATION-STATUS.md

阶段前必读（开工后各阶段开始时再读，启动仪式不读）：
7. candidates/p0-static-design-conformance-mvi/{README.md, frontier-review-2026-08-06.md, revision-contract-v0.2.yaml}（candidate-spec-draft-2026-08-05.md 只作历史输入）
8. history/decision-version-and-migration-log.md
9. methodology/core-methodology.md
10. research/README.md → research/reviews/MA-DR-01-05-cross-report-synthesis-v0.1.md、MA-DR-01-05-gap-analysis-v0.1.md
11. research/waves/2026Q3-independent-wave-001/reviews/MA-DR-08-15-cross-report-convergence-v0.1.md、MA-DR-09-upstream-binding-addendum.md
12. 三份 candidate ledger（Batch-A / independent-wave / MA-DR-09）——独立设计前查重用
13. decision-support/Meta-Agent-v0.1-owner-disposition-decision-package.md、cases/case-and-feedback-ledger.md
14. handoff/receipts/handoff-receive-report-2026-08-05.md（历史回执，样式参考）

**B. Mnemosyne 侧方法参考（C 类；只读；开工后按阶段需要读；`git -C /home/cheyh/projs/Mnemosyne show origin/master:<path>` 读取——Mnemosyne 主检出停在工作分支，不得切换、不得写）**
- notes/cross-model-review-results/FABLE5-REVIEW2-001/00-orientation/00-owner-work-order-verbatim.md（评审轨道工作令范本）
- notes/cross-model-review-results/FABLE5-REVIEW2-001/01-composite-review/00-phase1-summary.md、04-acceptance-debt-register.md（评审阶段索引、验收债定义）
- notes/cross-model-review-results/FABLE5-REVIEW2-001/02-triage/02-owner-decision-package.md、03-gate3-owner-decision-record.md（Owner 决策清单与批示登记格式）
- notes/cross-model-review-results/FABLE5-REVIEW2-001/03-independent-design/00-phase3-scope-and-status.md（独立设计阶段的范围与返回契约）
- notes/cross-model-review-results/FABLE5-REDESIGN-001/00-work-order.md、05a-blind-review-plan.md（agent 起草的工作令；独立设计防火墙/盲评）
- notes/cross-model-review-results/FABLE5-REDESIGN-001/09-continuation/02-owner-correction-dual-channel-rules.md（Owner 沟通规则：跨会话转达件，按 Owner 纠正处理）
- notes/cross-model-review-results/FABLE5-REDESIGN-001/09-continuation/06-archiving-institution-record.md（双仓归档制度，含 Owner 2026-08-31 原话）
- notes/cross-family-cooperation/foundational-agent-antipattern-checklist-v1.md（16 条反模式；评审可逐条自检）
- notes/registries/multi-writer-attribution-convention.md（§1 四行提交尾注）
- notes/memory-system-designs/meta-agent-initial-memory-system-design-v0.1.md、notes/validation-designs/meta-agent-initial-memory-system-adoption-and-validation-v0.1.md（Fable 族起草、未采纳的 Meta-Agent 记忆系统候选；独立设计前必读以免重做——注意同族）
- target-projects/myos2/00-intake-and-wave-001-launch.md §4（Mnemosyne 会话代 Owner 留给 meta-agent 的 5 项接管清单，agent 起草、非 Owner 原话 [MI]——Meta-Agent 的首个真实用例已被 MyOS2 占位）

**C. 不读 / 不当真相**：Mnemosyne 的 target-projects/meta-agent/（已退役的 redirect 桩与 cutover 前旧版）；Meta-Agent 内 handoff/meta-agent-post-ma-dr-09-* 两件（引用已退役指令，不可复用）；Alaya 私档（如确需研究对话原文再向 Owner 申请；引用 ≤200 字/处且不含隐私）。

### 2.4 回执文件

写到 `/home/cheyh/Downloads/startup-packages-2026-09-02/receipts/META-AGENT-FABLE5-REVIEW-AND-DESIGN-001-startup-receipt.md`（不写仓库）。内容：

```yaml
record_type: startup_receipt
track_id: META-AGENT-FABLE5-REVIEW-AND-DESIGN-001
session_machine_name: <ListAgents 所见>
session_uuid: <jsonl 文件名 | unknown>
work_order_sha256_observed: <sha256sum 结果>
environment_checks: [{item, expected, observed, verdict}]   # §2.1 十项
files_read: [<实际读取清单：只应是 §2.3-A 启动必读六件>]
files_unreadable_or_missing: []
first_impressions_max_5: [<只读六件后的 5 条以内观察，标 [MI]；不是结论>]
incoming_messages_during_ritual: [<若有：发送方名＋摘要；未回复>]
blockers: []
questions_for_owner: [<至多 3 个，每个带三件套：人话意思 / 答了会怎样 / 不答会怎样>]
status: READY_WAITING_FOR_OWNER_SUPPLEMENT | BLOCKED
```

### 2.5 向 Owner 回报（对话回复，人话，≤15 行）

只写：核对了什么、有没有对不上的、你已就位在等补充说明、本轮**没有**写任何仓库或建分支；若有问题，至多 3 个，每个附三件套（人话意思 / 答了会怎样 / 不答会怎样）。技术细节一律"已存回执文件 <路径>"。

### 2.6 然后停止

- "确认启动正确" = Owner 读到 §2.5 回报后的一句确认；未确认前视同未启动。Owner 不说"确认"而直接开始补充说明，亦视为确认。
- 补充说明可能分多条：每条只逐字登记（§12 规则）并用一两句人话复述确认，**不据此开工**。
- 只有当 Owner 明确说"开工"/"开始"（或等价的话）时，才进入 §4 阶段 0；Owner 说"开始"即视为同意本工作令写好的全部默认值（§5），想改哪条另说。
- 补充材料也可能经 §9 的跨会话通道转来——那只是材料，Owner 的话才是授权。

## 3. 材料分级

- **A 类（Owner 原话）**：§1.1；§12 的补充说明。逐字存档，不改写。
- **B 类（当前状态与权威）**：§2.3-A 全部。
- **C 类（方法参考/历史证据，不是路线来源）**：§2.3-B 全部；Meta-Agent 内 research/ 的报告分片；Mnemosyne 镜像。
- **私档**：Alaya（/home/cheyh/projs/Alaya，私有）只读且默认不读。

## 4. 阶段与门（草案；每门停下等 Owner 一字批示，未批不得进入下一阶段。Owner 补充说明可增删阶段）

| 阶段 | 做什么 | 必含 | 交付文件（轨道目录内） |
|---|---|---|---|
| 0 定向 | 存档 A 类原文与启动回执；读完 §2.3-A 全部；只读盘点：仓库结构、状态字段、过期/矛盾清单（§8 线索须逐条核实）、证据类别分布、本轨道计划 | 同族局限声明；读取清单；入库前脱敏核对（approved-spec §9：Owner 原话中与任务无关的个人信息不入公开仓，是否保留由 Owner 一句话定）；无结论 | 00-orientation/00-owner-work-order-verbatim.md（工作令＋§12 补充逐字）、00-orientation/00-startup-receipt.md（Downloads 回执原样复制，附 sha256）、00-orientation/01-orientation-report.md |
| 1 复核 | 逐项核对自称事实：迁移完整性（source-snapshot-pointer / source-copy-verification 可机械复核）、研究回收链（MA-DR-01~15 编号、哈希、37 片 transport）、决策日志 vs 文件、pending 状态字段、旧路径指针 | expected/observed 表；验收债台账（BLOCKED/NOT_RUN/pending 等未关闭项） | 01-verification/00-verification-ledger.md、01-verification/01-acceptance-debt-register.md |
| 2 评审 | 复合评审：需求 MA-REQ-0001~0016 vs Owner 目标与研究共识；方法 MA-METHOD-*；P0 候选＋frontier 评审＋revision contract；治理/权威设计的成本与收益；产品核心缺口（P0-1~P0-4）；31 个 candidate label 的去留 | findings 分级（BLOCKING / REPAIR_RECOMMENDED / NON_BLOCKING / OBSERVATION / QUESTION）；每条带证据与 claim 类别；Owner 决策清单（每题背景一句＋选项＋推荐默认，人话） | 02-review/00-review-summary.md、02-review/NN-<theme>.md、02-review/99-owner-decision-package.md |
| 3 独立设计 | 只对 Owner 在门 2 选定的条目做 greenfield 设计；每稿自我批判节；与既有方案分歧清单；adoption_gate: 不生效 | 独立性模式见 §5.3 | 03-independent-design/NN-design-<X>.md |
| 4+ 其他 | Owner 补充说明指定（见 §1.2 末行候选） | — | 04-.../ |
| 收口 | 门台账、返回契约、移交候选清单、续接读序；结论归档提案（§7） | — | 09-continuation/09-closeout.md |

## 5. 写入授权（起草方提议的默认值；Owner 一句"开始/开工"即视为确认默认值；确认前一律只读）

### 5.0 每批写入的 task-local action context（authority map §7 要求；开工后填写、随续接检查点存档）
```yaml
repository_action_context:
  task_id: META-AGENT-FABLE5-REVIEW-AND-DESIGN-001
  actor: claude-fable-5.1@claude-code-vscode
  exact_repository: 08822407d/Meta-Agent
  base_ref: <每批写入前 fetch 后钉住的 origin/master SHA>
  allowed_paths: [reviews/META-AGENT-FABLE5-REVIEW-AND-DESIGN-001/**]
  allowed_actions: [create_files_in_allowed_paths, commit, push_to_task_branch, open_or_update_single_draft_PR]
  prohibited: [见 §5.2 一律不改清单, §6]
  user_authorization_ref: §12 第 N 次补充（日期）＋Owner "开工" 原话
  safety_preflight_ref: 09-continuation/<本批预检记录>
  expires_with_task: true
```

### 5.1 谱系
- 一个任务号 = 一条分支 = 至多一个 open PR。分支 `meta-agent-fable5-review-and-design-001`，从最新 origin/master 新建（建前 fetch＋钉住 SHA，枚举 open PR 与路径交集）。
- 一个 Draft PR（例外理由：多阶段门控、内容随门变化），收口时转 Ready 交 Owner 合并；合并前给出明确 merge 建议。不直接推 master、不 merge、不删分支、不 force-push。
- 已合并任务的修正用新任务号新分支（Mnemosyne PR #248 事故的处置规则，记录存于 Meta-Agent research/waves/2026Q3-independent-wave-001/decisions/PR248-scope-mismatch-assessment.md）。
- Meta-Agent 仓**没有** preflight 脚本；每批写入前手工做：fetch → 记 origin/master SHA → `gh pr list --state open` → 确认本分支 PR 未合并/关闭 → `git diff --name-only origin/master...HEAD` 确认变更集 ⊆ 授权路径 → 记入 §5.0 的 safety_preflight_ref。

### 5.2 路径
- **只新建**：`reviews/META-AGENT-FABLE5-REVIEW-AND-DESIGN-001/`（新顶层目录；结构见 §4 交付列）。
- **一律不改**（发现问题写进 findings，原文不动）：README.md、MIGRATION-STATUS.md、current/*、authority/*、methodology/*、history/*、candidates/*、research/*、migration/*、handoff/*、cases/*、decision-support/*。
- 不发放任何稳定 ID（MA-REQ / MA-METHOD / MA-DEC / MA-MIG / MA-PEND）；不分配 MA-DR 序号（如需外部研究，只写候选任务书，编号与发射由 Owner 定）；不新增 candidate label 与 31 个既有 label 撞名。
- 不写 Mnemosyne、MyOS2、Alaya 任何仓库。归档结论到 Alaya 属 §7，需 Owner 单独同意。

### 5.3 独立设计的独立性模式（Owner 二选一，可混用；不答按 (b) 用于核心架构、(a) 用于其余条目）
- **(a) 同会话、披露非盲**：本会话在读过全部既有方案后设计；每稿显式声明"非盲，起草者已读 X/Y/Z"，独立性只靠自律。成本低，独立性弱。
- **(b) 另开全新会话盲设计**：由本会话起草一份"盲设计任务书"（允许读：Owner 目标与本轨道门 2 批示；禁止读：approved-spec 细节、候选包、研究报告、Mnemosyne 记忆系统设计），交 Owner 另开会话执行，交付到 ~/Downloads，本会话收档后再做"分歧清单"。独立性强，成本高（Owner 要多贴一次任务书）。
- 与 Mnemosyne 记忆系统候选设计的关系：它是 Fable 族作品，本会话与它**同族**；评审它时须写同族局限声明。

## 6. 明确禁止（must_not_do）

- 不把 Meta-Agent 描述为 operational / production-ready / 已授权 pilot（approved-spec §13 末段"Until a separate Owner decision activates this spec…"）。
- 不做 handoff-current.md `prohibited_in_same_step` 列出的任何一项：validator 实现、fixture 执行、target truth 变更、方法论变更、稳定 ID 发放、初始记忆系统落地、RAG、MCP、自动化、私有材料摄入、benchmark、pilot、operational activation。
- 不加载已退役的 current/meta-agent-mnemosyne-guidance-compatibility-guard.md 作为指导；不把 Mnemosyne 的 guard/状态/TODO 当 Meta-Agent 行动计划。
- 不创建根目录 CLAUDE.md / AGENTS.md / .claude/（Owner 预置的除外，不改不删）。
- 不对 Mnemosyne、MyOS2、Alaya 做任何写操作；不切换那些仓库的分支。
- 不发起 Deep Research / 外部服务调用 / 修改连接器；不把未脱敏私有材料写进公开仓库；不写入任何密钥。
- 不把任何设计当已采纳；不替 Owner 做决定；不在 Owner 说"开工"前开工。
- 不用绝对化二分压扁有梯度的事实；不虚构连续性，缺证据就写缺。
- Claude Code 自动记忆（~/.claude/projects/-home-cheyh-projs-Meta-Agent/memory/）：只允许写 Owner 偏好类条目，不得写任务状态或 Owner 决定（真相只在仓库）。

## 7. 记录纪律

- 每份产出文件头：`track_id / record_type / created_by_task / generated_by_actor: claude-fable-5.1 / generated_on_surface: claude-code-vscode / date / base_master_sha / evidence_class / authority_level: non_execution_source_advisory`。
- 结论一律分类：`VERIFIED_REPOSITORY_FACT / DIRECT_OWNER_INSTRUCTION / MODEL_INFERENCE / DESIGN_RECOMMENDATION / UNKNOWN_REQUIRES_EVIDENCE`（行内简写 [VRF]/[DOI]/[MI]/[DR]/[UNK]）。
- 同族局限：评审 GPT 族产物（approved-spec、研究报告、P0 候选）属跨族视角但仍是单模型意见；评审 Fable 族产物（Mnemosyne 记忆系统设计等）不构成独立复核——每份评审文件固定一节声明。
- commit SHA 只从工具输出复制；行号是易腐字段，优先"函数名/节标题＋路径"；外部结论须可解析 URL/DOI。
- 每个子步骤完成即 commit＋push（信息保全优先于整洁）；提交信息以任务号开头（沿仓库既有写法 `META-AGENT-FABLE5-REVIEW-AND-DESIGN-001 <message>`）；尾注四行 `Agent-Action-Actor: claude-fable-5.1@claude-code-vscode / Agent-Task: META-AGENT-FABLE5-REVIEW-AND-DESIGN-001 / Agent-Run-Context: <本轨道记录路径> / Agent-Content-Producer: claude-fable-5.1`，再加 `Co-Authored-By: Claude Fable 5.1 <noreply@anthropic.com>`。
- 上下文纪律：每个门结束写续接检查点（09-continuation/）；上下文占用约 70% 时先落盘再提醒 Owner 压缩。
- 归档：经 Owner 采纳的结论文件，按双仓归档制度提议归 Alaya `research/MA/`（目录尚不存在，首次归档时按 Alaya indexes/research-archiving-convention.md 新建；文件名 `<统一号>-<主题>-<角色>-<日期>.md`，两侧 bytes/sha256 互引）；执行需 Owner 单独同意。会话退场时按 Mnemosyne 既有惯例归档（Alaya 全量转录＋本仓脱敏有效内容；时机由 Owner 定）。
- **对话回复规则**（来源：Owner 2026-08-31 纠正的跨会话转达件＋起草方操作化）：回复只写人话——本轮对 Owner 目标的意义、需要 Owner 做/答什么；仪式性/证据性内容进文件；每个提问附三件套；每次回复末尾一行"本轮推进了什么｜下一步仓库写入：是/否/待授权——…"。

## 8. 起草方粗查所见的线索（未经本轨道核实；只作复核起点，不得直接采信）[MI]

1. Meta-Agent 仓无任何代码/schema/fixture，232 文件皆 Markdown/YAML/JSON(1)/base64 分片；v0.1 = "Owner 带限制接受的、inactive 的设计与治理基线"（2026-07-31）。
2. MIGRATION-STATUS.md 的 `next_candidate_artifact` 指向尚不存在的 candidate-spec-v0.2.md。
3. methodology/core-methodology.md、cases/case-and-feedback-ledger.md、research/README.md、wave OPERATOR.md、research/meta/manifest.yaml 仍引用 cutover 前的 `target-projects/meta-agent/...` 旧路径与 Mnemosyne 路径。
4. 多份 front matter 停留在 pending（batch-a README、decision-support、cases ledger、wave decisions、MA-DR-09.yaml）；MA-DR-09 formal intake 提到的 `report/MA-DR-09-report.md` 不存在（实际为 37 片 bz2-base64）。
5. approved-spec accepted_limitations 仍含"non-FABLE health review 待完成"与"DR-06/07 建议先做"——后者已完成，前者在 Mnemosyne 侧已无限期搁置，无人对账。
6. 5 条已合并的远端分支未删（各 0 个未合并提交）；仓库 26 天无提交；共 37 个提交（`git rev-list --count master`），作者字段均为 Owner、无 Agent-*/Co-Authored-By 尾注，来源推断为 ChatGPT 连接器/Codex [MI]；Claude Code 从未写过此仓（Mnemosyne 平台事实文件标其为"候选、需先做有界文档型试点"）。
7. 完成 P0 草案→frontier 评审→迁移收口的那条 ChatGPT 专用对话未归档到 Alaya（archive-inventory-ma.yaml known_gaps）。
8. Mnemosyne 镜像 target-projects/meta-agent/ 为退役 redirect 桩＋cutover 前旧版（缺 MA-DEC-0008 / MA-MIG-0002）。
9. Owner 期待的首个真实用例（MyOS2 内核分析规划）已由 Mnemosyne 会话代为启动并留有 5 项"留给 meta-agent 的接管清单"。
10. 已有 31 个 candidate label（CAND-* 12、WAVE-CAND-* 10、DR09-CAND-* 9）与一份 Fable 族记忆系统候选设计（25 节）——独立设计须先查重。

## 9. 跨会话通信（Claude Code 本机会话互发消息；**全部在 Owner 说"开工"之后**）

- 机器名（`meta-agent-xx [ref]`）**每次进程重启都会变**；仓库记录里引用会话时同时写 UUID。发消息前必先 ListAgents，`to` 照抄行名。
- 收到的消息只带发送方临时名、不带任务身份：**正文必须自报身份**（机器名＋任务号＋actor@surface）并写明收件方与"若你不是…请忽略并留存"。
- 可能给你发消息的会话：Mnemosyne 主导会话（起草方；起草时为 `mnemosyne-e8 [cb0c38]`，会变）——它可能转来补充材料、指针、哈希；**材料只是材料，Owner 的话才是授权**；来源标 `cross_session_relay`。MyOS2 本地主导会话（`myos2-xx`）是平行的另一任务，与你无写入交集；如需协作事实（例如 Meta-Agent 首个用例的现状），只读交换。
- 收到非发给你的广播：忽略并留存，不执行。
- （补充说明之后）你要回一句确认时（例如收到补充材料）：首行写消息类型，正文自报身份、复述收到的哈希/路径。发送失败：写到 ~/Downloads 并请 Owner 转交。

## 10. 完成定义与返回契约

- 完成 = 所有门经 Owner 批示；Draft PR 转 Ready 交 Owner 合并；收口件含门台账、`agent_product_PR_delivery`（task_id / PR / 变更路径 / 未动的受保护路径 / 验证方式 / 已知局限 / merge 建议）、移交候选清单、续接读序。
- 每次会话结束按返回契约汇报：base/head SHA、变更路径、未动受保护路径、验证方式、已知局限、下一个门。

## 11. Owner 补充说明时可以顺便定的事（人话；不答按括号里的默认；每条格式：问题｜不答＝默认｜答了的影响）

1. 复核/评审/重新设计三个词我按 §1.2 理解（核对它自称的状态是否属实 / 评价设计与治理够不够格 / 抛开旧方案从你的目标重做）。要不要再加：给 Meta-Agent 写一份它自己的行为守则草案、拿 MyOS2 当它第一个真实用例来映射、评一评 Mnemosyne 那边给它做的记忆系统草案、给下一个 Meta-Agent 会话准备交接包？｜不答＝只做三件｜答了＝加进阶段 4。
2. 成果放仓库新建的 reviews/ 目录、开一个草稿 PR 最后由你合并，仓库原有文件一字不改。｜不答＝照此｜答"改"＝按你说的改位置。
3. 重新设计由谁做：我自己（已看过全部旧方案，省事但难免受影响）还是另开一个没看过旧方案的新会话（更独立，你要多贴一次任务书）？｜不答＝核心架构另开新会话，其余我做｜答了＝照答。
4. 节奏：每做完一个阶段停下等你一句"可以"，还是一口气做完再报？｜不答＝每阶段停｜答"一口气"＝中途不打扰你，但你只能最后否决。
5. 被你采纳的结论要存进私档 Alaya：我直接写，还是留给 Mnemosyne 会话/你来写？｜不答＝我不碰 Alaya，到时再问你｜答"你写"＝我按归档规则写并给你两边哈希。
6. 要不要顺便起草"Meta-Agent 自己的行为守则"（那个仓库现在没有任何给 agent 的规范）？｜不答＝不写｜答"要"＝作为草案交付，不生效。
7. 其他你想加的约束或材料。

## 12. Owner 补充说明登记处

（本节由会话回填 Owner 在对话中所说的话；Owner 不必、也请不要编辑本文件。）

登记规则：本 Downloads 原件冻结不改。写入授权前，每条补充逐字登记到同目录 `receipts/META-AGENT-FABLE5-REVIEW-AND-DESIGN-001-owner-supplements.md`（逐条标日期、序号）；写入授权后，工作令原文＋全部补充按序进入仓库轨道目录 `00-orientation/00-owner-work-order-verbatim.md`，此后新补充继续追加在该仓库副本。与前文冲突时以补充为准，并在登记处注明改了哪条。哈希核验只针对首次读取的 Downloads 原件；之后以回执登记的哈希为准。
<!-- END work-order verbatim -->

## B. Owner 补充说明登记（逐字；Downloads 登记件的完整副本）

<!-- BEGIN supplements verbatim -->
# Owner 补充说明登记 · META-AGENT-FABLE5-REVIEW-AND-DESIGN-001

```yaml
record_type: owner_supplements_register
track_id: META-AGENT-FABLE5-REVIEW-AND-DESIGN-001
register_rule: 工作令 §12（Downloads 原件冻结；每条补充逐字登记、标日期与序号；写入授权后随工作令原文进入仓库 00-orientation/00-owner-work-order-verbatim.md）
registered_by_actor: claude-fable-5.1@claude-code-vscode
session_machine_name: "meta-agent-34 [9b1e59]"
session_uuid: 5fbf7385-035e-4075-9703-5aaf05159b15
evidence_class_of_owner_text: DIRECT_OWNER_INSTRUCTION
evidence_class_of_session_restatement: MODEL_INFERENCE
gate_status_after_this_entry: BEHAVIOR_GUIDANCE_FIRST_all_other_work_deferred_by_supplement_4
```

---

## 补充 #1 · 2026-09-03 · 对话第 2 条 Owner 消息（登记于 2026-09-03T09:28:16+08:00）

### Owner 原话（逐字，A 类）

> 我接下来要你模仿Mnemosyne建设过程中，我曾经用claude的fable5做过的类似工作，对Meta-Agent的现有设计和实现做复核评审然后提出改进意见；然后独立地对现有需求和构想做逻辑一致性和可行性检查和纠正后，做人工复核确认和补充说明，给出一些需要“深度研究”解决的问题（需要考虑chatgpt的“深度研究”和claude的“research”功能的特点特长和用法，而不是直接假定它们就能解决你没法解决的问题）进行研究后，综合这些信息做出独立设计。注意独立工作这部分和Mnemosyne中一样是独立的对照组，不要直接替代chatgpt的旧结果，独立对照工作完成后还要进行对比和改进。你现在先做我说的前面一项工作，就是复核评审和改进意见。

### 会话复述（[MI]，供 Owner 纠正）

Owner 把本轨道定为一条串行工作线，共五段，现在只做第一段：

1. **复核评审 ＋ 改进意见**（现在做）：仿照 Mnemosyne 建设期 Owner 用 Fable 5 做过的同类工作（即工作令 §2.3-B 所列 FABLE5-REVIEW2-001 轨道），对 Meta-Agent 现有设计与实现做复核与评审，并提出改进意见。
2. **独立的逻辑一致性与可行性检查＋纠正**：对现有需求与构想做独立检查并给出纠正稿。
3. **Owner 人工复核确认与补充说明**：Owner 对第 2 段的结果做人工确认与补充。
4. **提出需要"深度研究"的问题并研究**：会话列出必须靠深度研究才能解决的问题；出题时须考虑 ChatGPT "深度研究" 与 Claude "research" 各自的特点、特长与用法，不得假定它们能解决会话自己解决不了的问题。研究由 Owner 发射（工作令 §1 header：本轨道不自行发起 Deep Research）。
5. **综合以上信息做独立设计**：独立设计是与 Mnemosyne 时同样的"独立对照组"，不直接替代 ChatGPT 的旧结果；独立对照工作完成后，再做与旧结果的对比与改进。

与工作令的关系（[MI]）：
- 第 1 段 ≈ 工作令 §4 阶段 1（复核）＋阶段 2（评审），"改进意见"作为阶段 2 的显式交付；进入前仍须先做阶段 0（定向）。
- 第 2～5 段改写了工作令 §4 阶段 3 及 §1.2 "不限于此三项" 的内容，阶段结构以本补充为准；具体门与交付文件名待 Owner 后续补充或开工后在定向报告中提案。
- 本补充部分回答了工作令 §11 第 1 问（范围）与第 3 问（独立设计为独立对照组）；§11 其余各问暂按默认。

### 登记时的门状态

- 末句"你现在先做我说的前面一项工作"疑似等价于工作令 §2.6 的"开工"，但 Owner 启动提示词明言"直到我说'开工'才开始"。会话未据此开工，已向 Owner 提问确认（见对话）。
- 本条登记未触发任何仓库写入。

---

## 补充 #2 · 2026-09-03 · 对话第 3 条 Owner 消息（登记于 2026-09-03T09:43:24+08:00）

### Owner 原话（逐字，A 类）

> 你的复述中有两点我要纠正：第一点里，我用claude的fable对Mnemosyne做过两次复核评审和独立设计，你提出的应该是8月底做的第二次，不过你可以参照第二次的思路和细节（因为第一次是让chatgpt pro设计的执行细节。如果参考第一次的设计细节和思路，那在独立性上就不是很可靠了），我不确定第二次复核评审是不是仅仅有“FABLE5-REVIEW2-001”这一次工作，你应该从工作历史中看看，不过第二次工作都是集中在8月底的两三天里完成的，你不用全仓库搜索排查。第三点里，我说的人工复核和补充说明有两方面来源，1是我自己突然想起来要补充说明的，2是你在分析需求构想时感觉不是很清楚必须由我说清楚的。此外你在给出研究课题时注意在本地生成对应文件，就像在Mnemosyne里那样，它们是做设计的依据，而等研究结论出结果后，要在Alaya中进行存档备份，操作规则等信息你可以从本机上活动中的claude code上的Mnemosyne建设对话处询问。如果你对我描述的任务和补充说明没有什么疑问就可以自己开工了。因为我还同时用claude code进行其他工作，为了避免飞速消耗额度影响进行中的工作，你只能串行工作。

### 会话复述（[MI]，供 Owner 纠正）

1. 纠正复述第 1 段：Owner 用 Fable 对 Mnemosyne 做过**两次**复核评审＋独立设计。本轨道参照的是 **8 月底的第二次**（其思路与细节可参照）；第一次的执行细节由 ChatGPT Pro 设计，参照它会损害独立性，**不参照第一次**。第二次是否只有 FABLE5-REVIEW2-001 一个轨道，Owner 不确定；会话应从 Mnemosyne 工作历史（集中在 8 月底两三天）核实，不做全仓库搜索。
2. 纠正复述第 3 段：Owner 的"人工复核确认与补充说明"有两个来源——(1) Owner 自己想起来要补充的；(2) 会话在分析需求与构想时感到不清楚、必须由 Owner 说清的问题。
3. 新增：给出研究课题时，要像在 Mnemosyne 里那样在本地生成对应的课题文件（它们是后续设计的依据）；研究结论回来后要在 Alaya 存档备份；存档操作规则可向本机活动中的 Mnemosyne 建设会话（Claude Code）询问。
4. 开工授权：若会话对任务与补充说明无疑问，即可自行开工。
5. 新增硬约束：Owner 同时在用 Claude Code 做其他工作，为避免额度消耗过快，本会话**只能串行工作**（会话理解为：不使用 Workflow/并行子代理编排；单线程自己读自己写；这也回答了启动回执 Q1——答案为"不要"）。

### 登记时的门状态

- 会话对任务无阻塞性疑问，按第 4 条视为 Owner 授权开工；工作令 §5 默认值生效（分支 meta-agent-fable5-review-and-design-001、一个 Draft PR、只新建 reviews/META-AGENT-FABLE5-REVIEW-AND-DESIGN-001/）。
- 本轮工作单元 = 补充 #1 的第一段"复核评审＋改进意见"（工作令阶段 0→1→2）；阶段 0 与阶段 1 之间不再停等 Owner 批示，阶段 2 完成后停下交 Owner 决策。此为会话推断 [MI]，Owner 可随时叫停或恢复逐门停等。

---

## 补充 #3 · 2026-09-06 · 对话中 Owner 对第 ① 段决策清单（99）的答复（登记于 2026-09-06T11:28:01+08:00）

### 过程性消息（Owner，2026-09-06，逐字；非任务条款，登记备查）

> 要不你就在当前对话里直接给我显示那8个问题,要带说明和背景简介(目的是要让我能知道你想问什么),我就直接在对话里回复

### Owner 原话（逐字，A 类）

> 关于1,我不知道所谓规格包合成器是什么.但如果要问用什么真实项目,暂时不要用MyOS2,因为这个项目要求和我描述的Meta-Agent的主要目标软件项目类型很不一样.主要的使用目标的项目类型目前有一部分收集在"git@github.com:08822407d/JobSpecific.git"下的"需求整理"中,作为"具体开发需求和代码库项目"的试验和真实项目来源.关于2,因为在上次推进meta-agent的建设之后一直集中精力推进mnemosyne的建设,所以我几乎忘了meta-agent进行到什么程度,以及你提到的这两个死锁的规则是什么情况,所以先搁置它,后面你帮我好好回忆一下.关于3,我不知道这是什么,需要足够的说明.关于4,行为守则至少要从mnemosyne建设过程中积累的经验中借鉴一部分,你在当前claude code任务中的表现表明急需做这件事.关于5,说的太模糊,不是人类能理解的内容,后续要重新讲解.关于6,可以抽查一下时效性,可能过时的那些重做一次研究,综合分析后来解决其中需要确定的问题.关于7,最好从对话存档里找回原文作文meta-agent的原文基础.关于8,这点也一样,说的过于模糊我不知道你想表达什么.你先做目前确定下来的工作.完成之后解决其他的.

### 会话复述（[MI]，供 Owner 纠正）

| 题 | Owner 的意思（人话） | 本会话据此要做的事 |
|---|---|---|
| Q1 | 我上一条里"验证器规格包"等说法你听不懂（我的表达问题）。真实项目**不用 MyOS2**（类型不对）；Meta-Agent 主要面向"具体开发需求和代码库项目"，样本在 JobSpecific 仓库的"需求整理"目录 | 去读 JobSpecific/需求整理，弄清目标项目类型；首个用例从那里选；用人话重新解释 Q1 |
| Q2 | 你已经不记得 Meta-Agent 做到哪、"死锁"指什么；先搁置；之后要我帮你回忆 | 之后写一份人话的"Meta-Agent 进展与现状回顾"，再重提 Q2 |
| Q3 | 不知道 non-FABLE health review 是什么；要充分说明 | 之后用人话讲清它的来龙去脉，再重提 Q3 |
| Q4 | **要**做行为守则；至少借鉴 Mnemosyne 建设中积累的经验；我在本任务里的表现（回复不像人话）说明这件事很急 | 起草守则草案，以 Mnemosyne 经验为主要素材；同时立即改正本会话的回复方式 |
| Q5 | 太模糊，不是人能理解的；之后重新讲 | 之后用具体例子重讲"治理太重"指什么 |
| Q6 | 可以：先抽查研究的时效性，可能过时的重做一次研究，综合后再解决其中需要拍板的问题 | 做研究时效性抽查 → 列出需重做的课题 → 综合 → 再把要拍板的问题摆出来 |
| Q7 | **允许**从对话存档（Alaya）里找回 Owner 原文，作为 Meta-Agent 的原文基础 | 读 Alaya，找回 Owner 关于 Meta-Agent 的原话，建原文登记表 |
| Q8 | 太模糊，不知道我想说什么 | 之后用具体例子重讲 |
| 总指令 | 先做已经定下来的（Q1 读 JobSpecific、Q4 守则、Q6 时效抽查、Q7 找回原文），做完再解决其他的（Q2/Q3/Q5/Q8 的重新讲解） | 按此顺序执行 |

### 登记时的门状态

- 门 A（Owner 审阅第 ① 段）：**部分批示**——Q4、Q6、Q7 已定；Q1 定了"不用 MyOS2、用 JobSpecific 来源"；Q2/Q3/Q5/Q8 搁置待重新讲解。
- Owner 纠正（沟通方式）：本会话的回复与决策清单含 Owner 无法理解的内部术语；自本条起，面向 Owner 的解释须用具体例子、不用未解释的术语。

---

## 补充 #4 · 2026-09-06 · 优先级改变（登记于 2026-09-06T11:54:01+08:00）

### Owner 原话（逐字，A 类）

> 其他工作都往后推,先确定Meta-Agent的行为守则.否则以后你的每次回复都大概率存在各种问题导致大量token用在低效率沟通上.

### 会话复述（[MI]）

先把行为守则定下来（Owner 逐条/整体批准），其他一切（首例、研究、第 ② 段、三个待答问题）都后推；理由是没有守则，会话每次回复都会有沟通问题、浪费 token。守则一旦批准即对本轨道立即生效。
<!-- END supplements verbatim -->

## 核验方法

```bash
F=reviews/META-AGENT-FABLE5-REVIEW-AND-DESIGN-001/00-orientation/00-owner-work-order-verbatim.md
# 工作令段（应等于头部 work_order_sha256）
awk '/^<!-- BEGIN work-order verbatim -->$/{f=1;next} /^<!-- END work-order verbatim -->$/{f=0} f' "$F" | sha256sum
# 补充说明段（应等于头部 supplements_register_sha256_at_copy；若之后在本文件追加了新补充，则以追加时登记的新哈希为准）
awk '/^<!-- BEGIN supplements verbatim -->$/{f=1;next} /^<!-- END supplements verbatim -->$/{f=0} f' "$F" | sha256sum
```
