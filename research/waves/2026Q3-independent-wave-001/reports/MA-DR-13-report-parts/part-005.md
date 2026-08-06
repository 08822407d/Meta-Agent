- unattended jobs 或 external webhooks 已由 bounded local prototypes 证明价值；
- remote/multi-device access 是持续需求；
- local-only failure cost 高于 service operating cost；
- workload 有真实 concurrency 或 long-running execution；
- connector/API integration 已有明确 least-privilege scope。

**回退或退出条件：**

- monthly operational burden 超过 Owner tolerance；
- subscription/service outage 导致 authority core 不可用；
- security patch、dependency update、backup test 长期积压；
- automation false-success 或 unauthorized-side-effect rate 超标；
- hosted state 无法完整 export；
- service 只是在包装低频 manual workflow。

### Capability staging model

| Capability | Bootstrap | Personal production | Expanded service | 前置条件 | Failure containment |
|---|---|---|---|---|---|
| Local keyword search | Optional | Candidate default | Retained fallback | source revision tracking | index delete/rebuild |
| Vector retrieval | No assumption | Experiment only | Optional module | evaluation corpus、chunk/version metadata、rebuild path | disable module；fallback to keyword/manual |
| RAG answer synthesis | No assumption | Proposal-only experiment | Optional read path | retriever/generator metrics、source citations、injection tests | no direct write authority |
| MCP-like interface | None | Static contract prototype | Optional adapter | typed tool schema、OAuth/identity、no token passthrough | per-server disable、scoped credentials |
| Connectors | None | Mock/synthetic only | Selected connectors | exact data/write scope、audit、revocation | connector-level kill switch |
| Scheduled jobs | None | manually triggered only | Optional scheduler | idempotency、expiry、budget、stop criteria | disable queue；reconcile side effects |
| Webhooks | None | simulated events | Optional gateway | signature verification、deduplication、replay protection | quarantine event |
| Writeback | Manual reviewed diff | bounded proposal or branch | gated side-effect service | canonical write contract、approval、rollback | no broad direct write |
| Event log | Git/run receipt | structured append log | durable event/audit stream | retention、schema、replay semantics | non-authoritative by default |
| Desktop UI | None | UX experiment | Client option | measured navigation pain | retain CLI/repo fallback |
| Hosted service | None | None required | Optional | SLO/security/export/DR | offline authority core |

### Prototype plan

所有 prototypes 使用 public、synthetic 或 explicitly safe material；不连接真实 private data，不进行真实 repository writeback，不启用 external connectors，不进行 unattended execution。

#### Repository/manual baseline prototype

**目的：** 建立最低复杂度 benchmark。

输入为一组 synthetic Agent-design requests 和固定 repository snapshot。Owner 使用 current manual workflow 完成：

- load truth/context；
- identify authority；
- produce candidate design；
- record sources；
- prepare reviewed change proposal。

测量：

- elapsed time；
- files opened；
- navigation errors；
- stale-context incidents；
- review time；
- provenance completeness；
- ability of a fresh session to resume；
- recovery from intentionally missing derived files。

该 baseline 是比较其他表面的必要 counterfactual，不能省略。

#### Read-mostly local CLI prototype

CLI 只允许：

```text
status
validate
search
trace <claim-or-id>
export
rebuild-index
propose-diff
```

明确禁止：

```text
commit
push
modify-target-truth
invoke-network-tool
read-secrets
run-unbounded-shell
```

比较 CLI 与 manual baseline 的：

- navigation time；
- exactness；
- Owner review load；
- false-positive validation；
- hidden-state dependency；
- fresh-machine reproducibility。

#### Conversational client prototype

同一 synthetic task 通过 conversation surface 完成，但每次必须：

- 从 exact repository ref 读取；
- 输出 source-binding receipt；
- 将所有 proposed changes 标记为 candidate；
- 不依赖 previous chat history；
- 不持有独立 truth；
- 在 context conflict 时停止。

该 prototype 要回答：conversation 是否显著改善 problem framing 和 review，而没有制造 shadow truth。

#### Derived-state prototype

从 canonical files 生成两种可丢弃 view：

1. local keyword/FTS index；
2. machine-readable object/status projection。

测试：

- 删除后能否完整重建；
- source commit 是否保留；
- canonical file 修改后能否检测 stale index；
- conflicting entries 是否被 projection 隐藏；
- search recall 是否优于 manual grep；
- rebuild 时间和维护成本。

Vector retrieval 不应进入第一轮，除非 keyword/manual baseline 已显示不足。

#### Repository extraction dry run

在临时 clone 中模拟 subfolder split，但不创建远程仓库、不改变 authority。

验证：

- file inventory；
- commit history preservation；
- lost branches/tags；
- internal links；
- source references；
- generated/current files；
- old/new path mapping；
- rollback to original clone。

GitHub 官方 `git filter-repo` procedure 为该 dry run 提供可重复起点。citeturn11search0

#### Recovery and vendor-exit drill

在一台 clean environment 中仅使用 export bundle 和 documented prerequisites：

- restore repository；
- restore external evidence pointers/manifests；
- rebuild local search；
- load current truth；
- produce a fresh-session receipt；
- validate no credentials embedded；
- run offline/manual degraded workflow。

Git `bundle` 支持 repository 的 offline transfer、full 或 incremental bundle，但不包含 working tree、index、stash、configuration 或 hooks，因此不能把一个 bundle 当作完整系统 backup。citeturn5search0

#### Static connector/MCP contract prototype

不连接真实 server，只定义 synthetic tool contracts：

```yaml
tool:
required_identity:
read_scope:
write_scope:
network_scope:
data_class:
side_effect:
approval_required:
idempotency:
rollback:
credential_audience:
expiry:
audit_fields:
degraded_mode:
```

用 malicious descriptions、prompt injection、token passthrough、over-broad write scope 和 stale capability declarations 测试 validator。MCP 的开放 protocol 有利于 interface portability，但其 authorization 与 security guidance 说明 interoperability 并不等于安全。citeturn3search5turn3search7turn3search8

### Prototype promotion rule

任何 prototype 只有同时满足以下条件，才进入 candidate architecture review：

| Gate | 最低要求 |
|---|---|
| Functional value | 相对于 manual baseline 有可测量改善 |
| Authority correctness | 无 shadow truth、无 implicit promotion |
| Review economics | 节省的 Owner 时间高于 verification/rework |
| Reproducibility | clean environment 可重现 |
| Recovery | 删除 derived state 后可恢复 |
| Security | 无超范围 read/write/network；恶意输入测试通过 |
| Portability | open export、documented schema、provider replacement path |
| Degradation | module unavailable 时 core workflow 仍可用 |
| Maintenance | dependency/update/backup burden在 Owner tolerance 内 |
| Stop condition | 失败后可以无数据丢失地关闭模块 |

## 可移植性、运营负担与 Owner 决策

### Portability、backup、recovery 与 vendor-exit checklist

#### Authority and data inventory

- [ ] 每种 object class 都有 owner、canonical location、format、schema/version 与 write path。
- [ ] conversation、cache、index、database projection 和 runtime state 均标明是否 authoritative。
- [ ] private、large、licensed 和 public material 的 storage classes 分开。
- [ ] 每个 external pointer 都有 content hash、availability assumptions 与 recovery instructions。
- [ ] 任何 provider-native identifier 都有 local mapping，不作为唯一 identity。
- [ ] stable IDs 不编码不可迁移的 provider/repository assumptions。

#### Open formats and contracts

- [ ] 核心 truth 可导出为 plain text、Markdown、JSON、YAML 或其他 documented open format。
- [ ] JSON objects 使用 versioned JSON Schema；JSON Schema Draft 2020-12 提供标准化 validation dialect。citeturn4search0turn4search2
- [ ] API surface 使用 versioned machine-readable contract；OpenAPI 当前 specification line 已达到 3.2.0，但采用何版本仍应由实现兼容性决定。citeturn4search6
- [ ] Events 如需交换，可使用 CloudEvents-compatible envelope，但业务语义、authorization 和 replay policy 另行定义。citeturn8search0turn8search6
- [ ] Binary/runtime artifacts 具有 content digest、media type、producer、source revision 和 compatibility metadata。
- [ ] Schema migration 支持 old-to-new mapping、unknown-field handling、validation 与 rollback。

#### Repository backup

- [ ] 至少一个 offline Git backup。
- [ ] 至少一个与主 hosting account 隔离的 mirror 或 bundle。
- [ ] branches、tags、notes、LFS objects、submodules 和 releases 是否包含均有明确说明。
- [ ] GitHub mirror procedure 可用于复制全部 remote refs；包含 LFS 时必须单独 fetch/push LFS objects。citeturn11search1
- [ ] backup 不只存在于同一 account、同一 device 或同一 credential domain。
- [ ] 定期验证 clone、checkout、history、tags 和 expected hashes。

#### Runtime and state backup

- [ ] database 有 logical export 和 documented restore。
- [ ] queues/leases 等 transient state 被分类为 preserve、recompute 或 discard。
- [ ] indexes、embeddings 和 materialized views 默认可重建。
- [ ] secret values 不进入普通 backup bundle；secret inventory、names、rotation/recreation steps 被保存。
- [ ] service configuration 与 infrastructure definitions 被版本化，但 credentials 与 machine-local secrets 分离。
- [ ] 对外 side effects 有 reconciliation record，避免 restore 后重复执行。

#### Recovery objectives

- [ ] Owner 定义最低可接受 **RPO**：最多可以丢失多少已批准变更或 run records。
- [ ] Owner 定义最低可接受 **RTO**：恢复 manual degraded mode 和完整 service 各需多久。
- [ ] 恢复优先级是：truth → authority/policy → evidence references → current state → derived views → convenience UI。
- [ ] 恢复演练在 clean environment 中执行，而不是只检查 backup 文件存在。
- [ ] NIST SP 800-34 将 contingency planning 视为包含 recovery strategy、testing、training 和 maintenance 的持续过程，而不是一次性备份。citeturn6search1
- [ ] restore 后运行 no-dual-truth、stale-index、permission、schema 和 semantic-tombstone checks。

#### Provider replacement

- [ ] model/provider adapter 接收 documented request object，返回 documented result/evidence object。
- [ ] provider-specific tool calls 不直接写入 target truth。
- [ ] capability matrix 带 observation date、source、surface/subscription scope 与 uncertainty。
- [ ] 不支持的 semantics 被声明为 `unsupported` 或 `degraded`，不静默近似。
- [ ] hosted conversation 不可用时，可使用 local files + another client 恢复 review。
- [ ] hosted inference 不可用时，至少保留 manual read/review/export。
- [ ] connector 不可用时，safe pointers 和 manual import path 仍然存在。
- [ ] subscription 终止前可以导出全部 required state，且导出已实际验证。

#### Reproducibility and supply chain

- [ ] dependencies、tool versions、schema versions、model-visible selections 与 transformation parameters 被记录。
- [ ] build/search/index generation 具有 deterministic 或至少可解释的 inputs。
