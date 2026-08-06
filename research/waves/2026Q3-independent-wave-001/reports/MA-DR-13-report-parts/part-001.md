```yaml
research_id: MA-DR-13
research_title: Long-Term Product Surface, Repository Topology, and Operational Architecture
target_project: Meta-Agent
report_role: external_research_evidence_non_execution_source
independence_contract_observed: true
```

# MA-DR-13 — 长期产品形态、仓库拓扑与运行架构选项

## 执行结论、范围与证据口径

### Executive verdict

**总体判定：`VIABLE_AS_STAGED_MULTI_SURFACE_SYSTEM_WITH_SINGLE_AUTHORITY_CORE`。**

Meta-Agent 对一位技术能力较强的单一 Owner 存在多种可行长期形态，但外部证据不支持现在就选择一个永久产品表面、永久仓库拓扑或永久运行提供方。更稳健的长期设计不是把 Chat、Git、database、retrieval、connectors 和执行工具合并为一个“万能应用”，而是保持一个**可迁移的 authority core**，再按需要增加可替换的交互与执行表面。

本研究的核心结论如下：

| 结论 | 证据分类 | 判定 |
|---|---|---|
| 产品 UI 不应同时充当唯一 durable truth、唯一 evidence store 和唯一 execution authority。 | `MULTI_SOURCE_PATTERN` | 采用为设计原则 |
| Meta-Agent 当前 file-based、human-reviewed、single-truth bootstrap 与长期可迁移架构相容，不需要为了“现代化”立即重建。 | `TARGET_SPECIFIC_INFERENCE` | 保持 no-migration 为有效选项 |
| 最值得早期原型化的不是完整 desktop/service，而是三个可独立验证的表面：repository-first manual、read-mostly local CLI、conversation surface as non-authoritative client。 | `RECOMMENDATION` | 原型候选，不是产品选择 |
| dedicated repository 的合理触发因素是 authority、access、release lifecycle、CI、backup 或 churn 的真实分离需求，而不是目录数量或产品身份本身。 | `MULTI_SOURCE_PATTERN` | 建立迁移门槛 |
| control、evidence、state、execution 四个 planes 应在逻辑上分开；bootstrap 阶段可物理共置部分文件，但 credentials、side effects 和 derived indexes 不应与 authoritative truth 混同。 | `MULTI_SOURCE_PATTERN` | 采用为设计原则 |
| RAG、vector retrieval、MCP-like interfaces、connectors、scheduled jobs、webhooks 和 writeback 都应是 capability modules，而不是 baseline prerequisites。 | `VERIFIED_PRIMARY_EVIDENCE` + `TARGET_SPECIFIC_INFERENCE` | 实验门控 |
| “hybrid”不是免成本答案。每增加一个运行表面，就增加同步、身份、权限、恢复、测试和版本兼容负担。 | `MULTI_SOURCE_PATTERN` | 每个模块单独证明价值 |
| 对单一 Owner，合理默认是“一个 authority core，少量 replaceable clients，最多一个 active execution path”；不是多服务、多数据库、多仓库同时起步。 | `RECOMMENDATION` | 候选默认，不是 target truth |

当前 Meta-Agent 的 Owner-accepted baseline 已明确：唯一指定 truth-source path、human review、无隐式 activation、无 private material、无默认 RAG/MCP/auto-writeback，并要求 migration mapping 与 rollback。该状态与本报告结论没有实质冲突。fileciteturn2file0L2-L2

### 定义

本报告使用以下术语：

| 术语 | 本报告定义 |
|---|---|
| **Product surface** | Owner 直接交互的入口，例如 conversational Project、CLI、desktop application、web UI 或 API client。 |
| **Durable truth** | 被明确指定、可版本化、可审查、可恢复，并具有最终运行权威的配置或规范。 |
| **Evidence plane** | research、source snapshots、experiment results、audit records、negative evidence 与 provenance；它支持决策但不自动成为 truth。 |
| **State plane** | current progress、job status、leases、queues、runtime observations、materialized views、indexes、caches 等可变状态。 |
| **Control plane** | product intent、methodology、policy、desired state、authority、approval、versioning、migration 和 rollback 决策。 |
| **Execution plane** | 实际调用模型、工具、filesystem、repository、network、connector、scheduler 或外部 side effect 的组件。 |
| **Canonical source** | 对某一类对象拥有最终权威的唯一声明位置。不同对象可以有不同 canonical stores，但同一对象不能同时有多个未经仲裁的 canonical writers。 |
| **Materialized view** | 从 canonical inputs 可重建的优化表示，例如 search index、summary、SQLite projection 或 vector index。 |
| **Repository topology** | authoritative files、runtime code、shared packages、target projects 与 large/private evidence 在一个或多个 repositories/storage systems 中的分布方式。 |

### 非目标与 authority boundary

本报告：

- 不选择永久 UI、repository、database、vector store、provider、framework 或 runtime。
- 不授权修改 `08822407d/Mnemosyne` 或创建新仓库。
- 不授权 private data ingestion、pilot、connector activation、scheduled job、writeback 或 runtime execution。
- 不把 research review、candidate ledger 或本报告提升为 Meta-Agent target truth。
- 不创建新的稳定 `MA-REQ`、`MA-PEND`、`MA-METHOD`、`MA-MIG`、schema 或 runtime IDs。
- 不假定 RAG、MCP、multi-Agent runtime、event sourcing、microservices 或 dedicated repository 是必要设施。
- 不从 visible model label 或 self-report 推断 exact served backend。

### 证据标签

报告中的 load-bearing judgments 使用以下标签：

- `VERIFIED_PRIMARY_EVIDENCE`
- `OFFICIAL_SPECIFICATION_OR_DOCUMENTATION_FACT`
- `MULTI_SOURCE_PATTERN`
- `INDUSTRY_PRACTICE`
- `TARGET_SPECIFIC_INFERENCE`
- `RECOMMENDATION`
- `UNRESOLVED`

“推荐”表示可供 Owner 比较的候选设计，不表示已获采纳。

## 仓库绑定、现状与目标映射

### Target/repository input-binding receipt

```yaml
repository: 08822407d/Mnemosyne
requested_ref: execution-time latest master
actual_ref_read: master@0865f334177e2ff0d81a3652ea9e3384e55f4259
commit_message: Merge pull request #245 from 08822407d/mnemosyne-188-fable-research-project-knowledge-surface
commit_observed_at_utc: 2026-08-04T00:47:52Z
mandatory_inputs_requested: 10
mandatory_inputs_read: 10
target_specific_mapping_status: AVAILABLE
blocked_by_missing_target_inputs: false
repository_writes_performed: false
sibling_wave_reports_used_as_inputs: false
```

读取的 commit SHA、message 与 canonical GitHub commit URL 已由 repository connector 确认。fileciteturn12file0L2-L6

| Mandatory input | 角色保留 | 读取结果 |
|---|---|---|
| `target-projects/meta-agent/current/approved-spec.md` | designated target truth path；当前 inactive | 已读取 |
| `target-projects/meta-agent/current/active-context.md` | current-state/navigation，非 execution source | 已读取 |
| `target-projects/meta-agent/authority/source-and-owner-map.md` | authority support record，非 truth source | 已读取 |
| `target-projects/meta-agent/methodology/core-methodology.md` | initial incomplete method library | 已读取 |
| `target-projects/meta-agent/history/decision-version-and-migration-log.md` | reviewed history、lineage、migration、rollback | 已读取 |
| `target-projects/meta-agent/research/reviews/MA-DR-01-05-cross-report-synthesis-v0.1.md` | research synthesis，非执行来源 | 已读取 |
| `target-projects/meta-agent/research/reviews/MA-DR-01-05-gap-analysis-v0.1.md` | research gap analysis，非执行来源 | 已读取 |
| `target-projects/meta-agent/research/batches/2026Q3-batch-a/reviews/MA-DR-06-07-cross-report-adjudication.md` | Batch-A non-execution adjudication | 已读取 |
| `target-projects/meta-agent/research/batches/2026Q3-batch-a/candidates/Batch-A-candidate-change-ledger.md` | candidate-only ledger | 已读取 |
| `notes/first-target-project-intake-records/meta-agent/meta-agent-v0.1-M0-requirements-and-authority-baseline.md` | historical intake/build baseline | 已读取 |

### 当前目标约束

`approved-spec.md` 将 Meta-Agent 定义为 long-lived、versioned、general-purpose Agent-design and methodology system；当前 baseline 是 Owner 接受但 inactive 的 design/governance baseline。它指定 `current/approved-spec.md` 为唯一 target truth-source path，并明确排除 implicit activation、private material、RAG、MCP、auto-indexing、auto-writeback、autonomous self-modification 和 unrestricted production claims。fileciteturn2file0L2-L2

`active-context.md` 显示 Meta-Agent 当前与 Mnemosyne 物理共仓，默认 product write root 为 `target-projects/meta-agent/`；没有 operational activation、pilot、private material 或 advanced automation。该文件本身只承担 navigation/current-state 作用。fileciteturn3file0L2-L2

`source-and-owner-map.md` 明确 Owner 对 product purpose、target truth、methodology promotion、privacy、repository/write scope、migration 与 operational acceptance 保留最终权威；platform permission 不等于 task authorization，read authority 不等于 write authority，新文件或新摘要也不会因“更新”自动获得更高权威。fileciteturn4file0L2-L2

`core-methodology.md` 已将“single Agent / simple workflow first”“source/memory/authority role separation”“bounded execution”“human promotion gate”作为 accepted-but-inactive method library 的组成部分。该方法库也明确列出 multi-Agent 的 coordination、state drift、privacy、handoff 和 debugging 成本。fileciteturn5file0L2-L2

`decision-version-and-migration-log.md` 已具备 stable identity、version set、old-to-new mapping、preserve/transform/recompute/retire、migration class 和 rollback boundary。对 storage/runtime platform 变更，它要求 data and authority mapping、export/recovery、staged validation 和 no dual truth；同时明确 public Git history 不能保证被擦除。fileciteturn6file0L2-L2

### 既有研究材料的非执行映射

既有 DR-01–05 synthesis 支持 human-governed、file-based、simple-first 方向，但没有证明 operational effectiveness，也没有决定物理 repository topology。它还明确识别了 memory rigor 与 administrative burden 之间的张力。fileciteturn7file0L2-L2

Gap analysis 将 exact SQLite need、memory layer 数量、approval density 和 seven-file burden 归类为应通过实验回答的问题，而不是由另一份 broad report 决定。fileciteturn8file0L2-L2

Batch-A adjudication 将 near-term useful product 描述为 design assistance 而非 autonomous redesign，并建议 durable design object 采用 declarative、typed、versioned、diffable 形式；其 risk ladder 仍将真实 tool/repository scope 标记为未授权。fileciteturn9file0L2-L2

Batch-A candidate ledger 中的 design synthesis、typed permissions、origin metadata、backend degraded semantics、anti-resurrection rollback 等均保持 candidate-only，不构成当前 requirements 或 methods。fileciteturn10file0L2-L2

M0 baseline 已把 long-term product surface、dedicated repository 和 automation/RAG/MCP/index/writeback 记录为 pending questions，并规定未来迁移后旧路径不得继续作为竞争 truth source。fileciteturn11file0L2-L2

### Meta-Agent-specific architecture invariants

以下映射属于 `TARGET_SPECIFIC_INFERENCE`，不是新 target truth：

| Invariant candidate | 对 Meta-Agent 的意义 |
|---|---|
| **One declared truth authority** | `approved-spec.md` 或未来经 Owner 迁移后明确指定的新路径保持唯一；chat、database、index、service state 都不得成为隐式第二 truth。 |
| **UI replaceability** | conversation、CLI、desktop 和 web service 应能在不迁移 authority core 的情况下替换。 |
