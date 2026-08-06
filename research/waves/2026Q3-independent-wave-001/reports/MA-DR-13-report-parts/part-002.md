| **Derived-state rebuildability** | search index、embedding、summary、dashboard、cache 应记录其 source revision 与 transformation，并可从 authoritative/evidence inputs 重建。 |
| **Execution isolation** | credentials、network access、write permissions、tool execution 与 target truth 物理或权限隔离；至少不能因读取 spec 自动获得 side-effect authority。 |
| **Explicit promotion** | evidence → candidate → Owner decision → target/method update，不允许 index、chat memory 或 automation 直接促成 promotion。 |
| **Migration without dual writing** | repository split 或 storage migration 应采用 staged copy/verify/cutover，而不是长期双向同步 authoritative files。 |
| **Graceful degradation** | hosted surface、connector、subscription 或 retrieval layer 不可用时，repository-backed manual workflow 仍应能读取、审查和更新 authority core。 |

## 外部证据与主要架构方案

### Primary evidence landscape

#### Control plane 与 execution plane 的分离

Kubernetes 是大型系统中 control plane / worker execution separation 的成熟实例：control plane 管理 desired/current state，worker nodes 执行 workloads；小型开发环境可以共置，较大的生产环境通常分离。该证据不能直接证明 Meta-Agent 应采用 Kubernetes，但它说明**逻辑 plane separation 与物理 deployment topology 是两个不同决策**。citeturn2search0turn2search6

Kubernetes 的 API-centric hub-and-spoke 模型及 node/control-plane authentication 还表明：一旦 execution nodes 或 external tools 被加入，通信、身份和 policy enforcement 就成为独立架构职责，而不只是 UI 功能。citeturn2search3

NIST SP 800-207 的 Zero Trust 原则否定“因为位于本机、内网或同一 repository 就自动可信”；访问应基于 resource、identity、policy 和显式 authorization。NIST SP 800-207A 进一步强调 application/service identity 与细粒度 policy enforcement。citeturn2search2turn2search9

NIST SP 800-204 同时提供了重要负面证据：microservices 会引入 service discovery、secure communication、authentication、monitoring、resilience、load balancing 和 session/integrity 等额外问题。因此“把 planes 分开”不等于“把每个 plane 立即做成独立网络服务”。citeturn2search14

#### Conversation、CLI 与 API surface

Hosted conversational Projects 可以整合 chats、instructions 和 files，但其 retention、workspace controls、file limits 与平台产品规则绑定。因此它适合做 interaction/client surface，却不天然满足 provider-independent canonical truth、complete export、offline recovery 或 deterministic rebuild。citeturn3search14

Local coding CLI 的代表性实现显示，terminal surface 可以读取项目、编辑文件、运行命令并配合 Git；但“local CLI”也不必然等于完全 offline，因为 model inference、authentication 或 account control 可能仍依赖 hosted services。citeturn3search11turn3search13

API/orchestrator surface 提供更清晰的 machine-readable contracts、automation 和 client independence，但会引入 API keys、state retention、retry、rate limit、billing、deployment 与 observability 责任。不同 API 的 application-state retention 与 zero-data-retention constraints 也可能不同，因此 API 不应被假设为 stateless。citeturn3search1turn3search2

#### Retrieval 与 long context

RAG 的原始研究证明，parametric generator 与 external non-parametric memory 结合可以改善特定 knowledge-intensive tasks，并支持更新外部知识而不重新训练模型。该结果证明 retrieval 是**可用能力**，不是每个 Agent 系统的必要 baseline。citeturn10academia48

后续研究显示，RAG 本身是 modular system，retriever 与 generator 都可能出错，评估需要区分 recall、context precision、faithfulness、noise sensitivity、hallucination 和 context utilization。citeturn10academia49

“Lost in the Middle” 的 controlled experiments 表明，模型对长 context 的利用可能随 relevant information 的位置显著变化；增加 documents 或 context 并不保证 answer quality 持续提升。由此可见，“把整个 repository 塞入 conversation context”不能替代可验证的 retrieval、ranking 和 source binding。citeturn9search0turn9search2

Indirect prompt injection 研究及 AgentDojo 表明，来自 web、email、repository 或 connector 的未信任内容可能被模型误当作指令；加入 retrieval 与 tools 会扩大 attack surface。AgentDojo 的实验还显示，即使没有攻击，tool-using agents 也可能无法可靠完成全部任务。citeturn10academia50turn9academia36

#### State、views 与 events

PostgreSQL materialized views 将 query result 持久化，并通过 refresh 重新生成；它们不是直接维护的 canonical source。这是“durable truth + rebuildable projection”模式的清晰实例。citeturn4search5

SQLite FTS5 支持 phrase、prefix、NEAR 和 boolean full-text queries，说明一位 Owner 可以在不引入 distributed vector infrastructure 的情况下获得实用 local search。它仍然只是候选 implementation，不是 Meta-Agent requirement。citeturn4search4

CQRS 的官方工程 guidance 提供重要反例：分离 read/write models 会增加 messaging failures、duplicate processing、retry、eventual consistency 和 stale reads。对于低写入量、单一 Owner 的 Meta-Agent，若一个简单 canonical store 与可重建 index 已足够，完整 CQRS 通常难以证明其额外成本合理。citeturn5search2

CloudEvents 提供跨系统 event metadata 的标准格式，但 specification 不定义完整处理语义，且 event context attributes 也可能泄露敏感信息。采用标准 envelope 不能自动解决 ordering、idempotency、authorization、retention 或 replay correctness。citeturn8search0turn8search4turn8search6

### Product-surface and architecture-option matrix

评分采用相对等级：`低 / 中 / 高`。它们是针对单一技术型 Owner 的 architecture comparison，不是产品 benchmark。

| Surface family | UI 与 durable truth 的合理关系 | 自动化与执行能力 | 主要优点 | 主要负面证据与成本 | 候选适用阶段 |
|---|---|---|---|---|---|
| **Conversational Project / custom configuration** | conversation 是 client；truth 应外置或至少可完整导出、版本化 | 低到中，取决于 files/tools/connectors | 最低交互摩擦；适合 framing、review、drafting | platform retention、limits、subscription、context binding 与 export 可移植性；chat history 易产生隐式状态 | Bootstrap companion |
| **Repository-first manual workflow** | repository path 是 durable authority；conversation/editor 只读取和提出 diff | 默认低 | diffable、auditable、portable、offline-readable；与当前 baseline 最一致 | manual navigation、review load、stale context、无自动 freshness guarantee | Bootstrap core |
| **Local CLI / coding Agent** | 读取 repository truth；local state 与 output 必须标明 derived/candidate | 中 | keyboard-efficient；可组合 Git、tests、schemas；易于批量 lint | command execution、credentials、shell injection、hidden local state；部分工具仍依赖 hosted inference | Early bounded personal production |
| **Desktop application** | UI shell 不应拥有独占格式；应读写 documented local core | 中 | 可改善 navigation、approval UX、notifications 与 local integration | packaging、updates、OS compatibility、code signing、sandbox、support burden；单 Owner 可能收益不足 | 仅 UX pain 经验证后 |
| **Local service** | authoritative files/database 通过 local API 暴露；client replaceable | 中到高 | 多 client 共享一致 state；可加 scheduler、search、audit | daemon lifecycle、ports、auth、backup、schema migration、process supervision | Personal production candidate |
| **Hosted service** | hosted control/state store 需要完整 export 与 offline recovery；不应成为不可退出的黑箱 | 高 | remote access、continuous jobs、webhooks、多设备 | recurring cost、security perimeter、secrets、availability、provider lock-in、operations | Expansion only |
| **API/orchestrator** | contract 层，不必等同于存储层；canonical writes 必须受 policy gate | 高 | automation、typed clients、testability、provider adapters | retries、idempotency、rate limits、observability、auth、state retention、version compatibility | 当重复调用量证明需要 |
| **Hybrid arrangement** | 一个 authority core；多个 replaceable clients；最多一个受控 write path | 可分阶段 | 兼顾 human interaction、durability 与 bounded automation | 最容易掩盖同步、dual truth、dependency 和 maintenance 成本 | 仅逐模块证明价值后 |

`RECOMMENDATION`：首轮 prototype 不应比较所有表面。应比较三个最小家族：

1. repository-first manual；
2. repository + read-mostly local CLI；
3. repository + conversational client。

Desktop、hosted service 和 full orchestrator 应等待实际 UX、scheduling、multi-device 或 integration 需求出现。

### Control、evidence、state、execution plane responsibility model

```text
                       Owner decisions
                             │
                             ▼
┌───────────────────────────────────────────────────────┐
│ Control plane                                         │
│ intent • methodology • target truth • policy          │
│ version • migration • approvals • desired state       │
└───────────────┬───────────────────────────┬───────────┘
                │ references                │ authorizes
                ▼                           ▼
┌──────────────────────────────┐   ┌──────────────────────────────┐
│ Evidence plane               │   │ Execution plane              │
│ sources • research • tests   │   │ models • tools • connectors  │
│ audit • provenance • failures│   │ jobs • filesystem • network  │
└───────────────┬──────────────┘   └───────────────┬──────────────┘
                │ supports                         │ emits observations
                ▼                                  ▼
┌───────────────────────────────────────────────────────┐
│ State plane                                           │
│ current status • queues • run records • caches        │
│ indexes • materialized views • health • leases        │
└───────────────────────────────────────────────────────┘
```

| Responsibility | Primary plane | 可以共置的情形 | 应分离的情形 |
|---|---|---|---|
| Product intent、non-goals、Owner authority | Control | Markdown 与 methodology 可在同一 repository | 不应由 chat memory、database inference 或 runtime service 自动改写 |
