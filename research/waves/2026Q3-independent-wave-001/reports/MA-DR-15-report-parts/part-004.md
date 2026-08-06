**Multi-model review and heterogeneity**

Multi-model review 只有在至少一个以下机制成立时才值得额外成本：不同模型具有经过任务相关测试的 failure complementarity；reviewer 使用不同 evidence channel 或 deterministic oracle；一个模型负责 proposal，另一个只接收 clean specification 而不共享 producer’s hidden assumptions；或不同工具／权限边界带来真正的功能分离。Mixture-of-Agents 和 debate research 表明集成可能提高某些 benchmark；但 OneFlow 表明 homogeneous role splitting 经常只是同一模型的昂贵展开。citeturn16academia48turn16academia49turn14academia48

下列情况不得标记为 independent review：

* 同一 alias 的多个 sessions，而 backend identity 未 attested；
* 不同 visible labels，但 provider 未证明 underlying backend 不同；
* producer 与 reviewer 使用相同 retrieved evidence、相同 prompt template 和同一 judge；
* reviewer 只重写 producer output，没有独立重做关键推理或验证；
* 两个模型都由同一 LLM judge adjudicate，而该 judge 与候选共享 model family；
* 多个 Agent 共享被污染的 memory、capability matrix 或 evaluator。

LLM-as-a-Judge 的 self-enhancement、position 和 verbosity bias 表明，同一 model family 同时担任 producer、reviewer 和 final judge 会制造 correlated confidence。citeturn16academia51 因此，backend identity unknown 时可以称为“additional review sample”，不能称为“independent model review”。

## Meta-Agent 映射、冲突证据示例与实施依赖

**Meta-Agent-specific mapping**

| 本报告候选原则 | 当前 Meta-Agent 对应位置 | 状态 |
|:--|:--|:--|
| Provider-neutral atomic capability claims | `MA-REQ-0011` capability-aware split；不永久绑定品牌。fileciteturn2file0L2-L2 | 与 target baseline 一致；具体 schema 未采用。 |
| Authority/privacy/permission hard gates | Owner map 与 repository action context。fileciteturn4file0L2-L2 | 已有原则；route-engine representation 仍为 candidate。 |
| Freshness、scope、date 和 backend non-attestation | Source/owner map 的 external-fact rules。fileciteturn4file0L2-L2 | 已有原则；TTL 与 claim lifecycle 未定。 |
| Frontier / next-tier / mechanical / human split | Approved spec 和 `MA-METHOD-0004`。fileciteturn2file0L2-L2 fileciteturn5file0L2-L2 | 已接受为 inactive method baseline；route thresholds 未验证。 |
| Typed permission and side effects | Batch-A `CAND-TYPED-PERMISSION-SIDE-EFFECT`。fileciteturn10file0L2-L2 | Candidate only。 |
| Backend unsupported/degraded semantics | Batch-A `CAND-BACKEND-DEGRADED-SEMANTICS`。fileciteturn10file0L2-L2 | Candidate only。 |
| Origin、scope、freshness、allowed influence | `CAND-ORIGIN-ALLOWED-INFLUENCE`。fileciteturn10file0L2-L2 | Candidate only。 |
| Strong simple baseline before multi-agent | Core methodology + Batch-A adjudication。fileciteturn5file0L2-L2 fileciteturn9file0L2-L2 | 设计原则强支持；实验阈值未定。 |
| Risk-tiered validation | Batch-A tier ladder。fileciteturn9file0L2-L2 | Candidate experimental structure。 |
| Change log、version、rollback | Decision/version/migration log。fileciteturn6file0L2-L2 | Existing governance baseline，可扩展但不可由本报告修改。 |

因此，本报告不要求 rollback 当前 v0.1 baseline。它填补的是 operationally useful routing governance 的设计空白：现有文件已声明 capability-aware routing 和 freshness 原则，但尚未定义原子 capability ontology、claim expiry、conflict handling、fallback guarantee object 或 lightweight validation schedule。

**Worked example：incomplete and conflicting evidence**

假设任务为：

```yaml
goal: 读取一个 public repository 和最新公开文档，生成机器可验证的 change proposal
repository_write_authorized: false
private_material_allowed: false
required_output: schema-conformant JSON plus human-readable explanation
preferred:
  - lower cost
  - completion under ten minutes
  - independent review where genuinely available
```

候选 evidence 如下：

| Candidate | Evidence | 问题 |
|:--|:--|:--|
| `model_route_A` | Official docs 三天前声明当前 API surface 支持 structured output；45 天前 local test 在 consumer UI surface 出现 schema failure。 | Scope 不同且 local test stale；证据不是直接矛盾，而是 surface mismatch。 |
| `model_route_B` | Pinned snapshot 的 benchmark 和 schema test 良好。 | 当前用户 account、region 和 subscription availability unknown。 |
| `repository_reader` | Exact repository/ref read 已在当前 connector session 验证。 | Read only；tool description 还声称支持 write，但本任务不授权 write。 |
| `review_route_C` | Visible label 与 A 不同。 | Underlying backend 和 evaluator lineage unknown；不能声称 independent。 |

正确 route decision 不是把四项证据转成平均分，而是：

1. **Authority gate**：所有 repository write operations 被 filter，无论 connector 是否技术上支持 write。  
2. **Material gate**：只允许 public repository 和 public docs；禁止把 private account data 发送给模型。  
3. **Required capability gate**：A 的 structured-output claim 尚未在本次 API surface 验证，因此执行一个无敏感数据的 bounded schema probe。B 的 current availability 进行 JIT read-only check。  
4. **Tool route**：repository_reader 只调用已验证的 exact-ref read operations。其 write description 不进入 route candidate。  
5. **Scoring**：若 A 通过 schema probe，且质量 canary 在 accepted band 内，则因低成本 preference 选择 A；B 保留为 escalation。  
6. **Fallback**：若 A schema probe 失败，且 B 可用并通过 privacy/permission gates，则选择 B。若 B 不可用，则产出 Markdown proposal 和 untrusted JSON draft，明确丢失“schema-conformant machine-executable output”保证。  
7. **Review**：先用 deterministic JSON Schema validator、repository path checks 和 citation checks；C 只能标记为 additional review，因为 backend independence 未证明。最终 machine-executable acceptance 由 deterministic checks 和 human review 决定。  
8. **Stop condition**：A、B 都不能满足 schema requirement，且用户不接受 reduced-scope output 时，route 结果为 `NO_AUTOMATION_FOR_REQUIRED_OUTPUT`，而不是静默提交近似 JSON。

示例 route record：

```yaml
routing_result:
  selected_primary: model_route_A_after_current_schema_probe
  deterministic_tools:
    - exact_ref_repository_reader
    - json_schema_validator
    - citation_reference_checker
  rejected_actions:
    - repository_write
  escalation_candidate: model_route_B_if_current_availability_verified
  review_label: additional_review_not_attested_independent
  fallback:
    mode: human_readable_proposal
    retained:
      - public-source synthesis
      - exact repository citations
    lost:
      - guaranteed schema-conformant machine execution
    user_warning_required: true
  stop_if:
    - required_output_cannot_be_met
    - source_freshness_cannot_be_verified
    - any_private_or_write_scope_is_required
```

这个例子展示了三个关键区别：conflicting-looking evidence 可能只是 scope 不同；unknown required capability 必须先验证而非低分放行；fallback 必须说明 guarantee loss。

**Implementation and experiment dependencies**

在任何 implementation 前，Owner 至少需要选择：capability taxonomy 的最小字段集、risk tiers、默认 TTL bands、claim owner、route decision record、允许的 telemetry content、provider/account data boundaries、write-capable connector 的 confirmation policy，以及 exception authority。

工程依赖包括一个 versioned claim registry、schema validator、change log、event ingestion 或人工 release-note review、JIT probe harness、route decision logger、cost/latency telemetry、fallback state machine、tool permission manifest 和 deterministic test fixtures。OpenTelemetry 可作为 vendor-neutral traces、metrics 和 logs 基础；其 Generative AI semantic conventions 已提供 model/provider、token usage 和 tool-call 类属性，但 prompt、tool arguments 和 results 可能包含敏感数据，必须默认 redact 或 opt-in。citeturn21search0turn21search6turn7search1

需要实验决定而非文献直接决定的项目包括：quality/cost score weights、uncertainty penalty、frontier escalation threshold、每类任务的 cheaper-model acceptance band、multi-model review 的实际 marginal benefit、fallback 用户容忍度，以及管理 matrix 所需的人力。既有 gap analysis 也明确认为 exact topology thresholds、rubric weights、test-set size 和 administrative burden 应由目标实验而非又一轮广泛文献综述决定。fileciteturn8file0L2-L2

任何涉及真实 write tools、private data、account credentials 或 operational activation 的 experiment 均不由本报告授权。

