# 中文模組限制 / Chinese Module Limitations

[English](#english) | [简体中文](#简体中文) | [繁體中文](#繁體中文)

## English

### Summary

This module provides Chinese functions and operators for Raku, but cannot modify the fundamental language syntax due to current Raku limitations (issue #2404).

### What Works

#### ✅ Translated Functions
- Over 200 functions translated to Chinese (both Simplified and Traditional)
- All math, string, list, I/O, file, date/time functions
- Examples:
  ```raku
  說 "你好！";                    # say "Hello!"
  my $和 = 總和([1,2,3,4,5]);    # sum([1,2,3,4,5])
  my $大寫 = 大寫("hello");      # uc("hello")
  ```

#### ✅ Custom Operators
- Arithmetic: `加`, `減`, `乘`, `除`, `餘`, `冪`
- Comparison: `等於`, `不等於`, `大於`, `小於`, `大於等於`, `小於等於`
- Logical: `且`, `或`, `非`
- String: `連接`, `重複字符串`
- Range: `到`, `直到`
- Assignment: `加等於`, `減等於`, `乘等於`, `除等於`

**Important Note**: Operators require parentheses for precedence:
```raku
# Correct
my $結果 = (5 加 3 乘 2);         # (5+3)*2 = 16
my $結果 = (5 加 (3 乘 2));       # 5+(3*2) = 11

# In conditions
if ($年齡 大於等於 18) { ... }
```

#### ✅ Constants
```raku
真        # True
假        # False
空        # Nil
無限      # Inf
非数      # NaN
圓周率    # 3.14159...
自然對數底 # 2.71828...
```

### What Does NOT Work

#### ❌ Language Keywords
Cannot translate control structures:
```raku
# Does NOT work:
如果 ($x > 5) { ... }          # if
當 ($x < 10) { ... }           # while
對於 @列表 { ... }             # for

# Must use original:
if ($x > 5) { ... }
while ($x < 10) { ... }
for @列表 { ... }
```

#### ❌ Variable Declaration
```raku
# Does NOT work:
我的 $變量 = 5;                # my
我們的 $共享 = 10;             # our

# Must use:
my $變量 = 5;
our $共享 = 10;
```

#### ❌ Class and Method Syntax
```raku
# Does NOT work:
類 我的類 { ... }              # class
方法 foo() { ... }             # method

# Must use:
class 我的類 { ... }
method foo() { ... }
```

### Technical Reason

Rakudo (Raku's implementation) has issue #2404 preventing modules from fully modifying the language grammar. Slangs currently cannot:
1. Change reserved keywords
2. Modify declaration syntax
3. Alter core control structures

However, they CAN:
- Define new functions
- Create custom operators
- Export symbols to namespace

### Workarounds

#### For Control Structures
Use provided functions with blocks:
```raku
# Instead of if/while syntax
如果($x > 5, { 說 "較大" }, { 說 "較小或相等" });

當({ $x < 10 }, { 
    說 $x;
    $x++;
});

對於([1,2,3,4,5], -> $n {
    說 "數字：$n";
});
```

#### For Better Readability
Use Chinese comments:
```raku
# 如果用戶是成年人
if ($年齡 大於等於 18) {
    說 "可以投票";
}

# 對每個學生進行處理
for @學生 -> $學生 {
    說 "處理：$學生";
}
```

---

## 简体中文

### 概要

本模块为 Raku 提供中文函数和操作符，但由于当前 Raku 的限制（问题 #2404），无法修改基础语言语法。

### 可以使用的功能

#### ✅ 翻译的函数
- 超过 200 个函数翻译成中文（同时支持简体和繁体）
- 所有数学、字符串、列表、I/O、文件、日期/时间函数
- 示例：
  ```raku
  說 "你好！";                    # say "Hello!"
  my $和 = 總和([1,2,3,4,5]);    # sum([1,2,3,4,5])
  my $大寫 = 大寫("hello");      # uc("hello")
  ```

#### ✅ 自定义操作符
- 算术：`加`、`減`、`乘`、`除`、`餘`、`冪`
- 比较：`等於`、`不等於`、`大於`、`小於`、`大於等於`、`小於等於`
- 逻辑：`且`、`或`、`非`
- 字符串：`連接`、`重複字符串`
- 范围：`到`、`直到`
- 赋值：`加等於`、`減等於`、`乘等於`、`除等於`

**重要提示**：操作符需要括号来确定优先级：
```raku
# 正确
my $結果 = (5 加 3 乘 2);         # (5+3)*2 = 16
my $結果 = (5 加 (3 乘 2));       # 5+(3*2) = 11

# 在条件中
if ($年齡 大於等於 18) { ... }
```

#### ✅ 常量
```raku
真        # True
假        # False
空        # Nil
無限      # Inf
非数      # NaN
圓周率    # 3.14159...
自然對數底 # 2.71828...
```

### 不能使用的功能

#### ❌ 语言关键字
无法翻译控制结构：
```raku
# 不能使用：
如果 ($x > 5) { ... }          # if
當 ($x < 10) { ... }           # while
對於 @列表 { ... }             # for

# 必须使用原始语法：
if ($x > 5) { ... }
while ($x < 10) { ... }
for @列表 { ... }
```

#### ❌ 变量声明
```raku
# 不能使用：
我的 $變量 = 5;                # my
我們的 $共享 = 10;             # our

# 必须使用：
my $變量 = 5;
our $共享 = 10;
```

#### ❌ 类和方法语法
```raku
# 不能使用：
類 我的類 { ... }              # class
方法 foo() { ... }             # method

# 必须使用：
class 我的類 { ... }
method foo() { ... }
```

### 技术原因

Rakudo（Raku 的实现）有问题 #2404，阻止模块完全修改语言语法。子语言目前不能：
1. 改变保留关键字
2. 修改声明语法
3. 更改核心控制结构

但是可以：
- 定义新函数
- 创建自定义操作符
- 导出符号到命名空间

### 解决方法

#### 对于控制结构
使用提供的函数与代码块：
```raku
# 代替 if/while 语法
如果($x > 5, { 說 "较大" }, { 說 "较小或相等" });

當({ $x < 10 }, { 
    說 $x;
    $x++;
});

對於([1,2,3,4,5], -> $n {
    說 "数字：$n";
});
```

#### 提高可读性
使用中文注释：
```raku
# 如果用户是成年人
if ($年齡 大於等於 18) {
    說 "可以投票";
}

# 对每个学生进行处理
for @學生 -> $學生 {
    說 "处理：$學生";
}
```

---

## 繁體中文

### 概要

本模組為 Raku 提供中文函數和運算子，但由於當前 Raku 的限制（問題 #2404），無法修改基礎語言語法。

### 可以使用的功能

#### ✅ 翻譯的函數
- 超過 200 個函數翻譯成中文（同時支援簡體和繁體）
- 所有數學、字串、列表、I/O、檔案、日期/時間函數
- 範例：
  ```raku
  說 "你好！";                    # say "Hello!"
  my $和 = 總和([1,2,3,4,5]);    # sum([1,2,3,4,5])
  my $大寫 = 大寫("hello");      # uc("hello")
  ```

#### ✅ 自訂運算子
- 算術：`加`、`減`、`乘`、`除`、`餘`、`冪`
- 比較：`等於`、`不等於`、`大於`、`小於`、`大於等於`、`小於等於`
- 邏輯：`且`、`或`、`非`
- 字串：`連接`、`重複字符串`
- 範圍：`到`、`直到`
- 賦值：`加等於`、`減等於`、`乘等於`、`除等於`

**重要提示**：運算子需要括號來確定優先順序：
```raku
# 正確
my $結果 = (5 加 3 乘 2);         # (5+3)*2 = 16
my $結果 = (5 加 (3 乘 2));       # 5+(3*2) = 11

# 在條件中
if ($年齡 大於等於 18) { ... }
```

#### ✅ 常數
```raku
真        # True
假        # False
空        # Nil
無限      # Inf
非數      # NaN
圓周率    # 3.14159...
自然對數底 # 2.71828...
```

### 不能使用的功能

#### ❌ 語言關鍵字
無法翻譯控制結構：
```raku
# 不能使用：
如果 ($x > 5) { ... }          # if
當 ($x < 10) { ... }           # while
對於 @列表 { ... }             # for

# 必須使用原始語法：
if ($x > 5) { ... }
while ($x < 10) { ... }
for @列表 { ... }
```

#### ❌ 變數宣告
```raku
# 不能使用：
我的 $變數 = 5;                # my
我們的 $共享 = 10;             # our

# 必須使用：
my $變數 = 5;
our $共享 = 10;
```

#### ❌ 類別和方法語法
```raku
# 不能使用：
類 我的類 { ... }              # class
方法 foo() { ... }             # method

# 必須使用：
class 我的類 { ... }
method foo() { ... }
```

### 技術原因

Rakudo（Raku 的實作）有問題 #2404，阻止模組完全修改語言語法。子語言目前不能：
1. 改變保留關鍵字
2. 修改宣告語法
3. 更改核心控制結構

但是可以：
- 定義新函數
- 建立自訂運算子
- 匯出符號到命名空間

### 解決方法

#### 對於控制結構
使用提供的函數與程式碼區塊：
```raku
# 代替 if/while 語法
如果($x > 5, { 說 "較大" }, { 說 "較小或相等" });

當({ $x < 10 }, { 
    說 $x;
    $x++;
});

對於([1,2,3,4,5], -> $n {
    說 "數字：$n";
});
```

#### 提高可讀性
使用中文註解：
```raku
# 如果用戶是成年人
if ($年齡 大於等於 18) {
    說 "可以投票";
}

# 對每個學生進行處理
for @學生 -> $學生 {
    說 "處理：$學生";
}
```