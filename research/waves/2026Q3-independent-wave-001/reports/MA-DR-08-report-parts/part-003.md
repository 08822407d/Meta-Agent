  extension_model:
    namespaced: true
    unknown_extension_default: preserve_but_do_not_execute
```

这是 `RECOMMENDATION`，不是对 YAML、JSON Schema、某 graph library、OPA、Cedar 或任何 implementation language 的永久选择。JSON-compatible core 的意义是让多语言 tooling 可行，并不是把 JSON Schema 误认为完整的 behavioral type system。

## 候选 IR 语义模型

**Candidate core object model**

推荐把一个 design instance 建模为下列组合对象。每个对象有 stable local identity；跨对象只通过 references 连接，不依赖名称猜测。

|Object|核心内容|Core status|Compositional relation|
|---|---|---|---|
|`ir_header`|IR version、design instance version、design ID、status、created/derived metadata|Mandatory|所有对象的 root|
|`authority_context`|Owner ref、target-truth ref、source priority、Owner-only decisions、delegation ceilings|Mandatory|约束所有 roles、tools、gates 和 mutations|
|`problem_frame`|purpose、scope、requirements、non-goals、assumptions、unknowns|Mandatory|派生 roles、workflow、evaluation|
|`roles`|责任、trust class、capability needs、authority ceiling、allowed delegation|Mandatory|workflow nodes 由 roles 执行|
|`contracts`|typed inputs/outputs、preconditions、postconditions、evidence obligations|Mandatory|节点、tools、stores 和 final output 引用|
|`workflow`|nodes、edges、branches、loops、parallel joins、retries、timeouts、termination|Mandatory|引用 roles、contracts、stores、gates|
|`state_stores`|store kind、schema、read/write、scope、retention、promotion、deletion、tombstone|Mandatory，即使声明 `none`|workflow nodes 读取或写入|
|`capability_requirements`|provider-neutral model/tool/runtime features，required/preferred/prohibited|Mandatory|由 backend binding 满足|
|`tools`|interface contract、side-effect class、credential ref、approval、idempotency、compensation|Mandatory，即使为空|被 workflow nodes 调用|
|`human_gates`|触发条件、required authority、expiry、resume semantics|Mandatory|位于 nodes/edges/side effects 前|
|`security_invariants`|必须始终满足的 authority、privacy、permission、network、data-flow 规则|Mandatory|映射到 enforcement points|
|`evaluation`|acceptance tests、adversarial fixtures、independent verifier、metrics、judge isolation|Mandatory|验证 design 与 backend mappings|
|`incident_recovery`|stop、containment、rollback、purge、tombstones、rebuild dependencies|Mandatory minimum|与 stores、artifacts、bindings 关联|
|`provenance`|origin、source role、scope、freshness、allowed influence、claim support|Mandatory|可附着于任一 field/object|
|`deployment_constraints`|sandbox、network、filesystem、residency、retention、budget、parallelism|Mandatory|由 backend binding 检查|
|`backend_bindings`|backend ref、component mappings、capability evidence、loss/degradation report|Mandatory before deployment；可在 pure design candidate 中为空|不改变 portable core|
|`search_space`|mutable/immutable fields、operator allowlist、budget、lineage、fallback|Optional profile|只供 proposal generation|
|`domain_profiles`|software engineering、research、regulated-data 等额外 vocabularies|Optional|扩展 core，不覆盖 core invariants|

Batch A 已明确要求 future IR 将 roles、workflow、state/memory、tools、human gates、evaluation、search metadata、failure/recovery 和 evidence 作为显式对象，而不是自由文本或任意 Python。安全报告进一步要求 `may_influence_fields`、delegated authority ceiling、typed side effects、origin binding、unsupported security semantics 与 degraded guarantees 成为 first-class fields。fileciteturn12file0L2-L2 fileciteturn20file0L2-L2

**Mandatory versus optional rule**

Mandatory 的含义不是每个系统必须使用 memory、tools 或 multi-agent。它表示 section 必须存在并明确声明状态。例如，一个 stateless、tool-free single Agent 应写：

```yaml
state_stores: []
tools: []
roles:
  - role_id: primary
workflow:
  topology: single_node
```

这样可以区分“设计明确不需要”与“生成器遗漏了关键领域”。`null`、missing 与 empty list 的含义应不同：missing 是 validation failure；empty 是明确 none；`unknown` 必须携带 blocker 或 review requirement。

**Field-status matrix**

```yaml
field_status:
  portable_core:
    - ir_version
    - design_id
    - design_instance_version
    - design_status
    - purpose
    - scope
    - requirements
    - non_goals
    - assumptions_and_unknowns
    - owner_ref
    - target_truth_ref
    - source_priority
    - Owner_only_decisions
    - roles_and_responsibilities
    - delegated_authority_ceiling
    - prohibited_delegations
    - typed_input_output_contracts
    - evidence_contracts
    - workflow_nodes_edges_and_termination
    - branch_loop_retry_timeout_semantics
    - state_store_lifecycle_contracts
    - provider_neutral_capability_requirements
    - tool_contracts_and_side_effect_classes
    - credential_identity_refs_without_secrets
    - human_gates_and_expiry
    - security_invariants
    - evaluation_and_independent_verification
    - incident_stop_rollback_and_tombstones
    - provenance_origin_scope_freshness
    - may_influence_fields
    - deployment_constraints
    - mapping_loss_acceptance_policy

  optional_profile:
    - bounded_search_profile
    - advanced_policy_bundle
    - domain_specific_evaluation_profile
    - cryptographic_attestation_profile
    - detailed_privacy_and_data_residency_profile
    - shared_memory_profile
    - multi_agent_coordination_profile
    - regulated_domain_profile
    - visual_authoring_metadata
    - cost_estimation_profile

  backend_binding:
    - backend_runtime_type
    - backend_runtime_version
    - adapter_version
    - component_mapping
    - concrete_model_or_endpoint_binding
    - concrete_tool_implementation
    - credential_resolver
    - checkpoint_backend
    - sandbox_implementation
    - structured_output_binding
    - concurrency_binding
    - tracing_binding
    - generated_artifact_refs_and_digests
    - capability_evidence
    - unsupported_semantics
    - degraded_guarantees
    - compensation_controls
    - equivalence_evidence_level

  evidence_only:
    - source_documents
    - research_reports
    - benchmark_results
    - observed_capability_facts
    - conformance_test_results
    - attestation_records
    - reviewer_notes
    - model_generated_rationale
    - confidence_estimates
    - incident_evidence

  runtime_state_not_design_IR:
    - current_workflow_node
    - live_thread_or_session_id
    - current_memory_contents
    - active_approval_token
    - live_credentials
    - actual_served_model_identity_unless_attested
    - current_retry_counter
    - current_budget_consumption
    - pending_tool_call
    - live_trace_spans
    - deployment_health
    - mutable_runtime_cache

  Owner_decision_not_machine_selected:
    - product_purpose
    - accepted_target_truth
    - methodology_promotion
    - privacy_or_material_scope_expansion
    - operational_activation
    - irreversible_side_effect_acceptance
    - acceptance_of_security_degradation
    - final_Pareto_tradeoff
    - exception_to_hard_constraint
    - retirement_or_supersession_of_authoritative_objects

  deferred:
    - universal_cross_framework_behavioral_semantics
    - arbitrary_code_round_trip_import
    - autonomous_runtime_self_redesign
    - automatic_methodology_promotion
    - shared_cross_project_memory
    - cryptographically_enforced_origin_authority
    - universal_hidden_backend_attestation
    - general_semantic_equivalence_prover
```

**Workflow semantics**

推荐 canonical AST/graph 使用有限、typed node taxonomy：

```yaml
node_kinds:
  - input
  - deterministic_transform
  - model_inference
  - tool_call
  - agent_call
  - subworkflow
  - decision
  - parallel_fork
  - parallel_join
  - human_gate
  - evidence_check
  - policy_check
  - checkpoint
  - emit_output
  - safe_halt
  - rollback
```

每个 edge 必须声明 `condition`、`data_mapping`、`authority_transition` 和 `failure_route`。Loops 不应仅用普通 back-edge 暗示；必须有 `loop_id`、progress measure、maximum iterations、timeout、break conditions 与 exhaustion behavior。Retries 必须区分 transient retry、repair retry、human retry 和 compensation；否则 backend 可能把非幂等 tool call 重复执行。

Arazzo 已将 API workflows、dependencies、inputs、success/failure actions、`retry`、`goto` 和 source descriptions 表示为 machine-readable objects，COVENANT 则通过 WAST/WCFG 和 controller-before-commit 模式降低 workflow misalignment；二者共同支持显式 flow semantics 而不是把步骤留在 prompt 中。citeturn9search2turn11academia45

**State and memory semantics**

每个 store 至少包含：

```yaml
state_store:
  store_id:
  purpose:
  data_schema_ref:
  scope: invocation | thread | project | global_prohibited_by_default
  durability: ephemeral | checkpointed | persistent
  read_roles: []
  write_roles: []
  write_eligibility:
  origin_binding:
  sensitivity:
  retention:
  promotion_policy:
  deletion_policy:
  tombstone_policy:
  anti_resurrection_dependencies: []
  backend_requirement_refs: []
```

LangGraph 官方文档显示，per-invocation、per-thread 和 stateless subgraph persistence 有实质不同的 memory、HITL 和 recovery behavior；checkpoint replay 还可能重新触发后续 LLM calls、API calls 或 interrupts。因此，`persistence: true` 远远不够，IR 必须明确 persistence scope、replay effects 和 external side-effect safeguards。citeturn8search0turn8search2turn8search5

**Authority, security and provenance semantics**

推荐把 security rule 分成四类，而不是假设所有字段都可被同一 validator 证明。

|Rule class|示例|可证明范围|
|---|---|---|
|Statically checkable|Owner-only fields 不在 mutation allowlist；delegated ceiling 是 delegator ceiling 的 subset；write tool 必须有 gate；无 wildcard path；所有 input 有 origin|由 deterministic validator 阻止不合规 design|
|Runtime-enforceable|actual credential identity、network/filesystem sandbox、approval token expiry、tool-call budget、retention deletion、checkpoint encryption|由 runtime enforcement point 执行并产出 evidence|
|Evidence-only|backend 官方 capability claim、independent verifier report、security audit、builder attestation|可审查但不能仅由 IR 自证|
|Human decision|是否接受 degraded guarantee、是否扩大 private scope、是否激活、是否提升 methodology|机器只能阻止缺少决定，不能自行作决定|

推荐字段：

```yaml
authority:
  owner_ref:
  source_priority: []
  decision_rights:
    Owner_only: []
    delegated: []
  delegation:
    ceilings: []
    prohibited: []
    transitive_delegation_default: false
  read_write_separation:
    reviewer_may_execute: false
    verifier_may_write: false
  exceptions:
    - scope:
      approval_ref:
      expires_at:
      non_precedential: true

provenance:
  - subject_path:
    origin_ref:
    source_role:
    project_scope:
    observed_at:
    valid_until:
    sensitivity:
    may_influence_fields: []
    may_not_influence_fields: []
    transformation_chain: []
```

`may_influence_fields` 的默认行为应为 deny：没有明确 allowed influence 的 research evidence 可以进入 analyst context，但不能更改 authority、permission、target truth 或 promotion state。这直接延续了 current source-and-owner map 中“artifact role 不因位置、新旧或长度自动升级”的规则。fileciteturn5file0L2-L2

