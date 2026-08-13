---
trigger: glob
globs: bucket/*.json
---

# Scoop 清单编写规范

处理 `bucket/*.json` 文件时，必须遵守以下规范。

## 1. 命名规则

- 清单文件名 MUST 使用小写 + 连字符（如 `chrome-plus.json`）。

## 2. 字段编写规范

- **必填字段**：`version`, `description`, `homepage`, `license`, `url` (或通过 `architecture` 指定), `hash`。
  - MUST NOT 省略 `hash` 字段（存在安全风险）。
- **自动更新配置**：MUST 包含 `checkver` 和 `autoupdate` 字段，保证该软件能够被系统自动识别和更新。
- **推荐添加字段**：
  - GUI 应用程序 SHOULD 添加 `shortcuts` 字段。
  - 需要持久化用户数据或配置的应用 SHOULD 添加 `persist` 字段。
- **高级字段（可选）**：
  - `installer.script`: 用于非标准安装流程的补丁逻辑。
  - `suggest`: 关联包提示。
  - `notes`: 安装后提示。
  - `env_set`: 环境变量配置。
  - `extract_dir`: 指定特定的解压目录。

## 3. 注意事项

- MUST NOT 为修复局部问题重写整个清单。
- MUST NOT 修改与当前任务无关的清单文件。
- 如果不确定应用的安装行为，优先从现有清单找答案，记录假设并告知用户，切勿自行假设。
