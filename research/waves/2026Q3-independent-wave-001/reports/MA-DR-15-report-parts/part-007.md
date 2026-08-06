**Final disposition matrix**

| Disposition | Items | Rationale and boundary |
|:--|:--|:--|
| **Adoptable design principles** | Provider-neutral atomic claims；hard gates before scoring；required/preferred/prohibited/unknown separation；scope/date/version fields；backend non-attestation；explicit guarantee degradation；tool descriptions treated as unverified claims；event-triggered revalidation；active-route-only maintenance；JIT resolution of volatile facts。 | Strongly aligned with existing target baseline and multi-source evidence。这里的“adoptable”表示可提交 Owner 考虑，不表示已经成为 target truth。 |
| **Candidate items** | 本报告的 capability taxonomy；claim schema；TTL bands；filter–score–approve route record；fallback guarantee object；connector permission matrix；monthly expiry sweep；route changelog。 | 需要 Owner 选择字段、版本、storage 和 administrative budget。不得由本报告直接写入 methodology。 |
| **Experiment-gated items** | Learned router、contextual bandit、automatic cost cascade、heterogeneous model review、dynamic uncertainty thresholds、automated provider substitution、write-tool failover、quality canaries 的精确 acceptance bands。 | 收益依赖 workload、feedback、risk 和 volume；必须与 strong rule-based/single-agent baseline 比较。 |
| **Deferred items** | Exhaustive continuous benchmarking；全市场 provider inventory；实时自动抓取所有价格／quota；dynamic query-level topology；runtime self-adaptation；自动 capability promotion；完整 backend attestation infrastructure。 | 当前收益不足以证明行政和安全成本合理；部分事实更适合 JIT。 |
| **Rejected approaches** | Timeless provider ranking；从 UI label、latency、style 或 self-report 推断 backend；让成本或 benchmark score 越过 authority/privacy/permission；将 unknown required capability 当作普通低分；对 non-idempotent writes 盲目 retry；静默 fallback；将 schema/tool description 当作行为证明；把同一 backend 的多次调用称为 independent review；以 research result 自动更新 target truth 或 methodology。 | 与任务 prohibited conclusions、repository authority model、可靠性工程和负面研究证据冲突。 |

最终判定为：

```yaml
research_disposition:
  external_evidence_quality: SUFFICIENT_FOR_OWNER_DECISION_SUPPORT
  durable_capability_model_identified: true
  timeless_provider_ranking_supported: false
  target_truth_change_authorized: false
  methodology_change_authorized: false
  operational_activation_supported: false
  private_material_use_authorized: false
  repository_write_authorized: false

recommended_owner_posture:
  - retain_provider_neutral_capability_routing_principle
  - consider_atomic_claim_registry_and_explicit_freshness_states
  - place_authority_privacy_permission_and_required_capabilities_in_hard_gates
  - require_explicit_guarantee_delta_for_every_fallback
  - validate_only_active_routes_with_event_driven_and_just_in_time_checks
  - keep_learned_routing_multi_model_independence_and_write_failover_experiment_gated
```

该治理模型能在 provider churn 下保持稳定的部分，不是任何 provider 名称，而是：**任务约束的类型系统、证据和作用域记录、freshness lifecycle、不可交易 hard gates、可解释 routing decision、显式 degraded guarantees，以及与风险相称的验证程序。**