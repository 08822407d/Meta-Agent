|---|---|---|---|---|
| **ISO/IEC/IEEE 29148:2018 — Systems and software engineering — Life cycle processes — Requirements engineering** | https://www.iso.org/standard/72089.html | Edition 2, 2018; confirmed 2024; revision initiated 2026 | Requirements processes和information items贯穿生命周期。citeturn10view2 | 付费全文；不是 Agent-specific；新版尚在开发。 |
| **ISO/IEC/IEEE 42010:2022 — Software, systems and enterprise — Architecture description** | https://www.iso.org/standard/74393.html | Edition 2, 2022 | 区分 architecture 与 architecture description；不规定 format/media；支持 representation neutrality。citeturn10view1 | 不定义 architecting method，也不评价 Agent-specific security。 |
| **The Architecture Tradeoff Analysis Method** | https://www.sei.cmu.edu/library/the-architecture-tradeoff-analysis-method/ ; CMU/SEI-98-TR-008 | 1998 | Scenario-driven quality trade-off、candidate refinement、risk identification。citeturn10view3 | 完整方法成本较高；早于现代 LLM Agents。 |
| **Contracts for Systems Design** | https://doi.org/10.1561/1000000053 | Foundations and Trends in EDA, 2017 | Assumption/guarantee contracts、composition、system design discipline。citeturn1search12 | 形式 guarantees 不能直接套用于 stochastic model behavior。 |
| **Interface theories, contracts, and assume-guarantee reasoning** | https://arxiv.org/abs/0706.1456 | 2007 | Contract composition 和环境假设的理论基础。citeturn1academia49 | 理论性强；不处理 LLM prompts、memory 或 tool injection。 |
| **Decision record template by Michael Nygard** | https://github.com/joelparkerhenderson/architecture-decision-record/blob/main/locales/en/templates/decision-record-template-by-michael-nygard/index.md | Template originating 2011 | Context、decision、status、consequences 的轻量 rationale record。citeturn1search11 | Industry practice，非完整 traceability 或 empirical validation framework。 |
| **Requirements traceability technologies: A systematic review** | https://doi.org/10.1016/j.jss.2018.09.001 | Journal of Systems and Software, 2019 | Traceability benefits、technologies、empirical evidence与maintenance challenges。citeturn1search15 | 文献异质；大量研究非 Agent context。 |
| **Goal Structuring Notation Community Standard Version 3** | https://scsc.uk/r1386.pdf | Version 3, 2021 | Claim–argument–evidence、context、assumption 和 modular assurance-case structure。citeturn3search3 | Notation不保证 evidence 真实或 argument sound。 |
| **STPA Handbook** | https://psas.scripts.mit.edu/home/books-and-handbooks/ | MIT-STAMP-001, 2018 | Losses、hazards、control structure、unsafe control actions、causal scenarios。citeturn3search0 | 全套分析对低风险 proposal-only design 可能过重。 |
| **Safety Analysis in Early Concept Development and Requirements Generation** | https://doi.org/10.1002/j.2334-5837.2018.00492.x | 2018 | 使用 STPA 从 early concept 推导 safety constraints 与 requirements。citeturn2search9 | Safety-critical systems取向；需缩减适配 Agent designs。 |
| **ISO 9241-210:2019 — Human-centred design for interactive systems** | https://www.iso.org/standard/77520.html | 2019 | User、task、context、iteration 和 lifecycle evaluation。citeturn2search1 | 不替代 security、safety、authority 或 project governance。 |
| **BPMN Version 2.0.2** | https://www.omg.org/spec/BPMN/2.0.2 | 2013 | Events、branches、loops、messages、parallel flow 与 process notation。citeturn2search0 | 不表达 stochastic model semantics、source authority 或 prompt injection。 |
| **RFC 2119 — Key words for use in RFCs to Indicate Requirement Levels** | https://www.rfc-editor.org/info/rfc2119/ ; DOI 10.17487/RFC2119 | 1997 | MUST/SHOULD/MAY normative discipline。citeturn8search2 | 只解决规范用词，不解决 requirement correctness。 |
| **RFC 8174 — Ambiguity of Uppercase vs Lowercase in RFC 2119 Key Words** | https://www.rfc-editor.org/info/rfc8174/ ; DOI 10.17487/RFC8174 | 2017 | 明确只有大写 normative terms 具有 BCP 14 含义。citeturn8search8 | 同上。 |
| **RFC 3552 — Guidelines for Writing RFC Text on Security Considerations** | https://www.rfc-editor.org/info/rfc3552/ ; DOI 10.17487/RFC3552 | 2003 | Threats、security properties、misuse、residual risks 应显式记录。citeturn8search7 | Network protocol orientation；需映射到 Agent control/tool model。 |
| **Principles of Sociotechnical Design Revisited** | https://doi.org/10.1177/001872678704000303 | Human Relations, 1987 | Organization、people、technology 和 design process 的联合优化。citeturn8search3 | 不提供 Agent-specific technical controls。 |
| **NASA Software Architecture Review guidance** | https://swehb.nasa.gov/spaces/SWEHBVD/pages/102695501/SWE-143%2B-%2BSoftware%2BArchitecture%2BReview | Current official handbook page accessed 2026-08-04 | Architecture应关联 driving requirements、quality attributes、stakeholders、component sources 和 rationale。citeturn8search15 | NASA governance context；不直接验证通用 Agent方法。 |
| **Why Do Multi-Agent LLM Systems Fail?** | https://arxiv.org/abs/2503.13657 | arXiv, 2025 | Multi-Agent failure taxonomy；specification、misalignment、verification 和 termination issues。citeturn4academia1 | Benchmark/framework sample有限；preprint。 |
| **Rethinking the Value of Multi-Agent Workflow: A Strong Single Agent Baseline** | https://arxiv.org/abs/2601.12307 | arXiv, 2026 | 强 single-Agent 可以复现部分 homogeneous workflows 的收益；要求更强反事实基线。citeturn4academia0 | 很新；跨任务与长期生产 validity 尚有限。 |
| **AgentDojo: A Dynamic Environment to Evaluate Prompt Injection Attacks and Defenses for LLM Agents** | https://arxiv.org/abs/2406.13352 | arXiv, 2024 | Tool Agent security与utility需要双重、可重复检查；prompt injection defenses 有 trade-offs。citeturn6academia46 | 特定任务与tool suite；不等同于全系统 assurance。 |
| **ToolEmu: Identifying the Risks of LM Agents with an LM-Emulated Sandbox** | https://arxiv.org/abs/2309.15817 | arXiv, 2023 | 模拟高风险 tools、failure generation 和 evaluator-based risk discovery。citeturn6academia47 | 模拟环境和 evaluator 有 fidelity/bias limits。 |
| **Automated Design of Agentic Systems** | https://arxiv.org/abs/2408.08435 | arXiv, 2024 | Meta-agent/code-search 自动发现 Agent designs 的可行性。citeturn9academia47 | Benchmark-driven；不能证明生产 robustness、governance 或安全。 |
| **AFlow: Automating Agentic Workflow Generation** | https://arxiv.org/abs/2410.10762 | arXiv, 2024 | MCTS-based workflow generation 与 benchmark improvement。citeturn9academia48 | Search space、evaluation、budget 与 model assumptions 限定结果。 |
| **RobustFlow: Towards Robust Agentic Workflow Generation** | https://arxiv.org/abs/2509.21834 | arXiv, 2025 | Requirement paraphrase 可导致 workflow instability；需要 explicit robustness evaluation。citeturn9academia49 | 较新 preprint；robustness metrics 尚非成熟标准。 |
| **Guidelines for Human-AI Interaction** | https://doi.org/10.1145/3290605.3300233 | CHI 2019 | 18 条 human-AI interaction guidelines，经 practitioners/products 验证。citeturn7search1 | Interaction design guidelines，不是 architecture assurance standard。 |
| **A Model for Types and Levels of Human Interaction with Automation** | https://doi.org/10.1109/3468.844354 | IEEE, 2000 | 区分 acquisition、analysis、decision、action 的 automation stages。citeturn7search4 | 前 LLM 时代；需要映射到 generative systems。 |
| **NIST AI 600-1 — Artificial Intelligence Risk Management Framework: Generative Artificial Intelligence Profile** | https://doi.org/10.6028/NIST.AI.600-1 | July 2024 | Generative AI lifecycle risk identification、measurement、management 和 governance。citeturn5search0 | Voluntary risk profile；不是 Agent workflow certification。 |

### Unresolved questions and Owner decisions

| Question | Current evidence | Required authority/evidence |
|---|---|---|
| Meta-Agent 是否正式需要一个 explicit design-synthesis method？ | `TARGET_SPECIFIC_INFERENCE`: gap 明确，候选方法有合理依据。 | Owner 决定；不能由本研究提升。 |
| Minimal dossier 的哪些 sections 应成为 mandatory？ | 本报告提出概念最小集。 | MA-DR-08 representation review、MA-DR-09 benchmark、pilot burden。 |
| Hard gates 是否全部成为 invariant？ | authority、truth、critical permissions、termination 等有强依据。 | Owner acceptance 与 target-method review。 |
| Scored rubric 如何加权？ | 不存在通用权重；quality attributes 与 task risk 不同。 | Task-local Owner preference；MA-DR-09 calibration。 |
| AI 可否自动生成 architecture recommendation？ | 可生成 candidates；最终 high-impact selection 不应自动化。 | Pilot measuring defects、anchoring、learning value 和 rework。 |
| 何时 multi-Agent 值得采用？ | 需要独特 permission、trust、parallelism、independent evidence 或 capability separation。 | Strong baseline experiment；不能由 role count 判断。 |
| Dossier 成本是否可接受？ | 文献显示 trace/review 有收益也有维护负担。 | Real pilot metrics。 |
| 方法是否跨软件、学习、研究等 domain 泛化？ | 未证明。 | 至少三个结构不同的 cases 与 independent review。 |
| 何种 evidence 足以 methodology promotion？ | 需要 negative evidence、replication、baseline、regression、Owner decision。 | 后续 promotion policy 与 real cases。 |

### Final disposition matrix

| Disposition | Items | Rationale |
|---|---|---|
| **Adoptable design principles as research guidance** | Representation-neutral methodology；simplest viable mechanism first；hard constraints before scoring；explicit authority/state/permission；termination/fallback/rollback；traceable rationale；independent evidence；proportional assurance。 | 多种 standards、architecture、safety、human-factors 与 Agent research 方向一致。采用为“decision guidance”不等于 target truth。 |
| **Candidate items for Owner review** | Explicit Frame-to-Design Dossier Cycle；minimal dossier concept；stage-gate lifecycle；baseline ladder；hard-gate + scored rubric；human-AI allocation；Lite/Standard/High-Assurance profiles。 | 填补 repository 已识别缺口，但尚无 Meta-Agent-specific pilot proof。 |
| **Experiment-gated items** | Rubric weights/thresholds；automatic trace generation；paraphrase stability tests；same-Agent reviewer adequacy；AI design quality versus human baseline；exact role-separation threshold；administrative-burden reduction。 | 不能由 literature 单独决定，需要 MA-DR-09 与 controlled cases。 |
| **Deferred to MA-DR-08** | Canonical IR、field schema、graph/DSL/YAML choice、backend mapping、conformance、degraded-semantics representation。 | 本任务明确 representation-neutral，提前决定会违反 scope。 |
| **Deferred to later high-risk research/pilots** | Automated architecture search；runtime topology adaptation；persistent self-modifying memory；autonomous methodology promotion；real tool/repository execution。 | Security、evaluation、authority 与 rollback evidence 不足；当前 target truth inactive。 |
