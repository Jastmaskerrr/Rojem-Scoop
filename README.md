<div align="center">
    <h1 align="center">✨<a href="https://github.com/Myraxion/Rojem-Scoop/">Rojem-Scoop</a>✨</h1>
    <p align="center">
        一个专注于复杂软件便携化（Portable）整合与自动化维护的 Scoop 个人仓库。核心特色是通过高级脚本逻辑（如 Installer/Post-install 钩子）实现软件间的目录融合、环境隔离与依赖管理。
</div>

<p align="center">
    <a href="https://github.com/Myraxion/Rojem-Scoop">
        <img src="https://img.shields.io/github/stars/Myraxion/Rojem-Scoop" alt="github stars" />
    </a>
    <a href="https://github.com/Myraxion/Rojem-Scoop/tree/main/bucket">
        <img src="https://img.shields.io/github/directory-file-count/Myraxion/Rojem-Scoop/bucket?label=apps" alt="apps count" />
    </a>
    <a href="https://github.com/Myraxion/Rojem-Scoop">
        <img src="https://img.shields.io/github/created-at/Myraxion/Rojem-Scoop" alt="created" />
    </a>
</p>

## 订阅Bucket

确保你已经有 Scoop 环境，执行以下命令订阅本软件仓库:

```pwsh
scoop bucket add rojem https://github.com/Myraxion/Rojem-Scoop
```

执行以下命令安装本仓库中的软件:

```pwsh
scoop install rojem/<manifest>
```

## 应用列表 [![apps](https://img.shields.io/github/directory-file-count/Myraxion/Rojem-Scoop/bucket?label=%E6%94%B6%E5%BD%95%E6%95%B0%E9%87%8F)](https://github.com/Myraxion/Rojem-Scoop/tree/main/bucket)

| APP                                                          | Manifest                     | Description                                                  | Persist |
| ------------------------------------------------------------ | ---------------------------- | ------------------------------------------------------------ | ------- |
| [7-Zip Zstandard](https://mcmilk.de/projects/7-Zip-zstd/)    | 7zip-zstd                    | 一款基于 [7-Zip](https://www.7-zip.org/) 的多格式归档工具，在保持高压缩比的同时，增加了对 Zstandard、Brotli、LZ4、LZ5、Lizard 和 Fast-LZMA2 等现代压缩编解码器的支持 | ✔       |
| [7-zip-zstd Codecs](https://github.com/mcmilk/7-Zip-zstd)    | 7zip-zstd-codecs             | 为`main` [7-Zip](https://www.7-zip.org/) 添加附加编解码器，包括`Zstandard`、`Brotli`、`Lz4`、`Lz5`和`Lizard` | 🈚️       |
| [7-Zip-zstd TotalCmd](https://github.com/mcmilk/7-Zip-zstd)  | 7zip-zstd-totalcmd           | 替换 [Total Commander](https://www.ghisler.com/) 的`tc7z.dll` ，支持 [7-Zip](https://www.7-zip.org/) 的Zstandard（`Zstd`、`Brotli`、`Lz4`、`Lz5`、`Lizard`）格式 | 🈚️       |
| [Ahk2Exe](https://github.com/AutoHotkey/Ahk2Exe/releases)    | ahk2exe                      | 官方的 [AutoHotkey](https://www.autohotkey.com/) 脚本编译器  | 🈚️       |
| [Apollo Profile Manager](https://github.com/ClassicOldSong/ApolloProfileManager) | apollo-profile-manager       | 管理和自动交换 [Apollo](https://github.com/ClassicOldSong/Apollo)不同客户端之间的游戏配置文件、存档文件、模组集和其他用户数据的工具 | ✔       |
| [AutoHotkey_H](https://github.com/thqby/AutoHotkey_H)        | autohotkey-h                 | 一个具有多线程等附加功能的[AHK V2](https://www.autohotkey.com/v2/)分支 | 🈚️       |
| [AutoHotkey v1](https://www.autohotkey.com)                  | autohotkey1                  | [AHK v1](https://www.autohotkey.com/download/1.1/)版，与`main`中的AHK共存 | 🈚️       |
| [AvPlay](https://github.com/anonymousjav/AvPlayRelease)     | avplay                       | 一款美观优雅的跨平台JAV播放器                               | ❌       |
| [BilibiliHistoryFetcher](https://github.com/LifeArchiveProject/BilibiliHistoryFetcher) | bilibili-history-fetcher     | 获取b站历史记录，一键下载用户所有的视频，动态，收藏夹，找回14天内b站在屏幕上显示过的图片，生成详细的年度总结，自动化任务 | ✔       |
| [BiliHistoryFrontend](https://github.com/LifeArchiveProject/BiliHistoryFrontend) | bilibili-history-frontend    | 基于 Vue 3 开发的 B 站历史记录分析工具的前端项目，为用户提供丰富的 B 站观看历史数据分析功能。 | ❌       |
| [BingWallpaper](https://github.com/jadepeng/bing-wallpaper)  | bing-wallpaper               | Bing每日壁纸，自动获取Bing的精美图片设置为壁纸，并且支持随机切换历史壁纸，查看壁纸故事 | ✔       |
| [BlueGauge](https://github.com/iKineticate/BlueGauge)        | bluegauge                    | 轻松查看蓝牙设备电池电量的轻便托盘工具                       | ✔       |
| [BossKey](https://gitee.com/qiubin200236/boss-key)          | boss-key                     | 基于 C# 开发的老板键软件，支持按键/鼠标快捷键隐藏指定窗口与进程 | ✔       |
| [Browser Tamer](https://github.com/aloneguid/bt)             | browser-tamer                | 一款支持自动检测浏览器、代理规则与脚本配置的 Windows 浏览器代理路由工具 | ❌       |
| [CaesiumCLT](https://saerasoft.com/caesiumclt/)              | caesium-clt                  | Caesium命令行工具 - 有损/无损图像压缩工具                    | 🈚️       |
| [CBconvert](https://github.com/gen2brain/cbconvert)          | cbconvert                    | 漫画格式转换与重采样工具，支持 CBR、CBZ、PDF 等多种格式转换与调整 (标准版) | 🈚️       |
| [CBconvert WinUI](https://github.com/gen2brain/cbconvert)    | cbconvert-winui              | 漫画格式转换与重采样工具，支持 CBR、CBZ、PDF 等多种格式转换与调整 (WinUI 现代版) | 🈚️       |
| [CefFlashBrowser](https://github.com/Mzying2001/CefFlashBrowser) | cefflashbrowser              | 自带 Flash Player 插件的浏览器，可以正常显示网页上的 Flash 内容，此外还支持打开本地 SWF 文件，管理 Flash 游戏存档等。 | ✔       |
| [Chrome](https://github.com/Bush2021/chrome_installer)       | chrome-core                  | 自动抓取 [Google Chrome](https://www.google.com/chrome/) 官方离线安装包，并将其二进制文件无缝注入至 `chrome-plus` 的宿主目录中 | 🈚️       |
| [Chrome++ Next](https://github.com/Bush2021/chrome_plus/)    | chrome-plus                  | [Chrome](https://www.google.com/chrome/) 的便携化宿主环境，DLL劫持实现了Chrome浏览器的完全可移植性以及标签页增强功能 | ✔       |
| [ComicGUISpider](https://cgs.101114105.xyz)                  | comicguispider               | 跨平台漫画/本子下载 GUI，支持拷贝漫画、Māngabz、漫画柜、动漫屋、禁漫天堂、wnacg、exhentai、nhentai、hitomi.la、kemono、danbooru 等众多站点 | ❌       |
| [Context Menu Manager](https://github.com/Jack251970/ContextMenuManager) | context-menu-manager         | 一个管理 Windows 右键上下文菜单的程序                        | ✔       |
| [CudaLister](https://github.com/Alexey-T/CudaLister/)        | cudalister                   | 基于 ATSynEdit 的 Total Commander Lister 插件                | 🈚️       |
| [Digital Clock](https://sourceforge.net/projects/digitalclock4/) | digital-clock-5              | 一款美观的可定制时钟，支持插件功能                           | ✔       |
| [Discord](https://portapps.io/app/discord-portable/)         | discord                      | 便携版Discord客户端，并持久化[BetterDiscord](https://mwittrien.github.io/)插件 | ✔       |
| [echotrace](https://github.com/ycccccccy/echotrace)          | echotrace                    | 一个本地、安全的[微信](https://weixin.qq.com/)聊天记录导出、分析与年度报告生成工具 | ✔       |
| [embyToLocalPlayer](https://github.com/kjtsune/embyToLocalPlayer) | emby-to-local-player        | Emby/Jellyfin/Plex 调用外部本地播放器并回传播放记录的服务脚本，需安装 Python，并在配置文件中设置播放器路径与播放器选择 | ✔       |
| [EPUB Metadata Editor](https://github.com/benchen71/epub-metadata-editor) | epub-metadata-editor         | 编辑 EPUB 电子书元数据的图形化工具 | ❌       |
| [ExHyperV](https://github.com/Justsenger/ExHyperV)           | exhyperv                     | 一款提供高级HyperV虚拟机功能的图形用户界面软件，例如DDA和GPU-PV。 | ✔       |
| [ExifTool](https://exiftool.org/)                            | exiftool                     | 一个用于读取、写入和编辑各种文件元信息的命令行应用程序。如果检测  [Total Commander](https://www.ghisler.com/) ，将可执行文件复制到 [ExifToolView](totalcmd.net/plugring/exiftoolview.html) 插件目录内 | 🈚️       |
| [FancyStart](https://github.com/zyfzsi/fancyStart)           | fancystart                   | Windows 开机启动项管理工具，基于 WPF (.NET 8) 构建           | 🈚️       |
| [FFmpeg Builds for yt-dlp](https://github.com/yt-dlp/FFmpeg-Builds) | ffmpeg-shared-yt-dlp-nightly | 适用于 yt-dlp 的 FFmpeg 构建，特意去除了生成shims，防止与官方 [FFmpeg](https://ffmpeg.org) 冲突 | 🈚️       |
| [FlClash-Patched](https://github.com/chenx-dust/FlClash-Patched) | flclash-patched              | 基于 ClashMeta 的多平台代理客户端（社区补丁维护版）          | ❌       |
| [Flood](https://flood.js.org)                               | flood                        | 适用于各类 Torrent 客户端的现代 Web UI，基于 Node.js 后端与 React 前端构建 | ❌       |
| [fuck-xxxmoe](https://github.com/chenaive/fuck-xxxmoe)       | fuck-xxxmoe                  | 提取 xxx.moe 系漫画网站 EPUB 文件中的图片，并按实际阅读顺序排序 | 🈚️       |
| [GPUSwitch](https://github.com/JasonHu051219/GPUSwitch)      | gpuswitch                    | GPUSwitch (GPUS) - Windows 显卡切换程序。是一款为 Windows 10/11 用户设计的轻量级显卡首选项管理工具。通过“进程监听 + 动态重启”的技术方案，解决了双显卡笔记本电脑显卡切换繁琐的痛点。 | 🈚️       |
| [GoogleTranslate_IPFinder](https://github.com/GoodCoder666/GoogleTranslate_IPFinder) | google-translate-ipfinder    | 谷歌翻译 API 服务器的 IP 扫描、测速工具                      | ❌       |
| [HustWebAuth](https://github.com/a76yyyy/HustWebAuth)        | hustwebauth                  | 锐捷校园网 Web 认证命令行工具                                | 🈚️       |
| [Iceweasel](https://sourceforge.net/projects/libportable/)   | iceweasel                    | 便携版Firefox                                                | ✔       |
| [Imagine](https://www.nyam.pe.kr/dev/imagine/)               | imagine                      | 快速、紧凑的图像和动画查看器。可以作为独立应用程序使用，也可以作为 [Total Commander](https://www.ghisler.com/) 的 Lister 插件集成 | ✔       |
| [ImeSavior](https://github.com/cs0tony/ime-savior)           | ime-savior                   | Windows 11 第三方输入法救星，启动后自动触发触摸键盘以修复输入法首字母英文 Bug | 🈚️       |
| [imgbrd-grabber](https://www.bionus.org/imgbrd-grabber/)     | imgbrd-grabber               | 支持强大文件名定制功能的图像板（Imageboard/Booru）批量下载工具 | ✔       |
| [Immich-Go GUI](https://github.com/shitan198u/immich-go-gui) | immich-go-gui                | Immich-Go GUI 是一个用于将照片和视频上传、迁移和备份到 Immich 的跨平台桌面应用程序。 | ❌       |
| [Keep-Screen-WIN](https://github.com/Kindness-Kismet/Keep-Screen-WIN) | keep-screen                  | 一个极简的保持 Windows 屏幕常亮的小工具                      | 🈚️       |
| [Keymap](https://github.com/cataerogong/keymap)             | keymap                       | 快捷键可视化与记录工具，支持托盘全局热键唤起                 | ✔       |
| [KeywordGacha](https://github.com/neavo/KeywordGacha)        | keywordgacha                 | 使用 AI 能力一键分析 小说、游戏、字幕 等文本内容并生成术语表的次世代翻译辅助工具 | ✔       |
| [Kindle Mate 2](https://github.com/lzcapp/KindleMate2)       | kindlemate2                  | Kindle 标注、笔记与生词本管理工具                                         | ✔       |
| [LinguaGacha](https://github.com/neavo/LinguaGacha)          | linguagacha                  | 使用 AI 能力一键翻译 小说、游戏、字幕 等文本内容的次世代文本翻译器 | ✔       |
| [locale-remulator](https://github.com/InWILL/Locale_Remulator) | locale-remulator             | 系统区域和语言模拟器                                         | ✔       |
| [Memospot](https://github.com/memospot/memospot)             | memospot                     | [Memos](https://usememos.com/) 的独立桌面版本，可本地运行Memos，也可以连接到远程 Memos 服务器 | ❌       |
| [MoonLight 基地版](https://github.com/qiin2333/moonlight-qt) | moonlight-foundation         | 基地版[moonlight](https://github.com/moonlight-stream/moonlight-qt)客户端，支持[官方版Sunshine](https://docs.lizardbyte.dev/projects/sunshine/latest/index.html)和[基地版Sunshine](https://sunshine-foundation.vercel.app/) | ✔       |
| [mouse jiggler](https://github.com/arkane-systems/mousejiggler) | mouse-jiggler                | “模拟”鼠标输入来回抖动                                       | 🈚️       |
| [Neokikoeru](https://github.com/vscodev/neokikoeru)          | neokikoeru                   | 基于云存储的 DLsite 音声作品管理和媒体播放软件               | ❌       |
| [OliveTin](https://www.olivetin.app/)                        | olivetin                     | OliveTin 提供通过网络界面安全且简单地访问预定义的 shell 命令。 | ✔       |
| [Open Internet Explorer](https://github.com/AigioL/OpenInternetExplorer) | open-internet-explorer       | 在 Windows 11 中打开 Internet Explorer                       | 🈚️       |
| [OpenLogi](https://github.com/AprilNEA/OpenLogi)             | openlogi                     | 基于 Rust 的原生本地罗技 (Logitech Options+) 替代工具，支持 HID++ 按键重映射、DPI 与 SmartShift 设置 | 🈚️       |
| [PixaiTaggerOnnxGui](https://github.com/wai55555/PixaiTaggerOnnxGui) | pixai-tagger-onnx-gui        | 基于 Pixai Tagger ONNX 的本地图像自动打 Danbooru 标签 GUI 工具 | ✔       |
| [Pomotroid](https://github.com/splode/pomotroid)             | pomotroid                    | 简单易用的番茄钟计时器                                       | ❌       |
| [PowerRun](https://www.sordum.org/9416/)                     | powerrun                     | TrustedInstaller/NT Authority/系统相同的权限运行 regedit.exe、Cmd.exe 或其他软件 | ✔       |
| [pyTranscriber](https://pytranscriber.github.io/)            | pytranscriber                | 通过友好的图形用户界面，为音频/视频文件自动生成转录/字幕     | ❌       |
| [rScoop](https://github.com/AmarBego/Rscoop)                 | rscoop                       | A modern, efficient desktop GUI for Scoop, search, install, update and manage Windows packages without touching the terminal. | 🈚️       |
| [scoop-search-multisource](https://github.com/plicit/scoop-search-multisource) | scoop-search-multisource     | 默认情况下搜索本地Scoop活动存储桶和远程 Rasa HTML scoop目录  | ❌       |
| [Send Windows Key](https://www.sordum.org/12894/)            | send-windows-key             | 通过命令行发送Windows按键                                    | 🈚️       |
| [Skills Manager](https://github.com/xingkongliang/skills-manager) | skills-manager               | AI Agent 技能（Skills）跨工具管理与同步工具                   | ❌       |
| [Skip UAC Prompt](https://www.sordum.org/16219/)             | skip-uac-prompt              | 为选定的应用程序启用或禁用 UAC，而无需完全禁用系统范围内的 UAC | ✔       |
| [Stelliberty](https://github.com/Kindness-Kismet/Stellibert) | stelliberty                  | 现代化 [Mihomo](https://github.com/MetaCubeX/mihomo) 客户端  | ✔       |
| [Traynard](https://github.com/tabris17/traynard)             | traynard                     | 将任意应用窗口最小化到系统托盘                               | ✔       |
| [Tremotesf 2](https://github.com/equeim/tremotesf2)          | tremotesf                    | Bittorrent 客户端 [Transmission](https://transmissionbt.com/) 的GUI | ❌       |
| [uLister](https://github.com/evgen0xb/uLister)               | ulister                      | Total Commander Lister plugin,uLister is a powerful document viewer which can open more than 500 file formats. | 🈚️       |
| [WhoShitsonMyC](https://github.com/Kami958/WhoShitsonMyC)     | whoshitsonmyc                | 磁盘空间变化对比轻量小工具                                   | ❌       |
| [wx_key](https://github.com/ycccccccy/wx_key/)               | wx-key                       | 获取[微信](https://weixin.qq.com/)4.0版本以上数据库密钥和图片密钥的工具 | ✔       |
| [XiaoYao_QuickJump](https://github.com/lch319/XiaoYao_QuickJump) | xiaoyao-quickjump            | 在打开或保存对话框中，快速跳转到当前 资源管理器/TC/DO/XY/Q-Dir中打开的文件夹路径 | ✔       |

> **Persist 列说明**：`✔` = Scoop 可管理持久化数据；`❌` = 有持久化数据但 Scoop 无法管理（如存于 `AppData\Roaming`）；`🈚️` = 应用无需要持久化的数据。

## 疑问

**1. 我想要某个软件，这个仓库里没有！**

开 issue，描述你的需求。

**2. 仓库中的某个软件版本落后了，求更新！**

欢迎 Fork 本仓库，修改落后的软件清单，并提交你的拉取请求。
