| *Do Large Language Models Know What They Don’t Know?* | https://arxiv.org/abs/2305.18153 | 2023 | LLM 有部分 self-knowledge，但识别 unknowns 与人类仍有差距。citeturn17academia48 | Preprint；benchmark construction 影响结论。 |
| *Self-Consistency of Large Language Models under Ambiguity* | https://doi.org/10.18653/v1/2023.blackboxnlp-1.7 | 2023 | Self-consistency 与 self-calibration 不同；模型可一致但错误估计自身一致性。citeturn15search3 | 特定 ambiguous sequence task。 |
| *Detecting hallucinations in large language models using semantic entropy* | https://doi.org/10.1038/s41586-024-07421-0 | Nature 2024 | Semantic entropy 可检测一部分 confabulations 并支持 abstention。citeturn15search1 | 不检测 systematic error；有额外 sampling/entailment cost。 |
| *Conformal Prediction with Large Language Models for Multi-Choice Question Answering* | https://arxiv.org/abs/2305.18404 | v3, 2023 | Conformal prediction 可支持 task-specific selective prediction。citeturn17academia50 | 主要限于 multiple-choice；依赖 exchangeability。 |
| *Complacency and Bias in Human Use of Automation* | https://doi.org/10.1177/0018720810376055 | 2010 | Automation bias/complacency 影响专家、新手、个人和团队，training 不足以消除。citeturn14search0 | Review 聚焦传统 automation systems。 |
| *The Out-of-the-Loop Performance Problem and Level of Control in Automation* | https://doi.org/10.1518/001872095779064555 | 1995 | 高 automation 可降低 situation awareness 与 takeover performance。citeturn14search2 | 单类 navigation experiment；需谨慎外推。 |
| *Algorithm Aversion: People Erroneously Avoid Algorithms After Seeing Them Err* | https://doi.org/10.1037/xge0000033 | 2015 | 人可能在观察错误后过度弃用算法。citeturn16search9 | 特定 forecasting experiments；不覆盖所有 domains。 |
| *Guidelines for Human-AI Interaction* | https://doi.org/10.1145/3290605.3300233 | CHI 2019 | 交互应管理 expectations、支持 correction、控制与反馈。citeturn15search0 | Guidelines 需要 product-specific validation。 |
| *In search of verifiability: Explanations rarely enable complementary performance in AI-advised decision making* | https://doi.org/10.1002/aaai.12182 | 2024 | Explanations 只有在支持 verification 时更可能改善 reliance。citeturn14search6turn14search7 | 综合性理论与文献分析；不等于每类 explanation 都无效。 |
| *Alert fatigue measurement in clinical decision support: a systematic review* | https://doi.org/10.1093/jamia/ocag064 | 18 May 2026 | Alert-fatigue metrics 缺乏统一 operationalization；应观察 appropriate-response 的持续下降。citeturn16search0turn16search4 | 临床领域；迁移到 Agent approvals 需实验。 |
| *Noisy information value in utility-based decision making* | https://doi.org/10.1145/1089827.1089831 | 2005 | Information value 是获取信息后 expected utility 的提升。citeturn16search1 | 简化 decision model；实际损失估计困难。 |
| *Artificial Intelligence Risk Management Framework (AI RMF 1.0)* | https://doi.org/10.6028/NIST.AI.100-1 | NIST AI 100-1, 2023 | 跨 lifecycle、use-case-agnostic AI risk-management structure。citeturn12search2 | Voluntary framework；不规定具体 approval thresholds。 |
| *Artificial Intelligence Risk Management Framework: Generative Artificial Intelligence Profile* | https://doi.org/10.6028/NIST.AI.600-1 | 2024; metadata updated 2026 | GenAI-specific risk profile 与 measurement/governance actions。citeturn16search2 | Profile 而非 conformance certification。 |
| *Open Policy Agent Documentation* | https://www.openpolicyagent.org/docs | current docs accessed 2026-08-04 | Policy decision 与 enforcement 分离；declarative policy-as-code。citeturn12search0 | Policy 只能处理已编码、可获得的输入。 |
| *Deployments and environments — GitHub Docs* | https://docs.github.com/en/actions/reference/workflows-and-actions/deployments-and-environments | current docs accessed 2026-08-04 | Required reviewers、prevent self-review、approval 前隔离 secrets。citeturn13search0 | Plan/edition restrictions；默认并非 two approvals。 |
| *terraform plan command reference* | https://developer.hashicorp.com/terraform/cli/commands/plan | Terraform v1.15 docs observed 2026 | Preview/apply separation；speculative plans 可 stale。citeturn12search1turn12search10 | Terraform-specific；plan 可能包含 sensitive values。 |
| *Kubernetes API Concepts — Dry-run* | https://kubernetes.io/docs/reference/using-api/api-concepts#dry-run | Kubernetes stable feature; docs accessed 2026 | Dry-run 经过 validation 但不持久化；不等于授权。citeturn18search0 | Generated values 与 real run 可不同；webhooks 需正确声明 side effects。 |
| *Validating Admission Policy* | https://kubernetes.io/docs/reference/access-authn-authz/validating-admission-policy/ | docs modified 27 May 2026 | `Deny`、`Warn`、`Audit` 可将 hard block 与 monitoring 分开。citeturn18search3 | Misconfiguration、failure policy 与 exempt resources 仍构成风险。 |
| *Revoke IAM role temporary security credentials* | https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_use_revoke-sessions.html | current AWS docs | Temporary grants 可 expiry/revoke；revocation 本身有 operational impact。citeturn13search6 | AWS-specific；revocation 传播与已有工作需考虑。 |
| *Regulation (EU) 2024/1689 — Artificial Intelligence Act* | https://eur-lex.europa.eu/eli/reg/2024/1689/oj | Official Journal, 2024 | 高风险 AI 的 risk management 与 human-oversight 法规背景。 | 法律义务取决于角色、用途、jurisdiction；本报告非法律意见。 |

**Final disposition matrix**

| Disposition | 项目 | 理由与限制 |
|---|---|---|
| **Adoptable design principle** | Permission、competence、confidence、value judgment 分离 | 与 repository authority model 和外部证据一致；不改变 target truth。 |
| **Adoptable design principle** | Owner-only constraints 作为 hard gates，不进入 weighted optimizer | 防止 benchmark、成本或历史成功抵消 authority。 |
| **Adoptable design principle** | Reversibility、blast radius、sensitivity、evidence、detectability 多轴分类 | 单一 autonomy score 无法表达风险结构。 |
| **Adoptable design principle** | 在 ask user 前，优先执行被授权且有正 NetVOI 的 read-only verification | 减少无效打断，不扩大权限。 |
| **Adoptable design principle** | Model self-confidence 绝不作为 sole escalation/proceed signal | Calibration、self-consistency 和 OOD 证据均否定单信号可靠性。 |
| **Adoptable design principle** | Preview、fresh-state binding、expiry、rollback、audit | 广泛 engineering patterns 支持；仍需 backend-specific validation。 |
| **Candidate item** | `M0–M6` managed-autonomy ladder | 可作为 policy design input；尚未 target-approved。 |
| **Candidate item** | `PROCEED / VERIFY / ASK / ABSTAIN / ESCALATE` decision procedure | 需转成 target-specific schema、threshold 与 tests。 |
| **Candidate item** | Read-only、reversible-write、irreversible policy profiles | 需 Owner 选择 exact scope 与 semantics。 |
| **Candidate item** | Approval artifact 绑定 plan hash、state、expiry | 可减少 stale approval；实现方式未选择。 |
| **Candidate item** | Human-workload 与 trust-calibration metrics | 需真实或 synthetic human study 校准。 |
| **Experiment-gated** | Historical performance 调整 review intensity | 仅在 immutable authority ceiling、drift detection、minimum sampling 下测试。 |
| **Experiment-gated** | Conformal/semantic-entropy threshold | 任务、模型、distribution 与成本相关。 |
| **Experiment-gated** | Scoped-session approval 替代 per-action approval | 必须证明不会增加 scope violations 或漏审高风险动作。 |
| **Experiment-gated** | Two-person/independent review trigger | 需验证 reviewer independence 与 burden。 |
| **Deferred** | Runtime self-modifying delegation policy | 当前 baseline inactive，且缺少安全与 empirical evidence。 |
| **Deferred** | Persistent user/learner/cognitive profile | 超出本任务范围，并与现有 non-goal 冲突。 |
| **Deferred** | Query-level authority adaptation | 容易产生 silent scope growth；先验证离线固定 policy。 |
| **Rejected** | High model capability 自动扩大 authority | 违反 task prohibition 与 Owner authority model。 |
| **Rejected** | Agent self-issued permission 或 self-approved irreversible action | 形成 circular authorization。 |
| **Rejected** | 每个低风险 deterministic step 都要求人工批准 | 导致 approval fatigue、delay 与低 approval precision。 |
| **Rejected** | 仅用 verbal confidence/self-confidence 决定 proceed | 缺乏 calibration、OOD 与 permission 信息。 |
| **Rejected** | 把 target truth、privacy、authority 当作可被 utility score 抵消的 soft objective | 允许 optimizer laundering。 |
| **Rejected** | 仅依赖 post-hoc audit 控制 irreversible 或低-detectability 风险 | 损害发生后无法可靠恢复。 |

```yaml
final_report_disposition:
  external_evidence_value: ACCEPTABLE_FOR_OWNER_REVIEW
  target_specific_mapping: COMPLETED
  adoptable_principles_identified: true
  candidate_policy_profile_proposed: true
  experiment_program_proposed: true
  target_truth_change_authorized: false
  methodology_promotion_authorized: false
  stable_target_ids_issued: false
  repository_write_performed: false
  operational_activation_supported_by_this_report: false
  pilot_authorized: false
  owner_decision_required_for_any_promotion_or_execution: true
```