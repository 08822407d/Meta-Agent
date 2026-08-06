```yaml
research_id: MA-DR-08
research_title: Portable Agent Design IR and Multi-Backend Mapping
target_project: Meta-Agent
report_role: external_research_evidence_non_execution_source
```

# Portable Agent Design IR 与 Multi-Backend Mapping 规范研究报告

## 执行裁决与输入绑定

**Executive verdict**

```yaml
overall_verdict: ADOPT_FORMAL_IR_AS_CANDIDATE_NOT_TARGET_TRUTH
recommended_representation: layered_hybrid
normative_authoring_surface: typed_YAML_or_JSON
canonical_semantic_form: graph_AST
validation_stack:
  - JSON_Schema_structural_validation
  - deterministic_semantic_validation
  - policy_validation
  - backend_capability_conformance
  - evidence_and_human_review
generated_code_role: non_normative_backend_artifact
backend_mapping_rule: no_silent_approximation
operational_activation_supported: false
target_truth_change_authorized: false
methodology_change_authorized: false
implementation_selected: false
```

**结论是肯定但受限的：Meta-Agent 值得形成一个正式的 Agent Design IR candidate。** 它解决的不是“用统一文件直接运行所有 Agent framework”，而是建立一个可审查的中间语义层，使 Owner、设计者、validator、search proposer、backend adapter 和 reviewer 对同一个候选设计进行比较，同时明确区分 portable intent、backend realization 与实际 runtime state。该 IR 不应自动成为 target truth，不应授权运行，也不应把生成代码提升为唯一规范。这个方向与 Batch A 已裁定的近期产品链一致：从 approved problem frame 生成 structured specification、bounded alternatives、strong baselines 和 evidence package，最终由 Owner 决定。fileciteturn23file0L2-L2

推荐的 representation 是 **layered hybrid**：

```text
human-readable typed YAML/JSON
        ↓ parse + normalize
canonical semantic graph/AST
        ↓ validate + bind
backend-specific mapping manifest
        ↓ generate
runtime code/configuration/deployment artifacts
        ↓ execute and observe
runtime traces/state/evidence
```

其中，YAML/JSON 是主要 authoring、review 和 diff surface；graph/AST 是规范化后的 canonical semantic form；JSON Schema 仅承担 structural validation；authority、permission、reachability、termination、state flow 与 mapping loss 需要额外 semantic validators；代码和 vendor configuration 只能是可重建的 derived artifacts。JSON Schema 本身明确区分 core 与 validation vocabularies，且一些关键词（例如 `format`）可能只作为 annotation，无法替代应用级语义验证。citeturn4search0turn4search1turn4search2

**最小可用 IR 不应追求 universal Agent standard。** 下一阶段只需覆盖：设计身份与版本、problem frame、requirements/non-goals、角色、typed contracts、workflow graph、state-store rules、provider-neutral capabilities、tools/permissions/side effects、human gates、authority/security invariants、provenance/allowed influence、evaluation/recovery，以及独立的 backend binding 与 loss declaration。Search、advanced provenance graphs、cryptographic attestations、完整 BPMN interchange、runtime adaptation 和 shared-memory security 可作为 profiles 或 deferred extensions。

**最高优先级原则是：backend portability 必须是可证伪的声明，而不是营销标签。** 一个 adapter 能加载某种配置，并不能证明 authority、privacy、retry、checkpoint、approval、deletion、judge isolation 或 rollback semantics 等价。Oracle Agent Spec 已提供 portable JSON/YAML、Agents/Flows、WayFlow reference runtime 以及面向 LangGraph 等 framework 的 adapters；这些是重要先例，但 adapter existence 本身仍不构成 Meta-Agent 所需的完整 semantic equivalence proof。citeturn10search0turn10search1turn10search2

**Evidence-status legend**

|标签|本报告中的含义|
|---|---|
|`VERIFIED_PRIMARY_EVIDENCE`|来自论文、正式 benchmark、官方 repository 或可核查实验报告|
|`OFFICIAL_SPECIFICATION_FACT`|来自正式规范、官方 schema 或官方 runtime documentation|
|`MULTI_SOURCE_PATTERN`|多个相邻系统共同支持的工程模式，但没有统一正式标准|
|`TARGET_SPECIFIC_INFERENCE`|依据 Meta-Agent baseline 与外部证据作出的目标特定推断|
|`RECOMMENDATION`|供 Owner/reviewer 决策的候选方案，不是已接受实现|
|`UNRESOLVED`|需要 prototype、conformance test、adversarial test 或 Owner decision|

**Target/repository input-binding receipt**

执行时读取了 `08822407d/Mnemosyne` 的最新 `master`，实际绑定 ref 为：

```yaml
repository: 08822407d/Mnemosyne
branch: master
actual_ref: 0865f334177e2ff0d81a3652ea9e3384e55f4259
observed_commit_time_utc: 2026-08-04T00:47:52Z
repository_modified: false
input_binding_status: PASS
```

该 commit 是执行时查询到的最新 `master` merge commit。fileciteturn25file0L2-L6

所有要求的 Meta-Agent 文件均按此 ref 读取，包括：

|输入|读取状态|绑定说明|
|---|---|---|
|`current/approved-spec.md`|PASS|确认 Owner-accepted、inactive baseline、sole target truth path 及明确 non-goals。fileciteturn3file0L2-L2|
|`current/active-context.md`|PASS|确认 DR-08 在 repository 中为 ready/not selected，且 baseline 未激活、无 pilot/private material。fileciteturn4file0L2-L2|
|`authority/source-and-owner-map.md`|PASS|确认 Owner final authority、source priority、read/write 分离和 platform permission ≠ task authorization。fileciteturn5file0L2-L2|
|`methodology/core-methodology.md`|PASS|读取全部六个已接受但不完整的 methods。fileciteturn6file0L2-L2|
|`history/decision-version-and-migration-log.md`|PASS|确认 stable IDs、四类版本、mapping、change classes、rollback 与 non-reuse rules。fileciteturn7file0L2-L2|
|Batch-A reports README 与 manifest|PASS|确认 MA-DR-06 为六部分、MA-DR-07 为八部分，必须 lexical-order 无分隔符重建。fileciteturn8file0L2-L2 fileciteturn2file0L2-L2|
|MA-DR-06 ordered parts|PASS, 6/6|六部分全部读取。fileciteturn9file0L2-L2 fileciteturn10file0L2-L2 fileciteturn11file0L2-L2 fileciteturn12file0L2-L2 fileciteturn13file0L2-L2 fileciteturn14file0L2-L2|
|MA-DR-07 ordered parts|PASS, 8/8|八部分全部读取。fileciteturn15file0L2-L2 fileciteturn16file0L2-L2 fileciteturn17file0L2-L2 fileciteturn18file0L2-L2 fileciteturn19file0L2-L2 fileciteturn20file0L2-L2 fileciteturn21file0L2-L2 fileciteturn22file0L2-L2|
|Cross-report adjudication|PASS|读取 Batch-A consensus、conflicts、target mapping 与 Batch-B gate。fileciteturn23file0L2-L2|
|Candidate change ledger|PASS|读取全部 candidate-only IR/security/search/evaluation items。fileciteturn24file0L2-L2|

Manifest 中记录的原始报告身份为：

```yaml
MA_DR_06:
  parts_read: 6_of_6
  original_sha256: a02278ae871a2cf5b7716df52b0b8f4631dc2557d265ab8846af379349cc1452
MA_DR_07:
  parts_read: 8_of_8
  original_sha256: 264ac917af37ce77e605790bb8dbe2ef2ad25a65d418c9475af11c9519f794a0
```

这些报告和本报告都是 external research evidence；其完整读取不改变其 non-execution-source 身份。fileciteturn2file0L2-L2

**IR purpose, authority and non-goals**

IR 应治理的是 **candidate design semantics**，不是 Owner authority 本身，也不是 runtime factual state。推荐区分如下：

|概念|IR 中的表示|权威边界|
|---|---|---|
|Design truth/candidate|一个有版本、可验证、可比较的 design instance|始终为 candidate，除非另有 Owner-approved promotion|
|Runtime truth|实际部署 ref、served backend、credential identity、运行状态和 observations|来自 runtime/deployment attestation，不由设计文件自证|
|Portable core|跨 backend 应保持的 intent、contracts、constraints 和 invariants|规范性设计语义|
|Backend extension|某 runtime 特有的 tuning、deployment、checkpoint 或 adapter 配置|不得反向改变 portable intent|
|Declarative specification|说明系统应具有什么行为与边界|规范输入|
|Generated implementation|代码、framework graph、deployment manifests|可重建的 derived artifact|
|Human-authored fields|Owner decisions、requirements、non-goals、approval policy|需来源和 authority 标记|
|Model-generated fields|候选角色、节点、alternatives、estimated capabilities|必须标记 generation origin，不自动提升|
|Target requirements|来自 approved target source 的约束|search 不可修改|
|Derived design|为满足 requirements 生成的 roles/workflow/binding|可比较、可拒绝、可重算|
|Evidence/provenance|支持某字段的来源、日期、scope、limitations|不等于决定|
|Static design|预期结构、约束、接口、policy hooks|IR 的主要范围|
|Runtime state|当前 node、memory contents、approval token、live trace|明确排除在 design IR 之外，仅由 runtime record 引用|

```yaml
IR_may_govern:
  - candidate_design_structure
  - typed_interfaces
  - intended_control_flow
  - capability_requirements
  - authority_and_permission_constraints
  - human_gate_requirements
  - state_lifecycle_contracts
  - evidence_and_provenance_requirements
  - validation_and_conformance_obligations
  - backend_mapping_and_loss_declarations

IR_may_not_govern_or_self_authorize:
  - Owner_identity_or_final_authority_change
  - target_truth_promotion
  - methodology_promotion
  - private_material_access
  - credential_issuance
  - repository_or_external_write_authorization
  - operational_activation
  - proof_of_actual_backend_identity
  - proof_that_runtime_enforcement_occurred
  - acceptance_of_degraded_security
```

这延续了当前 Meta-Agent baseline 的核心边界：Owner 对 purpose、truth、methodology promotion、privacy、write scope、migration 和 operational acceptance 保持最终权威；研究、handoff、current context、model inference 或 platform access 均不能替代 Owner 决定。fileciteturn3file0L2-L2 fileciteturn5file0L2-L2

## 先例系统、规范与表示选择

**Existing specifications and adjacent systems**

现有系统已分别证明：Agent/workflow 可以被表示为 typed YAML、computational graph、declarative modules、workflow standards、policy programs 和 provenance attestations。然而，没有任何单一规范同时覆盖 Meta-Agent 所需的 Owner authority、allowed influence、target-truth separation、privacy boundaries、backend loss、evaluation isolation、rollback dependency 和 anti-resurrection。

**Mandatory comparison matrix**

|Approach/spec|Normative representation|Agent/workflow coverage|Authority/security semantics|Backend portability|Static validation|Runtime coupling|Maturity|Reusable lessons|Gaps|
|---|---|---|---|---|---|---|---|---|---|
|**AgentSPEX**|YAML specification + execution language|Typed steps、branch、loop、parallel、submodules、state、checkpoint、verification|Sandbox、verification 和 logging 可表达部分 execution controls；未见完整 Owner/source-priority/allowed-influence model|主要由其 harness 执行|较强的 typed structural model|中高，language 与 AgentSPEX harness 紧密相关|2026 preprint；七个 benchmarks 和 user study|显式 control flow、同步 graph/editor、checkpoint 是可复用模式|非常新；user study 与 benchmark 外推受限；不自动提供跨 runtime authority equivalence。citeturn11search1turn11academia46|
