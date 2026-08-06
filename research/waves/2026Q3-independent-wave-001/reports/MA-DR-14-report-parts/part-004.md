| **Ingestion** | checksum/private integrity ref、malware state、prompt-injection state、origin、allowed influence | 先进入 quarantine；禁止直接进入 retrieval corpus 或 shared memory |
| **Active use** | grants、operations、processor、connector、derived artifacts | 最小权限、短期 credential、audit、egress restriction |
| **Derivation** | parent refs、transformation、model/tool/version、classification result | summary/index 默认继承；只有 review 后才可降级或公开 |
| **Archive** | reason、retention end、access reduction、format、key state | 默认不可继续被 Agent 检索；只为明确历史、合同或恢复目的 |
| **Legal/contractual hold** | authority、scope、start/end、affected copies | 暂停普通 deletion，但不得扩大使用目的；hold 解除后重新评估 |
| **Deletion request** | requester、authority、scope、exceptions、downstream copies | logical delete、version delete、cache/index purge、backup policy、key action 分步执行 |
| **Verification** | systems checked、versions、exceptions、unreachable copies、date | 生成 deletion evidence，不声称不可证明的完全擦除 |
| **Migration/export** | source/destination、format、mapping、key transfer、rollback | 不产生双重 truth；旧系统退出和删除单独验证 |

删除术语必须精确区分：

- **Logical deletion**：应用不再返回对象，但底层版本可能仍存在；
- **Version deletion**：删除指定版本，但 backups、replicas、logs 或外部 copies 仍可能存在；
- **Cryptographic erasure**：销毁使 ciphertext 可解密的 keying material；
- **Media sanitization**：使目标数据在给定努力水平下不可行地恢复；
- **Retention expiry**：到期后启动 deletion workflow，不等于瞬间擦除；
- **Revocation**：阻止未来授权访问，不回收已下载或已生成的副本。

NIST SP 800-88 Rev. 2 将 sanitization 定义为使目标数据在给定 effort level 下不可访问，并强调建立企业级 sanitization program、验证方法和 vendor trust，而不是只执行某个 delete command。citeturn14search0turn14search4 因而 Meta-Agent 的 deletion receipt 应写明“已在哪些已知位置执行何种操作、有哪些无法控制的 copies”，而不是写“完全删除”。

备份必须同时满足 recovery 与 deletion governance：

```text
production delete
  → active replica/version handling
  → search/index/cache purge
  → backup catalog update
  → backup expiry or selective deletion rule
  → restore-time suppression/tombstone
  → verification
```

如果备份介质不能逐对象删除，可采用有限 retention + restore-time tombstone：恢复后先应用 deletion ledger，再允许系统服务数据。否则旧备份可能使被删除材料“resurrect”。这与现有 Meta-Agent candidate 中的 anti-resurrection concern 一致，但本报告不将其自动提升为 target control。fileciteturn10file0L1-L6

**Private/public pointer and redaction policy**

公共 pointer 不应是 private locator 的公开副本。建议采用双层 registry：

```text
public record
  ├─ opaque material reference
  ├─ reviewed non-sensitive summary, or no summary
  ├─ role: external_private_material_pointer
  ├─ public status: available / unavailable / superseded
  └─ non-sensitive approval or provenance reference

private registry
  ├─ actual storage locator
  ├─ exact classification overlays
  ├─ owner, subjects, customer, project
  ├─ purpose and allowed influence
  ├─ encryption/key reference
  ├─ current grants and expiry
  ├─ retention/hold/deletion state
  ├─ private integrity digest or keyed digest
  └─ derivative and backup inventory
```

**公共层允许：**

- 无语义或高熵 opaque identifier；
- 不泄露客户、人员、项目代号或 filesystem layout 的 coarse status；
- 已人工审查的 non-sensitive summary；
- 指向公开 redacted artifact 的普通 URL；
- “private original exists outside Git”这一事实，前提是其存在本身不敏感。

**公共层禁止：**

- private object path、bucket、workspace、tenant、account、email、customer name；
- live signed URL、OAuth token、secret-manager path 或 credential reference；
- 能让未授权者直接检索 plaintext 的 CID；
- 对低熵敏感内容的公开 unsalted hash；
- 原件 filename、meeting title、speaker identity、case number；
- 精细分类标签，如果标签本身会暴露 health、legal、customer 或 incident context；
- redaction map 中被删除内容的位置和原文。

Redaction 必须生成新的、经验证的 public artifact，而不是覆盖原文件视图。候选 procedure 包括：移除 text layer、comments、tracked changes、attachments、EXIF、document properties、hidden sheets/slides、speaker notes 和 filenames；重新导出；使用独立 extractor 检查；由未参与原始 redaction 的 reviewer 验证。Redaction manifest 记录 source private ref、transformation、tool/version、fields removed、reviewer 和日期，但 manifest 本身若可揭示被删内容，应保留在 private registry。

Derived summary 的降级必须回答三个问题：是否仍可识别人、客户或项目；是否保留了 confidential事实；是否可与公共信息组合重构原件。任何一个答案不确定时，summary 继续继承原分类。

## 候选决策框架、检索安全与运行画像

**Safe retrieval and connector safety model**

Indirect prompt injection 的根本问题是模型难以可靠地区分“外部数据”和“应执行的指令”。BIPIA 在其 benchmark 中发现所测试模型普遍存在这种脆弱性，并把 data/instruction confusion 识别为主要原因；其 black-box defenses 能降低风险，但不能证明所有模型、任务和 adaptive attacks 下的普遍安全。citeturn18search0turn18academia48

更早的 real-world indirect prompt-injection 研究展示了攻击者可把恶意指令嵌入未来会被检索的数据，从而影响 API 调用、窃取数据或污染信息生态。citeturn18academia50 AgentDojo 则提供了 97 个任务和 629 个安全测试案例的动态环境，并发现现有 Agent、attack 和 defense 均存在明显不完整性；防御评估必须同时测 benign utility 和 security，而不能只看 attack-block rate。citeturn18academia51

因此，检索安全应被设计成多层 pipeline：

| 阶段 | Mandatory safety behavior |
|---|---|
| **Source admission** | 记录 origin、owner、signature/checksum、retrieval date、licence、classification、trust level；未知来源默认 untrusted |
| **Quarantine** | 新材料不直接进入 active corpus；进行 malware、format、embedded object、prompt-injection indicator 和 secret scan |
| **Content normalization** | 解析 text 与 metadata 分离；保留原件 immutable evidence；normalized view 标记 derived |
| **Taint label** | 至少区分 trusted authority、reviewed evidence、untrusted external content、customer content、candidate、model output |
| **Allowed influence** | 明确材料可影响哪些字段；例如 research evidence 可影响 candidate analysis，但不能改变 Owner、target truth、credentials 或 tool permission |
| **Retrieval policy** | 先按 identity、project、purpose、classification 和 grant 过滤，再做 semantic/vector retrieval；不能先全局搜索再由模型自行忽略 |
| **Context minimization** | 只向模型暴露回答所需的最小 excerpt；高敏字段先 deterministic redaction |
| **Instruction boundary** | 使用结构化 message/channel 或 explicit data boundaries，但仅作为 defense-in-depth，不视为授权机制 |
| **Tool isolation** | 读取 untrusted content 的 Agent 默认无 write、send、delete、share、network egress 或 credential-access capability |
| **Decision gate** | 由 deterministic policy decision point 检查 tool、resource、scope、recipient 和 side effect；模型不能自行放宽 |
| **Output DLP** | 检查 secrets、PII、customer identifiers、large excerpts、unexpected URLs 和 cross-project terms；高风险输出 human review |
| **Logging privacy** | 记录 policy decision 和 opaque refs，不默认保存完整 prompt、retrieved payload、token 或 model hidden context |
| **Post-run cleanup** | 清理 temporary plaintext、ephemeral cache、local downloads、tool outputs；记录无法清理的 provider-side copies |
| **Feedback quarantine** | Agent 输出、user feedback 和 project lessons 先成为 candidate evidence，不能自动进入 general methodology |

OWASP 将 indirect prompt injection、sensitive information disclosure 和 excessive agency 分别列为主要风险，并指出减少 tool functionality、permissions 和 autonomy 是降低 blast radius 的核心做法。citeturn12search0turn12search5turn12search13

**Connector authorization**

对任何 OAuth/MCP/third-party connector，应遵守：

- client、server、resource owner 和 downstream resource 的身份分离；
- exact audience/resource binding；
- PKCE、exact redirect validation 和 short-lived access tokens；
- 不做 token passthrough；
- read-only scope 与 write scope 分开；
- refresh token rotation 或相应 sender constraint；
- connector token 不写入 prompt、metadata、audit payload 或 repository；
- tool description、annotation 和 server-provided content 均视为 untrusted input；
- sensitive credential 通过可信外部 UI 或 authorization flow 提交，不通过 Agent chat/form。

OAuth 2.0 Security Best Current Practice RFC 9700 要求更严格的 redirect URI matching、限制 token privilege、避免不安全的 flows 并降低 replay 风险。citeturn1search3turn1search4 MCP 2025-11-25 authorization specification 要求 resource parameter、audience validation、PKCE、secure token storage 和短期 access token，并明确禁止 token passthrough。citeturn12search2 MCP 总体规范同时说明 tool descriptions 应视为不可信，data exposure 与 tool invocation 要有明确 user consent，而且协议本身不能替实现者强制所有安全原则。citeturn12search4

**Cross-Agent and cross-project boundaries**

默认模型应是：

```text
one project
  → one private namespace
  → one retrieval corpus
  → one policy boundary
  → one key/grant scope
  → no implicit transitive sharing
```

显式 sharing grant 至少包含：

```yaml
source_project:
recipient_agent_or_project:
material_subset:
purpose:
allowed_operations:
allowed_output_class:
derivative_storage_allowed:
regrant_allowed: false
expires_at:
owner_approval_ref:
revocation_and_cleanup_rule:
```

关键约束：

1. **Default isolation**：没有 grant 即不可发现，避免通过搜索结果数量、error、embedding similarity 或 autocomplete 泄露材料存在。
2. **No transitive delegation**：recipient Agent 不能把权限自动转给 sub-Agent、tool 或 connector。
3. **Separate memory namespaces**：project memory、general methodology、case evidence 和 user profile 不共用一个索引或 collection。
4. **Sanitized summary is still governed**：summary 只有通过 review 才能跨界；它的 provenance 和 parent classification 必须保留。
5. **Revocation stops future access, not historical knowledge**：撤销后清理 caches、derived artifacts 和 persistent memory；已向人或外部服务披露的内容只能记录为 residual copy。
6. **No methodology contamination**：private target detail 不得被抽象成 general rule，除非先去识别、竞争解释、cross-project evidence review 和 Owner promotion。
7. **Cross-Agent logs are data flows**：handoff、trace、evaluation 和 error messages 也受相同分类约束。

