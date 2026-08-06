OWASP 的 Agentic AI 指南把 memory poisoning、tool misuse、identity/privilege abuse、goal hijacking 和 agentic supply-chain vulnerabilities 视为系统级风险。英国 NCSC 进一步警告，不应假设 prompt injection 可以被完全“修复”，而应限制可造成的影响并把 LLM 视为可能混淆指令和数据的组件。citeturn10search1turn10search15turn10search17

这对 automated search 有直接含义：搜索器不应拥有比其候选系统更高的 credentials；生成候选不等于执行候选；执行 sandbox 不应接触真实用户数据、生产 API、network egress 或 repository write access。ADAS 官方代码仓库的 untrusted-code 警告进一步支持这种隔离。citeturn11search0

**Minimal safe adoption ladder**

| 阶段 | 可允许能力 | 必要控制 | 当前建议 |
|---|---|---|---|
| Design linting | 检查缺失 role、I/O contract、failure path、permission declaration | 只读、deterministic rules、人工确认 | 可采用 |
| Specification synthesis | 从已批准需求草拟结构化 Agent/workflow spec | proposal-only、来源追踪、不可写 target truth | 可作为 candidate |
| Alternative generation | 产生 single Agent、deterministic workflow、multi-Agent 等多个方案 | bounded components、预算上限、显式 assumptions | 可作为 candidate |
| Offline comparison | 在 sandbox benchmark 比较候选 | hidden test、强 baseline、多 seed、成本和安全指标 | controlled experiment |
| Bounded search | 在受限 DSL/IR 中做 MCTS、evolution 或 black-box search | immutable constraints、reproducible config、no-write sandbox | controlled experiment |
| Query-level generation | 每个 query 动态产生 workflow | latency cap、canonicalization、fallback、security tests | defer |
| Runtime self-adaptation | live 修改 topology、memory 或 tool policy | 在线监控、rollback、authority proof | 不进入早期 scope |
| Autonomous promotion | 自动把结果写入方法论或 target truth | 不存在可接受的自动控制 | reject |

**Candidate requirements**

| Candidate | 内容 | Evidence / rationale | Status |
|---|---|---|---|
| `MA-CREQ-DESIGN-SEARCH-BOUNDARY` | 自动搜索只能改变显式 allowlist 中的 design variables | AFlow 的固定参数和 operator space 表明 bounded search 更可管理；安全资料要求最小权限 citeturn11search2turn10search15 | `retain_as_candidate_pending_evidence` |
| `MA-CREQ-IMMUTABLE-AUTHORITY` | Owner authority、privacy、target truth 和 irreversible writes 不进入 objective optimization | NIST/OWASP 治理原则；任务书既有 Owner boundary | `adopt_now_as_non_operational_design_principle` |
| `MA-CREQ-STRONG-BASELINES` | 每个自动设计实验必须含 strong single Agent、fixed workflow 和 same-workflow single-Agent simulation | OneFlow 直接证明弱 baseline 会夸大 multi-Agent 价值 citeturn3view4 | `adopt_now_as_non_operational_design_principle` |
| `MA-CREQ-PARAPHRASE-STABILITY` | 候选必须通过同义改写、噪声和 conflicting-input tests | RobustFlow 显示现有 workflow generation 存在严重结构不稳定 citeturn5view1turn7view0 | `adopt_now_as_non_operational_design_principle` |
| `MA-CREQ-PROPOSAL-ONLY` | 自动产生的设计只能成为 proposal artifact，不自动晋升 | 防止 benchmark objective 取代治理判断 | `adopt_now_as_non_operational_design_principle` |
| `MA-CREQ-REPRODUCIBLE-SEARCH` | 记录模型版本、prompt、seed、数据 split、预算、候选 lineage 和 evaluator | 搜索具有 stochasticity，且模型专用 workflow 可能更优 citeturn3view1 | `retain_as_candidate_pending_evidence` |
| `MA-CREQ-SAFE-FALLBACK` | 若搜索不优于简单 baseline 或 evidence 不足，回退 fixed template/single Agent | 复杂性必须证明净收益 | `adopt_now_as_non_operational_design_principle` |

**Candidate methods**

| Candidate method | 输入 | 过程 | 输出 | 建议状态 |
|---|---|---|---|---|
| `Agent/workflow specification synthesis` | 已批准 requirements、constraints、component catalog | 生成结构化 IR，不执行 | traceable draft spec | candidate |
| `Alternative topology generation` | draft spec、允许 topology 集 | 至少生成 direct single Agent、deterministic workflow、review loop、multi-Agent 方案 | alternative set | candidate |
| `Counterfactual baseline construction` | 某一 multi-Agent design | 生成同 workflow 的 single-Agent simulation 与 reduced workflow | baseline package | adopt as principle |
| `Bounded design search` | IR search space、hard constraints、evaluation suite | MCTS/evolution/black-box search | Pareto candidate archive | experiment only |
| `Robustness and transfer evaluation` | 候选、paraphrase clusters、model/tool variants | 多 seed、扰动、故障和权限测试 | robustness dossier | candidate |
| `Evidence-gated promotion review` | candidate archive、evaluation dossier | 人类对 evidence、risk、learning value 作判断 | accept/reject/defer record | adopt as principle |

**对当前 `MA-REQ-0001–0016` 和 `MA-METHOD-0001–0006` 的影响**

由于 required repository files 不可访问，本报告不能声称任何具体 ID 已覆盖或缺失某项能力。逐 ID 映射状态均为 `UNRESOLVED`。基于任务书提供的 v0.1 摘要，只能作以下原则级推断：

| 已知 v0.1 原则 | 本研究影响 |
|---|---|
| multi-Agent 不是默认方案 | 得到 OneFlow 强反事实证据支持，应继续保留 |
| file-based、human-reviewed | 与 proposal-only、audit trail 和 evidence-gated promotion 相容 |
| 不假设 auto-writeback 或自主方法论改写 | 应继续保持；现有研究没有推翻这一边界 |
| 用户保留最终权限 | 应被编码为 immutable constraint，而非评价权重 |
| 明确 role、I/O、memory、handoff、tool/model routing | 是未来 Design IR 搜索空间的基础 |
| 当前六个 method 尚未包含设计综合 | 任务书自身指出此 gap；建议增加 candidate synthesis/comparison method，但不能在未读 repository 时声称正式缺失 |

**MA-DR-08 必须继承的冻结输入**

未来 Design IR 研究至少应冻结以下语义：

| IR 领域 | 必须表达 |
|---|---|
| Identity and roles | role ID、responsibility、model/tool capability，不以拟人名称代替 |
| Contracts | typed input/output、preconditions、postconditions、evidence requirements |
| Control flow | sequential、parallel、conditional、loop、retry、timeout、termination |
| State and memory | state schema、read/write scope、retention、provenance、forget/rollback |
| Tools | allowlist、credential identity、parameter schema、side-effect class |
| Authority | Owner-only decisions、human gates、delegation boundary、approval state |
| Failure | expected failures、fallback、compensation、escalation、safe halt |
| Evaluation | datasets、oracles、judges、metrics、hidden split、perturbation suite |
| Search metadata | allowed mutations、seed、optimizer、budget、lineage、model version |
| Deployment | sandbox class、network policy、data classification、rollback package |
| Evidence | source、assumption、confidence、known limitation、promotion status |

`RECOMMENDATION`：IR 应优先是 declarative、versioned、diffable 和 statically validatable。Executable code 可以作为生成目标或 implementation artifact，但不应是唯一 truth representation。

**MA-DR-09 benchmark/pilot 的最低设计**

| 类别 | 必须包含 |
|---|---|
| Baselines | fixed template、direct Agent、strong single Agent、deterministic workflow、human design、homogeneous multi-Agent、same-workflow single-Agent simulation、heterogeneous design |
| Tasks | 至少一个 exact-oracle task、一个 tool task、一个 ambiguous open-ended task、一个权限敏感模拟任务 |
| Data split | search/validation/hidden test 严格分离；防止同题或 paraphrase leakage |
| Repetition | 每配置至少多个 independent seeds/runs；报告均值、方差和最坏值 |
| Cost | search cost 与 deployment inference cost 分开报告 |
| Robustness | paraphrase、noise、underspecification、conflict、model update、tool/API failure |
| Security | prompt injection、tool description poisoning、credential misuse、memory poisoning、unauthorized write |
| Human impact | review time、rework、理解度、learning-value preservation、administrative burden |
| Ablation | role、topology、prompt、reviewer、memory、tool routing、heterogeneity、search algorithm |
| Promotion rule | 必须在 hidden test、hard constraints 和 human review 上通过；benchmark gain 不足以单独晋升 |

**仍应保持实验性的内容**

Query-level workflow generation、从零 team generation、在线 topology adaptation、自动 memory architecture mutation、自动 evaluator generation、异构模型组合搜索和 self-improving runtime 都应保留为研究实验。它们尚未同时证明 transfer、security、权限正确、长期成本和人类治理负担。

**应明确拒绝或避免**

 unrestricted Python search、production credentials in search sandbox、以 multi-Agent 数量作为 sophistication proxy、只与弱 IO baseline 比较、用单个 LLM judge 作为唯一 oracle、将 validation gain 直接写入 target truth、无 rollback 的 runtime self-modification，以及让搜索器决定产品目的或敏感权限。

## 结论、开放问题与可移植来源

**明确结论**

`VERIFIED_PRIMARY_EVIDENCE`：Agent/workflow design 可以被表示和自动优化；graph、code、declarative modules、supernet、MCTS、population search、RL 和 preference optimization 均已有公开研究实例。citeturn1search11turn2view0turn2view1turn6academia0turn6academia1turn7view0

