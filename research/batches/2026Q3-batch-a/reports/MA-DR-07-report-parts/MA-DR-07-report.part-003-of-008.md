| SMSR | write-time signatures 可阻止 unsigned memory injection；authenticated attacker 仍需 retrieval-time robustness | 15 enterprise scenarios、3,150 trials；query-only attack 65.3%→5.3% | HMAC key management、writer compromise、semantic poison 均是残余风险；2026 preprint | `FORMAL_OR_MACHINE_CHECKED_CLAIM`，成熟度低 citeturn5academia45 |
| LLM-as-a-Judge injection | evaluator 可被被评对象中的 adversarial suffix 操纵 | MT-Bench Human Judgments；小型 open models；CUA ASR 超过 30% | 只覆盖有限 judge models 和文本比较；不能直接量化 Meta-Agent judge risk | `VERIFIED_PRIMARY_EVIDENCE`，preprint citeturn8academia0 |

这些结果共同支持三个判断。第一，**把不可信文本放进高优先级 prompt 与用 delimiter 包围它并不足够**。第二，memory 的风险不仅是错误事实，也包括可被模仿的 procedure、tool-selection precedent 和伪造的 authority。第三，任何“攻击成功率”都必须与攻击者权限、写入渠道、retrieval policy、模型版本、工具环境和评价定义绑定，不能直接作为 Meta-Agent 的发生概率。citeturn2academia12turn5academia44turn3academia46turn6academia26

**Current defenses and control effectiveness**

| 控制 | 保护边界与主要攻击 | 不防什么 | Utility / burden | 当前 file-based v0.1 适配度 |
|---|---|---|---|---|
| strict instruction/data separation | 阻断文档、tool output、research text 直接改变 control flow | context-dependent task 中，合法数据本来就需要决定 action；也不防 poisoned facts | 低至中；过严会拒绝合法 evidence | **立即采用为 artifact-role rule，但不能作为唯一防线**；CaMeL 与 ARGUS 表明需进一步验证 action support。citeturn7academia36turn4academia12 |
| provenance and taint/influence tracking | 标记每个 claim、decision、action 受哪些 source 影响；防 origin laundering、injection-to-action | provenance label 自身被篡改、LLM 错误分段、被信任 writer 作恶 | 中至高；需要 span/object lineage | **v0.1 可先做 coarse object-level provenance**；runtime graph 留待未来 |
| origin-bound authority | authority 在写入时绑定 origin，summary 不改变 origin | compromised authority issuer、stolen keys、错误的初始 classification | 中；需要明确 authority algebra | **优先 candidate requirement**；TMA-NM 给出强理论动机，但成熟度不足以直接宣称已解决。citeturn3academia49 |
| signed/tamper-evident records | 防止 Owner decision、promotion、handoff、evaluation 被静默改写 | 签名者本身恶意；签名不证明内容正确 | key management 与 recovery 负担 | pilot manifest 和 promotion record 适合；所有 scratch file 不必签名 |
| memory quarantine and staged promotion | 防 MINJA、MemoryGraft、feedback spam 直接进入 reusable method | quarantine reviewer 被欺骗；poison 仍可影响当前 session | 中；会增加 review latency | **非常适合 v0.1**，因为当前是 file-based，可用目录/状态隔离实现 |
| least privilege and capability tokens | 防 excessive tools、confused deputy、data exfiltration | 合法 capability 内的语义误用、tool output injection | 中；policy authoring 成本 | design output 必须表达；runtime enforcement 属未来 feature |
| typed tool contracts | 把 read/write、side effect、sensitive arguments、idempotency 显式化 | malicious implementation、false metadata、semantic ambiguity | 初期成本高，长期降低 review | Design IR 必须包含；MCP 接入前为硬门槛 |
| read/write separation | 阻止“看似读取”的接口隐藏 write；限制 review Agent 执行 | read result 仍可注入；同一 backend 可绕过 logical label | 低至中 | **立即要求** |
| dual approval / human confirmation | 高影响 publish/pay/delete/permission/methodology promotion | approval fatigue、欺骗性 presentation、human rubber-stamping | 高；不可对所有 action 使用 | 仅 Tier-3/4 action，风险分层 |
| sandbox and dry-run | 降低 malicious tool、dependency、generated command 的 side effect | sandbox escape、外部 API side effects、secret leakage in logs | 中；可能改变真实行为 | public/synthetic pilot 必须使用 |
| independent verifier | 检测 missing controls、false-success、artifact mismatch | 若 verifier 读取同一 injected content 或同模型 prompt，可能同样受骗 | 中至高 | verifier 必须拥有不同 context、只读权限和 deterministic checks；LLM judge 仅作辅助。citeturn8academia0 |
| source diversity and corroboration | 降低单一 source 错误或攻击 | Sybil sources、共同复制同一错误、manufactured corroboration | 中；增加 research cost | 对 capability facts、method promotion 必须，但要求 independent origin |
| immutable audit trail | 支持 incident reconstruction、repudiation control | 不防错误被忠实记录；public Git 无法保证删除 | 中 | Git history + protected promotion records 可作为初级机制 |
| secure rollback and anti-resurrection | 清除 active poison 并防旧 summary/index 重建它 | 外部副本、fork、未发现 derived artifact | 高；需要依赖图与 tombstone | v0.1 已有 rollback lineage，尚缺 dependency purge 和 resurrection tests |
| capability freshness and version pinning | 防 stale provider/tool claims 与 runtime drift | provider 未公开变更、semantic behavior drift | 低至中 | capability facts 必须带 `observed_at`、source、surface、expiry |
| adversarial testing | 在真实 trust boundary 上测攻击和 utility | benchmark overfitting、未知攻击 | 中至高 | bounded pilot 前必须完成 synthetic suite |
| rate/budget/loop limits | 防 denial of wallet、agent amplification、context flooding | 低速长期消耗、合法复杂任务被截断 | 低至中 | **立即可实施** |
| risk-tiered fail-closed / fail-open | 在高影响边界阻断，在低风险 research 中保留 utility | 错误 risk classification | 中 | 必须按 action tier，而不是全局 fail-closed |

MCP 官方安全指导明确讨论 confused deputy、per-client consent、token handling 和 trust boundaries；MCP client 文档也指出 tool descriptions 会与用户请求一起进入模型决策，因此 tool metadata 不能被视为普通静态配置。citeturn6search6turn6search11turn6search13

**Security–utility and governance tradeoffs**

安全控制不能退化成“任何内容均需人工逐字审批”。研究已显示，强防御往往伴随 task-success、token、latency 或 refusal 成本：CaMeL 的 v2 结果是在 AgentDojo 上从 undefended 84% task success 降至 77%，同时增加约 2.8 倍 token；ARGUS 报告保留 87.5% clean utility；SMSR 的组合控制报告约 85% clean-query utility。这些数字不能直接转移到 Meta-Agent，但证明 benchmark 必须同时报告 `security` 与 `utility`，不能只优化 ASR。citeturn7search0turn7search3turn4search0turn5academia45

建议采用四级 action risk：

| Risk tier | 示例 | 默认策略 |
|---|---|---|
| Tier A：read-only、reversible、public | 搜索公开论文、生成非执行草案 | fail-open with provenance；自动进行，保留来源 |
| Tier B：design-changing、无外部 side effect | 修改 candidate design、生成 Design IR | 自动生成，独立 verifier；不可自动变 target truth |
| Tier C：authority/methodology/write scope | methodology promotion、permission expansion、repository write | fail-closed；task-local authorization + human approval |
| Tier D：private/irreversible/external side effect | private material、credential use、publish/pay/delete、autonomous remediation | 默认禁止；需专项 threat model、sandbox、dual approval 与 rollback |

应避免的 over-defense 包括：因文档含 imperative language 就全部拒绝；因 source 非官方就视为无效；对每个 read-only action 要求确认；为所有 scratch notes 建立高成本签名；让 provenance metadata 超过内容本身；禁止合法 adaptive behavior。更合理的目标是让**不可信内容可被读取和分析，但不能无证据地获得 authority、write scope 或 promotion rights**。

## 当前 v0.1 覆盖与风险登记

**Current v0.1 control-coverage matrix**

| 控制领域 | 状态 | 当前证据 | 评价 |
|---|---|---|---|
| sole target truth | `already_addressed_by_current_design` | `approved-spec.md` 声明唯一 designated path，且当前 inactive | 强治理基础；未验证 runtime 是否会忽略其他文件。fileciteturn1file0L2-L2 |
| evidence/method/current/handoff separation | `already_addressed_by_current_design` | source-and-owner map 与 methodology 明确 artifact roles | 对防 semantic authority confusion 很重要；仍是文档约束。fileciteturn3file0L2-L2 fileciteturn4file0L2-L2 |
| task-local write authorization | `already_addressed_by_current_design` | exact path/action/user authorization/expiry fields | 方向正确；需机械 enforcement 和 negative tests |
| no automatic methodology promotion | `already_addressed_by_current_design` | requirement 和 method pipeline 均要求 evidence、review、Owner decision | 仍缺 evidence threshold、Sybil resistance 和 quarantine tests |
| no private Git material | `already_addressed_by_current_design` | public/synthetic/redacted/pointer-only boundary | public pilot 合适；不等于未来 private-store design |
| stable ID/version/migration/rollback | `already_addressed_by_current_design` | MA-MIG、change classes、rollback record | 已有 lineage；缺 derived-artifact purge 与 anti-resurrection drill。fileciteturn5file0L2-L2 |
