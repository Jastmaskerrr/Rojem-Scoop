---
trigger: always_on
---

# Rojem-Scoop 全局基础规范

个人用 Scoop bucket，核心是通过高级脚本逻辑实现软件的便携化整合与自动化维护。本文件包含贯穿整个项目的通用规范和红线，必须时刻遵守。

## 1. 架构规则

### 目录结构

```text
.
├── bucket/              # 清单文件（唯一的清单存放位置）
├── bin/                 # Scoop 官方工具脚本（checkver/formatjson/test 等）
├── scripts/             # 清单辅助脚本（安装钩子引用的外部脚本）
├── deprecated/          # 已废弃的清单
├── docs/scoop-wiki/     # Scoop 官方 Wiki 镜像（只读参考）
└── .github/             # CI 工作流、Issue/PR 模板
```

### 模块边界

- `bucket/` 下只放 JSON 清单文件，MUST NOT 放脚本或其他文件。
- `scripts/` 存放被清单 `pre_install`/`post_install` 引用的外部脚本。
- `bin/` 是 Scoop 官方工具，MUST NOT 修改其内容。

## 2. 禁止事项 (MUST NOT)

- MUST NOT 修改 `bin/` 下的 Scoop 官方工具脚本。
- MUST NOT 对 Excavator 自动创建的版本更新 PR 进行追加提交。
- MUST NOT 删除或修改现有测试来使测试通过。
- MUST NOT 为修复局部问题重写整个清单。
- MUST NOT 修改与当前任务无关的清单文件。
- MUST NOT 在清单中硬编码用户特定的路径。
- MUST NOT 省略 `hash` 字段（安全风险）。
- MUST NOT 省略 `checkver`/`autoupdate` 字段（导致无法自动更新）。

## 3. 语言与基础规范 (MUST)

- **会话与注释**：会话语言、代码注释、PowerShell 注释帮助（`.SYNOPSIS` 等）**必须**使用中文。
- **错误信息**：**必须**使用英语。
- **排版**：中文与英数字之间**必须**插入半角空格。
- **兼容性**：PowerShell 脚本必须同时兼容 Windows PowerShell 5.1+ 和 PowerShell Core。

## 4. Git 规范 (MUST)

- 提交信息必须遵循 [Conventional Commits](https://www.conventionalcommits.org/en/v1.0.0/)。
  - 格式：`<type>(<scope>): <description>`，`<description>` 使用中文。
  - 示例：`feat: 添加 chrome-plus 清单`
- 分支命名必须遵循 [Conventional Branch](https://conventional-branch.github.io)（格式：`<type>/<description>`，type 用缩写：feat, fix）。

## 5. 决策原则

### 方案选择优先级

存在多个实现方案时，按以下顺序选择：

1. 复用现有清单中已验证的模式
2. 保持与仓库整体风格一致
3. 最小化修改范围
4. 降低长期维护成本

### 不确定时

- MUST NOT 自行假设应用的安装行为。
- 优先从现有清单、Scoop Wiki 文档寻找答案。
- 如果仍无法确定，MUST 记录假设并告知用户。

### 调查范围

- 调查以获取必要信息为限：版本、下载 URL、hash、包结构、persist 目标。
- 下载安装包仅用于计算 hash 与分析目录结构，完成后清理临时文件。
- 查清即停，不做与当前改动无关的延伸调查（如依赖包版本号等）。

### 规则优先级

发生冲突时：

1. 用户当前任务的明确要求
2. 规则文件中的规则
3. 项目中其他文档
4. Agent 默认实践

## 6. 文档索引

### Scoop 官方知识库（`docs/scoop-wiki/`）

| 主题 | 文档 |
|---|---|
| 清单字段参考 | `App-Manifests.md` |
| 自动更新配置 | `App-Manifest-Autoupdate.md` |
| 安装脚本变量 | `Pre-Post-(un)install-scripts.md` |
| 持久化数据 | `Persistent-data.md` |
| Bucket 机制 | `Buckets.md` |
| 依赖管理 | `Dependencies.md` |

### 项目文件

| 文件 | 说明 |
|---|---|
| `README.md` | 项目说明和应用列表 |
| `Scoop-Bucket.Tests.ps1` | Scoop 官方测试框架入口 |
| `.github/workflows/ci.yml` | CI 工作流（双版本 PowerShell 测试） |
| `.github/workflows/excavator.yml` | 每 4 小时自动版本更新 |
