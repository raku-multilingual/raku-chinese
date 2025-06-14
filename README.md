# Chinese Language Module for Raku / Raku 中文語言模組

[English](#english) | [简体中文](#简体中文) | [繁體中文](#繁體中文)

## English

This module provides a comprehensive Chinese interface for Raku programming, supporting both Simplified (简体) and Traditional (繁體) Chinese. It allows Chinese speakers to write Raku programs using Chinese function names and operators.

### Features

- **200+ translated functions** covering all major Raku operations
- **Support for both Simplified and Traditional Chinese** - use whichever you prefer
- **Custom Chinese operators** for arithmetic, comparison, logic, and more
- **Comprehensive coverage** including I/O, math, strings, arrays, hashes, files, dates, and functional programming
- **Natural Chinese syntax** making code more readable for Chinese speakers

### Installation

```bash
# Clone the repository
git clone https://github.com/raku-multilingual/raku-chinese.git

# Or manually place the module in your Raku lib path
```

### Quick Start

```raku
use Chinese;

# Both Simplified and Traditional work
說 "你好，世界！";      # Simplified
講 "你好，世界！";      # Traditional

# Math operations
my $總 = 總和([1, 2, 3, 4, 5]);
說 "總和是：$總";

# Using operators (requires parentheses)
my $結果 = (10 加 5 乘 2);
說 "結果：$結果";
```

### Examples

See the `examples/` directory for more comprehensive examples:
- `00-測試簡單.raku` - Basic functionality test
- `01-你好世界.raku` - Hello World with various features
- `02-文本分析.raku` - Text analysis demonstration
- `03-函數式編程.raku` - Functional programming examples

### Limitations

Due to Rakudo issue #2404, this module cannot modify core language syntax. See `limitations.md` for details.

https://github.com/raku-multilingual/raku-chinese

---

## 简体中文

本模块为 Raku 编程语言提供全面的中文接口，同时支持简体和繁体中文。让中文使用者能够使用中文函数名和操作符编写 Raku 程序。

### 功能特点

- **200+ 翻译函数**，涵盖所有主要 Raku 操作
- **同时支持简体和繁体中文** - 使用您偏好的版本
- **自定义中文操作符**，包括算术、比较、逻辑等
- **全面覆盖**，包括输入输出、数学、字符串、数组、散列、文件、日期和函数式编程
- **自然的中文语法**，让代码对中文使用者更易读

### 安装

```bash
# 克隆仓库
git clone https://github.com/raku-multilingual/raku-chinese.git

# 或手动将模块放置在 Raku 库路径中
```

### 快速开始

```raku
use Chinese;

# 简体和繁体都可以使用
說 "你好，世界！";      # 简体
講 "你好，世界！";      # 繁体

# 数学运算
my $總 = 總和([1, 2, 3, 4, 5]);
說 "总和是：$總";

# 使用操作符（需要括号）
my $結果 = (10 加 5 乘 2);
說 "结果：$結果";
```

### 示例

查看 `examples/` 目录获取更多综合示例：
- `00-測試簡單.raku` - 基本功能测试
- `01-你好世界.raku` - 展示各种功能的 Hello World
- `02-文本分析.raku` - 文本分析演示
- `03-函數式編程.raku` - 函数式编程示例

### 限制

由于 Rakudo 问题 #2404，本模块无法修改核心语言语法。详见 `limitations.md`。

https://github.com/raku-multilingual/raku-chinese

---

## 繁體中文

本模組為 Raku 程式語言提供全面的中文介面，同時支援簡體和繁體中文。讓中文使用者能夠使用中文函數名和運算子編寫 Raku 程式。

### 功能特點

- **200+ 翻譯函數**，涵蓋所有主要 Raku 操作
- **同時支援簡體和繁體中文** - 使用您偏好的版本
- **自訂中文運算子**，包括算術、比較、邏輯等
- **全面覆蓋**，包括輸入輸出、數學、字串、陣列、雜湊、檔案、日期和函數式程式設計
- **自然的中文語法**，讓程式碼對中文使用者更易讀

### 安裝

```bash
# 複製儲存庫
git clone https://github.com/raku-multilingual/raku-chinese.git

# 或手動將模組放置在 Raku 函式庫路徑中
```

### 快速開始

```raku
use Chinese;

# 簡體和繁體都可以使用
說 "你好，世界！";      # 簡體
講 "你好，世界！";      # 繁體

# 數學運算
my $總 = 總和([1, 2, 3, 4, 5]);
說 "總和是：$總";

# 使用運算子（需要括號）
my $結果 = (10 加 5 乘 2);
說 "結果：$結果";
```

### 範例

查看 `examples/` 目錄獲取更多綜合範例：
- `00-測試簡單.raku` - 基本功能測試
- `01-你好世界.raku` - 展示各種功能的 Hello World
- `02-文本分析.raku` - 文字分析示範
- `03-函數式編程.raku` - 函數式程式設計範例

### 限制

由於 Rakudo 問題 #2404，本模組無法修改核心語言語法。詳見 `limitations.md`。

## License / 许可证 / 授權條款

This module is licensed under the Artistic License 2.0, same as Raku itself.

https://github.com/raku-multilingual/raku-chinese
