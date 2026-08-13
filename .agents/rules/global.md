---
trigger: always_on
---

# Rojem-Scoop 全局基础规范

本文件包含贯穿整个项目的绝对通用规范和红线，必须时刻遵守。

## 1. 禁止事项 (MUST NOT)

- **绝对禁止修改 `bin/` 下的 Scoop 官方工具脚本**。
- **不得**对 Excavator 自动创建的版本更新 PR 进行追加提交。
- **不得**删除或修改现有测试来使测试通过。
- **不得**在清单中硬编码用户特定的路径。

## 2. 语言与基础规范 (MUST)

- **会话与注释**：会话语言、代码注释、PowerShell 注释帮助（`.SYNOPSIS` 等）**必须**使用中文。
- **排版**：中文与英数字之间**必须**插入半角空格。
- **兼容性**：PowerShell 脚本必须同时兼容 Windows PowerShell 5.1+ 和 PowerShell Core。

## 3. Git 与代码审查规则 (MUST)

- 提交信息必须遵循 [Conventional Commits](https://www.conventionalcommits.org/en/v1.0.0/)。
  - 示例：`feat: 添加 chrome-plus 清单`（`<description>` 必须用中文）。
- 分支命名必须遵循 [Conventional Branch](https://conventional-branch.github.io)（如 `feat/<description>`）。
- 创建 PR 的正文必须用中文完整描述当前状态，不包含历史更新记录。

## 4. 知识索引 (MUST)

遇到技术细节不明的情况，务必查询相关 Wiki 文档，而不是凭空猜测。所有相关参考均指向本仓库内的镜像目录：`docs/scoop-wiki/`。

| 场景需求 | 请查阅文档 |
|---|---|
| 需要了解清单支持的所有字段 | `App-Manifests.md` |
| 需要配置或排查 `checkver` / `autoupdate` 自动更新逻辑 | `App-Manifest-Autoupdate.md` |
| 需要在 `pre_install`/`post_install` 脚本中调用环境参数 | `Pre-Post-(un)install-scripts.md` |
| 需要保留应用配置文件或数据目录 | `Persistent-data.md` |
| 需要处理依赖包和建议安装包 | `Dependencies.md` |
| 需要了解 Bucket 机制及整体运作逻辑 | `Buckets.md` |
