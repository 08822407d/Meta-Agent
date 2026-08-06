## 维护计划、行政负担与 Owner 决策

**Minimal recurring validation suite**

推荐只维护 active routes 和高风险 fallback 所需的最小套件，而不是测试市场上的全部模型。

| Validation item | Cadence | 最小范围 | Failure response |
|:--|:--|:--|:--|
| Claim/schema lint | 每次 claim change | Required fields、scope、date、evidence、expiry、conflict refs | Block merge/acceptance of malformed claim |
| Release/deprecation watch | 每周一次或 provider event | Active model/tool endpoints、aliases、shutdown、pricing/policy events | Mark affected claims `event_invalidated` |
| JIT availability/auth probe | Consequential use 前 | Exact account、region、endpoint、principal、required operation | Route to fallback or stop |
| Structured-output conformance | 每周或 model/surface change | Small positive/negative schema fixtures | Disable machine-executable guarantee |
| Tool argument/schema conformance | 每次 connector/schema hash change | Required/optional fields、invalid args、error semantics | Quarantine changed operation |
| Permission negative tests | Connector/auth change；启用 write 前 | Read principal cannot write；scope restrictions；wrong audience rejected | Stop route and investigate |
| Idempotency/duplicate test | Write route 首次启用、语义变更、季度 drill | Sandbox transaction、timeout-after-commit、duplicate key | Disable automatic retry |
| Quality canary | 每月或 snapshot/prompt/tool change | 少量代表性 task clusters、objective checks | Revert last-known-good or escalate |
| Latency/cost sample | Rolling weekly | p50/p95、success-adjusted cost、rate-limit incidence | Re-score feasible routes |
| Fallback drill | 季度，或重大 provider change 后 | Primary unavailable、tool unavailable、stale evidence、partial outage | Repair guarantee declaration or stop path |
| Multi-model independence audit | 每次声称 independent review 前 | Backend attestation、evidence channel、judge、shared context | Downgrade label to additional review |
| Changelog and expiry sweep | 每月 | Expired、superseded、orphaned、unused claims | Archive or require revalidation |

LiveBench 的持续更新模式支持保留小型 live canaries，而非只依赖永不变化的 benchmark；但其 repository 也显示运行 coding/agentic tests 可能需要 Docker 和额外依赖，因此 Meta-Agent 不应复制完整公共 leaderboard infrastructure。citeturn17academia29turn17search4

**Matrix update workflow**

```text
official release, local failure, policy change, or scheduled review
→ identify affected atomic claims
→ preserve previous claim and change reason
→ check source role and exact scope
→ run only the proportional validation subset
→ resolve as confirmed, partial, conflicted, unknown, or superseded
→ update expiry and fallback impact
→ require human review for authority/privacy/write implications
→ publish changelog entry
```

若一个 source 只更新 marketing wording 而没有可验证 semantic change，不应自动提高 confidence。若 local behavior 与 official docs 冲突，应先检查 surface、version、region、account 和 operation mode；仍无法解释时，claim 状态应为 `conflicted`，而不是选择更方便的一侧。

**应永久跟踪与应 JIT 解析的事实**

长期 registry 应保存 ontology、evidence provenance、known limitations、test fixtures、route policy、fallback contracts、historical regressions、last-known-good versions 和 supersession lineage。

以下事实更适合 just-in-time：当前 quota remaining、provider incident、account entitlement、region availability、alias 当前指向、write permission、token scope、实时价格、临时 preview allowlist、当前 data-residency endpoint、以及单次 transaction 是否已执行。将这些值长期复制进 matrix 会制造高维护负担和 stale confidence。

**Administrative, cost, and maintenance burden**

以下为 `RECOMMENDATION / ESTIMATE`，假设初始范围是约六个 active model routes、四个 connectors、以 public/read-only tasks 为主，且已有基本 CI 和日志设施：

| 工作 | 候选负担 |
|:--|:--|
| 初始 ontology、schema、route record 和 changelog | 约三至五个 engineering days |
| 小型 schema/tool/quality probe harness | 约三至八个 engineering days，取决于现有测试设施 |
| 每月 claim review、expiry sweep 和 canary triage | 约三至六小时 |
| 每个新增 read-only provider/surface | 初始半日至两日；之后每月约十五至四十五分钟 |
| 每个 write-capable connector | 额外一至三日建立 sandbox、idempotency、rollback 和 permission tests；每月约一至两小时 |
| 季度 fallback drill | 每次约一至三小时 |
| Learned router 或 contextual bandit | 显著更高：需 outcome logging、reward design、offline replay、exploration safety 和 drift monitoring，不适合作为 v0.x 默认 |

若实际维护超过每月一个工作日，却每月只发生少量 routes，则应缩减 permanently tracked facts、减少 benchmark scope，并将更多 volatility facts 转为 JIT checks。治理系统的 success metric 不应是 matrix 字段数量，而应是 prevented failures、reduced rework、faster safe routing 和更低的 stale-claim incidence。

**Unresolved questions and Owner decisions**

| Owner decision | 为什么无法由本报告代替 |
|:--|:--|
| 哪些 risk tiers 允许 unknown capability probe，哪些必须 stop？ | 取决于 Owner 的损失容忍度、privacy boundary 和任务组合。 |
| 默认 TTL 是全局设置还是按 capability family 设置？ | 不同 provider、surface 和 operation 的变化速度不同。 |
| 是否接受任何 learned router？ | 需要足够流量、objective outcomes 和 exploration risk budget。 |
| Quality、cost、latency、learning value 和 administrative burden 的权重是什么？ | 属于产品价值选择，不能由 benchmark 自动决定。 |
| 什么证据足以称为 independent review？ | 需要决定 backend attestation、shared-evidence 和 evaluator isolation 的最低标准。 |
| 哪些 provider/account/region 可处理哪些 data classes？ | 依赖用户合同、账户设置和 privacy decision。 |
| 是否允许自动 provider substitution？ | Read-only 与 write/communication operations 的风险不同。 |
| 哪些 fallback guarantee losses 必须逐次提示？ | 涉及用户体验与风险偏好。 |
| Matrix 的月度行政预算是多少？ | 决定 track permanently 与 resolve JIT 的分界。 |
| 何时允许 pilot 或 operational activation？ | 当前 baseline 明确要求单独 Owner decision，本报告没有该 authority。fileciteturn2file0L2-L2 |

