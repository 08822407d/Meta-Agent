OPA 的关键可复用思想是将 policy decision-making 与 enforcement 分离；Cedar 则提供 principal/action/resource/context request model、schema-based policy validation 和 default DENY。但 Cedar 官方文档也明确说明 policy validation 与 authorization request evaluation 是独立 API，application 仍必须确保 request 符合 schema。因此 IR 必须声明 enforcement point 和 request construction，而不能仅写 `policy: cedar` 就宣称权限已强制。citeturn10search12turn9search0

**Search and optimization compatibility**

```yaml
search_contract:
  candidate_status_always: proposal_only
  immutable_fields:
    - owner_ref
    - target_truth_ref
    - accepted_requirements
    - non_goals_marked_hard
    - privacy_boundaries
    - authority_ceilings
    - prohibited_delegations
    - side_effect_approval_requirements
    - critical_security_invariants
    - promotion_and_activation_rules

  mutable_fields:
    - role_decomposition
    - permitted_workflow_topology
    - node_prompts_or_instructions
    - allowed_model_capability_tiers
    - retry_parameters_within_bounds
    - verifier_placement
    - approved_tool_subset
    - state_scope_within_ceiling

  mutation_operator_allowlist:
    - add_remove_candidate_node
    - replace_operator_with_compatible_operator
    - reorder_independent_nodes
    - change_parallelization_within_limit
    - reduce_permissions
    - add_verification
    - alter_prompt_or_instruction
    - choose_backend_independent_capability_preference

  prohibited_mutations:
    - change_Owner_decision
    - remove_required_human_gate
    - expand_permission_ceiling
    - weaken_privacy
    - convert_candidate_to_target_truth
    - accept_mapping_loss
    - enable_write_profile
```

每个 candidate 需要：

```yaml
candidate_lineage:
  parent_design_digest:
  mutation_operator:
  changed_paths: []
  proposer_identity:
  model_tool_versions:
  seed:
  dataset_split:
  budget:
  evaluator_refs:
  generated_at:
  reproducibility_bundle_ref:
```

Search 应先通过 feasibility gate，再比较 Pareto metrics。Authority、privacy、permission、critical security 和 irreversible side effects 不是可被 score 抵消的 objective。Batch A 已明确裁定 hard constraints 位于 optimizer 外，Owner 从 feasible Pareto candidates 中选择，而不是由一个永久加权分数替代价值判断。fileciteturn11file0L2-L2 fileciteturn23file0L2-L2

推荐 semantic-diff categories：

|Category|示例|默认 gate|
|---|---|---|
|Presentation-only|description、ordering、formatting|mechanical diff|
|Additive compatible|新增 optional evidence、new non-executed test|schema/backward-read|
|Control-flow behavior|branch、retry、loop、termination 改变|semantic validation + evaluation|
|Capability/runtime|required context、streaming、parallelism 改变|backend remap|
|Authority/security/privacy|permission、gate、origin、retention 改变|Owner decision，fail closed|
|State lifecycle|store scope、promotion、deletion、replay 改变|migration + recovery tests|
|Backend binding/loss|adapter、model、tool implementation、degradation 改变|mapping conformance|
|Evaluation|dataset、oracle、judge、threshold 改变|evaluation-governance review|
|Provenance|source、origin、allowed influence 改变|source/authority review|
|Retirement/rollback|tombstone、replacement、rebuild dependency|migration and anti-resurrection gate|

Optimizer output 无论 benchmark score 多高，都只能是 `candidate_design`; promotion 必须引用独立 decision object。这样可机械阻止 `candidate.status: approved` 由 search process 自行写入。

## Backend binding、验证与迁移

**Provider-neutral capability and backend-binding model**

```text
portable capability requirement
             ↓
backend capability inventory with dated evidence
             ↓
binding solver / human-reviewed mapper
             ↓
mapping manifest and loss report
             ↓
generated runtime artifacts
             ↓
conformance and runtime evidence
```

Portable requirement 不应写永久 provider/model name，而应写 behavioral/capability predicate：

```yaml
capability_requirement:
  capability_id: cap.structured_research_output
  kind: model
  priority: required
  predicates:
    structured_output:
      schema_dialect: JSON_Schema_2020_12_subset
      strict_validation_required: true
    tool_calling:
      required: true
      parallel_calls: preferred
    context:
      minimum_input_tokens: 64000
      overflow_behavior: reject_or_explicit_compaction
    streaming:
      required: false
    checkpoint_resume:
      required: true
    data_handling:
      permitted_residency: [owner_approved_regions]
      provider_training_use: prohibited
      maximum_retention: owner_policy_ref
  fallback:
    allowed: false
```

`required`、`preferred`、`prohibited` 和 `informational` 必须分开。Preferred capability 缺失可降低 score；required capability 缺失必须产生 `UNSUPPORTED` 或 `BLOCKED`，不得用“相似能力”静默替代。

工具采用 interface 与 side-effect 双重分类：

```yaml
tool_contract:
  tool_id: tool.public_search
  interface_schema_ref: contracts.search.v1
  effect_class: external_read
  determinism: nondeterministic
  idempotency: safe_to_repeat
  credential_ref: cred.public_search_identity
  credential_secret_embedded: false
  network_scope: [public_https]
  filesystem_scope: none
  approval:
    required: false
  evidence_output:
    source_urls_required: true
  rollback:
    applicable: false
```

建议 effect classes：

```yaml
side_effect_classes:
  - pure_compute
  - local_ephemeral_write
  - persistent_internal_write
  - external_read
  - external_reversible_write
  - external_irreversible_write
  - authority_or_permission_change
  - private_data_disclosure
```

**Mapping result model**

```yaml
mapping_status:
  - NATIVE_CLAIMED
  - ADAPTER_MAPPED
  - EMULATED
  - DEGRADED
  - UNSUPPORTED
  - BLOCKED
  - UNKNOWN_UNVERIFIED

equivalence_evidence:
  - NONE
  - STRUCTURAL_ONLY
  - STATIC_SEMANTIC
  - CONFORMANCE_FIXTURES
  - BEHAVIORAL_TESTS
  - ADVERSARIAL_TESTS
  - INDEPENDENT_REVIEW
```

`NATIVE_CLAIMED` 表示官方 runtime 声称直接支持相应构件，不等于 Meta-Agent 已验证行为等价。只有通过对应 fixtures 后，才能提高 `equivalence_evidence`。任何 `DEGRADED`、`EMULATED` 或 `UNKNOWN_UNVERIFIED` 项都必须有 Owner-defined acceptance policy；涉及 security/authority/privacy 的 degradation 默认 `BLOCKED`。

**Backend mapping examples**

|Runtime style|Portable semantics that map well|Required binding work|Likely unsupported/degraded semantics|Disposition|
|---|---|---|---|---|
|**Oracle Agent Spec → WayFlow reference runtime**|Agents、Flows、tools、JSON/YAML component configuration；WayFlow 官方称 native support for all Agent Spec Agents and Flows|将 Meta-Agent core graph 降到 Agent Spec components；绑定 concrete LLM/tool configs；保留 external policy/provenance profile|Owner-only decisions、allowed-influence metadata、semantic tombstones、promotion quarantine 等若不属于 runtime-recognized fields，只能保留为 non-executed metadata 或 external enforcement|`ADAPTER_MAPPED` 或针对 Agent Spec subset 的 `NATIVE_CLAIMED`；Meta profiles 单独列 loss。citeturn10search0turn10search2|
|**LangGraph StateGraph runtime**|Graph nodes/edges、typed state、subgraphs、parallel supersteps、checkpoint、interrupt/HITL、replay|为每个 node 生成 code wrapper；选择 checkpointer；为 approval、policy 和 tool effects 添加 middleware；定义 replay-safe side effects|任意 code node 可能隐藏 side effects；portable policy、origin、retention 与 authority 没有自动 enforcement；reverse import 不能保证|`ADAPTER_MAPPED`; checkpoint semantics 可 native，authority/provenance 通常 `DEGRADED` 或 externalized。citeturn8search0turn8search2turn8search5|
|**Microsoft Agent Framework declarative YAML**|Variables、control flow、agent/tool invocation、HTTP/MCP、HITL 和 conversation actions|将 canonical nodes 降到 supported action kinds；处理 PowerFx-like expressions；选择 C# 或 Python target profile|官方文档说明 C# 与 Python YAML structure 略有不同；自定义 complex logic 可能需 programmatic escape；portable round-trip 受语言/profile 影响|`ADAPTER_MAPPED`; 每个 language profile 独立 conformance，不能只写一个 generic Microsoft binding。citeturn10search7|
|**OpenAI Agents SDK code-first runtime**|Agents、tools、structured outputs、handoffs、sessions、guardrails、HITL、tracing、sandbox concepts|生成 Python/TypeScript orchestration；将 tool permissions 编译为 approvals/guardrails；配置 sensitive trace capture；外部保存 provenance manifest|Agent-level guardrails 只覆盖 chain 边界；tool guardrails 对某些 hosted/built-in tools、handoffs 或 `Agent.as_tool()` 的覆盖不同；arbitrary workflow branches/rollback 需 custom code；无保证 code→IR round trip|`ADAPTER_MAPPED` with generated code; guardrail coverage 差异必须列 `DEGRADED`，不能宣称 universal enforcement。citeturn7search0turn7search1turn7search2turn7search7|

**Mapping-loss example**

```yaml
mapping_loss:
  portable_requirement_ref: security.invariant.no_external_write_without_gate
  target_backend: example_code_first_runtime
  target_backend_version: observed_version_ref
  status: DEGRADED
  reason:
    - hosted_tool_path_does_not_use_the_same_tool_guardrail_pipeline
    - approval_hook_does_not_cover_all_possible_side_effect_surfaces
  preserved:
    - function_tool_pre_execution_check
    - function_tool_human_approval
  not_preserved:
    - universal_pre_commit_gate_for_hosted_tools
  proposed_compensation:
    - remove_hosted_write_tools
    - wrap_allowed_operations_in_custom_function_tools
    - enforce_network_egress_allowlist_outside_runtime
    - run_adversarial_fixture
  residual_risk:
    - runtime_or_dependency_may_expose_unwrapped_side_effect
  acceptance_authority: Owner
  default_failure_behavior: BLOCK_DEPLOYMENT
```

OpenAI Agents SDK 的官方 guardrail documentation 明确区分 input/output/tool guardrails，并指出 tool guardrails 不覆盖所有 hosted/built-in tools 和 handoff paths。这是“backend 有 guardrails”仍不足以映射 portable universal invariant 的具体例子。citeturn7search1turn7search7

**Validation matrix**

|Rule|Static|Runtime|Evidence review|Human decision|Failure behavior|
|---|---:|---:|---:|---:|---|
|IR/schema version 可识别|✓||||Reject parse|
|Mandatory sections present|✓||||Reject design|
|Stable IDs unique and references resolve|✓||||Reject design|
|No forbidden embedded secrets|✓|✓|✓||Quarantine artifact|
|Owner-only fields absent from mutation allowlist|✓||||Reject search profile|
|Delegated authority ≤ delegator ceiling|✓|✓|||Block delegation|
|Prohibited delegations remain prohibited|✓|✓|||Fail closed|
|Read/write roles separated where required|✓|✓|||Block binding/execution|
|Tool effect class declared|✓||✓||Reject incomplete tool|
|Credential identity is ref, not secret|✓|✓|✓||Block deployment|
|Write/irreversible tool has required gate|✓|✓||✓|Block action|
|Gate approval state and expiry valid||✓|✓|✓|Pause or safe halt|
|Graph entry/exit and reachability valid|✓||||Reject design|
|Unintended dead nodes absent|✓|||optional|Warning or reject by profile|
|Loops have cap、timeout、progress/exit|✓|✓|||Reject or circuit-break|
|Retry of non-idempotent tool has compensation|✓|✓|✓||Block retry|
|All terminal paths satisfy output contract|✓|✓|||Fail test/deployment|
|State read occurs after defined write or valid initialization|✓|✓|||Reject graph|
