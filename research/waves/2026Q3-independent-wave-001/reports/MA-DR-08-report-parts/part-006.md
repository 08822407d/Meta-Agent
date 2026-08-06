  rollback:
    action: discard_candidate_and_ephemeral_state
  tombstones:
    required_for_retired_design: true

deployment_constraints:
  no_write_profile: true
  network: public_read_only
  filesystem: ephemeral
  maximum_tool_calls: 8
  maximum_wall_time_seconds: 600

backend_bindings: []
```

**Backend-mapping example**

```yaml
backend_binding:
  binding_version: "0.1.0"
  portable_design_ref: example.public-research-review@0.1.0
  target:
    runtime_family: graph_state_runtime
    runtime_version_ref: observed.current.version
    adapter_version: prototype-0.1
  mappings:
    workflow:
      status: ADAPTER_MAPPED
      node_mapping:
        deterministic_transform: graph_node
        model_inference: graph_node_with_model_adapter
        tool_call: graph_node_with_tool_wrapper
        evidence_check: graph_node_read_only_identity
        safe_halt: terminal_failure_node
      equivalence_evidence: CONFORMANCE_FIXTURES
    state:
      status: NATIVE_CLAIMED
      invocation_store: per_invocation_checkpointer
      replay_external_effect_policy: disable_replay_after_external_write
      equivalence_evidence: STRUCTURAL_ONLY
    human_gate:
      status: ADAPTER_MAPPED
      implementation: interrupt_and_resume
      equivalence_evidence: BEHAVIORAL_TESTS
    authority:
      status: DEGRADED
      reason: runtime_graph_does_not_natively_understand_Owner_only_semantics
      compensation:
        - external_policy_check
        - separate_runtime_identity
      equivalence_evidence: ADVERSARIAL_TESTS
    provenance:
      status: DEGRADED
      reason: provenance_is_preserved_in_manifest_but_not_used_by_native_scheduler
      compensation:
        - pre_node_influence_validator
    no_external_write:
      status: ADAPTER_MAPPED
      implementation:
        - tool_registry_allowlist
        - network_egress_policy
      equivalence_evidence: ADVERSARIAL_TESTS
  unsupported_semantics: []
  degraded_guarantees:
    - native_scheduler_does_not_enforce_source_allowed_influence
  deployment_decision:
    status: pending_Owner_review
```

**Explicit mapping-failure example**

```yaml
mapping_failure:
  target_runtime: simple_chat_agent_runtime
  failures:
    - portable_semantic: checkpoint_and_resume_before_human_approval
      status: UNSUPPORTED
      reason: runtime_has_no_durable_checkpoint_or_resume_token
    - portable_semantic: independent_read_only_verifier_identity
      status: UNSUPPORTED
      reason: all_agent_steps_share_one_tool_and_credential_context
    - portable_semantic: per_tool_pre_commit_guard
      status: UNKNOWN_UNVERIFIED
      reason: official_runtime_contract_does_not_specify_universal_interception
  attempted_approximation:
    - ask_model_to_remember_approval_in_prompt
    - instruct_verifier_not_to_use_tools
  approximation_disposition: REJECTED
  rationale:
    - prompt_instruction_is_not_durable_checkpoint
    - role_prompt_is_not_permission_isolation
  mapping_status: BLOCKED
  allowed_fallback:
    - run_design_as_non_executing_document_review_only
```

这体现了 core rule：缺失 durable checkpoint 不能用 prompt memory 近似；缺失 separate credential identity 不能用“请不要调用工具”近似；缺失 universal interception 不能用未验证 guardrail claim 近似。

**Conformance and future experiment plan**

推荐分阶段 prototype，而不是直接实现完整 compiler：

|Stage|Artifact|Tests|Exit criterion|
|---|---|---|---|
|Core schema prototype|YAML/JSON schema、canonicalizer、AST model|positive/negative schema fixtures；canonical serialization|同一设计跨 YAML/JSON 得到相同 digest|
|Semantic validator|reference resolver、graph/data-flow、authority、tool-effect checks|unreachable、unbounded loop、ceiling violation、missing gate、state-before-write|所有 deterministic failure 有稳定 diagnostic code|
|Semantic diff|field/object-aware diff engine|rename、split、permission expansion、backend-only change|能区分 presentation 与 authority-critical diff|
|Policy prototype|native deterministic rules，任选一个 OPA/Cedar experiment|decision/enforcement separation；request-shape failures|证明 policy result 被 runtime enforcement point 消费|
|Backend adapters|至少三种 materially different runtime styles|golden mapping manifests、loss reports、generated artifact digests|无 unsupported semantic 被静默忽略|
|Round-trip tests|IR serialization round trip|unknown extension preservation、canonical order、version aliases|portable IR 自身可 round-trip|
|Behavioral conformance|统一 deterministic fixtures 与 trace normalization|branch、retry、timeout、HITL、checkpoint、tool call|明确 pass/fail 与 accepted nondeterminism 范围|
|Security conformance|Batch-A adversarial cases|origin laundering、permission inflation、false success、judge injection、rollback resurrection|critical authority/security classes 零容忍|
|Search compatibility|proposal-only mutation engine|immutable field mutation attempts、lineage、reproducibility|optimizer 永远不能生成 promotable/approved status|
|Administrative evaluation|author/reviewer task study|review time、rework、schema confusion、extension burden|证明 IR 相对 structured Markdown 有净收益|

Cross-backend tests 不应只比较 final answer。最低 observation model 应包括：

```yaml
conformance_observations:
  - normalized_node_trace
  - branch_taken
  - tool_calls_and_arguments
  - side_effect_class
  - approvals_requested_and_consumed
  - state_reads_and_writes
  - retries_and_timeouts
  - terminal_status
  - evidence_records
  - policy_decisions
  - mapping_loss_triggered
```

Agent Spec 的 standardized representation 与 adapters、LangGraph 的 checkpoints/interrupts、Microsoft declarative-to-graph compilation、OpenAI Agents SDK 的 handoffs/guardrails/tracing 分别提供了可用于 prototype 的不同 runtime styles。citeturn10search1turn10search2turn8search0turn10search7turn7search0turn7search2

**Administrative burden and failure modes**

|Failure mode|机制|后果|Mitigation|
|---|---|---|---|
|Schema complexity explosion|把所有 backend feature 放入 core|无人能完整 author/review|compact core + profiles；extension budget|
|False portability|adapter 只映射 happy path|security/rollback 语义被静默丢失|mandatory component-level loss report|
|Dual representation drift|YAML、AST、code 被手工独立编辑|出现多份 competing truth|只有 YAML/JSON→AST 为规范 parse；code generated/read-only|
|DSL/runtime drift|grammar 与 runtime behavior 不同步|同一 IR 在版本间含义变化|spec tests、runtime conformance、version pin|
|Extension fragmentation|每 vendor 添加 incompatible fields|portable core 成为空壳|namespaces、extension registry、preserve-not-execute default|
|Opaque generated code|复杂 generator 隐藏 side effects|reviewer 无法确认 mapping|manifest、digest、generator version、diff summary|
|Provenance overload|每个 token/span 都有 lineage|review成本超过价值|MVI 用 object/field-level provenance；高风险 profile 才 span-level|
|Policy duplication|同一 rule 在 schema、Rego、runtime 多次实现|语义不一致|single rule catalog + declared enforcement mapping|
|Approval fatigue|过多 human gates|rubber-stamping、延迟|risk-tiered gates；只对 authority/high-impact action|
|Semantic-diff blind spots|普通 textual diff 看不出 permission expansion|高风险改变被视为小修改|typed semantic diff categories|
|Round-trip overclaim|把 reverse-import 当等价|backend-only behavior 被提升为 portable intent|reverse import 默认 unsupported|
|Evidence staleness|capability inventory 未更新|绑定到不存在或变化的 feature|source/date/version/TTL + remap gate|
|Conformance overfitting|adapters 针对固定 fixtures|现实行为仍漂移|hidden fixtures、adversarial variants、version update tests|
|Security metadata without enforcement|字段存在但 runtime 不消费|“paper security”|每 invariant 必须有 enforcement point 和 evidence|
|Rollback without dependency purge|只恢复主文件|旧语义从 cache/index/summary 复活|tombstones、dependency inventory、clean rebuild|
|Universal policy language burden|强迫所有 consumers 集成 Rego/Cedar|adoption failure|core 只定义 policy semantics/hooks；具体 language 为 profile|

AgentSPEX 自身以可读 YAML、visual editor 和 harness 降低 Python-coupling burden，但它仍需要自己的 execution ecosystem；Microsoft declarative workflows 已出现 C#/Python structures 差异；Arazzo 明确说明 schema 不能保证捕获所有 specification violations。这些都是“declarative format 不自动等于低负担或完整 portability”的负面证据。citeturn11search1turn10search7turn9search3

## 影响、冻结输入、开放决策与来源

**Implications for current Meta-Agent baseline and candidate methods**

本研究不要求回滚现有 v0.1。相反，它进一步支持当前 baseline 的以下方向：

|Current baseline|IR implication|Disposition|
|---|---|---|
|Sole target truth|IR instance 必须明确为 candidate，不成为第二 truth source|Retain|
|Owner final authority|Owner-only decisions 成为不可变 hard constraints|Retain and make first-class|
|Single-Agent-first|IR topology 可表达 single/workflow/multi-agent；不得默认 multi-agent|Retain|
|File-based、human-reviewed|YAML/JSON authoring 与 review 适合下一阶段 non-operational prototype|Retain|
|No RAG/MCP/auto-writeback|MVI 不需启用这些 runtime features|Retain|
|Stable IDs/version/migration|扩展到 IR objects、bindings、profiles 和 semantic diffs|Strengthen as candidate|
|No automatic methodology promotion|search、mapping、evaluation 结果始终 proposal/evidence|Retain|
|Authority/source/memory separation|增加 origin、freshness、scope、allowed influence|Candidate extension|
|Capability-aware work split|schema/diff/checks 可 mechanical；novel mapping 和 degradation acceptance 需 frontier/human|Strengthen|
|No provider-neutral compiler claim|本报告只建议 candidate IR 和 prototypes，不声称 complete compiler|Retain limitation|

当前 approved spec 明确不接受 provider-neutral Agent compiler 或 complete Agent Design IR；active context 也把 formal portable IR/conformance 列为未证明范围。因此，本报告的处置只能是形成 candidate specification/prototype agenda，不能被描述为 baseline 已接受的新能力。fileciteturn3file0L2-L2 fileciteturn4file0L2-L2

对 candidate ledger 的影响：

```yaml
candidate_implications:
  CAND_DESIGN_SYNTHESIS:
    support: strengthened
    proposed_artifact: typed_IR_candidate_plus_provenance
  CAND_ALTERNATIVE_BASELINE_COMPARISON:
    support: strengthened
    proposed_mechanism: same_core_IR_different_topologies
  CAND_CONSTRAINT_PRESERVING_SEARCH:
    support: conditional
    dependency: immutable_field_and_mutation_schema
  CAND_ORIGIN_ALLOWED_INFLUENCE:
    support: strong
    minimum_scope: object_or_field_level
  CAND_TYPED_PERMISSION_SIDE_EFFECT:
    support: strong
    minimum_scope: effect_class_credential_ref_gate_rollback
  CAND_BACKEND_DEGRADED_SEMANTICS:
    support: strong
    minimum_scope: component_mapping_loss_report
  CAND_PARAPHRASE_STABILITY:
    support: unchanged_for_later_evaluation
  CAND_SECURITY_UTILITY_DUAL_GATE:
    support: strengthened
    implementation: conformance_profile_not_core_score
  CAND_PROMOTION_QUARANTINE:
    support: strengthened
  CAND_ANTI_RESURRECTION_ROLLBACK:
    support: strengthened_but_runtime_profile_deferred
  CAND_REPRODUCIBLE_SEARCH_BUNDLE:
    support: strong
```

这些仍是 candidate-only objects，未发行任何新 `MA-REQ`、`MA-PEND`、`MA-METHOD` 或 `MA-MIG`。fileciteturn24file0L2-L2

**Inputs frozen for later MA-DR-09**

