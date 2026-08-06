`REPLICATED_OR_MULTI_SOURCE_EVIDENCE`：自动化 workflow 在若干 reasoning、code、QA 和 planning benchmarks 上可以超过所选人工 baseline，但改进幅度强烈依赖 executor、task、搜索空间、operator priors 和 evaluator。citeturn3view0turn3view1turn5view3

`VERIFIED_PRIMARY_EVIDENCE`：现有自动 workflow generation 对 paraphrase 和 noise 可能高度不稳定；结构稳定性应与 outcome、security 和 transfer 分开测量。citeturn5view1turn7view1turn7view2

`VERIFIED_PRIMARY_EVIDENCE`：homogeneous multi-Agent workflow 必须与 single-Agent multi-turn execution 比较；否则研究可能把 task decomposition 的收益错误归因于多实例 Agent。citeturn3view4turn12view3

`TARGET_SPECIFIC_INFERENCE`：Meta-Agent 最值得加入的不是“自动建造自主 multi-Agent”，而是三个较窄能力：结构化 specification synthesis、alternative generation/comparison，以及 evidence-rich evaluation package。

`RECOMMENDATION`：v0.1 可立即采用的只是 non-operational design principles：bounded search、immutable authority、strong baselines、paraphrase testing、proposal-only artifacts、safe fallback 和 evidence-gated promotion。

**实践建议**

第一，先建立强 single-Agent 与 deterministic baseline library，再研究 automated search。没有这一步，自动设计系统很容易仅比弱 prompt 或人为复杂的 multi-Agent baseline 好。

第二，把 search space 建在 Design IR 和受限 operator library 上。Code generation 可作为受控实验，但应在 no-network、no-credential、ephemeral filesystem 的 sandbox 中进行，并通过静态 allowlist 和 runtime syscall restriction。

第三，把 design search 与 operational deployment 分离。搜索器输出 `candidate spec + evidence dossier + reproducibility bundle`，而不是直接输出可获得真实权限的运行系统。

第四，采用 Pareto evaluation，不把 accuracy、cost、latency、robustness 和 human burden 预先压成一个永久分数。Owner 应选择可接受 frontier point。

第五，把 same-workflow single-Agent simulation 设为默认 baseline。只有当 heterogeneity、parallelism、独立 fault domains、不同 tool authority 或真实专业模型差异带来可验证收益时，才保留 multi-Agent topology。

第六，把 requirement paraphrase cluster 作为每次设计评估的标准输入。若语义等价需求导致完全不同的 topology，应要求 explanation、canonicalization 或人工澄清，而不是任由搜索器选择。

第七，search cost 必须单独核算。一个 workflow 即使部署推理便宜，也可能需要大量 optimizer calls、candidate executions 和 judge evaluations才能发现；这类 sunk search cost 不应被隐藏在最终 inference cost 后面。

**Open research questions**

| 问题 | 当前证据缺口 |
|---|---|
| 自动设计是否真正减少总人力 | 多数论文测 benchmark，不测 requirement clarification、review、debug、maintenance 和 incident work |
| topology innovation 是否超越 prompt optimization | 需要 equal-compute、same-model、same-token 的分离实验 |
| 异构 multi-Agent 何时必要 | OneFlow 只测试有限 heterogeneous baseline；尚缺系统性 model/tool diversity 因果研究 |
| 如何验证 workflow semantic equivalence | Graph similarity 不能证明行为、权限或 failure semantics 相同 |
| 如何避免 evaluator co-adaptation | 搜索器和 judge 使用相关模型时，可能共同学习风格偏好 |
| 如何安全搜索 memory architecture | 缺少长期 poisoning、privacy deletion、state rollback benchmark |
| 如何衡量用户 learning value | 尚无成熟指标衡量自动化是否削弱用户理解、判断和技能积累 |
| 如何验证 transfer | 需要跨 model family、version、API、domain 和 tool schema 的预注册评估 |
| Search 的最优停止规则是什么 | 需综合 marginal gain、uncertainty、预算和 hidden-test evidence |
| 能否形式化 authority constraints | 需要把权限和 human gate 编译为可静态检查及运行时强制的 policy |
| 如何处理 underspecification | 搜索应何时生成 alternatives，何时必须暂停并请求 Owner 澄清 |
| 如何审计生成代码的安全性 | 静态分析、sandbox 和 tests 仍不能证明不存在隐蔽 side effects |

**Open Owner decisions**

| 决策 | 需要 Owner 明确 |
|---|---|
| Scope | 是否将 automated design search 纳入 future scope，还是只保留 specification synthesis |
| Representation | 后续 IR 是纯 declarative DSL、typed graph，还是 DSL + generated code |
| Search budget | pilot 可接受的优化调用、时间和美元上限 |
| Human gate | 哪些 design changes 必须逐项审批，哪些可批量比较 |
| Learning value | Meta-Agent 应在何种程度上优先帮助用户理解设计，而非只提供最优候选 |
| Heterogeneity | 是否有真实 use case 需要不同模型、工具或权限域 |
| Promotion | candidate method 进入正式 methodology 所需证据等级 |
| Repository access | 是否提供当前 `master` 的五个强制文件，以完成逐 ID 映射 |

**Final disposition matrix**

```yaml
adopt_now_as_non_operational_design_principle:
  - bounded_search_space
  - immutable_owner_authority_privacy_and_permission_constraints
  - proposal_only_outputs
  - strong_single_agent_and_deterministic_baselines
  - same_workflow_single_agent_simulation_baseline
  - paraphrase_noise_and_conflict_robustness_testing
  - explicit_cost_latency_human_burden_and_false_success_metrics
  - reproducible_search_configuration_and_audit_trail
  - evidence_gated_human_promotion
  - safe_fallback_to_fixed_template_or_single_agent

retain_as_candidate_pending_evidence:
  - agent_workflow_specification_synthesis
  - alternative_topology_generation_and_comparison
  - declarative_design_ir_with_static_constraint_validation
  - reusable_operator_component_library
  - pareto_frontier_based_candidate_selection
  - automated_generation_of_evaluation_drafts_subject_to_review

requires_controlled_experiment:
  - mcts_based_workflow_search
  - evolutionary_or_population_based_design_search
  - query_level_workflow_generation
  - cost_aware_agentic_supernet_routing
  - robustness_preference_optimization
  - heterogeneous_model_and_tool_workflow_search
  - code_represented_agent_search_in_no_write_sandbox

defer_to_later_research:
  - runtime_topology_self_adaptation
  - automated_memory_architecture_mutation
  - online_self_improving_agent_systems
  - autonomous_evaluator_and_reward_rewriting
  - embodied_or_high_privilege_agent_design_search
  - automatic_methodology_promotion

reject_or_avoid:
  - multi_agent_as_default_topology
  - unrestricted_execution_of_model_generated_code
  - search_with_production_credentials_or_write_access
  - benchmark_accuracy_as_the_only_objective
  - comparison_only_against_weak_baselines
  - single_llm_judge_as_the_only_promotion_oracle
  - automatic_writeback_to_target_truth
  - allowing_search_to_decide_product_purpose_or_sensitive_authority
  - irreversible_runtime_changes_without_owner_approval
```

**Portable source table**

| Source ID | Title | Authors/Organization | Date | Type | Direct URL / DOI / arXiv ID | Claims supported | Limitations |
|---|---|---|---|---|---|---|---|
| S01 | Automated Design of Agentic Systems | Shengran Hu, Cong Lu, Jeff Clune | 2024; ICLR 2025 | Peer-reviewed paper | https://arxiv.org/abs/2408.08435 | ADAS taxonomy；Meta Agent Search；code search；domain and transfer results | Executor/model age；benchmark scope；untrusted generated code |
| S02 | ADAS official repository | ShengranHu | Accessed 2026 | Official code | https://github.com/ShengranHu/ADAS | Public code、experiment folders、explicit safety warning | Repository availability does not constitute independent reproduction |
| S03 | AFlow: Automating Agentic Workflow Generation | Jiayi Zhang et al. | 2024; ICLR 2025 | Peer-reviewed paper | https://arxiv.org/abs/2410.10762 | MCTS workflow search；Operators；six-benchmark results；cost analysis | Fixed parameters/operator priors；API cost and model dependence |
| S04 | AFlow official repository | FoundationAgents | Accessed 2026 | Official code | https://github.com/FoundationAgents/AFlow | Implementation、benchmarks、raw-data reproduction instructions | README notes migration bugs in some Operators |
| S05 | GPTSwarm: Language Agents as Optimizable Graphs | Mingchen Zhuge et al. | ICML 2024 | Peer-reviewed paper | https://proceedings.mlr.press/v235/zhuge24a.html | Graph representation；node and edge optimization | Graph semantics may not capture full authority/failure behavior |
| S06 | DSPy: Compiling Declarative Language Model Calls into Self-Improving Pipelines | Omar Khattab et al. | ICLR 2024 | Peer-reviewed paper | https://arxiv.org/abs/2310.03714 | Declarative LM modules；compiler optimization | Primarily fixed-pipeline/module optimization |
| S07 | Large Language Models as Optimizers | Chengrun Yang et al. | 2023 | Research paper/preprint | https://arxiv.org/abs/2309.03409 | OPRO；natural-language optimization；prompt gains | Prompt-level scope；optimizer capability dependence |
| S08 | Revisiting OPRO: The Limitations of Small-Scale LLMs as Optimizers | Tuo Zhang, Jinyue Yuan, Salman Avestimehr | 2024 | Research preprint | https://arxiv.org/abs/2405.10276 | Negative evidence for small-model optimization | Focused on smaller LLMs and prompt optimization |
| S09 | Promptbreeder: Self-Referential Self-Improvement via Prompt Evolution | Chrisantha Fernando et al. | ICML 2024 | Peer-reviewed paper | https://proceedings.mlr.press/v235/fernando24a.html | Evolutionary prompt search；self-referential mutation | Fitness overfitting and search cost remain |
