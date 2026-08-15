---
trigger: glob
globs: bucket/*.json
---

# Scoop 清单编写规范

处理 `bucket/*.json` 文件时，必须遵守以下规范。

## 1. 命名规则

- 清单文件名 MUST 使用小写 + 连字符（如 `chrome-plus.json`）。

## 2. 字段编写规范

- **必填字段 (MUST)**：`version`, `description`, `homepage`, `license`, `url` (或通过 `architecture` 指定), `hash`。
  - MUST NOT 省略 `hash` 字段（安全风险）。
- **自动更新配置 (MUST)**：MUST 包含 `checkver` 和 `autoupdate` 字段，保证该软件能够被系统自动识别和更新。
- **快捷方式 (SHOULD)**：GUI 应用程序 SHOULD 添加 `shortcuts` 字段。
- **持久化配置 (SHOULD / MUST)**：
  - 需要持久化数据的应用 SHOULD 添加 `persist` 字段。
  - **持久化动态文件初始化 (MUST)**：当 `persist` 包含的文件在原始安装包中不存在（仅在首次运行后才生成）时，MUST 在 `pre_install` 钩子中预先在 `$persist_dir` 下建立空文件或目录（需带 `-Force` 以确保自动创建父级目录），以确保 Scoop 软链接正常工作。
- **参考文档**：
  - 字段详细说明参考 `docs/scoop-wiki/App-Manifests.md`
  - 自动更新配置参考 `docs/scoop-wiki/App-Manifest-Autoupdate.md`
  - 安装脚本可用变量参考 `docs/scoop-wiki/Pre-Post-(un)install-scripts.md`

## 3. README 同步规则 (MUST)

- 新增/删除清单时 MUST 同步更新 `README.md` 中的应用列表。
- 应用列表为 Markdown 表格，列为 `APP`、`Manifest`、`Description`、`Persist`：
  - `APP`：`[软件显示名](homepage)`，显示名用软件官方名称。
  - `Manifest`：清单文件名（不含 `.json` 后缀）。
  - `Description`：一句话中文简介。
  - `Persist`：`✔` = Scoop 可管理持久化数据（清单含 `persist` 字段）；`❌` = 有持久化数据但 Scoop 无法管理（存于 `AppData\Roaming` 等安装目录之外）；`🈚️` = 应用无需要持久化的数据。
- 应用按 `APP` 显示名字母顺序排序。

## 4. 注意事项与禁止事项

- MUST NOT 为修复局部问题重写整个清单。
- MUST NOT 修改与当前任务无关的清单文件。
- MUST NOT 在清单中硬编码用户特定的路径。
- MUST NOT 自行假设应用的安装行为；优先从现有清单、Scoop Wiki 寻找答案，如果仍无法确定，MUST 记录假设并告知用户。
- 调查以获取必要信息为限（版本、下载 URL、hash、包结构、persist 目标），下载安装包仅用于计算 hash 与分析目录结构，完成后清理临时文件。
