<div align="center">
    <h1 align="center">✨<a href="https://github.com/Jastmaskerrr/Rojem-Scoop/">Rojem-Scoop</a>✨</h1>
    <p align="center">
        一个专注于复杂软件便携化（Portable）整合与自动化维护的 Scoop 个人仓库。核心特色是通过高级脚本逻辑（如 Installer/Post-install 钩子）实现软件间的目录融合、环境隔离与依赖管理。
</div>



<p align="center">
    <a href="https://github.com/Jastmaskerrr/Rojem-Scoop">
        <img src="https://img.shields.io/github/stars/Jastmaskerrr/Rojem-Scoop" alt="github stars" />
    </a>
    <a href="https://github.com/Jastmaskerrr/Rojem-Scoop">
        <img src="https://img.shields.io/github/created-at/Jastmaskerrr/Rojem-Scoop" alt="created" />
    </a>
</p>



## 订阅Bucket

确保你已经有 Scoop 环境，执行以下命令订阅本软件仓库:

```pwsh
scoop bucket add rojem https://github.com/Jastmaskerrr/Rojem-Scoop
```

执行以下命令安装本仓库中的软件:

```
scoop install rojem/<manifest>
```



## 应用列表

| APP                                                          | Manifest               | Description                                                  | depends                 | Persist |
| ------------------------------------------------------------ | ---------------------- | ------------------------------------------------------------ | ----------------------- | ------- |
| [7-zip-zstd Codecs](https://github.com/mcmilk/7-Zip-zstd)    | 7zip-zstd-codecs       | 为`main` 7-Zip 添加附加编解码器，包括`Zstandard`、`Brotli`、`Lz4`、`Lz5`和`Lizard` | `main/7zip`             | 🈚️       |
| [7-Zip-zstd TotalCmd](https://github.com/mcmilk/7-Zip-zstd)  | 7zip-zstd-totalcmd     | 替换 [Total Commander](https://www.ghisler.com/) 的`tc7z.dll` ，支持7-Zip的Zstandard（`Zstd`、`Brotli`、`Lz4`、`Lz5`、`Lizard`）格式 | `extras/totalcommander` | 🈚️       |
| [Ahk2Exe](https://github.com/AutoHotkey/Ahk2Exe/releases)    | ahk2exe                | 官方的 [AutoHotkey](https://www.autohotkey.com/) 脚本编译器  |                         | 🈚️       |
| [Apollo Profile Manager](https://github.com/ClassicOldSong/ApolloProfileManager) | apollo-profile-manager | 管理和自动交换 [Apollo ](https://github.com/ClassicOldSong/Apollo)不同客户端之间的游戏配置文件、存档文件、模组集和其他用户数据的工具 |                         | ✔       |
| [AutoHotkey_H](https://github.com/thqby/AutoHotkey_H)        | autohotkey-h           | 一个具有多线程等附加功能的[AHK V2](https://www.autohotkey.com/v2/)分支 |                         | 🈚️       |
| [AutoHotkey v1](https://www.autohotkey.com)                  | autohotkey1            | [AHK v1](https://www.autohotkey.com/download/1.1/)版，与`main`中的AHK共存 |                         | 🈚️       |
| [Chrome](https://github.com/Bush2021/chrome_installer)       | chrome-core            | 自动抓取 [Google Chrome](https://www.google.com/chrome/) 官方离线安装包，并将其二进制文件无缝注入至 `chrome-plus` 的宿主目录中 | `rojem/chrome-plus`     | 🈚️       |
| [Chrome++ Next](https://github.com/Bush2021/chrome_plus/)    | chrome-plus            | [Chrome](https://www.google.com/chrome/) 的便携化宿主环境，DLL劫持实现了Chrome浏览器的完全可移植性以及标签页增强功能 |                         | ✔       |
| [Context Menu Manager](https://github.com/Jack251970/ContextMenuManager) | contextmenumanager     | 一个管理 Windows 右键上下文菜单的程序                        |                         | ✔       |
| [echotrace](https://github.com/ycccccccy/echotrace)          | echotrace              | 一个本地、安全的微信聊天记录导出、分析与年度报告生成工具     |                         | ✔       |
| [Neokikoeru](https://github.com/vscodev/neokikoeru)          | neokikoeru             | 基于云存储的DLsite音声作品管理和媒体播放软件，使用Go和Vue.js开发 |                         | ❌       |
| [Open Internet Explorer](https://github.com/AigioL/OpenInternetExplorer) | open-Internet-explorer | 在 Windows 11 中打开 Internet Explorer                       |                         | 🈚️       |
| [Stelliberty](https://github.com/Kindness-Kismet/Stellibert) | stelliberty            | 现代化 [Mihomo](https://github.com/MetaCubeX/mihomo) 客户端  |                         | ✔       |
| [Tremotesf 2](https://github.com/equeim/tremotesf2)          | tremotesf2             | Bittorrent 客户端 [Transmission](https://transmissionbt.com/) 的GUI |                         | ❌       |
| [wx_key](https://github.com/ycccccccy/wx_key/)               | wx-key                 | 获取[微信](https://weixin.qq.com/)4.0版本以上数据库密钥和图片密钥的工具 |                         | ✔       |



## 疑问

**1. 我想要某个软件，这个仓库里没有！**

开 [issue](https://github.com/tldro/scoop-security/issues?q=sort%3Aupdated-desc+is%3Aissue+is%3Aopen)，描述你的需求。

**2. 仓库中的某个软件版本落后了，求更新！**

欢迎 Fork 本仓库，修改落后的软件清单，并提交你的拉取请求。

