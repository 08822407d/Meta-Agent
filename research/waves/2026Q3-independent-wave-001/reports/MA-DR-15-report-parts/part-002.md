第三，research、case feedback、candidate、current context 和 target truth 的角色必须分离。本报告只能提供 evidence 和 candidate decision support，不能自动改变 `MA-REQ`、`MA-METHOD` 或 runtime controls。fileciteturn2file0L2-L2 fileciteturn6file0L2-L2

第四，provider、tool 和 product facts 是 time-sensitive evidence。Consumer UI label 只证明 operator-visible selection；速度、文风、自我声明或一致输出不能证明实际 backend。Stale 或 conflicting facts 在 high-impact routing 中应回到 unknown。fileciteturn4file0L2-L2

第五，当前 baseline 仍不授权 private material、broad repository writes、MCP/RAG auto-writeback、pilot 或 operational activation。因此本报告提出的 connector matrix 和 fallback policy 均为 design candidates，不是当前可执行配置。fileciteturn2file0L2-L2 fileciteturn3file0L2-L2

## 主要证据景观、方法比较与负面证据

**Primary evidence landscape**

透明 capability reporting 的成熟基础来自 Model Cards、NIST AI RMF 和 HELM。Model Cards 要求记录 intended use、适用环境、评估条件和 performance characteristics；NIST AI RMF 将 Govern、Map、Measure、Manage 视为持续风险管理活动，并强调 valid/reliable、secure/resilient、transparent、privacy-enhanced 等属性；HELM 证明只比较单一 accuracy 指标会隐藏 robustness、calibration、fairness、toxicity 和 efficiency 之间的差异。citeturn15search0turn15search1turn15search2turn15academia45

这些工作不能直接给出 Meta-Agent 的 provider matrix schema，但共同支持一个模式：能力声明必须同时记录**使用场景、评估条件、限制、版本和多个非质量维度**。因此，“model X supports coding”不足以作为 route claim；至少必须被拆解成 task family、repository/tool environment、context size、output contract、permission boundary、version 和验证方法。

平台官方文档进一步证明 capability facts 具有强烈 surface specificity。当前模型页面可分别声明 modalities、endpoint support、structured outputs、function calling、snapshots、rate limits 和 usage tiers；相同 provider 的不同 model family 可能在 structured outputs、streaming、fine-tuning 或 endpoint support 上不同。Provider release notes 同时记录 preview、GA、deprecation、shutdown、region expansion 和 pricing changes。citeturn19search0turn19search1turn19search6turn18search0 这些事实不支持某个 provider 的永久排名；它们支持“每项 claim 必须 scoped and dated”。

Routing research 提供三类可复用证据。FrugalGPT 的 cascade 在其特定实验中展示了通过先调用较便宜模型、在置信不足时升级，可能显著降低成本；RouteLLM 用 preference data 训练 stronger/weaker model router，并在部分测试中实现超过两倍的成本下降；online contextual-bandit research 则研究在上下文持续变化、没有完整离线数据时的自适应选择。citeturn14academia49turn14academia51turn14academia50 这些是 `VERIFIED_PRIMARY_EVIDENCE`，但其外部有效性受 benchmark、model pair、confidence estimator、feedback quality 和目标函数限制，不能证明 learned routing 在 Meta-Agent 的 low-volume、high-authority decisions 中优于透明规则。

Multi-model research 呈现明显的正负证据。Multiagent Debate 和 Mixture-of-Agents 在特定 reasoning 或 preference benchmarks 上获得收益；但 debate 需要多轮生成、计算更昂贵，长辩论可能导致模型偏重最近信息，且参与者可以一致收敛到错误答案。较新的 OneFlow 研究表明，许多 homogeneous workflows 可由同一模型的 single-agent multi-turn execution 匹配，并具有 cache reuse 效率优势。citeturn16academia48turn16search1turn16academia49turn14academia48 因而“多 Agent”或“多次采样”不是 independence 的证据；价值取决于 failure diversity、evidence diversity 和 adjudication design。

Evaluation 也存在系统性风险。LLM-as-a-Judge 研究记录了 position、verbosity 和 self-enhancement bias；虽然强 judge 在特定设置中与人类偏好有较高一致度，但它仍不能成为 high-impact target truth 的唯一 verifier。LiveBench 通过频繁更新、近期来源和 objective ground truth 缓解 benchmark contamination 和 judge bias，说明 freshness 也适用于测试集本身。citeturn16academia51turn17academia29turn17search4

**Major routing approaches**

| 方法 | 优点 | 关键失败模式 | Meta-Agent 适用判定 |
|:--|:--|:--|:--|
| Rule-based routing | 可读、可审计、易实现 stop conditions；适合少量 routes 和强 authority constraints。 | 规则可能变陈旧；边界复杂时出现冲突和例外堆积。 | `RECOMMENDATION`：v0.x 默认控制层。 |
| Constraint satisfaction | 将 required/prohibited capability、region、permission、budget 和 availability 形式化；能明确返回 feasible、infeasible 或 unknown。CP-SAT 等 solver 明确区分 `OPTIMAL`、`FEASIBLE`、`INFEASIBLE` 和 `UNKNOWN`。citeturn12search0turn12search12 | 错误建模会产生“精确但错误”的解；连续指标需离散化；解释成本可能上升。 | `RECOMMENDATION`：适合 hard-gate feasibility，暂不要求引入专用 solver。 |
| Multi-Criteria Decision Analysis | 在 feasible candidates 中透明表达 quality、cost、latency、reliability 等 trade-offs。 | 权重主观；不确定值易被伪精确化；不能把 authority 变成可补偿分数。 | `RECOMMENDATION`：仅用于 hard gates 之后。 |
| Contextual bandit | 可在线学习 query context 与 model outcome 关系，并处理 exploration/exploitation。citeturn14academia50 | Exploration 会产生真实失误；需要大量可比反馈；concept drift、delayed reward 和安全约束难处理。 | `EXPERIMENT_GATED`：仅限可逆、低风险、高频、有 objective reward 的任务。 |
| Empirical policy learning | 可从 preference、quality 和 cost logs 学习 route；RouteLLM 展示 model-pair routing 的可行性。citeturn14academia51 | Training data contamination、provider churn、reward misspecification 和 feedback bias；模型更换后可能失效。 | `EXPERIMENT_GATED`：不能控制 Owner-level decisions。 |
| Human selection | 可处理目的、伦理、隐私、不可逆后果和价值冲突。 | 速度慢、一致性低、认知负担高；人工可能受品牌印象影响。 | `REQUIRED`：authority、privacy、activation、methodology promotion 和不可逆高影响动作。 |
| Hybrid filter–score–approve | 先 filter infeasible，再 score feasible，最后按风险 human approve。Kubernetes scheduler 的 Filter 与 Score phase 是成熟的同构设计例子：不可调度候选先被排除，剩余候选再按 weighted scores 排名。citeturn12search2turn12search6 | 需要清晰的数据模型、冲突处理和 observability。 | `RECOMMENDATION`：最适合 Meta-Agent。 |

**Failure modes and negative evidence**

静态 capability matrix 最常见的失败不是单个字段填错，而是**scope laundering**：将在一个 API snapshot、一个 account tier 或一个 region 上观察到的行为，推广成对整个 provider、所有产品面和未来版本的永久事实。官方模型页面中的 snapshot、alias 和 tier-specific limits，以及 Vertex AI 持续发生的 preview、GA、deprecation 和 endpoint migration，都是对此的直接反例。citeturn19search0turn19search1turn18search0

Benchmark score 也容易被错误升级为 permission。HELM 说明不同指标之间存在 trade-offs；LiveBench 说明静态测试会受 contamination 和时间过期影响；SWE-bench 一类高保真 coding evaluation 还可能要求 Docker、较大存储和计算资源。因此，持续对所有 provider 做 exhaustive benchmarking 很可能消耗超过其决策价值的维护成本。citeturn15academia45turn17academia29turn11search0

Retry policy 的负面证据尤其重要。AWS reliability guidance 指出 retry 会放大下游负载，必须限制次数、使用 backoff 和 jitter，并尽量只在一个 stack layer 执行；HTTP semantics 允许自动重试 safe/idempotent operations，但 non-idempotent requests 不能在不知道实际执行结果时随意重放。citeturn6search1turn7search0 因此，对 repository write、send email、create event、financial action 或其他 external side effects，不能把“网络超时”自动解释为“操作未发生”。

Schema quality 也不能代替 semantic validation。JSON Schema 可证明 JSON instance 满足结构断言，却不会验证 URL 指向的资源真实存在、账户有权限、操作语义正确或副作用可回滚；复杂 regex 和 external content 还可能带来 denial-of-service 或 unsafe evaluation 风险。citeturn20search1turn20search5 OpenAPI 能描述 operation、responses 和 security schemes，但规范本身警告 external resources 可能不可信，工具必须处理 reference cycles、HTML sanitization 和不同 security scheme 的风险。citeturn21search1

MCP authorization 提供了另一个反例：即使 connector 能拿到某个 token，也必须验证 token audience，且不得把 client token 原样透传给 downstream API；否则可能产生 confused-deputy、绕过 security controls 和审计归属不清。citeturn20search0turn20search6 这意味着“authentication works”不是“this exact operation is authorized”的充分证据。

## 候选治理设计：能力、证据、路由、工具与降级

**Provider-neutral capability taxonomy**

以下 taxonomy 是 `RECOMMENDATION`，不是已采用的 target schema。它将能力拆成原子维度，以防一个宽泛标签掩盖关键限制。

| Capability family | 原子能力示例 | 必须记录的 scope | 可验证方式 |
|:--|:--|:--|:--|
| Reasoning | constraint satisfaction、long-horizon synthesis、uncertainty handling、counterexample generation | task family、language、context regime、tool access、reasoning mode | frozen task set、objective checks、human rubric、failure taxonomy |
| Coding | code generation、debugging、test repair、repository comprehension、patch production | languages、repository size、build environment、network/shell access | compile/test、static analysis、diff review、sandbox |
| Research | web search、source retrieval、PDF handling、citation fidelity、freshness checking | source types、date range、paywall/auth、citation format | source recall sample、claim–citation entailment、freshness audit |
| Multimodality | image input、audio input/output、video、document layout、chart interpretation | input/output modality、file type、size、resolution、surface | modality fixtures、round-trip checks、known-answer samples |
| Context and state | context window、persistent state、session resume、memory isolation | token limit、surface、retention policy、conversation/session model | boundary tests、fresh-session reconstruction、data-retention review |
| Structured output | JSON mode、schema-constrained output、function arguments、validation behavior | endpoint、schema dialect、strictness、streaming mode | positive/negative schema fixtures、malformed-output rate |
| Tool use | tool discovery、selection、argument formation、parallel calls、result integration | tool protocol/version、tool-choice mode、max calls、permissions | conformance harness、mock tools、invalid-schema tests |
| Repository operations | read tree/blob/history、branch/PR operations、write/merge/revert | repository、ref、path allowlist、actor、write authority | exact-scope dry run、audit log、sandbox repo |
| Long-running work | timeout behavior、resume/checkpoint、background execution、cancellation | endpoint/surface、maximum duration、state persistence | timeout/cancel/recovery tests |
| Determinism | pinned version、seed support、temperature controls、schema stability | snapshot、sampling config、tool nondeterminism | repeated runs、variance distribution、semantic diff |
| Security | auth method、audience binding、secret isolation、injection resistance | trust boundary、principal、token audience、network access | threat tests、scope inspection、negative auth tests |
| Privacy | retention、training use、region/data residency、logging controls | account contract、endpoint、region、data class | official policy review、account setting evidence、data-flow inspection |
| Latency and availability | time-to-first-token、total latency、timeout、error rate | region、account tier、concurrency、input/output size | sampled telemetry、provider status、rolling canary |
| Cost and quota | token price、tool-call price、RPM/TPM、daily caps、budget controls | date、currency、tier、region、batch/realtime mode | current pricing/quota API or docs、usage reconciliation |
| Observability | trace IDs、model/snapshot metadata、tool spans、usage metrics、decision logs | SDK/protocol version、redaction policy、backend | trace conformance、log completeness、privacy review |
| Human interaction | approval points、clarification behavior、accessible explanation、learning-value preservation | user role、risk tier、interaction mode | user review、handoff test、rework and comprehension measures |

任务 requirement 与 candidate support 必须使用不同字段：

| Task-side status | 含义 | Candidate-side 对应行为 |
|:--|:--|:--|
| `required` | 缺失即不可满足原任务。 | `supported` 才可通过；`unknown/stale/conflicted` 在高风险任务中先验证，否则 infeasible。 |
| `preferred` | 可在保留核心保证时退让。 | 作为 scored preference；退让必须记录。 |
| `prohibited` | 出现该能力、数据流或副作用即违反边界。 | 候选若无法证明关闭该行为，则被 filter。 |
| `unknown` | 需求本身尚未确认。 | 不应由 router 擅自猜测；按影响 gather evidence、ask Owner 或 stop。 |

**Capability-claim evidence and freshness schema**

```yaml
capability_claim:
  local_record_key:
  capability_key:
  statement:
    subject:
      provider_or_implementation:
      product_or_tool:
      visible_label:
      attested_backend_id:
      backend_identity_status: attested | provider_declared | visible_only | unknown
    scope:
      surface:
      endpoint_or_connector:
      model_snapshot_or_tool_version:
      alias_if_any:
      subscription_or_account_tier:
      region:
      language:
      input_modality:
      output_modality:
      operation_mode:
      data_class:
    support_state: supported | partial | unsupported | unknown | stale | conflicted
    constraints:
      maximum_context:
      rate_or_usage_limits:
      permission_requirements:
      incompatible_features:
      known_failure_conditions:
    evidence:
      evidence_class:
      source_title:
      direct_url_or_artifact_ref:
      source_version:
      source_publication_date:
      observed_at:
      observed_by:
      test_fixture_ref:
      environment_fingerprint:
      reproduction_steps:
      result_artifact_ref:
    assessment:
      confidence: high | medium | low | unresolved
      attestation_strength:
      scope_match:
      reproducibility:
      conflicting_evidence_refs: []
      negative_evidence_refs: []
    freshness:
      volatility_class:
      last_verified_at:
      expires_at:
      event_triggers: []
      current_status: current | expiring | expired | superseded | event_invalidated
    governance:
      claim_owner:
      permitted_decision_impact:
      prohibited_uses: []
      review_required:
      supersedes_local_record_key:
      change_log_ref:
```

`local_record_key` 只是报告中的 schema field，不是稳定 `MA-*` ID。若将来采用，命名、版本和 migration 应由 Owner 单独决定。

**Evidence classes**

| Evidence class | 最适合支持的 claim | 默认强度 | 主要限制 |
|:--|:--|:--|:--|
| Official specification | Protocol semantics、required security behavior、schema meaning。 | 高，限规范语义 | 不证明具体 implementation 正确或当前可用。 |
| Official platform documentation | Feature availability、endpoint、snapshot、quota、region、account policy。 | 中高，限声明 scope | 可能过时、遗漏 exception，或是 provider claim。 |
| Controlled local test | 当前 account/surface 上可观察行为、latency、schema compliance、permission response。 | 高，若环境和 fixture 可重现 | 仅覆盖测试条件；不能推断 hidden backend 或未测试 workload。 |
| Reproducible benchmark | 在固定 dataset、metric 和 harness 下的相对能力。 | 中高，限 benchmark | Contamination、benchmark overfitting、judge bias、版本漂移。 |
| Independent third-party evaluation | Cross-provider comparison、failure patterns。 | 中 | 可能使用旧版本、不同账户或不可复现实验。 |
| Visible product behavior | 当前交互面上的 observed behavior。 | 中低 | UI A/B、silent backend change、session state 和随机性会混淆。 |
| User observation | Incident discovery、需求、体验和 edge-case signal。 | 低到中 | 缺少控制组、environment metadata 和重复性。 |
| Provider marketing claim | Discovery 与候选假设。 | 低到中 | 可能宽泛、未给测试条件，不能单独支持高影响 route。 |
| Model self-report | 几乎只用于 debugging hypothesis。 | 极低 | 不能证明身份、版本、权限或实际工具可用性。 |
| Corroborated composite | Official docs + current controlled test + independent evidence。 | 最高 | 仍受 exact scope 和日期限制。 |

Model Cards 和 NIST governance 支持记录 intended use、limits、evaluation context 和 lifecycle risk；HELM 则支持多场景、多指标而非单分数判断。citeturn15search0turn15search1turn15academia45

