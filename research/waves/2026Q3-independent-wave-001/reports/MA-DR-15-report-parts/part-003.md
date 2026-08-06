**Candidate freshness policy**

下面的 TTL 是起始候选值，不是普遍定律。TTL 只表示“未发生已知 invalidating event 时允许继续引用的最大年龄”；event trigger 可立即使 claim 失效。

| Volatility class | 事实类型 | Candidate maximum age | 使用规则 |
|:--|:--|:--|:--|
| `transaction_time` | 当前 outage、quota remaining、auth token、write permission、account entitlement | 每次 consequential operation 前 JIT | 不永久缓存为路由真值。 |
| `very_fast` | price、rate limit、region availability、preview access、alias target | 24 小时至 7 天 | 高成本或高影响 run 前再次查询。 |
| `fast` | feature support、structured output、tool schema、connector availability、subscription difference | 7 至 30 天 | schema hash、release note 或 failure 立即 invalidates。 |
| `measured_operational` | latency、error rate、cost per successful task、fallback frequency | 7 至 30 天滚动窗口 | 必须记录 workload distribution；不得跨 region/account 泛化。 |
| `benchmark_snapshot` | pinned model 在固定 harness 上的 quality result | 30 至 90 天 | model、prompt、judge、dataset 或 tool change 后重跑 relevant subset。 |
| `policy_contract` | retention、data use、security controls、terms affecting data flow | 30 至 90 天，且 operation 前核验 | Contract/account-specific；policy update 立即失效。 |
| `standard_or_protocol` | OpenAPI、JSON Schema、OAuth/MCP、HTTP semantics | 180 至 365 天 | 新版本、security advisory 或 implementation migration 时 review。 |
| `target_governance` | Meta-Agent authority、truth-source、activation state | 每次新 task 读取 latest target inputs | 不以时间 TTL 替代 latest-ref binding。 |

必须触发 revalidation 的事件包括：model alias 或 snapshot 改变、endpoint migration、deprecation、tool schema hash 变化、authentication scope 变化、region 或 subscription 变化、provider incident、unexpected 4xx/5xx、local regression、价格或延迟越过预算阈值、security advisory、data-retention policy change、fallback 被实际调用、以及 benchmark harness 或 evaluator 更新。Provider release notes 中频繁出现 endpoint deprecation、model shutdown、preview/GA 变化和 region expansion，说明 event-trigger 比固定年度 review 更重要。citeturn18search0turn18search1

**Routing policy framework**

推荐的 route evaluation 顺序如下：

```text
task and authority normalization
→ prohibited-action and material gates
→ required-capability and permission feasibility
→ freshness and evidence sufficiency
→ current availability / quota / account check
→ score only the feasible candidates
→ choose route plus explicit fallback chain
→ execute bounded validation where required
→ record actual outcome and guarantee status
```

Hard gates 应至少包括：

| Gate | Pass condition | Unknown handling |
|:--|:--|:--|
| Owner/task authority | Actor、task scope、allowed actions、expiry 和 target 明确。 | Stop；平台 permission 不能填补 task authorization。 |
| Material/privacy | Data class、storage、retention、region 和 exposure route 被允许。 | High-impact 或 private data：stop。Public synthetic probe 可继续。 |
| Permission and side effects | Read/write、principal、scope、confirmation、idempotency 和 rollback 满足。 | Write 或 irreversible：stop；read-only low-risk 可做 bounded probe。 |
| Required capability | 每项 required capability 有 current、scope-matched evidence。 | High-risk：infeasible；low-risk：probe or human review。 |
| Prohibited capability | 候选能证明不会执行 prohibited action/data flow。 | Treat as potentially present；filter。 |
| Availability | Current account、region、quota、endpoint 和 auth 可用。 | JIT check；不能仅凭一般文档假定。 |
| Risk/human gate | 所需 human approval 已取得。 | Stop or return decision package。 |

通过 hard gates 后，才计算偏好分数：

```text
candidate_score =
  Σ(weight_i × normalized_preference_i × evidence_confidence_i)
  − uncertainty_penalty
  − switching_and_migration_penalty
  − expected_failure_and_rework_cost
```

这里的 score 不允许包含 authority、privacy 或 prohibited side effects；这些已在 feasibility phase 决定。输出应同时记录 raw metrics、weights、evidence dates 和 rejected reasons，避免只有一个不可解释总分。

路由选择原则如下：

| 选择 | 适用条件 |
|:--|:--|
| Cheaper / smaller model | 输入 frozen、任务 bounded、required capabilities 已在相同 surface/version 上验证、deterministic acceptance checks 足够、失败可安全升级，且预计 verification/rework 小于节省成本。FrugalGPT 与 RouteLLM 证明这类 cascade 在特定 workload 中可能有效，但不证明普遍有效。citeturn14academia49turn14academia51 |
| Stronger model | Novel synthesis、conflicting evidence、high impact、open-ended research、architecture/policy adjudication、弱模型历史 rework 高，或所需 capability 只有 stronger route 有当前证据。 |
| Deterministic tool | 任务可由 parser、compiler、test runner、schema validator、exact search 或 database query 更可靠地完成；模型负责 framing，不替代 oracle。 |
| Different specialized tool | 当前模型缺少 current data、repository access、PDF rendering、code execution 或 transactional interface，而专用工具能以更小权限完成。 |
| Human selection/review | 目的、价值冲突、privacy、irreversible action、methodology promotion、target truth 或证据冲突无法被 objective test 解决。 |
| No automation | Required permission、privacy boundary、backend/tool identity、rollback 或 capability evidence 无法满足；没有可接受 degraded mode；自动化成本高于人工；或执行会制造不透明的权威变化。 |

**Failure, fallback and degraded guarantees**

| Failure class | Retry | Substitution | Required declaration |
|:--|:--|:--|:--|
| Transient read timeout / 429 | Bounded exponential backoff with jitter；设置 total deadline；只在一个 layer retry。 | 可切换等价 read source。 | 记录 attempts、elapsed time、source freshness。 |
| Non-idempotent write timeout | 不自动重放，除非有 verified idempotency key 或 transaction status query。 | 默认转人工核验。 | “Result unknown”；必须确认是否已产生 side effect。 |
| Provider/model unavailable | 只在 fallback candidate 通过全部 hard gates 后替代。 | 允许 model/provider substitution。 | 声明 quality、latency、version、privacy 和 observability 差异。 |
| Required feature unsupported | 不伪造等价支持。 | 可选择 reduced-scope mode。 | 明确列出 lost guarantee，例如“不再 schema-constrained”。 |
| Tool unavailable | 可进入 no-tool mode，仅处理已有输入。 | Local/manual fallback。 | 不得声称 current web/repository/account state 已验证。 |
| Stale capability claim | 先 JIT revalidate。 | 若无法验证，换 current-evidence candidate。 | Stale warning；高影响任务不得静默沿用。 |
| Conflicting evidence | 不用平均分消解。 | Scope split、controlled test、human adjudication。 | 保留两侧证据和 unresolved status。 |
| Authentication/security anomaly | Stop；不通过扩大 scope 解决。 | Secure manual path。 | Security incident/exception record；必要时 credential rotation。 |
| Unknown backend identity | 可继续低风险内容处理。 | 无法通过第二次调用制造 attestation。 | 禁止声称 exact backend、model independence 或 snapshot reproducibility。 |
| Quality regression | 停止自动 promotion；回退 pinned candidate 或 manual review。 | Stronger route / deterministic oracle。 | Regression scope、last-known-good、revalidation result。 |

AWS retry guidance、HTTP semantics 和 Circuit Breaker pattern 共同支持“retry、backoff、circuit open、degradation 和 manual intervention 是不同控制”，而非统一的“再试几次”。citeturn6search0turn6search1turn7search0

每次 degraded execution 应生成一个 guarantee object：

```yaml
degraded_guarantee:
  original_route:
  triggering_failure:
  original_guarantees: []
  retained_guarantees: []
  weakened_guarantees: []
  lost_guarantees: []
  compensating_controls: []
  evidence_freshness_after_fallback:
  user_visible_warning:
  human_approval_required:
  acceptance_criteria:
  stop_condition:
  rollback_or_recovery_path:
```

例如，structured output unavailable 时，fallback 可产出 human-readable Markdown draft，但必须声明“不保证 JSON Schema conformance、不可直接驱动 tool execution”；web search unavailable 时，可总结用户已给材料，但必须声明“未验证 current facts”。

**Tool and connector capability/permission matrix**

OpenAPI 可以描述 operation、parameters、responses、deprecation 和 security schemes；JSON Schema 可以约束 input/output structure；MCP authorization 规定 audience binding、PKCE、HTTPS 和禁止 token passthrough。这些规范适合成为 connector evidence 的一部分，但它们不证明 implementation 没有额外副作用，也不证明当前 principal 具有所需 scope。citeturn21search1turn20search1turn20search0turn20search6

推荐每个 tool operation 至少记录：

```yaml
tool_operation_claim:
  tool_name:
  connector_version:
  operation_name:
  operation_schema_ref:
  schema_version_or_hash:
  capability_description_source:
  description_trust_status: unverified | structurally_validated | behavior_verified
  access_mode: read | write | execute | communicate | administer
  side_effect_class: none | local_reversible | external_reversible | external_irreversible | unknown
  trust_boundaries_crossed: []
  data_exposed: []
  authentication_principal:
  required_scopes: []
  current_scope_evidence:
  confirmation_semantics:
  idempotency_support:
  duplicate_detection:
  transaction_status_query:
  rollback_or_compensation:
  audit_log:
  current_availability:
  last_verified_at:
  retry_policy:
  human_gate:
  prohibited_material: []
```

| Generic operation class | 默认风险 | 最低验证 | Retry policy | Default human boundary |
|:--|:--|:--|:--|:--|
| Local read-only parser | 低 | File type、resource limit、no-network behavior、malformed-input handling | 可安全重试；仍需防 resource exhaustion | 通常不需要逐次批准 |
| Public web/search read | 低至中 | Query exposure、source provenance、current availability、citation capture | Bounded retry；保持 source/date | 敏感 query 不应发送 |
| Repository read | 中 | Exact repo/ref/path、principal、private/public status | Idempotent read 可重试 | Private repo/material 需单独授权 |
| Repository write/PR | 高 | Exact path/action、branch/base、idempotency、diff preview、rollback | 未确认 transaction result 时不得盲重试 | 每个 task 的明确 write authorization |
| Email/calendar/message send | 高 | Recipient、content、send versus draft、duplicate suppression | Send timeout 后先查状态 | External communication 前 human confirmation，除非精确授权 |
| Shell/code execution | 高 | Sandbox、filesystem/network/credential boundaries、timeout、resource caps | 只重试已知无副作用命令 | 非沙箱、credential 或外部修改需独立批准 |
| Database mutation | 高至极高 | Transaction、constraints、backup/rollback、row scope、audit | 使用 transaction/idempotency key | Destructive/bulk operation 必须人工 gate |
| Administrative/security change | 极高 | Principal、scope、two-person review、recovery、audit | 默认不自动重试或替代 | Human-only unless separately authorized |

