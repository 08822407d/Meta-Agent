|Store scope/retention compatible with sensitivity|✓|✓|✓|✓ for exceptions|Block binding|
|Deletion and tombstone behavior implemented||✓|✓|✓|Block persistent profile|
|Source origin/scope/freshness present|✓||✓||Quarantine unsupported field|
|`may_influence_fields` allows each derived field|✓||✓|✓ for override|Remove influence or escalate|
|Required capability has supported backend match|✓||✓||Mapping `UNSUPPORTED`|
|Preferred capability absent|✓||✓|optional|Record degradation, compare fallback|
|Required security semantic lost in mapping|✓|✓|✓|✓ only to accept|Default `BLOCKED`|
|Generated artifact digest matches manifest|✓|✓|✓||Reject artifact|
|Runtime backend/version matches binding||✓|✓||Stop execution|
|Structured output validates|✓|✓|||Retry within cap or fail|
|Human verifier independent from executor identity|✓|✓|✓|✓|Invalidate verification|
|Judge input/rubric isolation preserved|✓|✓|✓||Invalidate evaluation|
|Acceptance tests and adversarial fixtures complete|✓|✓|✓|✓|No promotion/deployment|
|Rollback dependency inventory complete|✓|✓|✓|✓|Remain inactive|
|Retired semantic/tombstone not reintroduced|✓|✓|✓||Quarantine candidate|
|Search candidate lineage reproducible|✓|✓|✓||Candidate not promotable|
|Target truth remains separate from candidate|✓|✓|✓|✓|Critical failure; halt|
|Actual operational activation exists|||✓|✓|Without it, no execution|

Deterministic checks 应优先处理 reference resolution、authority set inclusion、graph analysis、type/data flow、mutation constraints 和 mapping status。模型 review 适合检查 natural-language requirement fidelity、semantic equivalence、evidence sufficiency 与 adversarial interpretation；human review 保留 purpose、privacy、degradation acceptance、promotion 和 activation。任何模型或 human review 都不能替代可以 deterministic 检查的规则。

**Round-trip and semantic equivalence limits**

允许的保证应分层：

```yaml
round_trip_levels:
  serialization:
    guarantee: canonical_IR_to_YAML_to_canonical_IR
  normalized_semantics:
    guarantee: aliases_and_order_normalize_to_same_AST
  backend_generation:
    guarantee: IR_to_backend_artifact_reproducible
  backend_reverse_import:
    guarantee: not_required_for_MVI
  behavioral_equivalence:
    guarantee: bounded_to_defined_conformance_fixtures
  universal_semantic_equivalence:
    guarantee: explicitly_not_claimed
```

Code-first backend 可能包含 arbitrary computation、dynamic imports、hidden defaults、callbacks 或 side effects，通常无法无损反编译为 portable IR。即使两个 graphs 结构相同，model nondeterminism、tool implementation、retry timing、state consistency 和 provider behavior 也会导致不同 outcomes。因此 semantic equivalence 必须被限定为：在明确 inputs、fixtures、capability versions、budgets 和 observation model 下通过的 conformance relation，而不是一般数学等价。

**Versioning, migration and extension model**

推荐版本集合：

```yaml
versions:
  ir_spec_version: 0.x
  design_instance_version: semantic_or_project_policy_version
  policy_profile_versions: {}
  backend_binding_version: independent
  generated_artifact_version: content_digest_plus_generator_version
  evaluation_profile_version: independent
```

`ir_spec_version` 描述 vocabulary 与 semantics；`design_instance_version` 描述某个候选设计的变化；`backend_binding_version` 可在 portable design 不变时单独更新；generated code 由 IR digest、binding digest、generator version 和 dependency lock 共同标识。

Stable IDs 规则应延续 Meta-Agent baseline：ID 不因 rename 改变；删除后不 reuse；split、merge、replace、retire 要显式 mapping。Protocol Buffers 的成熟实践同样要求已使用 field number 不得改变或重用，删除字段要 reserve number，必要时也 reserve name；其可复用教训是“旧标识必须被占位保留，防止 silent reinterpretation”。fileciteturn7file0L2-L2 citeturn9search4turn9search5

```yaml
object_mapping:
  old_ref:
  new_refs: []
  relation: unchanged | renamed | moved | split | merged | replaced | retired
  field_rules:
    preserve: []
    transform: []
    recompute: []
    retire: []
  authority_changed: false
  loss_or_ambiguity: []
  compatibility:
    backward_read:
    forward_preserve_unknown:
    backend_rebind_required:
  validation_refs: []
  Owner_decision_ref:
```

Change classification：

|Change|Compatibility|Required action|
|---|---|---|
|Add optional annotation|Additive compatible|schema update、unknown-field preservation test|
|Add optional profile|Core compatible|profile version + consumer declaration|
|Add mandatory core field|Breaking|IR major/minor policy decision + migration|
|Change existing field meaning|Breaking semantic|new field/ID preferred；explicit transform|
|Rename only|Potentially compatible|alias period + mapping|
|Split/merge object|Breaking|object map、recompute/review|
|Change authority/security default|Critical breaking|Owner decision、policy version、regression、rollback|
|Backend adapter update|Portable core unchanged|binding version、mapping diff、conformance rerun|
|Retire field or semantic|Potential resurrection risk|tombstone、reserved name、reader warning|
|Vendor extension becomes common core|Migration-sensitive|independent evidence、namespace migration、fragmentation review|

Unknown extensions 默认应 **preserve but not execute**。只有 consumer 声明理解 extension namespace/version 后才可让其影响 behavior。否则 extension fragmentation 会产生表面可移植、实际 vendor-specific 的 designs。

## Minimum viable IR、示例与实验计划

**Minimum viable IR**

推荐下一阶段 MVI 只实现以下能力：

```yaml
mandatory_core:
  - header_and_versions
  - candidate_status_and_authority_boundary
  - problem_frame_requirements_and_non_goals
  - roles
  - typed_input_output_and_evidence_contracts
  - finite_typed_workflow_graph
  - explicit_state_store_declarations
  - provider_neutral_capability_requirements
  - tool_permission_and_side_effect_contracts
  - human_gates
  - source_origin_scope_freshness_and_allowed_influence
  - security_invariants
  - acceptance_and_adversarial_test_refs
  - stop_rollback_and_tombstone_minimum
  - deployment_constraints
  - backend_binding_and_loss_report

deferred_extensions:
  - arbitrary_user_defined_control_flow_code
  - complete_BPMN_DMN_interchange
  - shared_cross_project_memory
  - runtime_self_adaptation
  - cryptographic_origin_bound_authority
  - universal_policy_language
  - automatic_reverse_import_from_framework_code
  - autonomous_search_or_promotion
```

实施负担应被限制在一个 parser/normalizer、JSON Schema、semantic validator、canonical serializer、semantic diff、三至四个 mapping prototypes 和 conformance fixtures。不需要在 MVI 中构建 production runtime、visual IDE、universal compiler、policy server、RAG、MCP registry 或 autonomous optimizer。

**Compact illustrative candidate schema**

以下只是说明性 candidate，不是已接受 schema，也不发行任何 Meta-Agent stable ID：

```yaml
ir_version: "0.x-candidate"
design:
  id: example.public-research-review
  version: "0.1.0"
  status: candidate_non_execution
  authority:
    owner_ref: owner.user
    target_truth_ref: target.approved_problem_frame
    Owner_only_decisions:
      - accept_design
      - accept_security_degradation
      - authorize_external_write
    prohibited_delegations:
      - target_truth_change
      - methodology_promotion

problem_frame:
  purpose: produce_a_cited_public_research_comparison
  scope:
    allowed_material: [public_information]
    external_side_effects: none
  requirements:
    - ref: req.citations
      statement: every_load_bearing_claim_has_source_support
      hard: true
    - ref: req.independent_review
      statement: final_report_is_checked_by_read_only_verifier
      hard: true
  non_goals:
    - repository_write
    - private_material_access
    - operational_activation

roles:
  - id: researcher
    responsibilities: [collect_sources, synthesize_candidate_report]
    authority_ceiling: [public_read, candidate_artifact_write]
    may_delegate: false
  - id: verifier
    responsibilities: [check_sources, check_boundary_compliance]
    authority_ceiling: [artifact_read]
    may_execute_tools: false

contracts:
  inputs:
    - id: research_question
      schema:
        type: string
  outputs:
    - id: canonical_report
      schema:
        type: object
        required: [claims, sources, limitations]
  evidence:
    - id: source_support
      requires_direct_url: true
      minimum_source_class: official_or_primary

workflow:
  entry: frame
  nodes:
    - id: frame
      kind: deterministic_transform
      role_ref: researcher
      output_contract: framed_question
    - id: collect
      kind: tool_call
      role_ref: researcher
      tool_ref: public_search
      retry:
        max_attempts: 2
        only_on: [transient_error]
      timeout_seconds: 120
    - id: synthesize
      kind: model_inference
      role_ref: researcher
      capability_ref: cap.research_model
    - id: verify
      kind: evidence_check
      role_ref: verifier
    - id: emit
      kind: emit_output
      output_contract: canonical_report
    - id: halt
      kind: safe_halt
  edges:
    - {from: frame, to: collect}
    - {from: collect, to: synthesize}
    - {from: synthesize, to: verify}
    - from: verify
      to: emit
      condition: verification_passed
    - from: verify
      to: halt
      condition: verification_failed
  termination:
    success_nodes: [emit]
    failure_nodes: [halt]
    maximum_node_executions: 12

state_stores:
  - id: run_state
    scope: invocation
    durability: ephemeral
    read_roles: [researcher, verifier]
    write_roles: [researcher]
    retention: delete_at_run_end
    promotion_policy: prohibited

capabilities:
  - id: cap.research_model
    kind: model
    required:
      structured_output: true
      tool_calling: true
      minimum_context_tokens: 32000
    preferred:
      streaming: true
    provider_name_required: false

tools:
  - id: public_search
    interface_schema_ref: tool.search.v1
    effect_class: external_read
    network_scope: public_https
    credential_ref: credential.public_search
    embeds_secret: false
    idempotency: safe_to_repeat

human_gates:
  - id: accept_design
    authority: owner.user
    trigger: before_candidate_promotion
    expiry: single_decision

security_invariants:
  - id: no_external_write
    statement: no_tool_may_have_external_write_effect
    enforcement_points: [static_validator, runtime_tool_registry]
    fail_mode: block
  - id: verifier_read_only
    statement: verifier_has_no_execution_or_write_authority
    enforcement_points: [static_validator, runtime_identity]
    fail_mode: block

provenance:
  default_influence: deny
  inputs:
    - subject: problem_frame.requirements
      origin_ref: target.approved_problem_frame
      source_role: target_requirement
      may_influence_fields:
        - problem_frame
        - contracts
        - workflow
        - evaluation
    - subject: external_sources
      source_role: research_evidence
      may_influence_fields:
        - evidence
        - candidate_rationale
      may_not_influence_fields:
        - authority
        - target_truth_ref
        - deployment_permissions

evaluation:
  deterministic_checks:
    - schema_valid
    - graph_reachable
    - no_write_tool
    - verifier_read_only
  adversarial_tests:
    - source_instruction_injection
    - false_completion_claim
  independent_verifier: verifier
  promotion_authority: owner.user

incident_recovery:
  stop_conditions:
    - unauthorized_write_capability_detected
    - source_origin_missing
