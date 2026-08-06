- [ ] Reproducible Builds 的核心标准是相同 source、build environment 和 instructions 应产生 bit-for-bit identical artifacts；对非确定性模型输出，Meta-Agent 至少应保存 prompts、inputs、versions、seeds/budgets（如适用）与 verifier evidence。citeturn6search3
- [ ] 可选 software supply-chain metadata 可考虑 SLSA provenance、SPDX 或 CycloneDX，但只在实际 code/artifact delivery 出现后引入。SLSA v1.2、SPDX 3.0 与 CycloneDX 1.7 都提供当前开放 provenance/SBOM 表达选项。citeturn7search4turn7search15turn7search0
- [ ] SBOM/provenance 本身也要备份并与 artifact digest 绑定。

### Administrative、cost and maintenance burden

#### 相对负担模型

| Option | Initial build | Recurring maintenance | Security burden | Recovery burden | Human review load | 对单一 Owner 的主要风险 |
|---|---:|---:|---:|---:|---:|---|
| Repository-first manual | 低 | 低 | 低 | 低 | 中高 | ceremony 或 navigation 过多 |
| Repository + local CLI | 中 | 中低 | 中 | 中低 | 中 | hidden local state、shell scope |
| Conversation companion | 低 | 低 | 中 | 中 | 中 | shadow truth、platform dependency |
| Desktop app | 高 | 中高 | 中高 | 中 | 低到中 | packaging/update 成本不成比例 |
| Local service | 中高 | 中高 | 高 | 中高 | 中低 | daemon、auth、backup、schema migrations |
| Hosted service | 高 | 高 | 高 | 高 | 中低 | recurring operations 与 vendor lock-in |
| API/orchestrator | 高 | 高 | 高 | 高 | 中 | retries、idempotency、state retention |
| RAG/vector layer | 中到高 | 中高 | 高 | 中 | 可能降低 navigation | evaluation、poisoning、rebuild |
| Connectors/MCP | 中 | 高 | 很高 | 中 | 可能降低手工输入 | credentials、prompt injection、side effects |
| Multi-repo | 中 | 中高 | 可改善隔离 | 高 | 中 | version drift、cross-repo coordination |
| Submodules | 中 | 中高 | 可改善隔离 | 中高 | 中高 | detached/stale state、双 commit |

#### 成本不只包括 infrastructure

对 Meta-Agent，真实 total cost 应至少记录：

```text
subscription and API cost
+ build and migration time
+ dependency update time
+ security review
+ backup and restore testing
+ incident/debugging time
+ Owner approval time
+ false-success verification
+ stale-state cleanup
+ vendor-exit preparation
+ opportunity cost
```

一个“免费”的 local service 仍可能有高 maintenance cost；一个付费 hosted Project 也可能因降低交互成本而有净收益。两者都需要通过真实 prototype 数据判断。

#### Human review load

Owner review 应按风险分层：

| Change class | 合理 gate |
|---|---|
| Read-only search、formatting、derived rebuild | mechanical checks + sample review |
| Candidate draft、non-authoritative summary | source binding + semantic review |
| Methodology candidate | evidence diversity + contradictions + Owner decision |
| Target truth change | explicit diff、authority check、version/migration assessment |
| External write/tool action | exact scope、approval、side-effect receipt、rollback |
| Privacy/access/credential change | highest gate；不可由 routine automation批准 |

`RECOMMENDATION`：每个 prototype 都记录“系统节省了多少 Owner 时间”和“验证系统输出用了多少 Owner 时间”。若 verification/rework 接近或超过节省，automation 不应升级。

### Candidate decision framework

建议 Owner 对任何 architecture candidate 使用加权之前先设 hard gates。Authority、privacy、recoverability 和 no-dual-truth 不应被低 cost 或 convenience 抵消。

#### Hard feasibility gates

```yaml
must_pass:
  - one_declared_authoritative_write_path
  - complete_export_of_required_truth
  - tested_restore_or_rebuild
  - explicit_credential_and_side_effect_boundary
  - no_automatic_methodology_promotion
  - graceful_degradation_to_reviewable_core
  - no_private_material_without_separate_approval
  - bounded_owner_authorization
```

#### Comparative dimensions

| Dimension | 问题 |
|---|---|
| Cost | direct spend 与 Owner time 是否可接受？ |
| Latency | interaction、search、execution 和 approval latency 是否满足需要？ |
| Reliability | failures 是否 detectable、contained、retry-safe？ |
| Security | least privilege、identity、untrusted input、secret handling 是否充分？ |
| Maintainability | 一位 Owner 能否更新、debug、patch、document？ |
| Observability | 能否解释读取了什么、做了什么、为何失败？ |
| Testability | 能否用 synthetic/public fixtures 重现？ |
| Migration burden | old-to-new mapping、cutover、rollback 成本是多少？ |
| Review load | automation 是否真正减少 human rework？ |
| Portability | provider、UI、repository host 或 runtime 是否可替换？ |
| Recovery | clean environment 能否重建？ |
| Learning value | 是否保留 Owner 的 architecture、engineering 和 judgment 参与？ |

#### Decision evidence package

每个候选应至少产出：

```yaml
candidate:
problem_observed:
baseline:
proposed_surface_or_topology:
authority_model:
data_and_state_model:
execution_boundary:
dependencies:
measured_benefit:
measured_cost:
negative_results:
security_findings:
backup_and_restore_result:
vendor_exit_result:
stop_conditions:
rollback:
unresolved_owner_choices:
```

### Externally researchable facts versus Owner decisions

| 可由外部研究支持的事实 | 必须由 Owner 决定的事项 |
|---|---|
| Git/submodule/filter-repo/mirror 的行为和限制 | 是否接受第二仓的管理负担 |
| Hosted Projects、API、CLI、MCP 的当前 capability facts | 偏好的日常交互 surface |
| RAG、long-context、prompt-injection 的 empirical limits | 是否有足够 search pain 值得引入 retrieval |
| Zero Trust、OAuth、observability、backup standards | 哪类风险和 residual risk 可接受 |
| Monorepo/microservice/CQRS 的典型 trade-offs | desired review density、latency 与 automation level |
| Open formats、schema、artifact standards | 未来 canonical storage 的具体选择 |
| Repository split 可保留哪些 Git history | 何时将 dedicated repo 的收益判定为超过迁移成本 |
| Restore 与 contingency-planning practices | RPO、RTO、retention 与 backup locations |
| Connector/token security requirements | 哪些 connectors 或 write scopes 可以启用 |
| API/provider state-retention facts | 允许哪些 data classes 进入 hosted surfaces |
| Tool execution attack surface | 哪些 operations 保留 human-only |
| UI/client 可替换的架构模式 | 是否建设 desktop、local service 或 hosted service |

### Unresolved questions and Owner decisions

`UNRESOLVED`：

- 实际 Meta-Agent case volume、update frequency 和 session-resumption frequency 尚无运行数据。
- current seven-file structure 的真实 review burden 尚未测量。
- repository search/navigation 是否已构成足以引入 index 的痛点尚未知。
- Owner 对 local CLI、desktop、hosted service 的 UX 偏好尚未通过 prototype 比较。
- future private material 的 exact storage 与 access model 不在本研究范围内。
- provider/model/tool routing policy 不在本研究范围内。
- 是否需要 remote/unattended operation 尚无 evidence。
- dedicated repository 是否改善权限、CI、backup 或产品生命周期，尚无实际需求数据。
- RPO、RTO、budget、monthly maintenance tolerance 与 acceptable review time 尚待 Owner 定义。
- 是否需要对 external evidence 做 content-addressed storage、LFS、object store 或只保存 pointer，取决于材料规模和授权。
- 是否需要 event log、queue、scheduler 或 service database，取决于 future execution frequency 和 side-effect requirements。
- 是否允许任何 automatic writeback，必须经过单独 Owner authorization；本报告不支持默认开启。

需要 Owner 将来做出的候选决策包括：

| Owner decision | 可延后到何时 |
|---|---|
| 首批 prototype surface 的选择 | 在任何 product implementation 前 |
| 是否继续 no-migration | 可持续保持，直到出现实测 trigger |
| dedicated repo migration gate | access/release/CI/DR 问题出现后 |
| canonical format/schema | machine tooling 开始写候选对象前 |
| local state store 是否必要 | manual/CLI prototype 后 |
| retrieval 类型 | keyword baseline 不足后 |
| connectors/MCP | exact integration use case 与 threat model 后 |
| scheduler/webhooks | recurring unattended use case 后 |
| writeback authority | bounded pilot 与 rollback contract 后 |
| hosted service | remote availability 需求和 operating budget 明确后 |
| backup RPO/RTO | 任何 operational activation 前 |
| degraded offline mode 的最低能力 | provider-dependent workflow 投产前 |

## Portable sources and final disposition

### Portable source table

以下表格保留 direct URLs、identifiers、版本或日期、支持的 claims 与限制。产品文档中的 capability facts 可能变化，实施前应重新 freshness-check。

| Source title | Direct URL / identifier | Version/date | Claims supported | Limitations |
|---|---|---|---|---|
| **Monorepos** | https://doi.org/10.1145/2854146 | ICSE-SEIP 2016 | common source of truth、cross-project visibility、monorepo engineering experience | Google-specific scale and tooling；不是 universal prescription。citeturn1search20 |
| **Git - git-submodule Documentation** | https://git-scm.com/docs/git-submodule | Current web documentation, accessed 2026-08-04 | parent pins submodule commit；init/update/sync 与 detached-state behavior | 不量化 Owner maintenance cost。citeturn0search0 |
| **Splitting a subfolder out into a new repository** | https://docs.github.com/en/get-started/using-git/splitting-a-subfolder-out-into-a-new-repository | Accessed 2026-08-04 | `git filter-repo` split，history preservation，branches/tags caveat | 不处理 authority cutover、issues、CI、secrets。citeturn11search0 |
| **Duplicating a repository** | https://docs.github.com/en/repositories/creating-and-managing-repositories/duplicating-a-repository | Accessed 2026-08-04 | bare/mirror clone、mirror push、LFS-specific steps | mirror 不是完整 application backup。citeturn11search1 |
| **Repository limits** | https://docs.github.com/en/enterprise-server@3.19/repositories/creating-and-managing-repositories/repository-limits | GitHub Enterprise Server 3.19 documentation | oversized repositories and generated/large-file concerns | Enterprise-specific recommendations；当前 Mnemosyne health 未测量。citeturn1search0 |
| **About Git Large File Storage** | https://docs.github.com/en/repositories/working-with-files/managing-large-files/about-git-large-file-storage | Accessed 2026-08-04 | pointer file + external object model | LFS 不解决 privacy、retention 或 authorization。citeturn1search7 |
| **git-bundle Documentation** | https://git-scm.com/docs/git-bundle | Current documentation | offline/full/incremental Git transfer；bundle omissions | 不包含 working tree、index、stash、config、hooks。citeturn5search0 |
| **Kubernetes Components** | https://kubernetes.io/docs/concepts/overview/components/ | Current documentation | control plane manages cluster state；worker execution separation | Kubernetes-scale example，不表示 Meta-Agent 应采用 Kubernetes。citeturn2search0turn2search6 |
| **Zero Trust Architecture** | https://csrc.nist.gov/pubs/sp/800/207/final | NIST SP 800-207, Aug. 2020; DOI 10.6028/NIST.SP.800-207 | no implicit trust by location；explicit authentication/authorization | high-level architecture，需转换为具体 controls。citeturn2search2 |
