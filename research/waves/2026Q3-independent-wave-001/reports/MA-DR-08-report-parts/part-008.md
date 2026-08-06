|EXT-14|Business Process Model and Notation, BPMN 2.0.2|Object Management Group|2014|Official standard|https://www.omg.org/spec/BPMN/2.0.2|Mature process/control/event semantics and metamodel。citeturn3search1turn3search13|XML/metamodel burden；非 Agent-specific|
|EXT-15|Decision Model and Notation, DMN 1.5|Object Management Group|2024-08|Official standard|https://www.omg.org/spec/DMN/1.5|Decision modeling and separation from process flow。citeturn3search9|不描述 model/tool capabilities or provenance|
|EXT-16|OpenAPI Specification 3.2.0|OpenAPI Initiative|2025-09-19|Official specification|https://spec.openapis.org/oas/v3.2.0.html|Language-neutral HTTP interface contracts and schema tooling。citeturn3search0turn3search3|不描述 complete Agent workflow/governance|
|EXT-17|Arazzo Specification 1.1.0|OpenAPI Initiative|2026|Official specification|https://spec.openapis.org/arazzo/latest.html|API call sequences、dependencies、source descriptions、workflow semantics。citeturn9search8|Loops/actor-in-loop 等范围仍在演进；非 Agent IR|
|EXT-18|JSON Schema Draft 2020-12|JSON Schema project|2020-12|Official specification|https://json-schema.org/draft/2020-12|Structural schemas、core/validation vocabularies。citeturn4search0turn4search1|不能独立证明 behavioral or authority semantics|
|EXT-19|Protocol Buffers Language Guide — Editions|Google|Current|Official documentation|https://protobuf.dev/programming-guides/editions/|Stable field numbers、reserved deleted fields、compatibility discipline。citeturn9search4|Binary/code-oriented；人类 authoring 不佳|
|EXT-20|Open Policy Agent Documentation|OPA / CNCF|Current|Official documentation|https://www.openpolicyagent.org/docs|Policy decision/enforcement separation、structured input、Rego。citeturn10search12|Enforcement still depends on calling application|
|EXT-21|Cedar Policy Validation|Cedar project / AWS open source|Current|Official language documentation|https://docs.cedarpolicy.com/policies/validation.html|Schema-based validation、default DENY、separate request validation。citeturn9search0|不表示 workflow/provenance；runtime request correctness external|
|EXT-22|SLSA Provenance|SLSA / OpenSSF|v1.2 current|Official specification|https://slsa.dev/spec/v1.2/provenance|Verifiable artifact origin、production context、provenance model。citeturn6search0|Software supply-chain focus；不是 semantic correctness proof|
|EXT-23|Software Attestations|SLSA / OpenSSF|v1.1 model|Official specification|https://slsa.dev/spec/v1.1/attestation-model|Attestation producer/consumer model、VSA concept。citeturn6search10|Attestation authenticity 不等于 design validity|
|EXT-24|in-toto Attestation Framework|in-toto / CNCF|v1.2.0, 2026-03-18|Official repository/specification|https://github.com/in-toto/attestation|Verifiable claims、predicate extensibility、protobuf bindings。citeturn8search1|Project notes tooling is still developing|
|EXT-25|The Arazzo Specification v1.0.1|OpenAPI Initiative|2025-01-16|Official specification|https://spec.openapis.org/arazzo/v1.0.1.html|Version semantics、inputs、dependencies、retry/goto、source references。citeturn9search2|Focused on API workflows|

**Final disposition matrix**

```yaml
recommended_portable_core:
  - candidate_identity_status_and_separate_authority
  - IR_spec_and_design_instance_versions
  - purpose_scope_requirements_non_goals_assumptions
  - Owner_ref_target_truth_ref_and_source_priority
  - Owner_only_decisions_delegation_ceilings_and_prohibitions
  - typed_roles_responsibilities_inputs_outputs_and_evidence_contracts
  - canonical_typed_workflow_graph_with_explicit_termination
  - branches_loops_retries_timeouts_parallel_fork_join_and_failure_routes
  - explicit_state_store_scope_read_write_retention_promotion_deletion
  - provider_neutral_required_preferred_and_prohibited_capabilities
  - typed_tool_contracts_permissions_credential_refs_and_side_effect_classes
  - human_gates_approval_scope_and_expiry
  - security_invariants_and_declared_enforcement_points
  - origin_role_scope_freshness_and_allowed_influence_metadata
  - independent_verification_evaluation_and_adversarial_test_refs
  - incident_stop_rollback_purge_and_semantic_tombstone_minimum
  - deployment_sandbox_network_filesystem_residency_and_budget_constraints
  - separate_backend_binding_with_component_level_loss_declaration

recommended_optional_profiles:
  - bounded_design_search_and_mutation_profile
  - advanced_OPA_Rego_or_Cedar_policy_profile
  - cryptographic_SLSA_in_toto_attestation_profile
  - domain_specific_evaluation_profiles
  - regulated_data_privacy_and_residency_profile
  - multi_agent_coordination_profile
  - persistent_or_shared_memory_profile
  - detailed_cost_latency_and_resource_profile
  - visual_editor_layout_metadata
  - span_level_influence_provenance_profile

recommended_backend_binding_fields:
  - runtime_family_and_version
  - adapter_and_generator_versions
  - concrete_component_mapping
  - concrete_model_endpoint_and_tool_implementation
  - capability_evidence_source_date_and_expiry
  - checkpoint_sandbox_network_and_credential_resolvers
  - generated_artifact_refs_and_content_digests
  - per_semantic_mapping_status
  - preserved_emulated_degraded_unsupported_and_unknown_semantics
  - compensation_controls
  - residual_risk
  - equivalence_evidence_level
  - conformance_and_adversarial_test_results
  - Owner_acceptance_ref_for_degradation

requires_experiment_or_prototype:
  - JSON_YAML_schema_and_canonical_AST
  - deterministic_semantic_validator
  - semantic_diff_engine
  - object_mapping_and_migration_tooling
  - at_least_three_materially_different_backend_adapters
  - mapping_loss_report_generation
  - serialization_and_unknown_extension_round_trip
  - normalized_cross_backend_trace_conformance
  - policy_decision_and_runtime_enforcement_integration
  - authority_permission_and_allowed_influence_negative_tests
  - checkpoint_replay_and_non_idempotent_side_effect_tests
  - rollback_dependency_and_anti_resurrection_fixtures
  - proposal_only_mutation_and_lineage_validation
  - author_reviewer_administrative_burden_study

defer:
  - permanent_implementation_language_selection
  - complete_universal_Agent_standard
  - complete_BPMN_DMN_interchange
  - arbitrary_framework_code_reverse_import
  - universal_semantic_equivalence_proof
  - runtime_self_adaptation
  - autonomous_topology_or_memory_mutation
  - shared_cross_project_memory
  - private_material_runtime
  - cryptographically_enforced_origin_authority_as_core
  - hidden_backend_identity_attestation
  - automatic_generation_or_execution_of_MA_DR_09

reject_or_avoid:
  - generated_code_as_sole_target_truth
  - vendor_framework_as_universal_IR
  - YAML_or_JSON_Schema_as_complete_semantic_validation
  - graph_edges_without_typed_authority_data_and_failure_semantics
  - backend_equivalence_claim_without_loss_analysis
  - silent_approximation_of_required_capabilities
  - prompt_instructions_as_permission_or_checkpoint_enforcement
  - wildcard_tool_repository_network_or_credential_scope
  - optimizer_access_to_Owner_authority_privacy_or_promotion_fields
  - automatic_candidate_to_target_truth_transition
  - automatic_methodology_promotion
  - security_metadata_without_declared_runtime_enforcement
  - reverse_import_claims_without_round_trip_evidence
  - visible_model_label_as_backend_attestation
  - implementation_or_operational_activation_from_this_report
```

本报告最终处置为：**建议 Owner 将 formal Agent Design IR 接受为下一阶段的 non-operational candidate research/design artifact；建议先构建 compact layered-hybrid prototype 与 conformance fixtures；不建议现在选择永久 implementation、通用 compiler 或 operational runtime。** 该处置不修改 Meta-Agent target truth，不发行 target IDs，不接受任何 schema 为正式标准，也不激活 Meta-Agent。