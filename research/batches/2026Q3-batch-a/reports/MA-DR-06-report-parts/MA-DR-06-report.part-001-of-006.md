```yaml
research_id: MA-DR-06
research_title: Automated Agentic System Design and Robust Workflow Search
target_project: Meta-Agent
report_role: external_research_evidence_non_execution_source
```

# 自动化 Agentic System Design、Workflow Search 与鲁棒性研究报告

## 研究绑定、范围与执行计划

**报告日期：** 2026-08-01  
**研究焦点：** 自动化 Agentic-system design 的当前研究状态、可验证的实际应用，以及 Meta-Agent 可安全采用的设计边界。  
**证据截止：** 2026-08-01。  
**报告性质：** 外部研究证据；不是 Meta-Agent 的 target truth，不修改 repository，不授权 operational activation。

任务可被解释为四种相邻但不同的研究主题：

| 可选解释 | 核心问题 | 适用输出 |
|---|---|---|
| Prompt / instruction optimization | 如何自动改善单个提示、demonstrations 或模块参数 | DSPy、OPRO、PromptBreeder、TextGrad 等方法比较 |
| Workflow / topology search | 如何自动产生角色、节点、边、控制流和工具调用结构 | GPTSwarm、ADAS、AFlow、MaAS、OneFlow 等比较 |
| Runtime self-adaptation | 系统是否应在运行时改写自身结构、memory 或 routing | 在线学习、安全边界、rollback 和权限研究 |
| Governance-first design automation | 哪些设计步骤可自动化，哪些必须由 Owner 或 reviewer 决定 | bounded search、human gate、audit trail、promotion policy |

**本报告选择的默认重点是第二项和第四项的结合：**“当前研究与实际应用”，即研究 design-time workflow search，同时把 runtime autonomy、权限和方法论晋升视为独立且更高风险的问题。这样既覆盖任务书中的 ADAS/AFlow/RobustFlow/OneFlow 研究线索，也与 Meta-Agent v0.1 的保守治理基线相容。

**执行计划与完成状态**

| 工作流 | 实际处理 |
|---|---|
| 项目绑定 | 读取了上传的 MA-DR-06 任务书及其中的项目背景、研究问题和输出合同 |
| Repository 输入 | 尝试通过可用 GitHub 连接读取 `08822407d/Mnemosyne`，但该 repository 未出现在可访问安装或公开搜索结果中 |
| 外部研究 | 核验论文正文、实验表格、同行评审状态、作者代码仓库和官方安全资料 |
| 定量提取 | 从论文正文提取 benchmark、sample size、性能、成本、robustness 和 ablation 数据 |
| 反面证据 | 检查强 single-agent baseline、模型迁移下降、paraphrase instability、judge bias、代码执行风险和安全遗漏 |
| Meta-Agent 映射 | 可完成原则级映射；由于 repository 文件不可读，不能可靠完成逐条 `MA-REQ-0001–0016` 或 `MA-METHOD-0001–0006` 映射 |

任务书记录的准备基准为：

```text
prepared_against_repository: 08822407d/Mnemosyne
prepared_against_master: 4eb4181ee7642aa6992c57802d052a4f39d0147e
```

但本次执行**无法确认该 commit 是否仍是执行时最新 `master`**，也无法读取以下强制输入：

```text
target-projects/meta-agent/current/approved-spec.md
target-projects/meta-agent/methodology/core-methodology.md
target-projects/meta-agent/research/reviews/MA-DR-01-05-cross-report-synthesis-v0.1.md
target-projects/meta-agent/research/reviews/MA-DR-01-05-gap-analysis-v0.1.md
target-projects/meta-agent/current/active-context.md
```

因此，后文所有 Meta-Agent-specific 结论均标记为 `TARGET_SPECIFIC_INFERENCE` 或 `RECOMMENDATION`，不得被视为已核验的 requirement/method 映射。

## 执行结论与研究背景

**Executive verdict**

自动化 Agentic-system design 已从单纯的 prompt optimization 发展到 graph、code、supernet、MCTS、population search、reinforcement learning 和 preference optimization 等多种设计空间。GPTSwarm、ADAS 与 AFlow 已分别在 ICML 2024、ICLR 2025 和 ICLR 2025 获得同行评审发表，说明“将 Agent/workflow 当作可优化程序”已经成为正式研究方向，而非只有 framework marketing 的概念。citeturn1search11turn2view0turn2view1turn9academia49

然而，现有证据**不支持把 unrestricted automated design search 纳入 Meta-Agent v0.1 或直接用于生产系统自我改写**。当前研究主要在公开 benchmark、离线搜索、有限工具集和可自动计算 reward 的环境中证明性能；真实权限、隐私、不可逆写入、人类返工、长期维护和事故恢复通常没有进入主要 objective。AFlow 明确固定了模型、temperature 和部分格式，以缩小搜索空间；ADAS 的官方仓库还直接警告其执行的是不受信任的 model-generated code。citeturn0search1turn11search0turn11search2

最强的正面证据是：自动搜索确实可能发现优于人工模板的 workflow。ADAS 在 DROP、MGSM、MMLU 和 GPQA 的独立 domain search 中超过其人工 baselines；AFlow 在六项 benchmark 的同一实验设置中报告平均分 80.3，对比其人工方法平均提升 5.7%，并显著超过论文中复现的 ADAS。citeturn3view0turn3view1turn4view0turn4view1

最重要的反面证据是：**multi-Agent topology 本身不应被当作价值来源。** 2026 年 OneFlow 研究显示，在所测试的 homogeneous workflow 中，一个 LLM 通过 multi-turn role simulation 可匹配或略超过多实例 multi-Agent 执行，并因 KV-cache reuse 降低成本。这意味着任何自动 multi-Agent design 都必须先击败“同一 workflow 由单 Agent 顺序执行”的反事实 baseline。citeturn3view4turn4view4turn12view3

另一个关键反面证据是 topology instability。RobustFlow 基于 1,255 个原始任务描述、7,530 个 instruction variants 和 31,889 个生成 workflow，发现既有方法在语义等价 paraphrase 和 noise 下的平均结构稳定性可降至约 0.4–0.7；这种问题在 temperature 为零时也没有消失。RobustFlow 的训练可把其测试中的 robustness 提升至约 0.70–0.90，但其代码 benchmark 平均性能低于 FlowReasoner 和 ScoreFlow，显示 robustness 与 raw benchmark score 之间存在实际 trade-off。citeturn5view1turn7view0turn7view1turn7view2

因此，本报告的核心处置是：

| 决策 | 结论 |
|---|---|
| 是否现在采用 automated design/search | **只采用为 proposal-only、bounded、offline 的候选设计方法，不作为自主执行机制** |
| 是否增加 specification synthesis | **是，作为 non-operational candidate method** |
| 是否增加 alternative generation/comparison | **是，但必须包含 fixed template、strong single Agent 和 deterministic workflow baseline** |
| 是否默认搜索 multi-Agent | **否；topology 必须是搜索结果，不是预设目标** |
| 是否允许搜索改动权限、隐私或 target truth | **否，必须是 immutable hard constraints** |
| 是否允许生成代码 | **仅在无网络、无凭据、no-write sandbox 中；默认更适合受限 DSL/IR** |
| 是否允许自动晋升方法论 | **否；search result 只能成为有证据的 proposal** |
| 是否适合进入 v0.1 | **只进入 design principle/candidate，不进入 autonomous runtime scope** |

以上处置属于 `RECOMMENDATION`，不是 repository-backed acceptance。

## 定义、分类与系统版图

**“自动设计 Agentic System”不应被定义为单一算法。** 它是一组设计自动化层级，区别在于可改变什么、如何表示、用何种 feedback，以及结果是否可审计。

| 自动化层级 | 典型输入 | 输出或可变参数 | 常见反馈 | 主要风险 |
|---|---|---|---|---|
| Prompt optimization | 固定任务、固定 pipeline、示例数据 | instruction、demonstrations、reasoning prompt | accuracy、LLM feedback | prompt overfitting、迁移失败 |
| Module optimization | declarative modules 或固定 program | 每个 module 的 prompt、few-shot examples | end-to-end metric | credit assignment 不清 |
| Tool selection/policy | 工具目录、schema、任务 | 工具子集、调用顺序、参数 policy | task success、cost | 越权、tool description injection |
| Role/team generation | 任务描述、可用模型/工具 | role、responsibility、agent count | outcome、judge score | 虚假专业化、协调开销 |
| Workflow graph synthesis | node/operator library | DAG、state machine、edge、routing | execution score | 结构表达受限、循环或 deadlock |
| Code-represented search | runtime API、sandbox、任务 | 完整 executable workflow | tests、benchmark | 任意代码执行、难以证明约束 |
| Memory/state design | state schema、retention policy | memory tier、write/read/forget rules | long-horizon outcome | privacy、poisoning、不可逆污染 |
| Controller/reviewer search | planner、executor、reviewer primitives | hierarchy、retry、verification topology | quality、false-success rate | evaluator collusion、无限循环 |
| Test/evaluator generation | requirements、oracle 或 reference | tests、rubric、judge prompts | coverage、mutation score | evaluator leakage、reward hacking |
| Query-level generation | 单个 query 与组件库 | 每-query workflow | execution feedback | 高 latency、结构抖动 |
| Runtime self-adaptation | live logs、memory、user state | 在线结构或 policy 更新 | production signals | uncontrolled drift、authority erosion |

Prompt-level methods证明了自然语言 artifact 可以被黑盒优化。OPRO 让 LLM 根据历史候选及其 scores 生成新提示，在论文任务中优于人工 prompt；PromptBreeder 进一步共同进化 task prompts 和 mutation prompts；DSPy 将 LM pipeline 表示为 declarative modules 并编译其 demonstrations；TextGrad 使用 textual feedback 模拟反向传播。这些方法对于“固定拓扑内优化”很重要，但不等价于完整 Agent-system design。citeturn8academia36turn8search0turn9academia49turn9search0

