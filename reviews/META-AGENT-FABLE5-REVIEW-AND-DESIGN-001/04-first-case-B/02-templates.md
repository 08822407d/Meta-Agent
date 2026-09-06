# 用例 B · 模板（登记表结构、决策包、派生任务书）

```yaml
track_id: META-AGENT-FABLE5-REVIEW-AND-DESIGN-001
record_type: case_templates
case_label: CASE-B-LIBRARY-EXTRACTION-WORKFLOW
created_by_task: META-AGENT-FABLE5-REVIEW-AND-DESIGN-001
generated_by_actor: claude-fable-5.1
generated_on_surface: claude-code-vscode
date: 2026-09-06
evidence_class: DESIGN_RECOMMENDATION
authority_level: candidate_only_trial_use
note: 示例全部为合成内容，不含任何真实项目信息
```

## 1. 跨项目候选登记表（S1 产出，S2/S4 更新）

每行一条候选能力；同族合并后保留原行并标 merged_into。

```yaml
- id: LC-0007                      # 登记表内临时编号，非稳定 ID
  capability: 逐项容错的批处理结果模型
  family: F01-batch-execution-model
  sources:                         # 必填，≥1；缺则该行非法
    - {doc: "<需求文档文件名>", section: "§13.6", quoted: "建议统一返回 BatchResult…"}
  projects_seen: 3                 # 提到该能力的文档数
  layer: infrastructure            # pure_algorithm | infrastructure | project_adapter | not_a_library
  existing_library_api: none       # 现有库里最接近的 API 或 none
  gap: 缺统一结果/诊断模型与逐项事务
  parameterize: [停止级别, 诊断字段, 并发度]
  do_not_extract: [某项目的日志前缀, 只保留第一行错误原因]
  ownership: independent           # independent | depends_on_legacy | unknown
  risk_flags: [untested_across_projects]
  status: candidate                # candidate | merged_into | approved | deferred | rejected | implemented_not_adopted | adopted | superseded_by
  decision_ref: null               # G1 决策记录路径
  superseded_by: null
```

## 2. 门 G1 决策包模板（S2 产出）

每题四段，按守则第 3 条：

```text
Q<n> · <一句话问题>
背景：<发生了什么、为什么现在问，三句以内>
意思：<用日常措辞说清选项各指什么>
后果：答了会怎样 / 不答（按默认）会怎样
推荐：<一个默认，附一句理由>
```

每批 ≤10 题；Owner 可整批"按推荐"。答复原文逐字登记，再回填登记表 status 与 decision_ref。

## 3. 派生任务书模板（S3 产出，交编码 agent）

```markdown
# 任务书 · <能力族> · <目标库/仓库>

## 0 一句话开工指令
先完整阅读本任务书；编码前先提交"不变量、阶段划分、测试矩阵、交付顺序"，确认后再施工。

## 1 范围
- 目标仓库与分支；允许写的路径；禁止写的路径
- 首个消费项目（迁移验证对象）；本任务不改其他项目

## 2 不变量（先于算法）
- 成功时库/消费方应如何变化；失败时哪一层保持原样
- 遍历顺序改变结果不变；重复运行幂等；中断可恢复或明确"只能重跑"
- 项目特定值（字段名/模板/阈值）不进库默认值——列出本任务的否决表

## 3 API 草图（中立于项目字段）
- 输入/输出模型；策略/配置接口；错误语义

## 4 测试矩阵（编码前冻结）
| 维度 | 最低样例 |
| 数值门槛 / 混合成功失败 / 相邻与顺序 / 事务与回滚 / 持久性重开 / 幂等重跑 / 中断恢复 | … |
分层验证：纯托管 → 平台内存 → 小型端到端 → 定点真实样例（须 Owner 指定）→ 大数据（须 Owner 授权）

## 5 消费方迁移
- 哪个项目、哪些调用点、迁移前后对比测试、旧 API 退役标记

## 6 交付顺序与冻结门
功能测试 → 只读结构审查 → 资源/事务审查 → 文档差异检查 → 代码冻结 → 一次正式构建打包 → 指纹写入；冻结后失败即撤销冻结重过门

## 7 记录更新
- 库文档（API 索引）；消费项目 docs/task-context 三件套；登记表 status → implemented_not_adopted / adopted

## 8 验收判据（机械可核）
- 测试矩阵全绿；消费方迁移通过；否决表零违反；变更集 ⊆ 允许路径

## 9 环境前提
- 位数/线程模型/许可/临时数据目录/外部工具版本

## 10 停止条件
- 需要改不变量、需要触碰禁止路径、需要真实大数据 → 停下回报，不自行决定
```

## 4. 用例反馈记录模板（S5 产出，进 Meta-Agent 候选证据）

```yaml
case_feedback:
  case_label: CASE-B-LIBRARY-EXTRACTION-WORKFLOW
  observed_at:
  what_worked: []
  what_failed: []
  owner_touch_count:
  rework_count:
  method_defects: []          # 对 Frame-to-Design 方法本身的观察
  lesson_candidates:          # 不自动升为通用方法
    - statement:
      scope: this_case | this_project_type | candidate_general
      evidence_refs: []
  owner_decision_ref: null
```
