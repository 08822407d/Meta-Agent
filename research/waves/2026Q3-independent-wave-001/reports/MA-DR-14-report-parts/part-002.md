| **Voice/chat** | raw audio、transcript、conversation history、speaker metadata、timestamps、behavioral signals | speakers、conversation participants、Owner；录音同意要求因地域而异 | raw 默认高敏；转写与摘要继承敏感性；分离音频、transcript、speaker map | 删除必须分别处理 raw media、transcript、embedding、summary、backup；speaker recognition 会增加风险 |
| **Source-code** | 非公开源码、配置、architecture、build artifacts、dependencies、vulnerability details | repository owner、employer、customer、licence holder | private repo 仅是一个控制；secret scanning、branch protection、export boundary、dependency review | Git 历史和 clones 难以完全清除；代码可能内嵌 credentials 或 customer data |
| **Customer** | 客户提供、代表客户处理或可归属于客户的材料 | 客户通常为 data owner/controller；Meta-Agent operator 可能是 processor | tenant/project isolation、contract scope、no secondary use、no methodology promotion、approved subprocessors | 以合同 deletion/return 条款为准；derived summaries 和 support logs 也需纳入 |
| **Derived-summary** | 摘要、标签、embedding、index entry、extracted entity、classification、evaluation output | 原材料 owner 权益通常继续相关；生成系统也是 processor | **默认继承最高相关输入分类，直至完成独立 sanitization review**；记录 provenance 和 allowed influence | 原件删除后若 summary 可重构事实，summary 不能自动保留；embedding 不应默认视为匿名 |

该矩阵的关键原则是：**classification follows content and obligation, not file extension or storage location**。把私有文件移动到“private project”不会降低其分类；把原件变成摘要、embedding 或 prompt context 也不会自动解除限制。此结论为 `MULTI_SOURCE_PATTERN`，与 Meta-Agent 已有的 source-role separation 和禁止 target-specific private details 静默进入 general methodology 的约束一致。fileciteturn2file0L1-L6 fileciteturn4file0L1-L6

**Threat model**

受保护资产不仅包括原始文件，还包括：

- locations、filenames、customer names、timestamps 和 access patterns 等 metadata；
- credentials、KEKs、recovery keys、OAuth refresh tokens 和 workload identities；
- search indexes、embeddings、derived summaries、prompt traces 和 evaluator outputs；
- policy、grants、audit logs、retention state、deletion tombstones 与 backup catalog；
- public pointer 与 private original 之间的关联关系。

主要参与者及其风险如下：

| 参与者 | 合法能力 | 主要风险 |
|---|---|---|
| Owner | 最终批准 material use、purpose、sharing、retention、activation | 误批准、过宽授权、recovery key 单点丢失 |
| Custodian/operator | 配置存储、备份、密钥与生命周期 | 配置错误、过度权限、日志泄露、insider misuse |
| Human collaborator | 在批准范围内读取或编辑 | accidental forwarding、local copy、clipboard、personal backup |
| Agent/runtime | 读取 context、生成 summary、调用工具 | prompt injection、over-broad retrieval、cross-project contamination、data exfiltration |
| Connector/service | 代理访问外部系统 | confused deputy、token passthrough、scope inflation、cached token theft |
| Storage/KMS/provider | 持久化、复制、恢复或解密支持 | control-plane compromise、subprocessor exposure、service outage、lock-in |
| External attacker | phishing、credential theft、malware、supply-chain attack | account takeover、encrypted-data replacement、exfiltration |
| Compromised writer | 可写入 corpus、index、pointer 或 policy | retrieval poisoning、origin laundering、malicious replacement、anti-resurrection bypass |

最常见的 accidental exposure paths 包括：错误 Git commit、issue/PR attachment、verbose log、crash dump、temporary extraction directory、cloud snapshot、support ticket、browser download、clipboard sync、email forwarding、analytics、model prompt retention、vector index、shared cache、publicly resolvable CID、unredacted document metadata、backup restored into a broader permission boundary，以及 Agent 把 private project observation 提炼成 general methodology。

Writer compromise 特别重要：encryption 可以保护未授权读取，却不能阻止一个已获写权限的主体植入恶意文档、错误摘要、poisoned embedding 或伪造 pointer。PoisonedRAG 表明，只需在大型知识库中注入少量优化文本，就可能显著控制指定问题的输出；论文报告在其测试设置中每个目标问题注入五条恶意文本时可达到约 90% attack success rate，且所测试防御不足。citeturn18academia49

## 主要存储方案比较与失效证据

**Comparison of major approaches**

下表比较的是 portable security properties，而不是指定永久供应商。评分为相对判断：低、中、高。

| 存储模式 | 主要 threat assumptions | Recovery / availability | Search / audit | Lock-in 与维护 | 删除边界与负面证据 | Meta-Agent 初步处置 |
|---|---|---|---|---|---|---|
| **Encrypted local filesystem** | 设备 OS、账户和本地解密 session 未被完全控制；密钥不与数据同处明文 | 离线可用；单设备故障风险高；需独立加密 backup | 原生搜索可能泄露 index；audit 通常有限，需额外层 | lock-in 低；运维中等 | full-disk encryption 主要保护关机或未解锁设备，不保护已登录恶意进程；SSD、snapshot、swap、temp files 使删除证明困难 | **候选首选**：单 Owner、无远程 connector 的 local-private profile |
| **Private Git** | 平台账户、collaborator permissions、CI、fork/clone 路径均受控 | 强版本恢复；分布式 clones 提高可用性 | diff、review 和 lineage 强；全文搜索好 | Git 可移植；历史清理成本高 | simple delete 不移除历史；forks、clones、PR refs、caches 可保留敏感提交。citeturn15search4 | **仅限条件使用**；绝不视为充分安全本身 |
| **Encrypted archive** | 加密工具实现可靠；passphrase/key 强且单独保存；解压环境安全 | 便于离线备份与移动；增量恢复差 | 未解密时搜索和审计弱；多人协作差 | lock-in 低到中，取决于格式 | 每次解压可能产生 plaintext temp copy；整体 archive 更新易留下旧副本；key loss 可能永久不可恢复 | **适合作为 transport/backup artifact**，不适合作为主要活跃知识库 |
| **Password/secret manager** | manager、browser integration、recovery 和 device trust 可接受 | 通常有同步和恢复机制 | 对 secret access 的 audit 较好；对大文档搜索不合适 | 产品依赖中等 | 适合小型 credentials，不适合大量 source/customer documents；export 文件可能成为高风险副本 | **credentials 专用**；不得扩展成一般材料库 |
| **Private cloud object store** | IAM、provider control plane、bucket policy、network、KMS 和 lifecycle 正确配置 | 高 durability/availability；可跨设备与区域 | object-level audit 较强；内容搜索需另建 index | provider API 与 lifecycle semantics 带来中等 lock-in | versioning 下 simple delete 常只生成 delete marker，旧版本仍存在；Object Lock/hold 会阻止永久删除。citeturn14search2turn14search3turn14search8 | **候选首选云模式**，但必须显式处理 versions、backups、KMS 和 egress |
| **Managed database** | 数据库、IAM、network、backup、replica、query log 和 administrator 均受控 | 高可用、事务与恢复能力强 | structured search、row-level policy、audit 最强 | schema、SQL extension、backup format、service features 造成中高 lock-in | logical row delete 不等于 replica、PITR、WAL、snapshot、search index 或 analytics deletion | **适合高结构化 metadata/control plane**；原件 blob 不必放入数据库 |
| **Local database** | 本地设备和数据库密钥安全；application 正确处理 journal/WAL/temp | 单设备可用；备份需自行设计 | structured search 好；audit 需应用实现 | lock-in 低；维护中等 | SQLite 默认删除通常只把空间标为可复用；`secure_delete` 通常默认关闭，FAST mode 可留 freelist traces，FTS shadow tables 也可能残留。citeturn15search0 | **适合本地 private registry/index**，但不能宣称 SQL DELETE 即擦除 |
| **Secure workspace/project storage** | workspace tenant、admin、connectors、sharing links、retention 与 export controls 均可靠 | 用户体验和协作通常好 | 搜索和审计方便，具体能力高度平台相关 | lock-in 高；权限模型常随产品变化 | hidden versions、trash、admin retention、provider backup、AI indexing 和 external integrations 可能超出用户直觉 | **实验门控候选**；必须先验证 export、delete、audit、connector scope |
| **Content-addressed pointer store** | content/pointer 关系不泄露敏感性；pinning、gateway 和 replication 受控 | integrity verification 强；availability 取决于 pinning/replication | 去重与完整性强；授权、mutable state 和 revocation 需额外层 | protocol lock-in 可低，运营复杂度高 | CID 对同一内容保持稳定；一旦其他节点或服务 pin/cache，撤销本地 pin 不保证外部副本消失。IPFS 文档说明 CID 指向不可变内容，而 persistence 由 pinning 决定。citeturn13search0turn13search1turn13search5 | **只考虑 private ciphertext addressing**；禁止把私有 plaintext CID 作为公共 pointer |
| **Hybrid** | classification、routing 和 policy engine 正确；跨层同步可控 | 可在 local confidentiality 与 cloud recovery 间平衡 | 可把 metadata/index 与 original 分离 | 设计和运维负担最高 | 最大风险是 classification drift、orphan copies、双重 truth、删除未传播和恢复后权限扩大 | **长期首选候选**，须通过 synthetic lifecycle tests |

**Storage encryption 不是完整访问控制。** NIST SP 800-111 将 full-disk、volume/virtual-disk 与 file/folder encryption 视为不同技术，并强调应按存储类型、环境和威胁选择；它主要解决存储介质被未授权访问的问题，而不是已解锁 session、malicious writer、connector delegation 或 cross-Agent inference。citeturn9search2

**Private Git 的正面价值**在于 diff、review、lineage、rollback 和可移植性；其负面证据则是 erase semantics 与复制模型不适合高删除要求。Meta-Agent 已有 history record 也明确写明不能承诺删除 public Git history、forks、caches 或 external copies。fileciteturn6file0L1-L6 因此，“private repository”只能是若干控制中的一个，而不能替代 material classification、secret scanning、branch protection、endpoint controls、retention 和 incident response。

**Cloud object versioning 的安全与治理目标可能冲突。** Versioning 能恢复 accidental overwrite/delete，但 simple delete 可能只添加 delete marker；每个非当前版本仍是完整对象并继续占用成本。WORM/Object Lock 对 ransomware、evidence preservation 或 legal hold 有价值，却会使删除权、合同 return/delete 条款和 data minimization 更难执行。citeturn14search6turn14search8 因此 versioning、retention 和 legal hold 必须由材料类别决定，不能全局无限开启。

**Local database 的删除也不是文件系统级擦除。** SQLite 官方说明，普通删除通常不擦除旧内容；`VACUUM` 可重建数据库并清理旧页面，但需要额外空间、可能受锁影响，并且数据库外的 backup、WAL、temp 和 filesystem snapshot 仍需单独治理。citeturn15search1turn15search8

