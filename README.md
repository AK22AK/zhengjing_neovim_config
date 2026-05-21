# Neovim 配置使用指南

## 基础设置

| 设置项 | 值 | 说明 |
|--------|-----|------|
| 空格 | `<Leader>` 键 | 多数快捷键的前缀 |
| 行号 | 开启 | 绝对行号 |
| 缩进 | 2 空格 | tab 自动转空格 |
| 自动换行 | 开启 | 长文本自动折行 |
| 剪贴板 | 系统剪贴板 | `unnamedplus`，复制粘贴与系统互通 |
| 鼠标 | 已启用 | 支持鼠标点击和滚轮 |
| 光标行高亮 | 开启 | 方便定位 |

---

## 插件列表

| 插件 | 用途 |
|------|------|
| **NERDTree** | 文件树/目录浏览 |
| **Telescope** | 模糊搜索（文件、内容、缓冲区、帮助） |
| **nvim-treesitter** | 更好的语法高亮和代码解析 |
| **render-markdown.nvim** | Markdown 渲染预览 |
| **lualine.nvim** | 美化状态栏 |
| **tokyonight.nvim** | Tokyo Night 主题配色 |
| **Comment.nvim** | 快捷注释 |
| **nvim-web-devicons** | 文件图标 |

---

## 快捷键速查

### 文件操作

| 快捷键 | 功能 |
|--------|------|
| `<Leader> w` | 保存文件 |
| `<Leader> q` | 退出当前窗口 |
| `<Leader> h` | 取消搜索高亮 |

### 窗口管理

| 快捷键 | 功能 |
|--------|------|
| `<Leader> sv` | 垂直分割窗口 |
| `<Leader> sh` | 水平分割窗口 |
| `<Tab>` | 切换到下一个缓冲区 |
| `<S-Tab>` | 切换到上一个缓冲区 |

### 文件浏览 (NERDTree)

| 快捷键 | 功能 |
|--------|------|
| `<Leader> n` | 打开/关闭文件树 |

无参数启动 nvim 时自动打开 NERDTree；如果启动参数是目录也会自动打开。

### 模糊搜索 (Telescope)

| 快捷键 | 功能 |
|--------|------|
| `<Leader> ff` | 按文件名搜索文件 |
| `<Leader> fg` | 全文实时搜索（Live Grep） |
| `<Leader> fb` | 在已打开的缓冲区中切换 |
| `<Leader> fh` | 搜索 Vim 帮助文档 |

### 注释 (Comment.nvim)

- 普通模式下 `gcc` — 注释/取消注释当前行
- 可视模式下 `gc` — 注释/取消注释选中行
- 支持各种语言，自动适配注释符号

### 快速修复 / Grep

| 操作 | 说明 |
|------|------|
| `;;` | 打开/关闭 quickfix 窗口 |
| `:Rg <关键词>` | 全局搜索并将结果放入 quickfix |
| 在 quickfix 中按 `Enter` | 跳转到结果行并自动关闭 quickfix |

用法示例：

```
:Rg foo bar
```

在项目范围内搜索 `foo bar`，结果列在 quickfix 列表中。`Enter` 跳转并自动关闭列表。

### Markdown 编辑

- Treesitter 提供 Markdown 语法高亮
- **render-markdown.nvim** 在缓冲区中实时渲染 Markdown 格式（标题加粗、列表样式等）
- `gqq` 或 `gq` 可对 Markdown 做文本格式化（自动换行）

---

## 主题

配色方案为 **Tokyo Night**，状态栏跟随主题。

---

## 使用技巧

1. **快速搜索项目代码**：`<Leader> fg` 然后输入关键词，实时过滤，比传统 grep 快很多。
2. **文件快速跳转**：`<Leader> ff` 后输入文件名片段，模糊匹配。
3. **多文件编辑**：用 `<Tab>` / `<S-Tab>` 在多个缓冲区之间切换，类似浏览器的标签页。
4. **代码全局搜索**：`:Rg <pattern>` 搜索结果在 quickfix 列表统一展示，`Enter` 跳转。
5. **清理搜索高亮**：`<Leader> h` — 搜索后残留的高亮一键清除。
