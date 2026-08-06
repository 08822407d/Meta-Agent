```yaml
research_id: MA-DR-14
research_title: Private Target Material Storage, Access Control, and Data Governance
target_project: Meta-Agent
report_role: external_research_evidence_non_execution_source
independence_contract_observed: true
```

# MA-DR-14 — 私有目标材料存储、访问控制与数据治理

## 执行结论与仓库输入绑定

**Executive verdict**

本研究的总体结论是：Meta-Agent 可以安全地原型验证私有材料能力，但当前证据不支持把“私有仓库”“默认云加密”或“隐藏链接”中的任何一种单独视为充分安全边界。最有希望的设计不是单一存储产品，而是一个**分层 hybrid control plane**：

1. 私有原件保存在独立于公共 Git 的加密存储中；
2. credentials 与 secret values 仅存于专用 secret manager 或受保护的本地 credential store；
3. 搜索索引、derived summaries、检索缓存和审计记录拥有各自独立的分类、保留和删除规则；
4. 公共仓库最多保存经审查的安全摘要或不泄露位置、身份、内容指纹和访问秘密的 opaque pointer；
5. 所有 Agent、connector 和 workload 的访问由外部身份与授权层强制执行，不由模型提示词、自报身份或“请勿泄露”指令承担；
6. cross-Agent、cross-project、RAG、MCP 或 shared-memory 访问默认关闭，只能通过有目的、有限期、可撤销、Owner 明确批准的 grant 开启。

这一结论属于 **RECOMMENDATION** 与 **TARGET_SPECIFIC_INFERENCE**，不构成 Meta-Agent target truth、operational activation、private-material authorization 或永久平台选择。

当前最值得以 synthetic data 原型验证的三种模式是：

| 候选模式 | 适用场景 | 初步结论 |
|---|---|---|
| encrypted local store + local encrypted index + separate credential store | 单一 Owner、低协作、优先减少第三方暴露 | **首选低复杂度原型**；恢复、设备失窃、密钥丢失和离机备份是主要风险 |
| bounded private cloud object store + client-side envelope encryption + external policy enforcement | 多设备、需要可靠备份或有限协作 | **首选云端原型**；IAM、KMS、版本删除、日志隐私和供应商控制面显著增加维护负担 |
| hybrid local/cloud separation | 高敏原件保留本地，较低敏材料或加密副本进入 bounded cloud | **长期最具可移植性的候选**；控制面最复杂，必须验证分类漂移和删除编排 |

Private Git 仅适合需要版本历史、删除要求不严格、访问者很少且材料本身不属于 credential、regulated、customer 或高敏 personal 类别的有限场景。它不能作为私有材料的一般默认存储，也不能消除历史、fork、clone、pull request、cache 或误提交后的残留风险。GitHub 官方文档明确指出，重写历史并 force-push 后，敏感提交仍可能存在于 forks、clones、cached views、SHA 直达引用和 pull requests 中，且无法删除其他用户的 clones。citeturn15search4

任何真实私有材料进入 Meta-Agent 之前，至少必须具备以下不可折价的 hard gates：材料分类与 owner、明确目的与合法/合同依据、存储与地域范围、read/write 分离、短期 credentials、密钥恢复与丢失策略、retention/deletion/backup policy、审计与 incident response、retrieval quarantine、cross-project isolation、synthetic adversarial validation，以及一次独立的 Owner 决定。**其中任何一项缺失时，默认应继续使用 no-private-data profile。**

**Target/repository input-binding receipt**

本研究在执行时读取的仓库为：

```text
repository: 08822407d/Mnemosyne
branch: master
actual_ref_read: 0865f334177e2ff0d81a3652ea9e3384e55f4259
prepared_against_master_supplied_by_task: 5cc758caa6baf86de0cf67cda2d852724f5edbbb
binding_result: EXECUTION_TIME_LATEST_MASTER_READ
mandatory_inputs_status: ALL_AVAILABLE
target_specific_mapping_status: COMPLETED
repository_writes_performed: false
```

所有 mandatory inputs 都通过固定 commit `0865f334177e2ff0d81a3652ea9e3384e55f4259` 读取；因此没有触发 `BLOCKED_BY_MISSING_TARGET_INPUTS`。固定 ref 的使用避免了在研究期间把后续 master 变化静默混入证据。所读文件的 GitHub 路径均解析到该 commit。fileciteturn2file0L4-L6

仓库绑定得出的关键约束如下：

| 仓库输入 | 本研究保留的权威含义 |
|---|---|
| `current/approved-spec.md` | sole designated target truth path 仍为 inactive；没有授权 private materials、RAG、MCP、shared memory、pilot 或 operational use。公共 workspace 仅允许 public、synthetic、redacted 或 safe-pointer material。fileciteturn2file0L1-L6 |
| `current/active-context.md` | 当前没有存储私有材料、没有 pilot、没有 activation；origin/allowed-influence、typed permissions 和 promotion quarantine 仍为 candidate concepts。fileciteturn3file0L1-L6 |
| `authority/source-and-owner-map.md` | Owner 对 privacy、material use、write scope 和 operational acceptance 保留最终权威；read authorization 不等于 write authorization，平台连接不等于 task authorization。fileciteturn4file0L1-L6 |
| `methodology/core-methodology.md` | source、authority、memory role 必须分离；multi-Agent 会扩大 privacy、injection 和 provenance surface；private material 不能自动进入公共 Git。fileciteturn5file0L1-L6 |
| `history/decision-version-and-migration-log.md` | 不得承诺擦除 public Git history、forks、caches 或 external copies；storage/runtime platform change 属于高门槛 migration。fileciteturn6file0L1-L6 |
| DR-01–05 synthesis 与 gap analysis | 作为 non-execution research evidence 使用；支持 source-role separation 和 poisoning threat，但不证明产品已经安全或有效。fileciteturn7file0L1-L6 fileciteturn8file0L1-L6 |
| DR-06/07 adjudication 与 candidate ledger | 保留其 candidate-only 地位；origin/allowed-influence、typed permissions、promotion quarantine、anti-resurrection 不被本报告自动提升。fileciteturn9file0L1-L6 fileciteturn10file0L1-L6 |
| M1 workspace manifest | public-risk workspace、outside-Git default、redaction manifest、safe-pointer non-payload rule 和 no-erasure promise 均保持有效。fileciteturn11file0L1-L5 |

本研究没有使用 MA-DR-08、MA-DR-10、MA-DR-11、MA-DR-12、MA-DR-13、MA-DR-14 或 MA-DR-15 的结论作为输入，也没有因 sibling wave task 改变研究问题或证据标准。

## 定义、范围与主要证据景观

**Definitions, scope, and non-goals**

本报告中的“private material”是一个治理总称，不等同于单一敏感等级。更可移植的模型是：

```text
base handling class
+ one or more content/obligation overlays
+ project/owner/purpose scope
+ lifecycle state
```

例如，客户源代码可能同时是 `confidential + source-code + customer + personal`；语音访谈的摘要即使删除了姓名，也可能仍是 `private + voice/chat + personal + derived-summary`。只要数据仍能直接或通过组合重新识别个人，pseudonymisation 或 encryption 本身不使其脱离 personal-data 范畴。欧盟委员会对 GDPR 的解释明确指出，经 de-identification、encryption 或 pseudonymisation 处理、但仍可重新识别的数据仍是 personal data。citeturn19search13

**Evidence-label semantics**

| 标签 | 在本报告中的含义 |
|---|---|
| `VERIFIED_PRIMARY_EVIDENCE` | peer-reviewed paper、标准化 benchmark 或具有可复现实验说明的 primary preprint |
| `OFFICIAL_SPECIFICATION_OR_DOCUMENTATION_FACT` | 标准组织、监管机构、协议或产品官方文档所述的当前事实 |
| `MULTI_SOURCE_PATTERN` | 多个独立标准、研究或实现共同支持的设计模式 |
| `INDUSTRY_PRACTICE` | 广泛使用但未必有强实验验证的工程惯例 |
| `TARGET_SPECIFIC_INFERENCE` | 将外部证据映射到 Meta-Agent 当前约束后的推论 |
| `RECOMMENDATION` | 尚待 Owner 选择或 synthetic prototype 验证的方案 |
| `UNRESOLVED` | 证据不足、依赖法律/合同/风险偏好或需实测的问题 |

NIST FIPS 199 使用 confidentiality、integrity、availability 受损后的潜在影响作为分类基础；本报告沿用该风险思想，但没有把美国联邦分类标准直接宣称为 Meta-Agent 的合规要求。citeturn10search1 NIST SP 800-53 Rev. 5 则提供了可裁剪的 access control、audit、identification、incident response、media protection、PII processing 和 system integrity control families，适合作为控制完整性检查表，而不是一项默认认证承诺。citeturn10search2turn10search3

**Data-classification and handling matrix**

下表中的分类可以叠加；“默认处理”是候选治理要求，不是已经批准的 policy。

| 类别 | 定义与典型内容 | Owner、rights holder 与 processor | 默认处理要求 | 保留与删除注意事项 |
|---|---|---|---|---|
| **Public** | 已合法公开、明确可再分发，或为本任务生成的 synthetic material | Owner 仍决定是否纳入 target；原作者或 licence holder 可能保留权利 | 可进入公共 workspace，但仍检查 licence、integrity、malware 和 prompt injection | 可按项目需要保留；公开来源的删除不等于互联网副本消失 |
| **Internal** | 不面向公众，但泄露通常造成有限组织或流程影响，如内部计划、非敏感操作说明 | 项目 Owner；指定协作者作为 processors | authenticated storage；不得自动公开；公共摘要需 review | 通常与项目生命周期绑定；离职或协作结束时撤权 |
| **Private** | Owner 明确限制访问的个人或项目材料，未必具有法律特殊类别 | Owner；可能另有 data subject 或作者权利 | outside public Git；encryption；purpose-bound access；default deny | 必须有 retention class；撤销访问不等于删除既有副本 |
| **Confidential** | 泄露、篡改或不可用会造成明显商业、合同、研究或安全损害 | Owner、合同对方或组织 data owner；processor obligations 可能适用 | stronger authentication；read/write separation；restricted export；audited access | 删除需覆盖 versions、backups、caches、derived artifacts；合同 hold 优先 |
| **Credential** | password、API key、token、private key、recovery code、session secret、connection secret | account owner；credential issuer；secret-management operator | **不得写入设计记录、prompt、Git 或普通 metadata**；只存 secret manager；设计仅保存 opaque reference | 轮换和 revocation 优先于文件删除；泄露时假定已被复制并立即 rotate |
| **Regulated** | 受适用法律、行业规则、记录保留或跨境要求约束的数据 | controller、processor、data subject、legal/compliance authority | 法律和地域评估、处理依据、最小化、记录 processing activity；必要时 hold | erasure 可能受法定义务、legal claims 或公共利益例外限制；不得作绝对删除承诺。citeturn19search1turn19search6 |
| **Personal** | 与已识别或可识别自然人有关的信息，包括组合后可识别的数据 | data subject 有相应权利；Owner/controller 决定目的；processors 按约处理 | collection minimization、purpose limitation、access/export/correction/deletion workflow、日志去标识 | 需要可定位所有 copies 与 derivatives；anonymisation 必须达到不可再识别，而非仅删姓名 |
