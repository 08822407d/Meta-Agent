5. `critical failure` 是否采用零容忍；本报告建议 authority escalation、private leakage、cross-project contamination、automatic promotion 和 rollback resurrection 为零容忍。
6. capability facts 的默认 TTL；建议高变化 provider/tool facts 为 30–90 天，且每次高影响 mapping 前重新验证。
7. future MCP 的 trust model：固定 allowlist、organization-controlled servers，还是第三方 registry；第三方动态发现不应进入首个 pilot。
8. Owner 可接受的 human review burden 与 benign utility floor；必须在 MA-DR-09 中预先设定，避免看到结果后调整门槛。

## 来源表与最终处置

**Portable source table**

| Source ID | Title | Authors/Organization | Date | Type | Direct URL / DOI / arXiv ID | Threat/control claims supported | Assumptions and limitations |
|---|---|---|---|---|---|---|---|
| INT-01 | Meta-Agent v0.1 Approved Spec | Meta-Agent project / Owner-governed repository | 2026-07-31 | Internal target artifact | https://github.com/08822407d/Mnemosyne/blob/master/target-projects/meta-agent/current/approved-spec.md | inactive baseline、sole target truth、no RAG/MCP/private/writeback、Owner authority | 文档基线，不是 operational validation。fileciteturn1file0L2-L2 |
| INT-02 | Meta-Agent v0.1 Active Context | Meta-Agent project | 2026-07-31 | Internal current-state artifact | https://github.com/08822407d/Mnemosyne/blob/master/target-projects/meta-agent/current/active-context.md | 未激活、无 pilot、无 private materials、现有 blockers | 可能 stale；明确非 execution source。fileciteturn2file0L2-L2 |
| INT-03 | Meta-Agent Source and Owner Map v0.1 | Meta-Agent project | 2026 | Internal authority map | https://github.com/08822407d/Mnemosyne/blob/master/target-projects/meta-agent/authority/source-and-owner-map.md | source roles、task-local write authorization、platform permission ≠ task authority | 规则未被 runtime enforcement 证明。fileciteturn3file0L2-L2 |
| INT-04 | Meta-Agent Core Methodology v0.1 | Meta-Agent project | 2026 | Internal method library | https://github.com/08822407d/Mnemosyne/blob/master/target-projects/meta-agent/methodology/core-methodology.md | single-Agent-first、promotion gate、handoff continuity | initial incomplete library。fileciteturn4file0L2-L2 |
| INT-05 | Decision, Version and Migration Log v0.1 | Meta-Agent project | 2026-07-31 | Internal lineage/rollback record | https://github.com/08822407d/Mnemosyne/blob/master/target-projects/meta-agent/history/decision-version-and-migration-log.md | stable IDs、change classes、rollback、public Git deletion limits | 尚无 real operational state 或 rollback drill。fileciteturn5file0L2-L2 |
| INT-06 | DR-01–05 Cross-Report Synthesis | Meta-Agent project | 2026 | Internal research synthesis | https://github.com/08822407d/Mnemosyne/blob/master/target-projects/meta-agent/research/reviews/MA-DR-01-05-cross-report-synthesis-v0.1.md | foundational baseline 与 Meta-level security gap | non-execution source。fileciteturn6file0L2-L2 |
| INT-07 | DR-01–05 Gap Analysis | Meta-Agent project | 2026 | Internal gap analysis | https://github.com/08822407d/Mnemosyne/blob/master/target-projects/meta-agent/research/reviews/MA-DR-01-05-gap-analysis-v0.1.md | security、IR、benchmark 为 P0 gaps | candidate implications only。fileciteturn7file0L2-L2 |
| EXT-01 | Agent Security Bench (ASB): Formalizing and Benchmarking Attacks and Defenses in LLM-based Agents | Zhang et al. | 2024/ICLR 2025 | Peer-reviewed benchmark | https://arxiv.org/abs/2410.02644 | DPI、IPI、memory poisoning、backdoor、mixed attacks、NRP | benchmark-specific frameworks、models、tools。citeturn2academia12 |
| EXT-02 | AgentDojo: A Dynamic Environment to Evaluate Prompt Injection Attacks and Defenses for LLM Agents | Debenedetti et al. | 2024 | NeurIPS paper/benchmark | https://arxiv.org/abs/2406.13352 | tool-return injection、security/utility joint evaluation | 不覆盖 Meta-Agent promotion。citeturn7search8 |
| EXT-03 | Formalizing and Benchmarking Prompt Injection Attacks and Defenses | Liu et al. | 2024 | USENIX Security paper | https://www.usenix.org/conference/usenixsecurity24/presentation/liu-yupei | systematic attack/defense formalization；heuristic defense limits | 主要为 LLM-integrated apps。citeturn7search4 |
| EXT-04 | Defeating Prompt Injections by Design | Debenedetti et al. | 2025 | Research preprint + code | https://arxiv.org/abs/2503.18813 | control/data-flow isolation、capabilities、provable security under model | 需要结构化 program/policy；token overhead。citeturn7search0turn7search9 |
| EXT-05 | ARGUS: Defending LLM Agents Against Context-Aware Prompt Injection | Weng et al. | 2026-05, revised 2026-07 | Very recent preprint/benchmark | https://arxiv.org/abs/2605.03378 | context-aware attacks、Influence-Provenance Graph、action justification | 尚未 peer-reviewed；LLM-backed auditor。citeturn4academia12turn4search0 |
| EXT-06 | A Practical Memory Injection Attack against LLM Agents / MINJA | Dong et al. | 2025 | Research preprint | https://arxiv.org/abs/2503.03704 | query-only memory injection、bridging steps、persistent influence | 依赖 auto-write memory；现实 memory 状态可降低效果。citeturn5academia44turn5academia47 |
| EXT-07 | MemoryGraft: Persistent Compromise of LLM Agents via Poisoned Experience Retrieval | Srivastava, He | 2025-12 | Preprint + code/data | https://arxiv.org/abs/2512.16962 | poisoned successful experiences、semantic imitation、hybrid retrieval | 单主要 framework/backbone、有限 workloads。citeturn3academia46 |
| EXT-08 | From Untrusted Input to Trusted Memory: A Systematic Study of Memory Poisoning Attacks in LLM Agents | Dash et al. | 2026-06 | Very recent preprint / MPBench | https://arxiv.org/abs/2606.04329 | memory-write channels、structural vulnerabilities、security/utility tension | 很新，跨实现复现有限。citeturn5search11 |
| EXT-09 | Hidden in Memory: Sleeper Memory Poisoning in LLM Agents | Pulipaka et al. | 2026-05 | Very recent preprint | https://arxiv.org/abs/2605.15338 | delayed cross-session memory poisoning、future action steering | 产品 memory semantics 和模型版本特定。citeturn5academia46 |
| EXT-10 | MemMorph: Tool Hijacking in LLM Agents via Memory Poisoning | Zhang et al. | 2026-05 | Very recent preprint | https://arxiv.org/abs/2605.26154 | memory-based tool selection hijacking | highest ASR 不代表所有设置。citeturn6academia26 |
| EXT-11 | MCPTox: A Benchmark for Tool Poisoning Attack on Real-World MCP Servers | Wang et al. | 2025-08 | Preprint/benchmark | https://arxiv.org/abs/2508.14925 | malicious instructions in tool metadata、real MCP tools | MCP ecosystem 和模型快速变化。citeturn6academia27 |
| EXT-12 | Securing LLM-Agent Long-Term Memory Against Poisoning: Non-Malleable, Origin-Bound Authority with Machine-Checked Guarantees | Louck | 2026-06 | Very recent preprint + TLA+ model | https://arxiv.org/abs/2606.24322 | origin laundering、write-time origin binding、Sybil-resistant elevation | 单作者 preprint；0% 仅限定义的模型与 benchmark。citeturn3academia49 |
| EXT-13 | SMSR: Certified Defence Against Runtime Memory Poisoning in Persistent LLM Agent Systems | Sharma | 2026-06 | Very recent preprint/formal defense | https://arxiv.org/abs/2606.12703 | signed memory、smoothed retrieval、certified bounds | key management、authenticated attacker、semantic correctness 仍是风险。citeturn5academia45 |
| EXT-14 | Investigating the Vulnerability of LLM-as-a-Judge Architectures to Prompt-Injection Attacks | Maloyan, Ashinov, Namiot | 2025-05 | Preprint | https://arxiv.org/abs/2505.13348 | evaluator/judge injection | 小型 open models、文本比较任务。citeturn8academia0 |
| EXT-15 | Security Best Practices | Model Context Protocol | current documentation | Official protocol security guidance | https://modelcontextprotocol.io/docs/tutorials/security/security_best_practices | confused deputy、authorization、token and consent boundaries | control practice，不是独立效果 benchmark。citeturn6search6 |
| EXT-16 | OWASP Top 10 for Agentic Applications | OWASP GenAI Security Project | 2025-12 | Official industry threat framework | https://genai.owasp.org/2025/12/09/owasp-top-10-for-agentic-applications-the-benchmark-for-agentic-security-in-the-age-of-autonomous-ai/ | goal hijack、tool misuse、identity abuse、supply chain、memory poisoning、cascading failure | taxonomy/industry consensus，不是因果效果证明。citeturn9search3 |
| EXT-17 | Artificial Intelligence Risk Management Framework: Generative AI Profile, NIST AI 600-1 | NIST | 2024, updated 2026 | Official risk-management standard | https://doi.org/10.6028/NIST.AI.600-1 | lifecycle governance、TEVV、incident disclosure、content provenance | cross-sector voluntary guidance，非 Agent-specific control proof。citeturn9search0 |
| EXT-18 | SLSA Build Environment Track | OpenSSF/SLSA | current draft | Supply-chain provenance standard | https://slsa.dev/spec/draft/build-env-track-basics | signed provenance、build environment attestation | 主要面向 software build；用于 Meta-Agent artifact provenance 是类比应用。citeturn9search11 |

**Final disposition matrix**

```yaml
retain_current_v0_1_control:
  - sole_target_truth_source
  - evidence_method_current_handoff_role_separation
  - task_local_write_authorization
  - platform_permission_is_not_task_authorization
  - no_automatic_methodology_promotion
  - no_private_material_in_public_git
  - stable_ID_version_migration_and_rollback
  - single_Agent_first
  - human_only_authority_decisions
