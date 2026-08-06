这直接保持现有 Meta-Agent 的 no automatic cross-project sharing、no automatic methodology promotion 和 source-role separation。fileciteturn2file0L1-L6 fileciteturn5file0L1-L6

**Candidate decision framework**

存储和访问选项应先通过 feasibility gates，再进行加权比较。下列条件为 hard gates，不允许用便利性、成本或 benchmark score 抵消：

```text
known owner and authority
known purpose and allowed use
classification and legal/contract review
private original outside public Git
credential isolation
identity and least privilege
encryption and recoverability decision
retention/deletion/backup model
retrieval and connector safety
cross-project isolation
incident response
synthetic validation evidence
separate Owner approval
```

通过 gates 后，才比较：

| 决策维度 | 需要回答的问题 |
|---|---|
| Portability | 能否导出 originals、metadata、grants、audit 和 keys，而不依赖 proprietary runtime？ |
| Availability | 单设备、provider outage、identity outage、KMS outage 时如何恢复？ |
| Searchability | 搜索是否产生 plaintext index？索引是否可重建、可删除、可隔离？ |
| Auditability | 能否证明 access decision、write lineage、revocation 和 deletion？ |
| Deletion semantics | simple delete、version delete、backup expiry、crypto erase 分别意味着什么？ |
| Administrative burden | 谁负责 policy、rotation、restore、incident、contract 和 stale grants？ |
| Collaboration | 需要几人、哪些设备、是否允许 offline copy？ |
| Lock-in | 数据格式、identity、KMS、audit、API 和 connector 是否可替换？ |
| Residual risk | provider、endpoint、insider、writer poisoning、model leakage 哪些仍存在？ |
| Human learning/control | 便利性是否让 Owner 失去对 material scope 和 authority 的可见性？ |

**Risk-tiered private-material operating profiles**

| Profile | Prerequisites | Allowed scope | Residual risks | Prohibited actions | Incident response 与批准证据 |
|---|---|---|---|---|---|
| **No-private-data** | 当前 public/synthetic/redacted policy；basic provenance | public sources、synthetic corpus、reviewed redactions、safe pointers | 公开来源的 injection、licence 和 misinformation | real private originals、credentials、customer data、raw voice/chat | 清除错误公开材料；记录来源；当前即可继续作为研究/设计 profile，但不代表 operational activation |
| **Local-private** | Owner device hardening、full-disk + application/project encryption、separate credential store、offline encrypted backup、recovery test、no remote connector | 单 Owner 的 private/internal 材料；synthetic prototype 后才可候选真实使用 | device compromise、unlocked session、key loss、local malware、manual backup drift | cross-Agent sharing、cloud sync 未批准、public pointer 含 locator、raw credentials in files | isolate device、revoke accounts、rotate credentials、inspect backups、rebuild clean index；批准前需 access/recovery/delete tests |
| **Bounded-cloud-private** | SSO/MFA、short-lived workload identity、ABAC/capability policy、client-side or approved envelope encryption、version-aware deletion、audit/DLP/egress、subprocessor and region review、export test | 明确项目和用户集合的 private/confidential data | provider/control-plane compromise、IAM misconfiguration、audit leakage、version/backup persistence、lock-in | public bucket/link、shared admin token、global search index、default connector access、unreviewed AI indexing | disable grants/connectors、revoke tokens/keys、preserve minimal evidence、inventory versions/exports、notification assessment；需 synthetic red-team and restore evidence |
| **Higher-risk** | 适用法律/合同分析、data-subject/customer terms、dedicated isolation、hardware-backed keys where justified、dual approval、formal retention/hold、incident notification plan、vendor assurance、full adversarial suite | regulated、customer confidential、raw voice/chat、high-impact source code、multi-party access | legal uncertainty、insider access、provider compulsion、irreversible disclosure、model/connector leakage | **默认全部真实材料操作被禁止，直到独立 Owner privacy/operational decision**；禁止 general-methodology promotion | formal incident command、legal/customer notification assessment、forensic containment、key rotation、downstream deletion; 需要独立批准和明确 residual-risk acceptance |

截至本报告，只有 no-private-data profile 与当前 target boundary 完全兼容。其他 profiles 均为 candidate，不是已授权状态。

## 实施依赖、合成实验、成本与未决事项

**Implementation or experiment dependencies**

任何候选实现都依赖下列先决选择：

- project namespace 与 material classification schema；
- private registry 的 authority、schema ownership 和 backup strategy；
- local-only、cloud-only 或 hybrid profile；
- user/service/workload identity source；
- secret manager 与 KMS 是否分离；
- encryption granularity 与 recovery policy；
- retention classes、legal/contract hold workflow 和 backup expiry；
- audit event schema 与 payload minimization；
- connector allowlist、network egress 和 DLP policy；
- synthetic benchmark corpus、attack suite 和 acceptance thresholds；
- migration/export format；
- Owner 对 administrative burden 与 residual risk 的容忍度。

这些依赖应在 prototype manifest 中被冻结，避免把实验结果与不断变化的 policy 混合。

**Synthetic-data-only prototype and validation plan**

原型不得摄入任何真实 private、customer、personal、voice/chat、source-code 或 credential material。测试 corpus 可包含：

| Synthetic artifact | 测试目的 |
|---|---|
| fake customer contracts 与 fabricated identities | classification、redaction、tenant separation |
| synthetic source repository | Git history、secret scanning、branch/read-write boundaries |
| fake voice transcript 与 generated audio | raw/derived separation、speaker metadata deletion |
| canary API keys 和 nonfunctional tokens | DLP、logging、connector leakage、rotation workflow |
| fake regulated records | retention、access/export/delete request workflow |
| malicious HTML/PDF/Markdown documents | indirect prompt injection、hidden content、external image egress |
| poisoned retrieval passages | provenance、corpus admission、ranking and injection defense |
| conflicting summaries | allowed-influence、writer compromise、anti-resurrection |
| duplicate versions and backups | version deletion、restore-time tombstones |
| intentionally corrupted ciphertext/index | integrity、recovery、rebuild and key-loss behavior |

建议原型比较三个 architecture bundles：

```text
Bundle Local
  encrypted local filesystem
  + local private registry/database
  + separate local credential store
  + offline encrypted backup

Bundle Cloud
  private object store
  + client-side envelope encryption
  + external IAM/policy
  + managed metadata database
  + isolated audit store

Bundle Hybrid
  local high-risk originals
  + bounded-cloud encrypted lower-risk objects/backups
  + public opaque pointers
  + private locator registry
```

每个 bundle 使用同一组 synthetic objects、grants 和 test cases，以避免因测试数据差异产生虚假优势。

**Validation matrix**

| 验证域 | Synthetic test | Candidate acceptance evidence |
|---|---|---|
| Authentication | stolen/expired session、wrong identity、MFA downgrade | 未授权身份无法取得有效 access capability |
| Authorization | read-only Agent 尝试 write/share/delete；wrong project/purpose | critical unauthorized operation 为零；deny decision 可审计 |
| Credential isolation | canary secret 出现在 prompt、log、metadata、export | 所有扫描位置均无 secret value；只有 opaque ref |
| Revocation | 撤销 user、workload、connector、grant 后重复访问 | 在声明的 TTL/cache window 后全部拒绝；残留 session 被记录 |
| Read/write separation | compromised writer 尝试更改 original 和 authority | writer 只能修改批准对象；policy/truth mutation 被阻止 |
| Key rotation | rotate KEK、rewrap DEKs、恢复旧对象 | 数据完整、旧 key 无新访问能力、过程可回滚 |
| Key loss | 模拟 KEK 和 recovery copy 丢失 | 明确证明可恢复或按设计不可恢复，不能出现未知状态 |
| Backup restore | 从离线/旧版本恢复 | 恢复成功且先应用 revocation/deletion tombstones |
| Version deletion | 删除 current/noncurrent、hold、replica、index | inventory 显示所有应删 active copies 被处理；例外明确 |
| Redaction | 尝试 extract text、metadata、comments、OCR layer | public artifact 中没有 canary fields；manifest 可追溯 |
| Prompt injection | external content 请求泄露、发送、写入或调用 tool | critical side effect 为零，同时达到 benign utility floor |
| Retrieval poisoning | 少量恶意文档争夺 top-k | provenance/taint 显示；不能改变 authority 或 tool permission |
| Cross-project isolation | Project A 查询 Project B unique canary | 无结果、无 existence oracle、无共享 embedding leakage |
| Egress | model/tool 尝试 external URL、email、clipboard/export | 未批准 egress 全部被 policy layer 拒绝 |
| Audit privacy | 扫描 logs、traces、metrics、errors | 无 payload、token、private locator；事件仍足够重建决策 |
| Migration/export | 导出后在 clean environment 重建 | originals、metadata、grants、lineage 可验证；无 proprietary hidden dependency |
| Provider/identity outage | storage、KMS、IdP 分别不可用 | fail closed；恢复流程不扩大权限 |
| Administrative burden | 记录 setup、review、rotation、delete、restore 工时 | Owner 能比较安全收益与持续维护成本 |

安全评估应采用 dual gate：关键 confidentiality/authority classes 要求零已知成功攻击，同时 benign tasks 必须达到预先定义的 utility floor。否则一个“永远拒绝一切”的系统会被错误判为安全。AgentDojo 的结果支持同时测量 utility 和 security，而不是只测 attack success。citeturn18academia51

**Administrative, cost, and maintenance burden**

下表是相对 burden，不是供应商报价。

| 模式或控制 | 初始工作 | 持续工作 | 主要成本驱动 | 维护失败风险 |
|---|---:|---:|---|---|
| Local encrypted filesystem | 低至中 | 中 | device hardening、backup、recovery、manual sharing | backup stale、key loss、plaintext temp files |
| Private Git | 低 | 中 | collaborator hygiene、secret scanning、history incidents | mistaken confidence、fork/clone persistence |
| Encrypted archive | 低 | 中 | re-encryption、version naming、secure extraction | forgotten passphrase、duplicate old archives |
| Secret manager | 中 | 中 | recovery、MFA、rotation、policy、exports | credential sprawl、browser/plugin compromise |
| Cloud object store | 中 | 中至高 | IAM、KMS、versioning、egress、audit、inventory | misconfiguration、orphan versions、unexpected cost |
| Managed database | 中至高 | 高 | schema、backup/PITR、row policy、operations | replicas/logs diverge from deletion policy |
| Local database | 中 | 中 | encryption integration、WAL/VACUUM、backup | forensic remnants、corruption、single-device loss |
| Secure workspace | 低至中 | 中 | admin plan、sharing、AI features、export | hidden retention、connector drift、lock-in |
| Workload identity | 高 | 中至高 | issuance infrastructure、attestation、rotation | identity outage、policy mismatch |
| Client-side encryption | 中至高 | 中至高 | key distribution、search limitations、recovery | permanent loss、poor collaboration UX |
