# Meta-Agent Post-MA-DR-09 — New Conversation Startup Prompt

@GitHub 请读取并严格执行：

```text
target-projects/meta-agent/handoff/meta-agent-post-ma-dr-09-handoff-package.md
```

第一轮只做 handoff receive：

1. 核验 `08822407d/Mnemosyne` 执行时最新 `master`；
2. 核验：
   - PR #249 已合并；
   - PR #251 已合并；
   - `active-context.md` 的状态是 `post_research_receive_only_handoff_ready`；
   - `handoff-current.md` 的状态是 `receive_only_handoff_ready`；
   - 当前没有与 Meta-Agent handoff/repair 重叠的开放 PR；
3. 按 handoff 的 required reading order 读取 Meta-Agent target-local 文件；
4. 对 MA-DR-09 transport 状态，以 `MA-DR-09-post-merge-verification.yaml` 和 `report-parts-manifest.yaml` 为当前状态记录；`MA-DR-09.yaml` 中若仍有 pre-merge pending 标签，应按 handoff 中的 supersession 规则视为历史声明，而不是活动冲突；
5. 返回结构化 `handoff_receive_report`，至少包括：
   - handoff identity；
   - latest master/ref；
   - PR #249 repair identity and merge state；
   - PR #251 post-merge finalization identity and merge state；
   - runtime readiness checks；
   - Meta-Agent target-truth path and operational status；
   - completed milestones；
   - MA-DR-09 original and final dispositions；
   - pending P0/P1 work；
   - separate dependencies；
   - deferred/prohibited actions；
   - missing/stale/conflicting artifacts；
   - recommended first post-receive action；
6. 不进行 Owner acceptance、candidate promotion、prototype implementation、benchmark/pilot planning or execution、private-material ingestion、operational activation 或 GitHub 写入；
7. 返回 receive report 后停止，等待我的下一条命令。

完成 receive report 后，我会单独发送 compatibility guard 中的增强版 Mnemosyne 指导加载命令；不要用裸命令替代。
