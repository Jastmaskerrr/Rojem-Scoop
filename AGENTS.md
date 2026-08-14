# Rojem-Scoop 项目规范

个人用 Scoop bucket，核心是通过高级脚本逻辑实现软件的便携化整合与自动化维护。

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

- `bucket/` 下只放 JSON 清单文件，MUST NOT 放脚本或其他文件
- `scripts/` 存放被清单 `pre_install`/`post_install` 引用的外部脚本
- `bin/` 是 Scoop 官方工具，MUST NOT 修改其内容

## 2. 开发规范

### 语言规则

- 会话语言、代码注释、PowerShell 注释帮助（`.SYNOPSIS` 等）：MUST 使用中文
- 错误信息：MUST 使用英语
- 中文与英数字之间：MUST 插入半角空格

### Git 规则

- 提交信息 MUST 遵循 [Conventional Commits](https://www.conventionalcommits.org/en/v1.0.0/)
  - 格式：`<type>(<scope>): <description>`，`<description>` 使用中文
  - 示例：`feat: 添加 chrome-plus 清单`
- 分支命名 MUST 遵循 [Conventional Branch](https://conventional-branch.github.io)
  - 格式：`<type>/<description>`（type 用缩写：feat, fix）

### 命名规则

- 清单文件名 MUST 使用小写 + 连字符（如 `chrome-plus.json`）

### 清单编写规则

- MUST 包含的字段：`version`, `description`, `homepage`, `license`, `url`/`architecture`, `hash`
- MUST 包含 `checkver` 和 `autoupdate`（保证自动更新能力）
- SHOULD 为 GUI 应用添加 `shortcuts` 字段
- SHOULD 为需要持久化数据的应用添加 `persist` 字段
- 持久化动态文件初始化（MUST）：当 `persist` 包含的文件在原始安装包中不存在（仅在首次运行后才生成）时，MUST 在 `pre_install` 钩子中预先在 `$persist_dir` 下建立空文件或目录（需带 `-Force` 以确保自动创建父级目录），以确保 Scoop 软链接正常工作。
- 字段详细说明参考 `docs/scoop-wiki/App-Manifests.md`
- 自动更新配置参考 `docs/scoop-wiki/App-Manifest-Autoupdate.md`
- 安装脚本可用变量参考 `docs/scoop-wiki/Pre-Post-(un)install-scripts.md`

### README 编写规则

- 应用列表为 Markdown 表格，列为 `APP`、`Manifest`、`Description`、`Persist`
  - `APP`：`[软件显示名](homepage)`，显示名用软件官方名称
  - `Manifest`：清单文件名（不含 `.json` 后缀）
  - `Description`：一句话中文简介
  - `Persist`：`✔` = Scoop 可管理持久化数据（清单含 `persist` 字段）；`❌` = 有持久化数据但 Scoop 无法管理（存于 `AppData\Roaming` 等安装目录之外）；`🈚️` = 应用无需要持久化的数据
- 应用按 `APP` 显示名字母顺序排序
- 新增/删除清单时 MUST 同步更新应用列表

## 3. 工作流程

### 修改代码前

1. 阅读任务涉及的清单文件和相关脚本
2. 解压或分析应用安装包文件结构，猜测判断可能需要持久化的文件或目录，确认 `persist` 目标文件是否存在。若为运行后动态生成的配置文件，提前规划 `pre_install` 建立空文件逻辑
3. 在将清单正式添加进 bucket 前，向用户列出拟定的各 Scoop Manifest 字段内容，供用户确认无误后再写入文件
4. 确认工作分支基于最新远程主分支
5. 确认不在已关闭 PR 的废弃分支上工作

### 小型修改（单个清单的新增/更新）

1. 在获得用户对清单内容的确认后，执行文件写入，并在完成后运行验证。
2. 添加更新清单时，给 README.md 在应用列表中添加新清单。

### 中型修改（多个清单或脚本联动）

1. 先分析清单间的依赖关系（`suggest`、`depends`）
2. 形成修改计划
3. 逐个实施并验证

### 大型修改（涉及项目结构或通用模式变更）

1. MUST 先分析现状并形成方案
2. MUST NOT 直接大规模删改
3. 分阶段实施，每阶段完成后验证

### 提交前

1. 运行 `.\bin\formatjson.ps1` 统一 JSON 格式
2. 运行 `.\bin\test.ps1` 确认测试通过
3. 确认提交内容不包含敏感信息

### 创建 PR

1. MUST 确认用户已要求创建 PR
2. PR 正文 MUST 用中文完整描述当前状态（不含历史更新记录）
3. 使用 `gh pr checks <PR ID> --watch` 等待 CI 通过
4. 如果本地有 `request-review-copilot` 命令，请求 Copilot 审查并处理反馈
5. 使用 `/code-review` 命令执行代码审查，处理评分 ≥ 50 的问题

## 4. 验证规则

### 完成标准

任务只有满足以下全部条件才视为完成：

- 清单 JSON 格式正确（`formatjson.ps1` 无报错）
- 测试通过（`test.ps1` 无报错）
- 没有修改与任务无关的文件
- 没有遗留临时代码或调试输出
- `README.md` 应用列表已同步更新（如涉及新增/删除清单）

### 验证命令

```powershell
.\bin\formatjson.ps1    # JSON 格式验证
.\bin\test.ps1          # Pester 测试
.\bin\checkver.ps1      # 版本检查
.\bin\checkhashes.ps1   # 哈希验证
.\bin\checkurls.ps1     # URL 可达性检查
```

### 验证脚本运行环境

> 运行上述 `.ps1` 验证脚本时，MUST 优先使用 **PowerShell 7（`pwsh`）**，而非 Windows PowerShell 5.1。

## 5. 禁止事项

- MUST NOT 修改 `bin/` 下的 Scoop 官方工具脚本
- MUST NOT 对 Excavator 自动创建的版本更新 PR 进行追加提交
- MUST NOT 删除或修改现有测试来使测试通过
- MUST NOT 为修复局部问题重写整个清单
- MUST NOT 修改与当前任务无关的清单文件
- MUST NOT 在清单中硬编码用户特定的路径
- MUST NOT 省略 `hash` 字段（安全风险）
- MUST NOT 省略 `checkver`/`autoupdate` 字段（导致无法自动更新）

## 6. 决策原则

### 方案选择优先级

存在多个实现方案时，按以下顺序选择：

1. 复用现有清单中已验证的模式
2. 保持与仓库整体风格一致
3. 最小化修改范围
4. 降低长期维护成本

### 不确定时

- MUST NOT 自行假设应用的安装行为
- 优先从现有清单、Scoop Wiki 文档寻找答案
- 如果仍无法确定，MUST 记录假设并告知用户

### 调查范围

- 调查以获取必要信息为限：版本、下载 URL、hash、包结构、persist 目标
- 下载安装包仅用于计算 hash 与分析目录结构，完成后清理临时文件
- 查清即停，不做与当前改动无关的延伸调查（如依赖包版本号等）

### 规则优先级

发生冲突时：

1. 用户当前任务的明确要求
2. 本文件中的规则
3. 项目中其他文档
4. Agent 默认实践

## 7. 文档索引

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
