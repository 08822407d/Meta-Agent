  │    └─ 否
  │
  ├─ 是否需要独立 access/visibility、release cadence、
  │  CI secrets、backup boundary 或 repository administration？
  │    ├─ 否：继续 monorepo
  │    └─ 是：dedicated Meta-Agent repository 成为候选
  │
  ├─ 是否存在多个具有不同 authority/privacy/runtime lifecycle 的 target projects？
  │    ├─ 否：一个 dedicated Meta-Agent repo 可能足够
  │    └─ 是：评估 multi-repo + shared versioned contracts
  │
  └─ Parent 是否只需 pin 精确 external revision？
       ├─ 是：submodule 可评估
       └─ 否：使用普通 cross-repo reference 或 package version
```

#### Dedicated repository 的正向触发器

以下不是单独充分条件，但组合出现时会增强迁移理由：

| Trigger | 可观察证据 |
|---|---|
| Access-boundary mismatch | Meta-Agent 需要与 Mnemosyne 不同 visibility、collaborator 或 automation permissions |
| Independent release cadence | Meta-Agent 有独立 tags、releases、compatibility policy 与 deployment |
| CI isolation | Meta-Agent checks 显著拖慢/污染 Mnemosyne CI，或需要不同 secrets/runners |
| Churn/conflict | 两条工作流频繁修改相同 roots、产生 stale-base 或 review interference |
| Repository size/health | clone、fetch、search、Git object size 或 generated artifacts 出现实测问题 |
| Operational ownership | Meta-Agent 已有 daemon/service/package 需要独立 on-call、backup、security lifecycle |
| Disaster-recovery boundary | 需要独立 mirror、restore test、retention 或 offline bundle |
| Product handoff | Meta-Agent 需要被单独移交、开源、归档或部署 |

#### No-migration 的正当条件

dedicated repository **不必要**，如果：

- Meta-Agent 仍以低频、human-reviewed documents 为主；
- access 与 visibility 与 Mnemosyne 相同；
- 没有独立 release/runtime；
- path-level authority 已清楚；
- cross-area atomic changes 有实际价值；
- repository health 无实测问题；
- 第二仓的 administration、backup、CI 和 dependency coordination 成本超过收益。

这不是“暂时凑合”，而是一个有效、可长期维持的 topology。

### Candidate migration protocol

若 Owner 日后选择迁移，建议的非执行 protocol 为：

```text
inventory and freeze candidate
  -> classify every artifact by role
  -> define exact new canonical path
  -> create filtered history copy
  -> verify commits/files/hashes/links
  -> establish CI, permissions, backup and restore
  -> dry-run read-only consumers
  -> Owner cutover decision
  -> activate one new write path
  -> mark old path historical/tombstoned
  -> rebuild derived views
  -> verify no dual writers
  -> retain rollback window
```

关键要求：

- **Copy is not cutover**：创建新仓不自动改变 truth authority。
- **No live bidirectional truth sync**：短期 validation 可以比较两份副本，但只能有一个 active writer。
- **Old path tombstone**：旧路径保留 migration pointer、last authoritative commit、new canonical location 和 status；不继续更新完整镜像。
- **Cross-repo references are versioned**：Mnemosyne 应引用 Meta-Agent repository URL + commit/tag，而不是模糊的 `latest`。
- **Rollback is tested**：在 cutover 前确认旧路径或 migration branch 可恢复。
- **History completeness is explicit**：GitHub 的 folder split 不自动携带所有 branches/tags。citeturn11search0

### Failure modes and negative evidence

| Failure mode | 典型原因 | 后果 | Containment |
|---|---|---|---|
| **Chat becomes shadow truth** | Owner 在 conversation 中修改目标但未进入 canonical review | fresh session 无法恢复一致状态 | chat output 必须标 candidate；采用 explicit diff/promotion |
| **Database and Git dual-write** | service 同时更新两者，无 transaction boundary | divergence、last-write ambiguity、rollback 困难 | 单 canonical writer；另一侧 projection/export |
| **Derived index treated as truth** | search result 更新更快或更方便 | stale/omitted content 控制决策 | 每条 result 携带 source revision；index 可丢弃重建 |
| **Repository split by aesthetics** | 将 product identity 等同于 repo identity | 第二套 admin/CI/backup，无实际隔离收益 | 要求 measurable trigger |
| **Submodule operational trap** | operators 未掌握 init/update/detached HEAD | stale dependency、错误 commit、broken clone | 仅用于真实 pinned dependency |
| **Microservice over-decomposition** | 把 logical planes 误解为每个一个 service | auth、network、deployment、monitoring burden | 先 modular monolith/local process；有 load/ownership 证据再拆 |
| **RAG quality illusion** | 检索到内容即假定 answer grounded | noisy context、missed evidence、hallucination | retriever/generator 分层测试；source binding；manual fallback |
| **Prompt injection through evidence** | retrieved content 混淆 data/instructions | data theft、tool misuse、policy bypass | untrusted-content marking、tool isolation、least privilege、human approval |
| **Connector token passthrough** | client 将外部 token 直接转发给 server | token theft、audience confusion | OAuth audience validation、no token passthrough、scoped credentials |
| **Scheduler creates invisible authority** | unattended job 根据 stale state 执行 | unauthorized writes、repeated side effects | explicit job manifest、expiry、idempotency、kill switch、audit |
| **Backup without restore test** | 只复制 Git 或 database dump | 灾难时发现 LFS、secrets、config、hooks、external evidence 缺失 | restore drills 与 dependency inventory |
| **Provider-native export is incomplete** | chats/files/tools/state 分散在平台内部 | vendor exit 后无法重建行为 | canonical open formats、adapter contracts、offline runbook |
| **Event log replay resurrects revoked state** | replay 未处理 tombstones/retirements | 已撤销 permissions/methods 重新生效 | semantic tombstone、dependency-aware rebuild、post-restore validation |
| **Human governance overload** | 每个动作都要求高成本 artifact | Owner 绕过流程或 context 过期 | risk-tiered review；测量 review time；删除无价值 ceremony |

MCP authorization specification 的 OAuth 2.1/PKCE、HTTPS、token handling 等要求，以及其 security guidance 对 token audience、token passthrough 和 attack vectors 的警告，说明标准化 tool interface 并没有消除 credential 与 confused-deputy 风险。citeturn3search5turn3search7turn3search16

## 分阶段架构、触发器与原型计划

### Minimal bootstrap profile

```yaml
profile_name: minimal_bootstrap
product_surfaces:
  authoritative: repository_first_manual
  optional_clients:
    - conversational_review_surface
    - text_editor_or_IDE
control_plane:
  storage: versioned_files
  authority: Owner_reviewed_change
evidence_plane:
  storage:
    - repository_public_safe_material
    - external_safe_pointers
state_plane:
  storage:
    - active_context_file
    - handoff_file
    - ephemeral_local_scratch
execution_plane:
  active_runtime: none_required
  permitted_prototype_behavior:
    - read
    - lint
    - generate_candidate_diff_without_writeback
retrieval:
  required: false
connectors:
  required: false
scheduled_jobs:
  required: false
writeback:
  required: false
```

**适用条件：** case volume 低、更新频率低、Owner 能手动 review、无需 unattended operation、无 private material、无需多设备 continuous access。

**进入该阶段不需要 migration。** 这基本延续当前 baseline，并允许增加不会改变 authority 的 local lint/search 工具。

**从该阶段升级的触发器：**

- 每次 fresh-session navigation 消耗不可接受；
- full-text search 或 cross-file validation 的人工成本可测量地升高；
- 重复的 schema/path/version checks 已稳定且适合自动化；
- 有多个 recurring workflows，但仍不需要 unattended side effects；
- Owner 能定义 bounded CLI contract 与 stop conditions。

**停止或回退条件：**

- generated candidates 经常需要大量人工重做；
- local tooling 产生 hidden state；
- review burden 没有下降；
- automation 无法可靠区分 evidence、candidate 和 truth；
- 引入 tooling 后恢复过程反而更复杂。

### Bounded personal-production profile

```yaml
profile_name: bounded_personal_production
product_surfaces:
  core:
    - repository_or_explicit_canonical_store
    - local_CLI
  optional:
    - local_desktop_shell
    - conversational_client
control_plane:
  representation:
    - versioned_open_files
    - machine_validatable_schema
evidence_plane:
  representation:
    - source_manifests
    - structured_run_receipts
state_plane:
  candidate_components:
    - local_SQLite_or_equivalent
    - rebuildable_full_text_index
    - explicit_job_history
execution_plane:
  mode:
    - local_bounded_process
    - exact_allowlisted_tools
  network_default: denied_or_task_scoped
  writeback_default: proposal_only
```

该 profile 不要求 dedicated repository。是否拆仓取决于前述 migration triggers。

合理的 capability modules 包括：

- schema and link validation；
- repository status receipt；
- local full-text search；
- source revision tracking；
- candidate package generation；
- deterministic export/import；
- backup/restore verification；
- manually triggered bounded jobs。

SQLite FTS5 等 local search 可以先验证 keyword/phrase retrieval 的实际价值，而不必直接部署 vector infrastructure。citeturn4search4

**进入触发器：**

- bootstrap prototypes 在 synthetic/public tasks 上显示稳定节省；
- candidate output 的 boundary adherence 达到预定义门槛；
- restore test 已通过；
- authoritative files 与 derived state 的关系已机器可检验；
- Owner 明确允许 exact local operations。

**退出或升级触发器：**

- 需要跨设备或远程持续可用；
- 需要 unattended schedules/webhooks；
- local process 的 concurrency、locking 或 availability 成为瓶颈；
- 多个 clients 需要共享同一 active state；
- connector integration 的价值超过 credential/security burden；
- 独立 release/CI/access 已达到 dedicated repo 门槛。

**停止条件：**

- CLI 拥有比 task manifest 更大的默认权限；
- database 成为 undocumented truth；
- local state 无法从 export 恢复；
- automatic writeback 导致未经 review 的 truth change；
- credential、network 或 external side effect 没有 audit trail。

### Expanded-service profile

```yaml
profile_name: expanded_service
product_surfaces:
  - web_or_desktop_client
  - API_orchestrator
  - CLI_client
control_plane:
  deployment: logically_separate_service_or_module
  policy:
    - typed_authority
    - approval_workflow
    - versioned_contracts
evidence_plane:
  deployment:
    - immutable_or_append_reviewed_evidence_store
    - audit_and_observability_backend
state_plane:
  deployment:
    - durable_job_state
    - queue_or_scheduler_state
    - rebuildable_search_indexes
execution_plane:
  deployment:
    - sandboxed_workers
    - scoped_service_identities
    - connector_adapters
    - explicit_side_effect_gateway
```

该 profile 只在需求出现后成立，不是“成熟产品必然形态”。

**必要先决条件：**

- 明确 SLO、RPO、RTO 与 availability need；
- service identity、authentication、authorization、secret rotation；
- API versioning 与 degraded-mode contract；
- idempotency、retry、deduplication 与 side-effect confirmation；
- telemetry、audit、security tests；
- provider/export exit test；
- service deployment 与 restore runbook；
- Owner 能承担 recurring operational maintenance。

**进入触发器：**

