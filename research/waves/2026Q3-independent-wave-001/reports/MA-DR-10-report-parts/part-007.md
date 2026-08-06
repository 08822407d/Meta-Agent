| **Rejected as methodology defaults** | Multi-Agent by default；role/persona proliferation；prompt-only architecture；provider/framework lock-in；polished specification = validated quality；single LLM judge as sole verifier；authority/privacy 作为可被总分抵消的 objectives；open-ended code search 作为当前 design method；automatic candidate promotion。 | 与 repository authority boundaries、strong-baseline evidence、Agent failure research 和 safety/governance principles冲突。 |

**Final report disposition**

```yaml
research_disposition: COMPLETE_EXTERNAL_RESEARCH_EVIDENCE
target_specific_mapping: COMPLETED
recommended_owner_posture: >
  REVIEW_AS_CANDIDATE_METHOD_AND_DECISION_FRAMEWORK;
  DO_NOT_PROMOTE_WITHOUT_IR_COMPATIBILITY_REVIEW,
  BENCHMARK_AND_PILOT_EVIDENCE,
  AND_EXPLICIT_OWNER_DECISION
supports_new_explicit_design_synthesis_method_candidate: true
supports_immediate_methodology_promotion: false
supports_target_truth_change: false
supports_operational_activation: false
supports_private_material_use: false
supports_automated_architecture_search: false
supports_canonical_IR_selection: false
```

Meta-Agent 的 repeatable gap 可由一个**baseline-first、contract-oriented、traceable、stage-gated、human-governed 的 design-dossier cycle** 填补。最小必要 artifacts 是：approved-frame binding、requirements/assumptions、authority、topology rationale、role and interaction contracts、state/memory、tools/permissions、workflow/termination、fallback/rollback、evaluation/observability、alternatives、trace/rationale、risk 与 unresolved decisions。AI 可以安全地承担候选生成、格式化、lint 和 consistency checking；architecture purpose、authority、risk acceptance、irreversible permissions、final trade-off 和 methodology promotion 必须保留给人。该候选只有在通过 MA-DR-08 的 representation compatibility review、MA-DR-09 的 benchmark/ablation design，以及真实 pilot 对 design quality、review burden、cross-domain transfer 和 learning value 的检验后，才具有被考虑提升进方法库的证据基础。