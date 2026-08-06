|**Oracle Open Agent Specification / Agent Spec**|组件 object model，JSON/YAML serialization|Standalone Agents、Flows、tools、multi-agent composition|官方文档含 security considerations，但核心定位主要是 agent/workflow configuration|高目标；WayFlow reference runtime，另有 adapters|SDK/conformance object model；serialization validation|由 compatible runtime 或 adapter 决定|26.1.2 docs/package，活跃官方项目|portable component model、reference runtime、adapter architecture、evaluation-ready positioning|Meta-Agent authority/provenance/allowed-influence/anti-resurrection 并非已证明核心语义；adapter 不等于无损 equivalence。citeturn10search0turn10search1turn10search2turn11search0|
|**COVENANT**|Natural-language workflow → WAST → WCFG|Required steps、branches、tool interaction、controller state|在 commit 前逐步检查 proposal 是否符合编译 requirements|不是通用 backend interchange；重点是 compiler/controller|WAST/WCFG 支持结构化检查|需要其 interpreter/controller|2026-07 very recent preprint，120 cases|把 workflow instructions 当 source program 而不是 prompt；proposal/commit 分离|样本小、场景有限；未覆盖 provider mapping、Owner authority、provenance 或完整 state lifecycle。citeturn11academia45|
|**GPTSwarm**|Computational graph|Nodes、information-flow edges、recursive compositions、prompt/edge optimization|未以权限、privacy 或 human authority 为主要语义|graph idea 可移植，implementation 为 Python framework|拓扑层可检查|与 GPTSwarm node/runtime abstractions 绑定|ICML 2024 peer-reviewed|graph 是优化、composition、visualization 的良好 canonical form|普通 graph 不足以表达 exception expiry、delegation ceiling、data retention、rollback 与 backend loss。citeturn6search9turn6search11turn6search19|
|**DSPy**|Python program；declarative LM modules embedded in imperative graph|LM calls、retrieval、reasoning modules、agent loops、optimizer/compiler|不以 Owner authority、tool permissions 或 deployment security 为核心|LM 与 module abstraction 有一定可移植性|Python typing/Signatures，加 metric-driven compilation|明显 code/runtime coupled|ICLR 2024 peer-reviewed，成熟开源项目|将 intent/module interfaces 与自动优化参数分离；optimizer 输出仍属于 compiled artifact|主要优化固定 program 内 prompt/demo；不是完整 Agent topology、authority 或 backend-conformance IR。citeturn6academia48|
|**Microsoft Agent Framework declarative workflows**|YAML → executable workflow graph|Variables、control flow、agent/tool invocation、HTTP、MCP、HITL、conversation control|部分 approval/tool action 可配置；完整 governance 仍在 framework/app 层|在 Microsoft Agent Framework 内 portable；C# 与 Python YAML structure 有差异|预定义 action kinds 可验证|较高；依赖 framework expression/action semantics|2026 active/pre-release documentation|human-readable workflow surface、action catalog、declarative-to-graph compilation|同一“declarative”surface 已存在语言差异；不应推断为 vendor-neutral interchange。citeturn10search7|
|**LangGraph**|Code-first state graph|State、nodes、edges、subgraphs、parallel supersteps、checkpoint、interrupt、replay|HITL 和 encrypted persistence 可支持 enforcement；policy 仍由 application 定义|不同 checkpointer/backend 可换，但 graph code 不是通用 interchange|类型与 graph checks 部分可做|高，绑定 LangGraph runtime|v1 stable core APIs|checkpoint、interrupt、state history、replay、per-invocation/per-thread store semantics|代码节点可能隐藏 side effects；round-trip 回 portable IR 通常不可靠；Owner/provenance fields 需外部层。citeturn8search0turn8search2turn8search5turn8search7|
|**OpenAI Agents SDK**|Python-/TypeScript-first objects and orchestration code|Agents、tools、handoffs、guardrails、sessions、HITL、tracing、sandbox agents|Tool guardrails、approval 和 tracing 提供 enforcement hooks；coverage 因 tool/handoff 类型而异|支持第三方 models/adapters，但 orchestration 是 SDK-specific|Pydantic/tool schemas 与 code checks|高，code-first|当前官方 production-oriented SDK|小而明确的 runtime primitives、structured handoff inputs、tracing、sensitive-trace controls|guardrail coverage 并非所有 tool/handoff 一致；不可把生成 SDK code 视为可逆规范。citeturn7search0turn7search1turn7search2turn7search3turn7search5|
|**BPMN 2.0.2 / DMN 1.5**|Formal metamodel、XML/XSD；graphical notation；decision models|Mature process、events、gateways、exceptions、human tasks；DMN decision tables|可表示职责和业务规则，但不是 Agent-specific least privilege/provenance model|跨 BPM tooling 理论较高|XSD/metamodel validation|执行语义由 BPM engine 决定|高度成熟，BPMN 2.0.2 / ISO 19510；DMN 1.5|成熟的 control-flow、event、compensation、decision separation、conformance mindset|行政与 tooling 负担大；LLM capabilities、prompt/tool semantics、allowed influence、model evaluation 不属于其原生重点。citeturn3search1turn3search9turn3search13|
|**OpenAPI + Arazzo**|YAML/JSON API descriptions 与 machine-readable workflow descriptions|OpenAPI 描述 HTTP interfaces；Arazzo 描述 calls、dependencies、inputs、success/failure/retry/goto|API security schemes 可声明；并非完整 task authorization 或 Agent authority|API/interface portability 高|正式 specification + schemas/test suites；schema 不保证捕获全部 violations|绑定 HTTP/AsyncAPI 等 interface semantics|成熟 OpenAPI；Arazzo 1.1.0 较新|把 tool contract 与 workflow sequence 分开；source-description references、failure actions、version rules|Agent reasoning、memory、Owner gates、evaluation、backend model capabilities 需另加层。citeturn3search0turn3search3turn9search2turn9search3turn9search8|
|**JSON Schema**|JSON-based structural/validation vocabularies|可定义所有 IR object shapes|能约束 enums、types、required fields；不能独立证明 authority 或 runtime enforcement|高|强于 syntax，弱于跨对象和行为语义|低|Draft 2020-12 广泛成熟|适合 authoring surface、extension vocabularies、machine linting|无法独立验证 graph termination、minimum privilege、source truth、backend equivalence。citeturn4search0turn4search1turn4search2|
|**Protocol Buffers**|`.proto` typed messages + field numbers|适合作为 binary/API interchange，不是自然 workflow language|无领域 policy；可承载 typed fields|高，multi-language|强 schema/compiler checks|中，需 generated code|高度成熟|字段编号稳定、删除字段必须 reserve、未知字段 compatibility 等版本纪律|人类审查/diff 较差；不能代替 readable normative YAML；语义 migration 仍需人工映射。citeturn9search4turn9search5|
|**OPA/Rego**|Declarative policy-as-code over structured inputs|不表示完整 workflow；适合 constraint/policy decisions|强，支持 authority/permission/invariant decision layer|可作为 sidecar、library 或 WASM policy evaluator|policy parse/compile/test|enforcement 需由 runtime 调用|CNCF graduated|将 policy decision 与 enforcement 分离；适合 hard constraints|若 runtime 不查询或忽略结果，policy 无效；Rego 不应成为所有 IR consumers 的 mandatory burden。citeturn10search12|
|**Cedar**|Authorization policies + schema + principal/action/resource/context requests|不描述 Agent workflow|强 authorization semantics，default DENY；schema-based validation|可嵌入不同 applications|较强；validator 与 authorization evaluation 分离|runtime 必须形成并提交正确 request|成熟开源 policy language|typed authorization schema、explicit request model、policy revalidation on schema change|schema 不会自动验证 runtime request；无法承担 provenance、workflow、evaluation 或 rollback。citeturn9search0|
|**SLSA / in-toto**|Attestation statement、predicate、provenance records|不描述 Agent logic；描述 artifact 如何产生|供应链 origin/integrity、builder/verification evidence|跨供应链 tooling|schema/signature/verifier checks|需 attestation producer/verifier|SLSA current approved spec；in-toto attestation v1.2.0 in 2026|生成物 provenance、subject digest、builder、inputs、verification summary 的分层模式|证明“如何产生”不证明“设计语义正确”；不能替代 Owner decision 或 behavioral conformance。citeturn6search0turn6search10turn8search1|

**为什么这些系统都不是自动的 Meta-Agent IR**

AgentSPEX 对 typed workflow authoring 很有启发，但其 execution harness 既是优势也是 coupling；Oracle Agent Spec 是最接近“portable Agent representation”的官方先例，但 Meta-Agent 还需要更强的 authority/provenance/loss semantics；GPTSwarm 证明 graph representation 适于组合和优化，却不覆盖 governance；DSPy 证明 declarative modules 可由 compiler 优化，但 optimizer 管理的是 program parameters，不是 Owner rights；BPMN/DMN、Arazzo、OPA/Cedar 和 SLSA/in-toto 分别提供成熟的流程、API workflow、policy 与 provenance primitives，却只覆盖整体问题的一部分。citeturn11search1turn10search2turn6search19turn6academia48turn9search8turn10search12turn6search0

**Representation alternatives and decision matrix**

评分使用 `高 / 中 / 低`，其中“tooling burden”越高越不利。

|Representation|Expressiveness|Human readability|Static validation|Diffability|Security visibility|Round-trip fidelity|Search compatibility|Migration burden|Tooling burden|Disposition|
|---|---|---|---|---|---|---|---|---|---|---|
|Typed YAML/JSON + JSON Schema|中高|高|结构高、语义低中|高，经 canonicalization 后更佳|高，只要字段为 first-class|同一 schema 内高|高|中|低中|**作为 normative authoring surface**|
|Canonical graph/AST|高|直接查看较低，visualization 高|高，可做 reachability/data-flow|中|高，可附 typed annotations|在受控 node set 内高|非常高|中高|中高|**作为 canonical semantic form**|
|Purpose-built DSL|高|中高|高|高|取决于 grammar|理论高，实际受 compiler drift 影响|高|高|高|暂不作为首个核心|
|BPMN/DMN-like|流程/决策高，Agent semantics 中|visual 高、raw XML 低|高|raw diff 低|业务职责中，Agent security 低中|在 conformant engines 中较高|中|高|高|只借鉴 semantics，不采用为主格式|
|Code-first representation|最高|开发者高、Owner/reviewer 中低|依语言和 analyzer|中低|低，side effects 可隐藏|通常低|高但风险高|高|中|不得作为 sole truth|
|Normative IR + generated code|高|高|高|高|高|IR→code 单向可验证；code→IR 不保证|高|中|中高|**推荐总体架构**|
|Profiles/extensions|高|核心保持简洁|中高|高|可隔离风险领域|视 profile 而定|高|中|中|**推荐，但需 extension governance**|

**Decision**

```yaml
representation_decision:
  normative_surface:
    format: YAML_or_JSON
    constraints:
      - JSON_compatible_data_model
      - canonical_key_and_array_order_rules
      - no_executable_embedded_code_in_portable_core
  canonical_model:
    format: typed_graph_AST
    purpose:
      - cross_object_resolution
      - control_and_data_flow_analysis
      - semantic_diff
      - bounded_search
      - backend_mapping
  schema:
    base: JSON_Schema_2020_12
    limitation: structural_validation_only
  policies:
    form: profile_or_external_policy_bundle
    candidates: [OPA_Rego, Cedar, deterministic_native_rules]
  generated_outputs:
    normative: false
    reverse_import_guaranteed: false
