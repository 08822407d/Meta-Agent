| Target truth | Control | Bootstrap 中与 reviewed history 同仓 | 与 runtime mutable state、cache、embedding 和 tool output 分离 |
| Methodology | Control | 可与 target truth 同仓但不同 role/path | 不得由 project feedback、retrieval ranking 或 model output 自动 promotion |
| Raw sources、research、negative evidence | Evidence | Public/synthetic evidence 可与 control files 同仓 | large、private、licensed 或 mutable external evidence 应用 pointers/外部存储 |
| Current work status | State | 可使用 `active-context.md` 等轻量文件 | high-frequency job state 不应频繁污染 Git history |
| Search index、embeddings、summary | State/derived | 小型 local index 可放 ignored/build directory | 不得成为 canonical writer；model/chunking 变化后应可重建 |
| Scheduling、queue、leases | State | Bootstrap 可完全没有 | 有 unattended jobs、parallel workers 或 retries 时需要独立 durable state |
| Credentials、tokens | Execution security substrate | 不应与 repository truth 共置 | secret store/environment/OS keychain；最小权限与 rotation |
| Tool/model execution | Execution | 小型 local script 可与 source code 同仓 | 执行进程、network、filesystem write 与 control files 的 authoring authority 分离 |
| Audit、run receipts | Evidence + State | 低频 run 可产生 reviewed log | 高频 telemetry 与 immutable evidence 应避免混成单一 mutable table |
| Rollback | Control governs；Execution performs | File-only change可由 Git commit/tag 支持 | data/schema/runtime migration 需独立 backup、restore、cutover 和 verification |
| Observability | Cross-cutting | CLI 输出与 structured logs 足够时无需 platform | 多进程/服务后应统一 traces、metrics、logs；OpenTelemetry 提供 vendor-neutral instrumentation model。citeturn2search7turn2search10 |

关键边界是：

```text
evidence may influence a proposal
but cannot directly become target truth

state may report what happened
but cannot decide what is authorized

execution may perform an allowed action
but cannot enlarge its own authority

a UI may request a change
but cannot silently become the canonical writer
```

### State and truth topology

建议比较以下五层，而不是比较“Git 还是 database”这一个过度简化的问题：

| 层 | 内容 | 权威性 | 更新方式 | 恢复方式 |
|---|---|---|---|---|
| **Canonical truth** | approved spec、policy、method refs、schema/version decisions | 高 | Owner-authorized reviewed change | Git history、signed/exported snapshots、migration map |
| **Evidence record** | sources、experiments、reviews、negative cases、audit | 支持性，不自动执行 | append/review/correction | preserve originals或safe pointers；完整 manifest |
| **Current operational state** | active task、job status、last run、health、pending approvals | 中低，易过期 | runtime/manual update | reconstruct where possible；snapshot where necessary |
| **Derived views** | summary、search index、SQLite projection、dashboard、embedding | 无独立权威 | refresh/rebuild | 从 source revision 重建 |
| **Ephemeral state** | temp files、locks、session cache、scratch prompts | 无权威 | runtime | 丢弃或自动重建 |

#### 避免 dual truth 的写入规则

`RECOMMENDATION`：

```text
Owner-approved change
  -> one canonical write
  -> commit/version receipt
  -> derived refresh request
  -> indexes/views rebuilt
  -> verification against canonical revision
```

不建议：

```text
chat edits spec
and database edits spec
and Git syncs later
```

也不建议：

```text
service writes both Git and database
then treats whichever is newer as truth
```

如确需 database-backed authoring，应先明确 database 是 canonical source，Git 只是 export；或 Git 是 canonical source，database 只是 projection。不能让“last-write-wins”隐式决定 authority。

#### Single truth 不等于 single storage system

一个系统可以使用多个存储位置而不产生 dual truth。例如：

- Git：canonical policy/spec。
- Object storage：large evidence，Git 中保存 content hash 与 pointer。
- SQLite/PostgreSQL：current state 或 materialized search view。
- Secret store：credentials。
- Log store：telemetry。

关键不是所有字节都在同一个地方，而是每种对象都具有**唯一 owner、唯一 authoritative write path、明确 derivation 和明确 recovery contract**。

#### Event log 的适用边界

Event log 适合记录：

- job requested；
- approval granted；
- tool call attempted；
- external side effect confirmed；
- index built from revision；
- migration cutover completed。

但对于一位 Owner 的早期 Meta-Agent，完整 event sourcing 通常不值得，除非出现以下需求：不可丢失的 long-running workflows、复杂 replay、并发 writers、强审计、跨服务 reconciliation 或需要从 events 重建 state。否则，Git history + structured run receipts + current-state projection 足以提供更低的维护负担。此判断受到 CQRS/eventual-consistency 复杂性证据支持。citeturn5search2

## 仓库拓扑、迁移门槛与失败模式

### Repository-topology comparison

| Topology | Authority clarity | Atomic cross-area change | Access control | CI/release independence | Discoverability | Migration burden | One-owner operational burden |
|---|---|---:|---:|---:|---:|---:|---:|
| **Current monorepo bootstrap** | 高，若路径角色清晰 | 高 | 低到中，通常 repo-level | 低到中 | 高 | 无 | 低 |
| **Dedicated Meta-Agent repository** | 高 | 与 Mnemosyne 的跨仓 atomicity 降低 | 高 | 高 | 中 | 中 | 中 |
| **Multi-repository per target project** | 各项目内高 | 低 | 高 | 高 | 低到中 | 高 | 高 |
| **Git submodule** | parent pin 很清晰 | 低；需协调两个 commits | 高 | 高 | 中低 | 中 | 高 |
| **Git subtree / vendored snapshot** | 中；copy 与 upstream 易混淆 | parent 内高 | 中 | 中 | 中 | 中 | 中高 |
| **Package/artifact publishing** | interface 层清晰 | 通过版本而非 commit atomicity | 高 | 高 | 中 | 中 | 中 |
| **External storage pointers** | 指针明确时高 | metadata 可原子变更；payload 外部 | 高 | 独立 | 中 | 低到中 | 中 |

#### Current monorepo bootstrap

Google 的 monorepo engineering paper 描述了 common source of truth、cross-project changes 和 discoverability 的价值，但其成功依赖大量 custom tooling、large-scale infrastructure 与组织实践；不能把 Google 的规模结论直接外推为“所有项目都应 monorepo”。citeturn1search20

对当前 Meta-Agent，monorepo 的现实优势是：

- authority/history/research/context 可以在一个 commit 中一致更新；
- 没有跨仓 version coordination；
- Owner 只维护一个 clone、backup、issue/PR environment；
- 目前 path boundary 已相当明确。

其缺点是：

- Meta-Agent 与 Mnemosyne 的 lifecycle、visibility 和 CI 仍绑定；
- repository-level permissions 难以针对 Meta-Agent 独立收紧；
- repository discovery/search 可能被大量无关内容干扰；
- Meta-Agent 的 product identity 与 release process 不独立。

GitHub 官方说明大型 repository 会带来 health、clone、push 和 maintenance 问题，并建议将 generated files 或不适合 Git 的大型内容移出普通 Git objects。当前 Mnemosyne 是否已经达到需要拆分的规模，不能仅凭目录结构推断。citeturn1search0

#### Dedicated Meta-Agent repository

dedicated repo 的主要价值不是“更整洁”，而是建立独立：

- visibility/access policy；
- issue/release/CI lifecycle；
- backup and disaster-recovery scope；
- contributor or automation permission；
- code ownership；
- product version cadence。

代价包括：

- Mnemosyne control-plane record 与 Meta-Agent truth 的跨仓引用；
- 跨仓 changes 不再是单一 atomic commit；
- migration history、tags、branches、links、CI secrets 和 issue references 需要处理；
- Owner 要维护第二套 repository administration。

GitHub 官方支持通过 `git filter-repo` 将 subfolder 保留历史地拆成新 repository，但新仓不会自动继承原仓所有 branches 和 tags，因此 migration manifest 仍需明确哪些 refs、issues、releases 与 metadata 被保留或重新建立。citeturn11search0

#### Multi-repository target-project layout

多仓适合：

- target projects 有不同 privacy/access boundaries；
- release cycles 真正独立；
- 每个 project 都有自己的 runtime/code/data lifecycle；
- shared methodology 已稳定为 versioned package/spec。

不适合：

- 只有一位 Owner；
- projects 数量少；
- shared files 高频协同修改；
- 没有自动 dependency update、compatibility testing 与 cross-repo search；
- 主要工作仍是文档审查。

`TARGET_SPECIFIC_INFERENCE`：Meta-Agent 当前尚无证据表明 project volume、access diversity 或 independent release cadence 已达到 multi-repo 的收益门槛。

#### Submodules

Git submodule 在 parent repository 中记录另一个 repository 的特定 commit，因此可提供精确 dependency pinning；但操作员必须处理 init/update/sync、detached HEAD 和双仓 commits。citeturn0search0

对 Meta-Agent，submodule 只有在以下条件同时成立时才合理：

- Mnemosyne 必须精确 pin 一个 externally versioned Meta-Agent release；
- Meta-Agent repo 有独立 lifecycle；
- Owner 愿意承担双 commit、update 和 detached-state troubleshooting；
- parent 不需要频繁 atomic edit submodule 内部内容。

将 submodule 仅用于“目录分离”通常是过度复杂。

#### Subtree 或 vendored snapshot

subtree/vendor copy 使 parent repository 保有完整文件，可在 parent 内 atomic change，但 upstream synchronization、history provenance 和 local modifications 容易变得不清楚。它适合作为发布 snapshot 或低频 vendor dependency，不适合作为双向共同编辑的 truth topology。

#### Package/artifact publishing

当真正需要共享的是 schema、CLI、validators、templates 或 runtime components，而不是整个 product repository 时，发布 versioned package/artifact 可能优于 repo split。

OCI specifications 定义了开放的 image、runtime 和 distribution contracts；OCI 1.1 artifact capabilities 还支持 `artifactType`、`subject` 和 referrers，用于在 registry 中关联非-container artifacts。它证明“versioned artifact interface”可以独立于 source repository，但不要求 Meta-Agent 使用 OCI。citeturn1search2turn1search3turn1search8

#### External storage pointers

Git LFS 用 pointer file 代替大对象本体，是 external payload + Git metadata 的典型模式。需要注意，Git repository backup 与 LFS object backup 是不同事项。citeturn1search7

对 private、large、mutable 或 licensed evidence，更通用的 pattern 是在 Git 中保存：

```yaml
artifact_id:
role:
storage_class:
external_location_or_resolver:
content_hash:
size:
media_type:
created_at:
access_boundary:
retention:
redaction_status:
```

pointer 不能隐藏未经授权的 sensitive payload，也不能因为 payload 不在 Git 就省略 access、backup 和 deletion policy。

### Migration decision tree

```text
START
  │
  ├─ 当前 monorepo 是否出现实证问题？
  │    ├─ 否：保持现状；定期复核，不迁移
  │    └─ 是
  │
  ├─ 问题是否可由 path rules、CODEOWNERS、CI path filters、
  │  archive rules、external pointers 或 local tooling 解决？
  │    ├─ 是：保持 monorepo，修复局部问题
  │    └─ 否
  │
  ├─ 主要需求只是共享 executable/schema/template？
  │    ├─ 是：发布 versioned package/artifact；不必拆 truth repo
