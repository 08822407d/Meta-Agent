| **A Zero Trust Architecture Model for Access Control in Cloud-Native Applications in Multi-Location Environments** | https://csrc.nist.gov/pubs/sp/800/207/a/final | NIST SP 800-207A, Sept. 2023; DOI 10.6028/NIST.SP.800-207A | granular application/service identities and policy enforcement | cloud-native focus。citeturn2search9 |
| **Security Strategies for Microservices-based Application Systems** | https://csrc.nist.gov/pubs/sp/800/204/final | NIST SP 800-204, Aug. 2019; DOI 10.6028/NIST.SP.800-204 | microservice security and operational complexity | 不比较单一 Owner 的具体成本。citeturn2search14 |
| **OpenTelemetry Documentation** | https://opentelemetry.io/docs/ | Current documentation | vendor-neutral traces、metrics、logs instrumentation | instrumentation 不等于完整 monitoring strategy。citeturn2search7turn2search10 |
| **Projects in ChatGPT** | https://help.openai.com/en/articles/10169521-projects-in-chatgpt | Current documentation, accessed 2026-08-04 | hosted Project surface、files/workspace controls/limits | Product behavior and plans may change；不是 portability guarantee。citeturn3search14 |
| **Claude Code overview / Getting started** | https://docs.anthropic.com/en/docs/claude-code/overview | Current documentation, accessed 2026-08-04 | representative terminal/coding-agent capabilities and hosted dependencies | Vendor-specific example，不是选型建议。citeturn3search11turn3search13 |
| **OpenAI API Quickstart** | https://platform.openai.com/docs/quickstart | Current documentation, accessed 2026-08-04 | API/SDK-based orchestration surface | Provider-specific；capabilities and pricing change。citeturn3search2 |
| **OpenAI API Data Controls** | https://platform.openai.com/docs/guides/your-data | Current documentation, accessed 2026-08-04 | application-state retention and hosted-mode constraints | Applies only to documented OpenAI surfaces and current policy.citeturn3search1 |
| **Model Context Protocol — Authorization** | https://modelcontextprotocol.io/specification/2025-03-26/basic/authorization | Revision 2025-03-26 | OAuth 2.1/PKCE、HTTPS、token handling | Authorization spec does not make tools safe by itself。citeturn3search5 |
| **Model Context Protocol — Security Best Practices** | https://modelcontextprotocol.io/specification/draft/basic/security_best_practices | Draft/current page accessed 2026-08-04 | token audience、token passthrough and attack mitigations | Draft status；implementations vary。citeturn3search7turn3search16 |
| **Retrieval-Augmented Generation for Knowledge-Intensive NLP Tasks** | https://arxiv.org/abs/2005.11401 | arXiv:2005.11401, 2020 | RAG feasibility、external non-parametric memory、knowledge updating | Specific datasets/models；does not establish universal need for RAG。citeturn10academia48 |
| **RAGChecker: A Fine-grained Framework for Diagnosing Retrieval-Augmented Generation** | https://arxiv.org/abs/2408.08067 | arXiv:2408.08067, 2024 | modular retriever/generator evaluation and trade-offs | automated evaluators and benchmark scope have limits。citeturn10academia49 |
| **Lost in the Middle: How Language Models Use Long Contexts** | https://doi.org/10.1162/tacl_a_00638 | TACL 12, 2024 | position-sensitive long-context performance；more context is not always better | Evaluated model generation is historical；pattern needs revalidation on current models。citeturn9search0turn9search2 |
| **Not what you've signed up for: Compromising Real-World LLM-Integrated Applications with Indirect Prompt Injection** | https://arxiv.org/abs/2302.12173 | arXiv:2302.12173, 2023 | indirect prompt injection through retrieved/external content | Early threat study；defenses continue to evolve。citeturn10academia50 |
| **AgentDojo: A Dynamic Environment to Evaluate Prompt Injection Attacks and Defenses for LLM Agents** | https://arxiv.org/abs/2406.13352 | arXiv:2406.13352, 2024 | tool-agent utility/security evaluation；attacks and baseline failures | benchmark tasks are not Meta-Agent-specific。citeturn9academia36 |
| **PostgreSQL Materialized Views** | https://www.postgresql.org/docs/current/rules-materializedviews.html | Current PostgreSQL documentation | persisted query results refreshed from sources | PostgreSQL-specific；does not prescribe storage choice。citeturn4search5 |
| **SQLite FTS5 Extension** | https://www.sqlite.org/fts5.html | Current SQLite documentation | lightweight local full-text search capabilities | lexical search only；ranking/evaluation still needed。citeturn4search4 |
| **CQRS pattern** | https://learn.microsoft.com/en-us/azure/architecture/patterns/cqrs | Current Microsoft architecture guidance | complexity、duplicates、retries、eventual consistency and stale-read risks | Industry guidance rather than controlled experiment。citeturn5search2 |
| **CloudEvents Specification** | https://github.com/cloudevents/spec | CloudEvents v1.0.2 | interoperable event envelope | processing semantics、authorization and privacy remain external concerns。citeturn8search0turn8search4turn8search6 |
| **JSON Schema Draft 2020-12** | https://json-schema.org/draft/2020-12 | Draft 2020-12 | versioned validation/descriptive schema for JSON | Schema cannot enforce all semantic/authority rules。citeturn4search0turn4search2 |
| **OpenAPI Specification** | https://spec.openapis.org/oas/latest.html | 3.2.0, 2025-09-19 | portable API contract description | Client/server support may lag latest spec。citeturn4search6 |
| **NIST SP 800-34 Rev. 1 — Contingency Planning Guide for Federal Information Systems** | https://csrc.nist.gov/pubs/sp/800/34/r1/final | May 2010; DOI 10.6028/NIST.SP.800-34r1 | recovery priorities、strategies、testing、maintenance | Federal-system orientation；needs proportional adaptation。citeturn6search1 |
| **Reproducible Builds** | https://reproducible-builds.org/docs/definition/ | Current definition | rebuild equivalence and recorded environment/instructions | Stochastic model output may not be bit-identical。citeturn6search3 |
| **SLSA Specification** | https://slsa.dev/spec/v1.2/ | v1.2, 2025-11-24 | source/build provenance tracks | Primarily software supply chain；may be excessive for document-only bootstrap。citeturn7search4turn7search8 |
| **SPDX Specification** | https://spdx.github.io/spdx-spec/ | SPDX 3.0; ISO/IEC 5962:2021 lineage | portable software/package provenance and SBOM | Relevant mainly after code/package distribution exists。citeturn7search15 |
| **CycloneDX Specification** | https://cyclonedx.org/specification/overview/ | v1.7, 2025-10-21 | components、services、dependencies、provenance metadata | Adds artifact administration burden。citeturn7search0 |
| **Open Container Initiative Specifications** | https://opencontainers.org/about/overview/ | Image 1.1.1, Distribution 1.1.1, Runtime 1.3.0 observed 2026-08-04 | open artifact/runtime/distribution contracts | Container/registry model may not be needed for Meta-Agent。citeturn1search2turn1search3turn1search8 |

### Final disposition matrix

| Item | Disposition | Evidence class | Rationale and boundary |
|---|---|---|---|
| One declared authoritative write path per object class | **ADOPTABLE_DESIGN_PRINCIPLE** | `MULTI_SOURCE_PATTERN` | 防止 chat/Git/database dual truth；不决定具体 store |
| UI separated from durable truth | **ADOPTABLE_DESIGN_PRINCIPLE** | `MULTI_SOURCE_PATTERN` | conversation、CLI、desktop、API 均可替换 |
| Evidence、state、execution roles explicitly separated | **ADOPTABLE_DESIGN_PRINCIPLE** | `TARGET_SPECIFIC_INFERENCE` | 与当前 authority model 相容 |
| Derived indexes/views rebuildable and non-authoritative | **ADOPTABLE_DESIGN_PRINCIPLE** | `OFFICIAL_SPECIFICATION_OR_DOCUMENTATION_FACT` | 支持 recovery 与 provider exit |
| Credentials and side effects isolated from repository truth | **ADOPTABLE_DESIGN_PRINCIPLE** | `MULTI_SOURCE_PATTERN` | least privilege 与 rollback 基础 |
| Open export、versioned schemas、source revision binding | **ADOPTABLE_DESIGN_PRINCIPLE** | `INDUSTRY_PRACTICE` | 不选择具体 schema/product |
| Restore testing rather than backup existence only | **ADOPTABLE_DESIGN_PRINCIPLE** | `OFFICIAL_SPECIFICATION_OR_DOCUMENTATION_FACT` | disaster recovery 必需 |
| Graceful degradation to repository/manual mode | **ADOPTABLE_DESIGN_PRINCIPLE** | `RECOMMENDATION` | subscription、connector、service 不可用时保持可工作 |
| Continue current monorepo | **CANDIDATE / NO-MIGRATION OPTION** | `TARGET_SPECIFIC_INFERENCE` | 当前未发现足够强的拆仓证据 |
| Dedicated Meta-Agent repository | **CANDIDATE** | `RECOMMENDATION` | 仅在 access/release/CI/DR/churn trigger 后评估 |
| Repository-first manual product core | **CANDIDATE** | `TARGET_SPECIFIC_INFERENCE` | 最低复杂度 baseline；不必是永久 UI |
| Conversational Project as non-authoritative client | **CANDIDATE** | `MULTI_SOURCE_PATTERN` | 适合 interaction；不得成为 shadow truth |
| Read-mostly local CLI | **CANDIDATE** | `RECOMMENDATION` | 优先 prototype；禁止初始 broad writes |
| Local desktop shell | **EXPERIMENT-GATED** | `RECOMMENDATION` | 需实际 UX pain 证明 packaging 成本合理 |
| Local service | **EXPERIMENT-GATED** | `RECOMMENDATION` | 需共享 state、scheduler 或 multi-client 需求 |
| Hosted service/API orchestrator | **DEFERRED** | `RECOMMENDATION` | 需要 SLO、security、export、DR 与 recurring operations |
| Multi-repository target layout | **DEFERRED** | `TARGET_SPECIFIC_INFERENCE` | project/access/release diversity 尚未证明 |
| Submodule as default Meta-Agent boundary | **REJECTED_AS_DEFAULT** | `OFFICIAL_SPECIFICATION_OR_DOCUMENTATION_FACT` | 双仓操作成本高；仅用于真实 pinned dependency |
| Package/artifact publishing | **CANDIDATE_WHEN_CODE_OR_SCHEMA_STABILIZES** | `INDUSTRY_PRACTICE` | 分享接口时可能优于 repo split |
| External storage pointers | **CANDIDATE** | `INDUSTRY_PRACTICE` | 适合 large/private/licensed evidence；需 hash/access/backup |
| Local keyword/FTS retrieval | **EXPERIMENT-GATED** | `OFFICIAL_SPECIFICATION_OR_DOCUMENTATION_FACT` | 在 vector retrieval 前建立低成本 baseline |
| Vector retrieval/RAG | **EXPERIMENT-GATED** | `VERIFIED_PRIMARY_EVIDENCE` | 需真实 search pain、evaluation、injection tests |
| MCP-like interfaces | **EXPERIMENT-GATED** | `OFFICIAL_SPECIFICATION_OR_DOCUMENTATION_FACT` | interoperability 有价值，但 auth/security burden 明确 |
| Real connectors | **DEFERRED_UNTIL_EXACT_USE_CASE** | `MULTI_SOURCE_PATTERN` | 不作为 baseline；需 least privilege 与 revocation |
| Scheduled jobs/webhooks | **DEFERRED_UNTIL_RECURRING_NEED** | `RECOMMENDATION` | 需 idempotency、budget、expiry、audit、kill switch |
| Automatic writeback | **REJECTED_AS_DEFAULT** | `TARGET_SPECIFIC_INFERENCE` | 与 current human-reviewed authority boundary 不相容 |
| Long-lived bidirectional Git/database sync | **REJECTED** | `MULTI_SOURCE_PATTERN` | 高 dual-truth 与 rollback 风险 |
| Full CQRS/event sourcing at bootstrap | **REJECTED_FOR_BOOTSTRAP** | `OFFICIAL_SPECIFICATION_OR_DOCUMENTATION_FACT` | complexity 不符合单 Owner、低写入量现状 |
| Microservice-per-plane implementation | **REJECTED_FOR_BOOTSTRAP** | `MULTI_SOURCE_PATTERN` | logical separation 不要求 network-service separation |
| Chat history as sole memory/truth | **REJECTED** | `TARGET_SPECIFIC_INFERENCE` | 不可稳定 version、diff、fresh-session recovery |
| Secrets/private originals in public Git | **REJECTED** | `TARGET_SPECIFIC_INFERENCE` | 与现有 approved boundary 直接冲突 |
