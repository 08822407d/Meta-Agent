**Content addressing 提供完整性，不自动提供 confidentiality、authorization 或 erasure。** CID 可让接收方验证所取内容是否匹配地址，但公开 CID 本身可能成为 locator；private plaintext 的稳定 digest 还可能支持内容确认或 dictionary guessing。IPFS 官方同时指出，被 pin 的对象不会被本地 garbage collection 清除，而第三方 pinning service 的持续运营也不能由协议保证。citeturn13search3turn13search5turn13search11

**Failure modes and negative evidence**

| 失败模式 | 为什么常被低估 | 必要缓解 |
|---|---|---|
| encryption key 与 ciphertext 同机同权限 | 攻击者取得运行账户后可同时获得两者 | KEK 与 data plane 分离；hardware-backed 或独立 secret store；短期解密权限 |
| full-disk encryption 被当作 application isolation | 设备解锁后所有授权进程可能读取文件 | per-file/project encryption、OS sandbox、separate account、connector deny |
| bearer token 长寿命且可复制 | 任何持有者都能重放 | short-lived tokens、audience binding、sender-constrained token；RFC 9449 的 DPoP 用 proof-of-possession 降低单独 token 泄露后的重放，但不能解决同一执行上下文中的 XSS 或恶意代码。citeturn11search0turn11search1 |
| secret manager 被当作任意文档库 | credential lifecycle 与 document lifecycle 不同 | secret manager 只存 secrets、keys、small config；原件进入适合的 object/file store |
| private Git 误提交后只做新 commit 删除 | 历史、fork、clone 和 caches 继续存在 | rotate credentials、history rewrite、support cleanup、collaborator clone cleanup、incident record |
| versioned cloud store 只做 simple delete | delete marker 隐藏但不移除旧版本 | version-aware deletion、noncurrent lifecycle、hold check、inventory verification |
| audit log 记录 prompt、token、locator 或 payload | 审计系统变成第二个敏感数据湖 | event metadata minimization、field allowlist、payload hashing/private correlation、独立 retention |
| recovery key 只有一份 | 设备或 Owner 故障导致永久数据丢失 | 离线 recovery、定期恢复演练、清晰 custodian；但避免无限复制 |
| recovery key 太多 | confidentiality 边界被备份副本稀释 | 最少份数、分离保管、tamper evidence、访问记录 |
| compromised writer 更新索引 | 加密不阻止合法 writer 投毒 | signed manifest、write/read separation、two-step promotion、provenance、rollback |
| “redacted PDF”只覆盖视觉文本 | text layer、comments、metadata、attachments 仍可提取 | destructive redaction、metadata stripping、independent extraction test |
| revocation 被理解为删除 | 已下载、已提示给模型、已生成 summary 的副本不回收 | downstream copy registry、cache purge、derived deletion、incident notice |
| backup 与 production 使用同一 credential | account compromise 同时破坏原件和恢复点 | separate identity、offline or logically isolated backup、restore tests；CISA 建议关键数据使用 offline encrypted backups 并定期测试完整性和可恢复性。citeturn10search13 |
| prompt-level “do not leak”被当作 DLP | LLM 可能遵循恶意外部指令或错误输出 | policy enforcement、tool gateway、egress filter、human approval；不让模型成为 sole security control |
| private summary 自动进入 general methodology | source role 被洗白，造成跨项目泄露 | allowed-influence metadata、promotion quarantine、Owner review、anti-resurrection tombstone |

## Meta-Agent 特定映射与控制模型

**Meta-Agent-specific mapping**

当前 Meta-Agent baseline 已经提供了适合私有数据治理的若干上位不变量：单一 target truth source、Owner 最终权威、source/memory role separation、public/synthetic/redacted/safe-pointer default、platform permission 不等于 task authorization，以及 target case 不得自动成为 general methodology。fileciteturn2file0L1-L6 fileciteturn4file0L1-L6

本研究据此推导出下列 candidate mapping：

```text
public repository
  = public control/evidence surface only
  ≠ private material store
  ≠ credential store
  ≠ runtime authorization database

private original store
  = content payload and private metadata
  ≠ target truth by location alone

private registry
  = locator, classification, owner, purpose, grant, retention, key reference
  ≠ secret-value store

secret manager
  = credential and key material
  ≠ general project memory

retrieval index
  = rebuildable derived view
  ≠ authority source
  ≠ automatic cross-project memory
```

这一映射属于 `TARGET_SPECIFIC_INFERENCE`。它不改变现有 `MA-REQ`、`MA-METHOD`、schema 或 target truth，也不签发新 stable IDs。

**Identity, authentication, and least-privilege model**

NIST SP 800-63-4 将 identity proofing、authentication、authenticator management 和 federation 分开处理，并于 2025 年取代 SP 800-63-3；本报告采用这种分离思路，而不要求 Meta-Agent 达到特定政府 assurance level。citeturn9search0turn9search1

候选 access-control model 应包括：

| 控制域 | Mandatory candidate control |
|---|---|
| **Human identity** | Owner 和协作者使用独立身份；高敏操作要求 phishing-resistant MFA 或等效强认证；禁止共享账户 |
| **Service/workload identity** | 每个 Agent、connector、indexer、backup job 具有独立身份，不继承 Owner 的通用 token；优先短期、自动轮换的 workload credential |
| **Authentication ≠ authorization** | 成功登录仅证明主体身份；每次访问仍按 project、purpose、material class、operation、environment、expiry 进行授权 |
| **Read/write separation** | Retriever 默认 read-only；Indexer 可写 derived index 但不能修改 original；Redactor 不能授予访问；Auditor 不读 payload |
| **Capability ceiling** | Agent 可使用的 tool 和 data scope 不得大于任务所需；下游 Agent 不得自行扩展或转授权限 |
| **Purpose-bound grant** | grant 至少包含 source project、recipient identity、material subset、allowed operations、purpose、expiry、approval ref、derivative/export rule |
| **Just-in-time access** | 默认无持久 access；任务启动时换取短期 credential，结束或超时后撤销 |
| **Approval scope** | read、write、share、export、decrypt、delete、hold、restore、cross-Agent 使用分别批准，不使用一个笼统 “admin” 同意 |
| **Revocation** | 撤销 identity、token、group、grant、cached session 和 connector authorization；记录无法回收的已导出副本 |
| **Break-glass** | 仅用于恢复或 incident；短期、强认证、独立告警、事后 review；不得成为日常通道 |
| **Audit** | 记录谁、何时、基于何 grant、对何 opaque object、做何操作、结果和 policy decision；默认不记录 secret/payload |

NIST SP 800-162 对 ABAC 的定义是依据 subject、object、operation 和环境属性评估 policy；这比只靠静态 role 更适合表达 Meta-Agent 的 project、purpose、classification 和 expiry 条件。citeturn9search12turn9search18 实现上可用 RBAC 管理稳定职责，再用 ABAC 或 capability tokens 缩小具体任务范围。

NIST zero-trust guidance 明确反对仅因网络位置、归属或设备位置而赋予 implicit trust，并把用户、服务和应用身份视为访问决策的核心。citeturn19search0turn19search5 因此“在本机”“在 private subnet”或“来自受信 Agent”都不能代替逐请求授权。

SPIFFE/SPIRE 提供了一个可移植 workload-identity 参考模式：workload 通过本地 API 获得短期、自动轮换的 X.509-SVID，而不需要把长期 bootstrap secret 与应用一起部署。citeturn17search0turn17search3 这属于可借鉴模式，不表示 Meta-Agent 必须采用 SPIFFE。

**Credential-reference rule**

设计记录中允许出现：

```yaml
credential_required: true
credential_class: oauth_access | workload_identity | database_dynamic | encryption_key
credential_binding_ref: opaque_private_registry_reference
scope_required:
expires_with_task: true
```

设计记录中禁止出现：

```text
password
token value
API key
private key
recovery code
connection string containing secret
secret-manager retrieval token
signed URL with live authority
```

即使 system prompt 不公开，也不得将其视为 secret store。OWASP 明确指出 system prompt 不应被视为秘密或 security control，credentials、connection strings 和 passwords 不应放入其中。citeturn12search8

**Encryption and key-management control model**

候选 key hierarchy：

```text
plaintext object
  → encrypted with object/project Data Encryption Key (DEK)
  → DEK wrapped with Key Encryption Key (KEK)
  → KEK protected by OS secure hardware, KMS/HSM, or offline recovery boundary
```

Envelope encryption 将大批 data encryption keys 与较少的 centrally governed key encryption keys 分开；DEK 可靠近 ciphertext 保存，但必须处于 wrapped 状态，plaintext DEK 不得持久化。Google Cloud 的官方 envelope-encryption 文档也建议本地生成 DEK、按写入或用户划分、使用 KEK 包装，并明确警告不要保存 plaintext DEK。citeturn16search1 这被用作技术模式证据，不是永久 provider 选择。

| 密钥控制 | Candidate requirement |
|---|---|
| Encryption in transit | 所有远程 storage、KMS、identity 和 connector traffic 使用经过验证的 secure transport |
| Encryption at rest | filesystem、database、object store、backup、index 和 audit store 均覆盖；不能只依赖 provider default |
| Client-side encryption | confidential、customer、regulated 或 provider operator 不应看到 plaintext 时优先考虑 |
| AEAD/integrity | 使用 authenticated encryption 或等效完整性保护，检测 ciphertext tampering |
| Granularity | 避免所有项目共用一个 DEK；按 object、project、tenant 或 retention boundary 划分 |
| KEK isolation | KEK 与 ciphertext 的访问 identity、policy 和 audit 分离 |
| Hardware-backed key | 高风险 profile 可要求 non-exportable key 或 HSM-backed KEK；不是低风险原型必需 |
| Rotation | KEK 定期或在 incident 后轮换；DEK 可按新写入产生，旧数据通过 rewrap 或 migration 管理 |
| Recovery | 明确“可恢复”还是“不可恢复”；恢复材料离线、最少复制并定期演练 |
| Key loss | 没有 recovery 的 KEK 丢失意味着数据可能永久不可读；必须在批准时接受该残余风险 |
| Compromise | 密钥泄露后要 rotate、rewrap/re-encrypt、撤销 access、检查 historical copies；删除 key 不自动删除已导出的 plaintext |
| Crypto-shredding | 只有在所有可用 DEK/KEK copies、cache 和 recovery copies 都被可靠销毁时，才可作为删除机制的一部分 |

NIST SP 800-57 Part 1 Rev. 5 涵盖 key lifecycle、backup、recovery、compromise、protection 和 key inventory；截至本研究日期，Rev. 6 仍是 initial public draft，因此本报告以 Rev. 5 作为 final baseline，并只把 Rev. 6 当作未来变化观察项。citeturn17search1turn16search17

Hardware-backed key 也不等于绝对控制。如果应用已经获得 decrypt capability，恶意或被攻陷的 writer/reader 仍可请求解密。Key policy 必须与 workload identity、purpose、request context 和 egress policy 联合使用。

**Lifecycle, retention, deletion, and backup model**

| 生命周期阶段 | 必须记录 | 控制与退出条件 |
|---|---|---|
| **Collection** | owner、source、purpose、consent/legal/contract basis、classification | 只收集完成目的所需的最少数据；无法说明目的则不收集 |
