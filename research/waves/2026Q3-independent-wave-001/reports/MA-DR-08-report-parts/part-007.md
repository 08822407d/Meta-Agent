本报告不生成或执行 MA-DR-09，但以下内容已足够稳定，可作为后续 benchmark/conformance task 的 frozen inputs：

```yaml
frozen_for_later_MA_DR_09:
  IR_architecture:
    - typed_YAML_JSON_authoring
    - canonical_graph_AST
    - generated_code_non_normative
  minimum_core_domains:
    - authority
    - requirements
    - roles
    - contracts
    - workflow
    - state
    - capabilities
    - tools_permissions_side_effects
    - human_gates
    - provenance_allowed_influence
    - evaluation
    - recovery
    - deployment
    - backend_binding
  mapping_status_taxonomy:
    - NATIVE_CLAIMED
    - ADAPTER_MAPPED
    - EMULATED
    - DEGRADED
    - UNSUPPORTED
    - BLOCKED
    - UNKNOWN_UNVERIFIED
  equivalence_evidence_levels:
    - STRUCTURAL_ONLY
    - STATIC_SEMANTIC
    - CONFORMANCE_FIXTURES
    - BEHAVIORAL_TESTS
    - ADVERSARIAL_TESTS
    - INDEPENDENT_REVIEW
  required_runtime_styles:
    - declarative_reference_runtime
    - graph_state_checkpoint_runtime
    - vendor_declarative_workflow_runtime
    - code_first_agent_SDK
  required_test_classes:
    - serialization_round_trip
    - semantic_validation
    - authority_and_permission
    - graph_reachability_and_termination
    - state_flow_and_retention
    - backend_mapping_loss
    - cross_backend_trace_conformance
    - security_regression
    - semantic_diff_and_migration
  critical_zero_tolerance:
    - automatic_target_truth_transition
    - authority_ceiling_violation
    - undeclared_external_write
    - silent_security_semantic_loss
    - private_scope_expansion
    - automatic_methodology_promotion
    - rollback_resurrection
```

未冻结、仍需 Owner 或 prototype 决定的内容包括 concrete schema naming、exact JSON Schema layout、policy language、canonical expression language、first adapter implementation order、benchmark tasks、acceptance thresholds 和预算。

**Open Owner decisions**

|Decision|Options|Research recommendation|Why Owner-level|
|---|---|---|---|
|是否正式采纳 IR candidate stage|Adopt candidate / defer / reject|Adopt candidate, non-operational|会改变 future design methodology，但不应由研究自行提升|
|MVI authoring format|YAML-first / JSON-first / both|YAML-first with JSON-compatible data model and canonical JSON form|涉及 reviewer ergonomics|
|Canonical source relation|YAML normative / AST normative / both|YAML/JSON document normative input；normalized AST normative semantics|需要明确冲突时哪层胜出|
|Mandatory security core depth|compact / extensive|保留 authority、permissions、allowed influence、loss report 为 mandatory；advanced cryptography deferred|不能为简洁删除核心边界|
|Policy representation|native rules / OPA / Cedar / multiple profile|MVI native deterministic rules；OPA/Cedar 做 prototype profiles|避免早期 ecosystem lock-in|
|Backend prototype set|Oracle/WayFlow、LangGraph、Microsoft、OpenAI SDK 或其他|选择至少三种 materially different styles，而非三个相似 Python frameworks|测试 portability 的有效性|
|Degradation acceptance|全局规则 / per risk tier|security/authority/privacy 默认 block；性能/streaming 可 warning|属于风险偏好|
|Reverse import|MVI required / deferred|Deferred|成本高且容易制造 false equivalence|
|Search support|只 schema / mutation engine prototype|先定义 immutable/mutable schema；search engine later|避免 optimizer scope 膨胀|
|Provenance granularity|document/object/field/span|MVI object/field；高风险 profile 才 span-level|影响行政负担|
|Human review floor|每 mapping / risk-tiered|risk-tiered，security degradation 必须 Owner review|涉及 Owner burden 与安全|
|Public prototype scope|synthetic only / public real examples|public/synthetic、no-write|与当前 inactive/private-material boundary 一致|
|Promotion path|直接更新 methodology / separate adjudication|必须 separate adjudication|本报告无授权改变 methodology|
|MA-DR-09 readiness|generate after Owner acceptance / after prototype|可在本报告 adjudication 后生成 task，但 benchmark execution 应等待 schema prototype|任务依赖与 quota 决策属于 Owner|

**Portable source table**

|Source ID|Title/specification|Authors/organization|Date/version|Type|Direct URL/DOI|Claims supported|Limitations|
|---|---|---|---|---|---|---|---|
|INT-01|Meta-Agent v0.1 Approved Spec|Meta-Agent / Owner-governed repository|2026-07-31; ref `0865f334...`|Internal target artifact|https://github.com/08822407d/Mnemosyne/blob/0865f334177e2ff0d81a3652ea9e3384e55f4259/target-projects/meta-agent/current/approved-spec.md|Inactive baseline、sole truth path、Owner authority、non-goals。fileciteturn3file0L2-L2|不是 operational validation|
|INT-02|Meta-Agent v0.1 Active Context|Meta-Agent|2026-08-01 state; same ref|Internal current-state artifact|https://github.com/08822407d/Mnemosyne/blob/0865f334177e2ff0d81a3652ea9e3384e55f4259/target-projects/meta-agent/current/active-context.md|DR-08 state、inactive status、unproven IR/conformance。fileciteturn4file0L2-L2|可能随 repository state 变旧|
|INT-03|Meta-Agent Source and Owner Map v0.1|Meta-Agent|2026|Internal authority map|https://github.com/08822407d/Mnemosyne/blob/0865f334177e2ff0d81a3652ea9e3384e55f4259/target-projects/meta-agent/authority/source-and-owner-map.md|Source priority、Owner rights、task authorization、artifact roles。fileciteturn5file0L2-L2|规则尚未有 runtime enforcement proof|
|INT-04|Meta-Agent Core Methodology v0.1|Meta-Agent|2026|Internal method library|https://github.com/08822407d/Mnemosyne/blob/0865f334177e2ff0d81a3652ea9e3384e55f4259/target-projects/meta-agent/methodology/core-methodology.md|Current six methods、single-Agent-first、promotion and handoff rules。fileciteturn6file0L2-L2|明确为 initial incomplete library|
|INT-05|Decision, Version and Migration Log v0.1|Meta-Agent|2026-07-31|Internal version/lineage record|https://github.com/08822407d/Mnemosyne/blob/0865f334177e2ff0d81a3652ea9e3384e55f4259/target-projects/meta-agent/history/decision-version-and-migration-log.md|Stable IDs、version classes、object mapping、rollback。fileciteturn7file0L2-L2|无真实 operational migration evidence|
|INT-06|MA-DR-06 — Automated Agentic System Design and Robust Workflow Search|External research export|2026-08-01|Internal-preserved external evidence|https://github.com/08822407d/Mnemosyne/tree/0865f334177e2ff0d81a3652ea9e3384e55f4259/target-projects/meta-agent/research/batches/2026Q3-batch-a/reports/MA-DR-06-report-parts|Bounded search、strong baselines、declarative IR、search metadata。fileciteturn9file0L2-L2 fileciteturn14file0L2-L2|原执行 repository mapping 不完整，后由 reviewer 补充|
|INT-07|MA-DR-07 — Meta-Agent Security Threat Model and Adversarial Evaluation|External research export|2026-08-01|Internal-preserved external evidence|https://github.com/08822407d/Mnemosyne/tree/0865f334177e2ff0d81a3652ea9e3384e55f4259/target-projects/meta-agent/research/batches/2026Q3-batch-a/reports/MA-DR-07-report-parts|Authority、origin、allowed influence、permissions、rollback、backend degradation。fileciteturn15file0L2-L2 fileciteturn22file0L2-L2|Adversarial suite 未执行|
|INT-08|MA-DR-06 / MA-DR-07 Cross-Report Adjudication|Meta-Agent reviewer|2026-08|Internal adjudication|https://github.com/08822407d/Mnemosyne/blob/0865f334177e2ff0d81a3652ea9e3384e55f4259/target-projects/meta-agent/research/batches/2026Q3-batch-a/reviews/MA-DR-06-07-cross-report-adjudication.md|Batch-A consensus、hard constraints、typed declarative IR candidate、Batch-B gate。fileciteturn23file0L2-L2|不授权 methodology 或 operation|
|EXT-01|AgentSPEX: An Agent SPecification and EXecution Language|Pengcheng Wang et al.|2026-04|Preprint、official project|https://arxiv.org/abs/2604.13346|Typed YAML steps、loops、parallelism、state、sandbox、checkpoint、visual editor。citeturn11search1turn11academia46|Very recent；evaluation 和 user study 外推有限|
|EXT-02|Open Agent Specification / Agent Spec|Oracle|26.1.2 documentation; 2026|Official specification/SDK/runtime ecosystem|https://oracle.github.io/agent-spec/|Portable Agents/Flows、JSON/YAML、adapters、evaluation-ready representation。citeturn10search2turn11search2|不自动证明 Meta-Agent security/governance equivalence|
|EXT-03|Agent Spec official repository|Oracle|2025–2026|Official repository|https://github.com/oracle/agent-spec|Framework-agnostic component model、SDK serialization、runtime adapter concept。citeturn11search0|当前主要 SDK 为 Python；adapter coverage 会变化|
|EXT-04|WayFlow documentation|Oracle|26.1.2|Official reference runtime documentation|https://oracle.github.io/wayflow/26.1.2/|Reference runtime、native Agent Spec Agents/Flows、multi-provider positioning。citeturn10search0|Reference-runtime support 不等同于所有 adapters 等价|
|EXT-05|Run Agent Spec configurations with LangGraph|Oracle|26.1.2|Official adapter documentation|https://oracle.github.io/agent-spec/26.1.2/adapters/langgraph/spec_to_langgraph.html|具体 JSON export、tool registry 与 LangGraph load example。citeturn10search1|Example 不是全面 conformance suite|
|EXT-06|COVENANT: Natural-Language Workflow Compilation for Aligned Agent Execution|Jincheng Wang, Min Zheng, Tao Wei|2026-07-28|Preprint|https://arxiv.org/abs/2607.25400|NL workflow→WAST→WCFG、pre-commit checking、120-case results。citeturn11academia45|Very recent、小样本、不含完整 backend/governance semantics|
|EXT-07|GPTSwarm: Language Agents as Optimizable Graphs|Mingchen Zhuge et al.|ICML 2024|Peer-reviewed paper/repository|https://proceedings.mlr.press/v235/zhuge24a.html|Agents as computational graphs、node/edge optimization。citeturn6search9turn6search19|Graph model 不含完整 authority/state lifecycle|
|EXT-08|DSPy: Compiling Declarative Language Model Calls into Self-Improving Pipelines|Omar Khattab et al.|ICLR 2024|Peer-reviewed paper|https://arxiv.org/abs/2310.03714|Declarative modules、text transformation graphs、compiler/optimizer separation。citeturn6academia48|主要为 Python program 与 fixed pipeline optimization|
|EXT-09|Declarative Workflows — Overview|Microsoft|2026 current docs|Official framework documentation|https://learn.microsoft.com/en-us/agent-framework/workflows/declarative|YAML→workflow graph、control flow、tools、HTTP/MCP、HITL；C#/Python differences。citeturn10search7|Packages/docs may be pre-release and framework-specific|
|EXT-10|LangGraph Persistence|LangChain|v1 current docs|Official runtime documentation|https://docs.langchain.com/oss/python/langgraph/persistence|Checkpoint、threads、replay、state history、fault tolerance。citeturn8search0|Runtime feature，不是 provider-neutral IR|
|EXT-11|LangGraph Interrupts|LangChain|v1 current docs|Official runtime documentation|https://docs.langchain.com/oss/python/langgraph/interrupts|HITL pause/resume、checkpoint requirements。citeturn8search5|Approval authority 仍由 application 决定|
|EXT-12|OpenAI Agents SDK|OpenAI|Current 2026 documentation|Official SDK documentation|https://openai.github.io/openai-agents-python/|Agents、tools、handoffs、guardrails、sessions、HITL、tracing。citeturn7search5|Code-first SDK，不是 universal interchange|
|EXT-13|Guardrails — OpenAI Agents SDK|OpenAI|Current 2026 documentation|Official SDK documentation|https://openai.github.io/openai-agents-python/guardrails/|Guardrail execution boundaries and tool coverage limitations。citeturn7search1|不同 tool/handoff paths 的 coverage 不一致|
