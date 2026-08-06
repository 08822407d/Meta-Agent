|---|---|---|
| **Adoptable design principles** | private originals outside public Git by default | 与当前 target baseline 一致；不授权任何实际 ingestion |
| **Adoptable design principles** | classification as base class + overlays + purpose/project scope | 可移植，不依赖供应商；实际 taxonomy 仍需 Owner 批准 |
| **Adoptable design principles** | credentials referenced but never embedded | 适用于设计、prompt、metadata、logs 和 Git |
| **Adoptable design principles** | default deny、read/write separation、short-lived task-scoped access | 符合 least privilege 与现有 task-local authority |
| **Adoptable design principles** | separate human、service、workload identities | 避免 Agent 继承 Owner 全权 credential |
| **Adoptable design principles** | encryption plus explicit key lifecycle and recovery decision | “encrypted”标签本身不充分 |
| **Adoptable design principles** | honest deletion vocabulary and evidence receipt | 禁止承诺 Git、cache、backup、fork 或 external copy 完全擦除 |
| **Adoptable design principles** | public/private pointer separation | 公共层不含 locator、secret、customer identity 或可猜测 digest |
| **Adoptable design principles** | provenance、taint、allowed-influence and promotion quarantine | 作为设计原则可采纳；具体 schema 仍是 candidate |
| **Adoptable design principles** | cross-Agent/cross-project isolation by default | 与现有 target non-goal 一致 |
| **Adoptable design principles** | retrieval content treated as untrusted data | 不让外部内容改变 authority、policy 或 tool grants |
| **Adoptable design principles** | synthetic-only prototype before real material | 满足当前 authority boundary |
| **Candidate items** | encrypted local private store | 适合单 Owner 低协作原型；需 recovery/delete tests |
| **Candidate items** | bounded cloud object store with client-side envelope encryption | 适合 availability/collaboration；需 IAM、version、audit 和 export validation |
| **Candidate items** | hybrid storage topology | 可平衡 risk 和 availability；administrative burden 高 |
| **Candidate items** | private material registry separate from original store | 可统一 locator、classification、grant、retention 和 deletion state |
| **Candidate items** | ABAC/capability-based policy layer | 可表达 project、purpose、class、operation、expiry |
| **Candidate items** | short-lived workload identity | 减少长期 embedded secret；需 operational infrastructure |
| **Candidate items** | deletion ledger and restore-time anti-resurrection | 解决 backup 恢复后材料重新出现的问题 |
| **Experiment-gated items** | local encrypted database for search/index | 必须验证 WAL、FTS、VACUUM、backup 和 key loss |
| **Experiment-gated items** | secure workspace/project storage | 必须验证 export、provider retention、connector、AI indexing 和 deletion semantics |
| **Experiment-gated items** | private ciphertext content addressing | 只允许 private registry；禁止 public plaintext CID |
| **Experiment-gated items** | automatic redaction and classification | 只作辅助；必须有人审或 deterministic verification |
| **Experiment-gated items** | semantic/vector retrieval over private data | 必须证明 namespace isolation、deletion、rebuild 和 poisoning resistance |
| **Experiment-gated items** | DLP/output scanner | 不能替代 policy；需测 false negatives、false positives 和 obfuscation |
| **Deferred items** | actual customer、regulated 或 raw voice/chat ingestion | 需要独立法律、合同、privacy 和 Owner decision |
| **Deferred items** | MCP/RAG private connector access | 当前 target 明确未授权；需另行 operational/security gate |
| **Deferred items** | cross-Agent private sharing | 只有 explicit purpose-bound grant 和 downstream cleanup 成熟后才可考虑 |
| **Deferred items** | multi-user higher-risk cloud profile | 需 incident、dual approval、vendor assurance 和 formal retention |
| **Deferred items** | automatic methodology learning from private cases | 与现有 promotion boundary 冲突，继续禁止 |
| **Rejected approaches** | treating a private repository as sufficient security | Git history、clones、forks、CI、endpoint 和 erase limitations 使其不足 |
| **Rejected approaches** | storing credentials or secret values in metadata, prompt, source files or logs | 扩大泄露与复制面；难以可靠 rotation |
| **Rejected approaches** | public pointer containing live locator, signed URL, secret path or plaintext CID | pointer 本身成为 access or disclosure channel |
| **Rejected approaches** | permanent broad bearer tokens for Agent access | 可复制、难撤销、blast radius 大 |
| **Rejected approaches** | one shared global retrieval index or memory namespace | 导致 existence leakage、cross-project contamination 和 authority confusion |
| **Rejected approaches** | cross-Agent or cross-project sharing by default | 与任务及 current baseline 明确禁止项冲突 |
| **Rejected approaches** | model prompt as sole access control, DLP or injection defense | 模型可能受 injection、error 或 adversarial content 影响 |
| **Rejected approaches** | claiming complete erasure from Git, caches, backups, pins, forks or external copies | 与平台事实和现有 repository record 不符 |
| **Rejected approaches** | backup accessible through the same broad production credential | compromise 会同时破坏原件与恢复点 |
| **Rejected approaches** | automatic classification downgrade for summaries or embeddings | derived content 仍可能重构 private facts |
| **Rejected approaches** | silent permanent provider or framework selection | 违反 portability 与 Owner authority boundary |

最终处置为：

```yaml
external_landscape_completed: true
repository_mapping_completed: true
mandatory_inputs_missing: false
private_material_ingested: false
prototype_authorized: false
operational_activation_authorized: false
target_truth_changed: false
methodology_promoted: false
stable_target_ids_issued: false

recommended_owner_posture:
  retain_no_private_data_default: true
  permit_candidate_review: true
  leading_synthetic_prototypes:
    - encrypted_local_private_store
    - bounded_cloud_client_side_encrypted_store
    - hybrid_private_original_and_public_pointer_separation
  real_private_material_use:
    status: PROHIBITED_UNTIL_SEPARATE_OWNER_PRIVACY_AND_OPERATIONAL_DECISION
```

本研究支持的最强结论不是“选择某个存储产品”，而是：**在任何私有材料被使用之前，Meta-Agent 必须先证明材料分类、identity、authority、key、lifecycle、retrieval、cross-project isolation、incident response 和 deletion evidence 能作为一个统一系统工作；缺少其中任何一层时，应继续停留在 no-private-data profile。**