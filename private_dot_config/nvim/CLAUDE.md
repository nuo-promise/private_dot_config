# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## 项目概述

这是一个基于 [LazyVim](https://github.com/LazyVim/LazyVim) 的 Neovim 配置，使用 lazy.nvim 作为包管理器。

## 常用命令

### 插件管理
- `:Lazy` - 打开 lazy.nvim 管理界面（安装/更新/清理插件）
- `:Lazy restore` - 根据 lazy-lock.json 恢复插件版本

### LSP/工具管理
- `:Mason` - 打开 Mason 界面（管理 LSP servers、linters、formatters）
- `:LspInfo` - 查看当前 buffer 的 LSP 状态
- `:LspRestart` - 重启 LSP

### Treesitter
- `:TSPlaygroundToggle` - 打开 Treesitter playground（查看语法树）
- `:TSInstall <language>` - 安装语言 parser
- `:TSUpdate` - 更新所有 parsers

### 其他
- `:ZenMode` - 专注模式
- `:ToggleAutoformat` - 切换自动格式化
- `:Noice` - 查看消息历史

## 代码格式化

Lua 代码使用 stylua 格式化，配置见 `stylua.toml`:
- 缩进: 2 空格
- 列宽: 120

运行格式化: `stylua lua/`

## 架构结构

```
├── init.lua              # 入口文件，设置全局 debug 函数 dd()
├── lua/
│   ├── config/
│   │   ├── lazy.lua      # lazy.nvim 配置，定义 LazyVim extras 和插件导入
│   │   ├── options.lua   # Vim 选项设置
│   │   ├── keymaps.lua   # 自定义快捷键
│   │   └── autocmds.lua  # 自动命令
│   ├── plugins/          # 插件配置（返回 table 的模块）
│   │   ├── lsp.lua       # LSP servers 配置
│   │   ├── coding.lua    # 编码相关插件（inc-rename, dial, copilot）
│   │   ├── editor.lua    # 编辑器增强（telescope, blink.cmp）
│   │   ├── ui.lua        # UI 插件（noice, bufferline, lualine）
│   │   ├── treesitter.lua
│   │   ├── colorscheme.lua  # solarized-osaka 主题
│   │   └── augment.lua   # Augment Code AI 集成
│   ├── craftzdog/        # 自定义工具模块
│   │   ├── hsl.lua       # 颜色转换工具 (hex <-> HSL)
│   │   └── lsp.lua       # LSP 工具函数（toggle inlay hints/autoformat）
│   └── util/
│       └── debug.lua     # 调试工具 (dd 函数, 内存泄漏检测)
```

## 关键配置

### 已启用的 LazyVim Extras
- `linting.eslint` - ESLint 集成
- `formatting.prettier` - Prettier 格式化
- `lang.typescript` - TypeScript 支持
- `lang.json` - JSON 支持
- `lang.rust` - Rust 支持
- `lang.tailwind` - Tailwind CSS 支持
- `util.mini-hipatterns` - 高亮模式

### 自定义快捷键
| 快捷键 | 模式 | 功能 |
|--------|------|------|
| `ag` | n/v | Augment AI chat |
| `sf` | n | 文件浏览器 (telescope file_browser) |
| `;f` | n | 查找文件 |
| `;r` | n | 实时 grep |
| `\\` | n | 列出 buffers |
| `<leader>r` | n | Hex 转 HSL |
| `<leader>i` | n | 切换 inlay hints |
| `<leader>z` | n | Zen Mode |
| `<leader>gb` | n | Git blame |
| `<C-l>` | i | Copilot 接受建议 |

### LSP Servers
通过 Mason 安装: `stylua`, `selene`, `luacheck`, `shellcheck`, `shfmt`, `tailwindcss-language-server`, `typescript-language-server`, `css-lsp`, `jdtls`, `pyright`, `vue-language-server`, `clangd`

### 禁用的功能
- `flash.nvim` - 跳转插件（已禁用）
- `render-markdown.nvim` - Markdown 渲染（已禁用）
- snacks.nvim scroll - 滚动动画（已禁用）

## 开发注意事项

1. **修改插件配置**: 在 `lua/plugins/` 下对应文件修改，返回 table 格式
2. **添加新插件**: 在 `lua/plugins/` 下创建新文件或修改现有文件
3. **调试**: 使用全局 `dd(value)` 函数打印调试信息
4. **主题**: 使用 solarized-osaka，透明背景模式
5. **补全**: 使用 blink.cmp 替代默认的 nvim-cmp
6. **Picker**: 使用 telescope 替代 snacks.picker
