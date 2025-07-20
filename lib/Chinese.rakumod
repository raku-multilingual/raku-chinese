# Chinese Language Module for Raku
# Supports both Simplified (简体) and Traditional (繁體) Chinese
# 支持简体和繁体中文

sub EXPORT(|) {
    my %exports;

    # === CONSTANTS ===
    my \真 = True;
    my \假 = False;
    sub 空() { Nil }
    my \無限 = Inf;
    my \无限 = Inf;
    my \非數 = NaN;
    my \非数 = NaN;
    my \圓周率 = pi;
    my \圆周率 = pi;
    my \自然對數底 = e;
    my \自然对数底 = e;

    # Traditional variants
    my \無限大 = Inf;
    my \圓周率π = pi;
    my \自然對數底數 = e;

    # Simplified variants
    my \无穷大 = Inf;
    my \圆周率π = pi;
    my \自然对数底数 = e;

    # === CONTROL FLOW ===
    my &如果 = sub (&cond, &then, &else?) { &cond() ?? &then() !! (&else ?? &else() !! Nil) }; # if
    my &若 = &如果;
    my &當 = sub (&cond, &code) { while &cond() { &code() } }; # while
    my &当 = &當;
    my &直到 = sub (&cond, &code) { until &cond() { &code() } }; # until
    my &對於 = sub ($list, &code) { for @($list) -> $_ { &code($_) } }; # for
    my &对于 = &對於;
    my &對每個 = sub ($list, &code) { for @($list) -> $_ { &code($_) } }; # foreach
    my &对每个 = &對每個;
    my &給定 = sub ($val, &code) { given $val { &code($_) } }; # given
    my &给定 = &給定;
    my &當為 = sub ($val, &code) { when $val { &code() } }; # when
    my &当为 = &當為;
    my &中斷 = sub (|c) { last |c };                     # last/break
    my &中断 = &中斷;
    my &繼續 = sub (|c) { next |c };                     # next
    my &继续 = &繼續;
    my &重做 = sub (|c) { redo |c };                     # redo

    # Traditional control flow variants
    my &對於每個 = sub ($list, &code) { for @($list) -> $_ { &code($_) } }; # for each (traditional)

    # Simplified control flow variants
    my &对于每个 = &對於每個;

    # === I/O FUNCTIONS ===
    my &說 = sub (|c) { say |c };                         # say
    my &说 = &說;
    my &印 = sub (|c) { print |c };                       # print
    my &輸出 = sub (|c) { say |c };                       # output (say)
    my &输出 = &輸出;
    my &打印 = sub (|c) { print |c };                     # print (alternative)
    my &獲取 = sub (|c) { get |c };                       # get
    my &获取 = &獲取;
    my &獲取行 = sub (|c) { lines |c };                   # get lines
    my &获取行 = &獲取行;
    my &提示 = sub ($msg) { prompt($msg) };               # prompt
    my &輸入 = sub ($msg = '') { prompt($msg) };          # input
    my &输入 = &輸入;
    my &注意 = sub (|c) { note |c };                      # note
    my &警告 = sub (|c) { warn |c };                      # warn
    my &死 = sub (|c) { die |c };                         # die

    # Traditional I/O variants
    my &講 = sub (|c) { say |c };                         # say (traditional)
    my &印出 = sub (|c) { print |c };                     # print (traditional)
    my &取得 = sub (|c) { get |c };                       # get (traditional)

    # Simplified I/O variants
    my &讲 = &講;

    # === BASIC FUNCTIONS ===
    my &定義 = sub (&f) { &f };                           # identity/define
    my &定义 = &定義;
    my &睡眠 = sub ($n) { sleep $n };                     # sleep
    my &退出 = sub ($code = 0) { exit $code };            # exit
    # my &求值 = sub ($code) { EVAL $code };              # eval (requires MONKEY-SEE-NO-EVAL)
    my &類型 = sub ($obj) { $obj.^name };                 # type
    my &类型 = &類型;
    my &定義嗎 = sub ($var) { $var.defined };             # defined?
    my &複製 = sub ($obj) { $obj.clone };                 # clone
    my &复制 = &複製;
    my &深複製 = sub ($obj) { $obj.deepmap(*.clone) };    # deep clone
    my &深复制 = &深複製;

    # Traditional basic variants
    my &型別 = sub ($obj) { $obj.^name };                 # type (traditional)
    my &定義了嗎 = sub ($var) { $var.defined };           # defined? (traditional)

    # Simplified basic variants
    my &定义了吗 = &定義了嗎;
    my &深拷贝 = &深複製;

    # === MATH FUNCTIONS ===
    # Arithmetic
    my &加 = sub ($a, $b) { $a + $b };                    # add
    my &減 = sub ($a, $b) { $a - $b };                    # subtract
    my &乘 = sub ($a, $b) { $a * $b };                    # multiply
    my &除 = sub ($a, $b) { $a / $b };                    # divide
    my &整除 = sub ($a, $b) { $a div $b };                # integer divide
    my &取余 = sub ($a, $b) { $a mod $b };                # Int modulo
    my &取餘 = &取余;
    my &模 = sub ($a, $b) { $a % $b };                    # Numeric modulo
    my &冪 = sub ($a, $b) { $a ** $b };                   # power
    my &幂 = &冪;
    my &平方根 = sub ($x) { sqrt($x) };                   # sqrt
    my &絕對值 = sub ($x) { abs($x) };                    # abs
    my &绝对值 = &絕對值;

    # Common math variants
    my &取模 = &模;
    my &次方 = sub ($a, $b) { $a ** $b };                 # power

    # Traditional math variants
    my &餘數 = sub ($a, $b) { $a mod $b };                # remainder (traditional)

    # Simplified math variants
    my &余数 = &餘數;                                     # remainder (simplified)

    # Rounding and comparison
    my &四捨五入 = sub ($x) { round($x) };                # round
    my &四舍五入 = &四捨五入;
    my &向下取整 = sub ($x) { floor($x) };                # floor
    my &向上取整 = sub ($x) { ceiling($x) };              # ceiling
    my &截斷 = sub ($x) { truncate($x) };                 # truncate
    my &截断 = &截斷;
    my &符號 = sub ($x) { sign($x) };                     # sign
    my &符号 = &符號;
    my &最大 = sub (*@a) { max(@a) };                     # max
    my &最小 = sub (*@a) { min(@a) };                     # min

    # Trigonometry
    my &正弦 = sub ($x) { sin($x) };                      # sine
    my &餘弦 = sub ($x) { cos($x) };                      # cosine
    my &余弦 = &餘弦;
    my &正切 = sub ($x) { tan($x) };                      # tangent
    my &反正弦 = sub ($x) { asin($x) };                   # arcsine
    my &反餘弦 = sub ($x) { acos($x) };                   # arccosine
    my &反余弦 = &反餘弦;
    my &反正切 = sub ($x) { atan($x) };                   # arctangent
    my &反正切2 = sub ($y, $x) { atan2($y, $x) };         # atan2

    # Hyperbolic functions
    my &雙曲正弦 = sub ($x) { sinh($x) };                 # hyperbolic sine
    my &双曲正弦 = &雙曲正弦;
    my &雙曲餘弦 = sub ($x) { cosh($x) };                 # hyperbolic cosine
    my &双曲余弦 = &雙曲餘弦;
    my &雙曲正切 = sub ($x) { tanh($x) };                 # hyperbolic tangent
    my &双曲正切 = &雙曲正切;

    # Logarithms and exponentials
    my &對數 = sub ($x, $base = e) { $base == e ?? log($x) !! log($x) / log($base) }; # logarithm
    my &对数 = &對數;
    my &自然對數 = sub ($x) { log($x) };                  # natural logarithm
    my &自然对数 = &自然對數;
    my &常用對數 = sub ($x) { log10($x) };                # base 10 logarithm
    my &常用对数 = &常用對數;
    my &指數 = sub ($x) { exp($x) };                      # exponential
    my &指数 = &指數;

    # Number theory
    my &最大公約數 = sub ($a, $b) { $a gcd $b };          # gcd
    my &最大公约数 = &最大公約數;
    my &最小公倍數 = sub ($a, $b) { $a lcm $b };          # lcm
    my &階乘 = sub ($n) { [*] 1..$n };                   # factorial
    my &阶乘 = &階乘;
    my &排列 = sub ($n, $k) { [*] ($n-$k+1)..$n };       # permutations
    my &組合 = sub ($n, $k) { 階乘($n) / (階乘($k) * 階乘($n - $k)) }; # combinations
    my &组合 = &組合;

    # === STRING FUNCTIONS ===
    my &長度 = sub ($s) { $s.chars };                     # length
    my &长度 = &長度;
    my &字符數 = sub ($s) { $s.chars };                   # char count
    my &字符数 = &字符數;
    my &字節數 = sub ($s) { $s.encode.bytes };            # byte count
    my &字节数 = &字節數;
    my &大寫 = sub ($s) { $s.uc };                        # uppercase
    my &大写 = &大寫;
    my &小寫 = sub ($s) { $s.lc };                        # lowercase
    my &小写 = &小寫;
    my &首字母大寫 = sub ($s) { $s.tc };                  # title case
    my &首字母大写 = &首字母大寫;
    my &反轉 = sub ($s) { $s.flip };                      # reverse
    my &反转 = &反轉;
    my &修剪 = sub ($s) { $s.trim };                      # trim
    my &左修剪 = sub ($s) { $s.trim-leading };            # trim left
    my &右修剪 = sub ($s) { $s.trim-trailing };           # trim right

    # String operations
    my &包含 = sub ($s, $substr) { $s.contains($substr) }; # contains
    my &開始於 = sub ($s, $prefix) { $s.starts-with($prefix) }; # starts with
    my &开始于 = &開始於;
    my &結束於 = sub ($s, $suffix) { $s.ends-with($suffix) }; # ends with
    my &结束于 = &結束於;
    my &索引 = sub ($s, $substr) { $s.index($substr) // -1 }; # index
    my &最後索引 = sub ($s, $substr) { $s.rindex($substr) // -1 }; # rindex
    my &反向索引 = &最後索引;
    my &替換 = sub ($s, $from, $to) { $s.subst($from, $to, :g) }; # replace all
    my &替换 = &替換;
    my &替換首個 = sub ($s, $from, $to) { $s.subst($from, $to) }; # replace first
    my &替换首个 = &替換首個;

    # Substring operations
    my &子字符串 = sub ($s, $start, $length?) {
        $length ?? $s.substr($start, $length) !! $s.substr($start)
    }; # substring
    my &左邊 = sub ($s, $n) { $s.substr(0, $n) };         # left n chars
    my &左边 = &左邊;
    my &右邊 = sub ($s, $n) { $s.substr(*-$n) };          # right n chars
    my &右边 = &右邊;

    # Splitting and joining
    my &分割 = sub ($s, $sep) { $s.split($sep) };         # split
    my &連接 = sub (@parts, $sep = '') { @parts.join($sep) }; # join
    my &连接 = &連接;
    my &單詞 = sub ($s) { $s.words };                     # words
    my &单词 = &單詞;
    my &行 = sub ($s) { $s.lines };                       # lines

    # Character operations
    my &字符列表 = sub ($s) { $s.comb };                  # characters as list
    my &字符代碼 = sub ($c) { $c.ord };                   # character code
    my &字符代码 = &字符代碼;
    my &代碼字符 = sub ($n) { $n.chr };                   # code to character
    my &代码字符 = &代碼字符;
    my &代碼列表 = sub ($s) { $s.ords };                  # all character codes
    my &代码列表 = &代碼列表;

    # === ARRAY/LIST FUNCTIONS ===
    # Basic operations
    my &列表大小 = sub (@a) { @a.elems };                 # size
    my &計數 = sub (@a) { @a.elems };                     # count
    my &计数 = &計數;
    my &元素數 = sub (@a) { @a.elems };                   # elements
    my &元素数 = &元素數;
    my &第一個 = sub (@a) { @a.first };                   # first
    my &第一个 = &第一個;
    my &最後一個 = sub (@a) { @a[*-1] };                  # last
    my &最后一个 = &最後一個;
    my &頭部 = sub (@a, $n = 1) { @a.head($n) };          # head
    my &头部 = &頭部;
    my &尾部 = sub (@a, $n = 1) { @a.tail($n) };          # tail
    my &推入 = sub (@a, *@items) { @a.push(|@items); @a }; # push
    my &彈出 = sub (@a) { @a.pop };                       # pop
    my &弹出 = &彈出;
    my &移出 = sub (@a) { @a.shift };                     # shift
    my &插入前 = sub (@a, *@items) { @a.unshift(|@items); @a }; # unshift

    # Common variants
    my &头 = &頭部;
    my &尾 = &尾部;

    # Functional operations
    my &映射 = sub (&f, @a) { @a.map(&f) };               # map
    my &過濾 = sub (&f, @a) { @a.grep(&f) };              # filter/grep
    my &过滤 = &過濾;
    my &歸約 = sub (&f, @a, $init?) {
        $init.defined ?? @a.reduce(&f, $init) !! @a.reduce(&f)
    }; # reduce
    my &规约 = &歸約;
    my &排序 = sub (@a, &by = {$^a cmp $^b}) { @a.sort(&by) }; # sort
    my &反向 = sub (@a) { @a.reverse };                   # reverse
    my &唯一 = sub (@a) { @a.unique };                    # unique
    my &扁平化 = sub (@a) { @a.flat };                    # flatten

    # Set operations
    my &並集 = sub (@a, @b) { (@a ∪ @b).keys };          # union
    my &并集 = &並集;
    my &交集 = sub (@a, @b) { (@a ∩ @b).keys };          # intersection
    my &差集 = sub (@a, @b) { (@a ∖ @b).keys };          # difference
    my &對稱差 = sub (@a, @b) { (@a ⊖ @b).keys };        # symmetric difference
    my &对称差 = &對稱差;

    # Searching and testing
    my &查找 = sub (&f, @a) { @a.first(&f) };             # find first
    my &查找所有 = sub (&f, @a) { @a.grep(&f) };          # find all
    my &任何 = sub (&f, @a) { so(@a.map(&f).any) };       # any
    my &全部 = sub (&f, @a) { so(@a.map(&f).all) };       # all
    my &沒有 = sub (&f, @a) { so(@a.map(&f).none) };      # none
    my &没有 = &沒有;
    my &恰好一個 = sub (&f, @a) { so(@a.map(&f).one) };   # exactly one
    my &恰好一个 = &恰好一個;

    # Aggregation
    my &總和 = sub (@a) { @a.sum };                       # sum
    my &总和 = &總和;
    my &乘積 = sub (@a) { [*] @a };                       # product
    my &乘积 = &乘積;
    my &平均 = sub (@a) { @a.sum / @a.elems };            # average/mean
    my &中位數 = sub (@a) {
        my @sorted = @a.sort;
        @sorted.elems %% 2
            ?? (@sorted[@sorted.elems div 2 - 1] + @sorted[@sorted.elems div 2]) / 2
            !! @sorted[@sorted.elems div 2]
    }; # median
    my &中位数 = &中位數;

    # List manipulation
    my &連接列表 = sub (*@lists) { |@lists.map(*.Slip) }; # concatenate
    my &连接列表 = &連接列表;
    my &重複 = sub (@a, $n) { @a xx $n };                 # repeat
    my &重复 = &重複;
    my &切片 = sub (@a, $start, $end?) {
        $end ?? @a[$start..$end] !! @a[$start..*]
    }; # slice
    my &分區 = sub (@a, $n) { @a.rotor($n) };            # partition
    my &分区 = &分區;
    my &分組 = sub (&f, @a) { @a.classify(&f) };         # group by
    my &壓縮 = sub (*@lists) { zip(|@lists) };           # zip
    my &压缩 = &壓縮;
    my &配對 = sub (@a, @b) { @a Z @b };                 # pair/zip
    my &配对 = &配對;

    # Random operations
    my &洗牌 = sub (@a) { @a.pick(*) };                  # shuffle
    my &隨機選 = sub (@a, $n = 1) { @a.pick($n) };       # pick random
    my &随机选 = &隨機選;
    my &隨機一個 = sub (@a) { @a.pick };                  # pick one random
    my &随机一个 = &隨機一個;
    my &樣本 = sub (@a, $n) { @a.roll($n) };             # sample with replacement
    my &样本 = &樣本;

    # === HASH/MAP FUNCTIONS ===
    my &鍵 = sub (%h) { %h.keys };                        # keys
    my &键 = &鍵;
    my &值 = sub (%h) { %h.values };                      # values
    my &配對列表 = sub (%h) { %h.pairs };                 # pairs
    my &配对列表 = &配對列表;
    my &存在 = sub (%h, $key) { %h{$key}:exists };        # exists
    my &刪除 = sub (%h, $key) { %h{$key}:delete };        # delete
    my &删除 = &刪除;
    my &清空 = sub (%h) { %h = () };                      # clear
    my &合併 = sub (%h1, %h2) { %h1, %h2 };               # merge
    my &合并 = &合併;

    # === FILE FUNCTIONS ===
    my &打開 = sub ($path, |c) { open($path, |c) };       # open
    my &打开 = &打開;
    my &關閉 = sub ($fh) { $fh.close };                   # close
    my &关闭 = &關閉;
    my &讀取 = sub ($path) { $path.IO.slurp };            # read/slurp
    my &读取 = &讀取;
    my &寫入 = sub ($path, $content) { $path.IO.spurt($content) }; # write
    my &写入 = &寫入;
    my &追加 = sub ($path, $content) { $path.IO.spurt($content, :append) }; # append
    my &讀行 = sub ($fh) { $fh.get };                     # read line
    my &读行 = &讀行;
    my &寫行 = sub ($fh, $line) { $fh.say($line) };       # write line
    my &写行 = &寫行;
    my &文件存在 = sub ($path) { $path.IO.e };            # file exists
    my &是目錄 = sub ($path) { $path.IO.d };              # is directory
    my &是目录 = &是目錄;
    my &是文件 = sub ($path) { $path.IO.f };              # is file
    my &創建目錄 = sub ($path) { $path.IO.mkdir };        # mkdir
    my &创建目录 = &創建目錄;
    my &刪除文件 = sub ($path) { $path.IO.unlink };       # delete file
    my &删除文件 = &刪除文件;
    my &移動 = sub ($from, $to) { $from.IO.move($to) };   # move
    my &移动 = &移動;
    my &複製文件 = sub ($from, $to) { $from.IO.copy($to) }; # copy
    my &复制文件 = &複製文件;

    # === DATE/TIME FUNCTIONS ===
    my &現在 = sub () { now };                            # current timestamp
    my &现在 = &現在;
    my &今天 = sub () { Date.today };                     # today's date
    my &日期 = sub () { Date.today };                     # date
    my &時間 = sub () { DateTime.now };                   # current datetime
    my &时间 = &時間;
    my &年 = sub ($dt = DateTime.now) { $dt.year };       # year
    my &月 = sub ($dt = DateTime.now) { $dt.month };      # month
    my &日 = sub ($dt = DateTime.now) { $dt.day };        # day
    my &小時 = sub ($dt = DateTime.now) { $dt.hour };     # hour
    my &小时 = &小時;
    my &分鐘 = sub ($dt = DateTime.now) { $dt.minute };   # minute
    my &分钟 = &分鐘;
    my &秒 = sub ($dt = DateTime.now) { $dt.second };     # second

    # === TYPE CHECKING ===
    my &是數字 = sub ($x) { $x ~~ Numeric };              # is number
    my &是数字 = &是數字;
    my &是整數 = sub ($x) { $x ~~ Int };                  # is integer
    my &是整数 = &是整數;
    my &是字符串 = sub ($x) { $x ~~ Str };                # is string
    my &是列表 = sub ($x) { $x ~~ Positional };           # is list/array
    my &是散列 = sub ($x) { $x ~~ Associative };          # is hash
    my &是布爾 = sub ($x) { $x ~~ Bool };                 # is boolean
    my &是布尔 = &是布爾;
    my &是空 = sub ($x) { !$x.defined };                  # is nil/undefined
    my &是真 = sub ($x) { ?$x };                          # is truthy
    my &是假 = sub ($x) { !$x };                          # is falsy
    my &是偶數 = sub ($n) { $n %% 2 };                    # is even
    my &是偶数 = &是偶數;
    my &是奇數 = sub ($n) { $n % 2 == 1 };                # is odd
    my &是奇数 = &是奇數;
    my &是正數 = sub ($n) { $n > 0 };                     # is positive
    my &是正数 = &是正數;
    my &是負數 = sub ($n) { $n < 0 };                     # is negative
    my &是负数 = &是負數;
    my &是質數 = sub ($n) { $n.is-prime };                # is prime
    my &是质数 = &是質數;

    # === CONVERSION FUNCTIONS ===
    my &轉整數 = sub ($x) { $x.Int };                     # to integer
    my &转正数 = &轉整數;
    my &轉數字 = sub ($x) { $x.Num };                     # to number
    my &转数字 = &轉數字;
    my &轉字符串 = sub ($x) { $x.Str };                   # to string
    my &转字符串 = &轉字符串;
    my &轉列表 = sub ($x) { $x.list };                    # to list
    my &转列表 = &轉列表;
    my &轉散列 = sub (@pairs) { @pairs.hash };            # to hash
    my &转散列 = &轉散列;
    my &轉布爾 = sub ($x) { ?$x };                        # to boolean
    my &转布尔 = &轉布爾;
    my &轉字符 = sub ($n) { $n.chr };                     # to character
    my &转字符 = &轉字符;
    my &轉代碼 = sub ($c) { $c.ord };                     # to code
    my &转代码 = &轉代碼;

    # === RANDOM FUNCTIONS ===
    my &隨機 = sub ($max = 1) { rand * $max };            # random
    my &随机 = &隨機;
    my &隨機整數 = sub ($min, $max) { ($min..$max).pick }; # random integer
    my &随机整数 = &隨機整數;
    my &隨機布爾 = sub () { Bool.pick };                  # random boolean
    my &随机布尔 = &隨機布爾;
    my &隨機選擇 = sub (@choices) { @choices.pick };      # random choice
    my &随机选择 = &隨機選擇;

    # === FUNCTIONAL HELPERS ===
    my &組合函數 = sub (&f, &g) { -> |c { &f(&g(|c)) } }; # compose
    my &组合函数 = &組合函數;
    my &柯里化 = sub (&f, *@args) { -> |c { &f(|@args, |c) } }; # curry
    my &部分應用 = sub (&f, *@args) { -> |c { &f(|@args, |c) } }; # partial
    my &部分应用 = &部分應用;
    my &恆等 = sub ($x) { $x };                           # identity
    my &恒等 = &恆等;
    my &常量 = sub ($x) { -> { $x } };                    # constant
    my &翻轉 = sub (&f) { -> $a, $b { &f($b, $a) } };    # flip
    my &翻转 = &翻轉;

    # === ERROR HANDLING ===
    my &嘗試 = sub (&code, &catch?) {                     # try
        my $result;
        try { $result = &code() };
        if $! && &catch { &catch($!) } else { $result }
    };
    my &尝试 = &嘗試;
    my &安全執行 = sub (&code, $default) {                # safe execute
        my $result;
        try { $result = &code() };
        $! ?? $default !! ($result // $default)
    };
    my &安全执行 = &安全執行;
    my &拋出 = sub ($msg) { die $msg };                   # throw
    my &斷言 = sub ($cond, $msg = "斷言失敗") {           # assert
        die $msg unless $cond
    };
    my &断言 = &斷言;

    # === OPERATORS ===
    # Arithmetic operators
    my &infix:<加> = sub ($a, $b) { $a + $b };
    my &infix:<減> = sub ($a, $b) { $a - $b };
    my &infix:<乘> = sub ($a, $b) { $a * $b };
    my &infix:<除> = sub ($a, $b) { $a / $b };
    my &infix:<模> = sub ($a, $b) { $a % $b };
    my &infix:<冪> = sub ($a, $b) { $a ** $b };
    my &infix:<幂> = sub ($a, $b) { $a ** $b };

    # Comparison operators
    my &infix:<等於> = sub ($a, $b) { $a == $b };
    my &infix:<等于> = sub ($a, $b) { $a == $b };
    my &infix:<不等於> = sub ($a, $b) { $a != $b };
    my &infix:<不等于> = sub ($a, $b) { $a != $b };
    my &infix:<大於> = sub ($a, $b) { $a > $b };
    my &infix:<大于> = sub ($a, $b) { $a > $b };
    my &infix:<小於> = sub ($a, $b) { $a < $b };
    my &infix:<小于> = sub ($a, $b) { $a < $b };
    my &infix:<大於等於> = sub ($a, $b) { $a >= $b };
    my &infix:<大于等于> = sub ($a, $b) { $a >= $b };
    my &infix:<小於等於> = sub ($a, $b) { $a <= $b };
    my &infix:<小于等于> = sub ($a, $b) { $a <= $b };

    # String operators
    my &infix:<連接> = sub ($a, $b) { $a ~ $b };
    my &infix:<连接> = sub ($a, $b) { $a ~ $b };
    my &infix:<重複字符串> = sub ($a, $b) { $a x $b };
    my &infix:<重复字符串> = sub ($a, $b) { $a x $b };

    # Logical operators
    my &infix:<且> = sub ($a, $b) { $a && $b };
    my &infix:<或> = sub ($a, $b) { $a || $b };
    my &prefix:<非> = sub ($a) { !$a };
    my &非 = sub ($a) { !$a };  # Also as function

    # Range operators
    my &infix:<到> = sub ($a, $b) { $a..$b };
    my &infix:<直到> = sub ($a, $b) { $a..^$b };

    # Assignment operators
    my &infix:<加等於> = sub ($a is rw, $b) { $a += $b };
    my &infix:<加等于> = sub ($a is rw, $b) { $a += $b };
    my &infix:<減等於> = sub ($a is rw, $b) { $a -= $b };
    my &infix:<減等于> = sub ($a is rw, $b) { $a -= $b };
    my &infix:<乘等於> = sub ($a is rw, $b) { $a *= $b };
    my &infix:<乘等于> = sub ($a is rw, $b) { $a *= $b };
    my &infix:<除等於> = sub ($a is rw, $b) { $a /= $b };
    my &infix:<除等于> = sub ($a is rw, $b) { $a /= $b };

    # Export all symbols
    %exports = %(
        # Constants
        '真' => 真, '假' => 假, '空' => 空,
        '無限' => 無限, '無限大' => 無限大, '无限' => 无限, '无穷大' => 无穷大,
        '非数' => 非数, '非數' => 非數,
        '圓周率' => 圓周率, '圓周率π' => 圓周率π, '圆周率' => 圆周率, '圆周率π' => 圆周率π,
        '自然對數底' => 自然對數底, '自然對數底數' => 自然對數底數, '自然对数底' => 自然对数底, '自然对数底数' => 自然对数底数,

        # Control flow
        '&如果' => &如果, '&若' => &若,
        '&當' => &當, '&当' => &当,
        '&直到' => &直到,
        '&對於' => &對於, '&对于' => &对于, '&對每個' => &對每個, '&对每个' => &对每个, '&對於每個' => &對於每個, '&对于每个' => &对于每个,
        '&給定' => &給定, '&给定' => &给定, '&當為' => &當為, '&当为' => &当为,
        '&中斷' => &中斷, '&中断' => &中断, '&繼續' => &繼續, '&继续' => &继续, '&重做' => &重做,

        # I/O
        '&說' => &說, '&说' => &说, '&講' => &講, '&讲' => &讲,
        '&印' => &印, '&印出' => &印出,
        '&輸出' => &輸出, '&输出' => &输出, '&打印' => &打印,
        '&獲取' => &獲取, '&获取' => &获取, '&取得' => &取得,
        '&獲取行' => &獲取行, '&获取行' => &获取行, '&提示' => &提示, '&輸入' => &輸入, '&输入' => &输入,
        '&注意' => &注意, '&警告' => &警告, '&死' => &死,

        # Basic functions
        '&定義' => &定義, '&定义' => &定义, '&睡眠' => &睡眠, '&退出' => &退出,
        # '&評估' => &評估,
        '&類型' => &類型, '&类型' => &类型, '&型別' => &型別,
        '&定義嗎' => &定義嗎, '&定義了嗎' => &定義了嗎, '&定义了吗' => &定义了吗,
        '&複製' => &複製, '&复制' => &复制, '&深複製' => &深複製, '&深复制' => &深复制, '&深拷贝' => &深拷贝,

        # Math functions
        '&加' => &加, '&減' => &減, '&乘' => &乘, '&除' => &除,
        '&整除' => &整除, '&取餘' => &取餘, '&餘數' => &餘數, '&余数' => &余数,
        '&取模' => &取模, '&冪' => &冪, '&幂' => &幂, '&次方' => &次方,
        '&平方根' => &平方根, '&絕對值' => &絕對值, '&绝对值' => &绝对值,
        '&四捨五入' => &四捨五入, '&四舍五入' => &四舍五入, '&向下取整' => &向下取整,
        '&向上取整' => &向上取整, '&截斷' => &截斷, '&截断' => &截断,
        '&符號' => &符號, '&符号' => &符号, '&最大' => &最大, '&最小' => &最小,

        # Trigonometry
        '&正弦' => &正弦, '&餘弦' => &餘弦, '&余弦' => &余弦, '&正切' => &正切,
        '&反正弦' => &反正弦, '&反餘弦' => &反餘弦, '&反余弦' => &反余弦,
        '&反正切' => &反正切, '&反正切2' => &反正切2,
        '&雙曲正弦' => &雙曲正弦, '&双曲正弦' => &双曲正弦, '&雙曲餘弦' => &雙曲餘弦, '&双曲余弦' => &双曲余弦,
        '&雙曲正切' => &雙曲正切, '&双曲正切' => &双曲正切,

        # Logarithms
        '&對數' => &對數, '&对数' => &对数, '&自然對數' => &自然對數, '&自然对数' => &自然对数,
        '&常用對數' => &常用對數, '&常用对数' => &常用对数, '&指數' => &指數, '&指数' => &指数,

        # Number theory
        '&最大公約數' => &最大公約數, '&最大公约数' => &最大公约数, '&最小公倍數' => &最小公倍數,
        '&階乘' => &階乘, '&阶乘' => &阶乘, '&排列' => &排列, '&組合' => &組合, '&组合' => &组合,

        # String functions
        '&長度' => &長度, '&长度' => &长度, '&字符數' => &字符數, '&字符数' => &字符数, '&字節數' => &字節數, '&字节数' => &字节数,
        '&大寫' => &大寫, '&大写' => &大写, '&小寫' => &小寫, '&小写' => &小写, '&首字母大寫' => &首字母大寫, '&首字母大写' => &首字母大写,
        '&反轉' => &反轉, '&反转' => &反转, '&修剪' => &修剪,
        '&左修剪' => &左修剪, '&右修剪' => &右修剪,
        '&包含' => &包含, '&開始於' => &開始於, '&开始于' => &开始于, '&結束於' => &結束於, '&结束于' => &结束于,
        '&索引' => &索引, '&最後索引' => &最後索引, '&反向索引' => &反向索引,
        '&替換' => &替換, '&替换' => &替换, '&替換首個' => &替換首個, '&替换首个' => &替换首个,
        '&子字符串' => &子字符串, '&左邊' => &左邊, '&左边' => &左边, '&右邊' => &右邊, '&右边' => &右边,
        '&分割' => &分割, '&連接' => &連接, '&连接' => &连接, '&單詞' => &單詞, '&单词' => &单词, '&行' => &行,
        '&字符列表' => &字符列表, '&字符代碼' => &字符代碼, '&字符代码' => &字符代码,
        '&代碼字符' => &代碼字符, '&代码字符' => &代码字符, '&代碼列表' => &代碼列表, '&代码列表' => &代码列表,

        # Array functions
        '&列表大小' => &列表大小, '&計數' => &計數, '&计数' => &计数, '&元素數' => &元素數, '&元素数' => &元素数,
        '&第一個' => &第一個, '&第一个' => &第一个, '&最後一個' => &最後一個, '&最后一个' => &最后一个,
        '&頭部' => &頭部, '&头部' => &头部, '&头' => &头, '&尾部' => &尾部, '&尾' => &尾,
        '&推入' => &推入, '&彈出' => &彈出, '&弹出' => &弹出,
        '&移出' => &移出, '&插入前' => &插入前,
        '&映射' => &映射, '&過濾' => &過濾, '&过滤' => &过滤, '&歸約' => &歸約, '&规约' => &规约,
        '&排序' => &排序, '&反向' => &反向, '&唯一' => &唯一,
        '&扁平化' => &扁平化,
        '&並集' => &並集, '&并集' => &并集, '&交集' => &交集,
        '&差集' => &差集, '&對稱差' => &對稱差, '&对称差' => &对称差,
        '&查找' => &查找, '&查找所有' => &查找所有,
        '&任何' => &任何, '&全部' => &全部,
        '&沒有' => &沒有, '&没有' => &没有, '&恰好一個' => &恰好一個, '&恰好一个' => &恰好一个,
        '&總和' => &總和, '&总和' => &总和, '&乘積' => &乘積, '&乘积' => &乘积,
        '&平均' => &平均, '&中位數' => &中位數, '&中位数' => &中位数,
        '&連接列表' => &連接列表, '&连接列表' => &连接列表, '&重複' => &重複, '&重复' => &重复,
        '&切片' => &切片, '&分區' => &分區, '&分区' => &分区, '&分組' => &分組,
        '&壓縮' => &壓縮, '&压缩' => &压缩, '&配對' => &配對, '&配对' => &配对,
        '&洗牌' => &洗牌, '&隨機選' => &隨機選, '&随机选' => &随机选,
        '&隨機一個' => &隨機一個, '&随机一个' => &随机一个, '&樣本' => &樣本, '&样本' => &样本,

        # Hash functions
        '&鍵' => &鍵, '&键' => &键, '&值' => &值, '&配對列表' => &配對列表, '&配对列表' => &配对列表,
        '&存在' => &存在, '&刪除' => &刪除, '&删除' => &删除,
        '&清空' => &清空, '&合併' => &合併, '&合并' => &合并,

        # File functions
        '&打開' => &打開, '&打开' => &打开, '&關閉' => &關閉, '&关闭' => &关闭,
        '&讀取' => &讀取, '&读取' => &读取, '&寫入' => &寫入, '&写入' => &写入, '&追加' => &追加,
        '&讀行' => &讀行, '&读行' => &读行, '&寫行' => &寫行, '&写行' => &写行,
        '&文件存在' => &文件存在, '&是目錄' => &是目錄, '&是目录' => &是目录, '&是文件' => &是文件,
        '&創建目錄' => &創建目錄, '&创建目录' => &创建目录, '&刪除文件' => &刪除文件, '&删除文件' => &删除文件,
        '&移動' => &移動, '&移动' => &移动, '&複製文件' => &複製文件, '&复制文件' => &复制文件,

        # Date/time functions
        '&現在' => &現在, '&现在' => &现在, '&今天' => &今天, '&日期' => &日期, '&時間' => &時間, '&时间' => &时间,
        '&年' => &年, '&月' => &月, '&日' => &日,
        '&小時' => &小時, '&小时' => &小时, '&分鐘' => &分鐘, '&分钟' => &分钟, '&秒' => &秒,

        # Type checking
        '&是數字' => &是數字, '&是数字' => &是数字, '&是整數' => &是整數, '&是整数' => &是整数, '&是字符串' => &是字符串,
        '&是列表' => &是列表, '&是散列' => &是散列, '&是布爾' => &是布爾, '&是布尔' => &是布尔,
        '&是空' => &是空, '&是真' => &是真, '&是假' => &是假,
        '&是偶數' => &是偶數, '&是偶数' => &是偶数, '&是奇數' => &是奇數, '&是奇数' => &是奇数,
        '&是正數' => &是正數, '&是正数' => &是正数, '&是負數' => &是負數, '&是负数' => &是负数, '&是質數' => &是質數, '&是质数' => &是质数,

        # Conversion functions
        '&轉整數' => &轉整數, '&转正数' => &转正数, '&轉數字' => &轉數字, '&转数字' => &转数字, '&轉字符串' => &轉字符串, '&转字符串' => &转字符串,
        '&轉列表' => &轉列表, '&转列表' => &转列表, '&轉散列' => &轉散列, '&转散列' => &转散列, '&轉布爾' => &轉布爾, '&转布尔' => &转布尔,
        '&轉字符' => &轉字符, '&转字符' => &转字符, '&轉代碼' => &轉代碼, '&转代码' => &转代码,

        # Random functions
        '&隨機' => &隨機, '&随机' => &随机, '&隨機整數' => &隨機整數, '&随机整数' => &随机整数,
        '&隨機布爾' => &隨機布爾, '&随机布尔' => &随机布尔, '&隨機選擇' => &隨機選擇, '&随机选择' => &随机选择,

        # Functional helpers
        '&組合函數' => &組合函數, '&组合函数' => &组合函数, '&柯里化' => &柯里化,
        '&部分應用' => &部分應用, '&部分应用' => &部分应用, '&恆等' => &恆等, '&恒等' => &恒等,
        '&常量' => &常量, '&翻轉' => &翻轉, '&翻转' => &翻转,

        # Error handling
        '&嘗試' => &嘗試, '&尝试' => &尝试, '&安全執行' => &安全執行, '&安全执行' => &安全执行,
        '&拋出' => &拋出, '&斷言' => &斷言, '&断言' => &断言,

        # Operators
        '&infix:<加>' => &infix:<加>,
        '&infix:<減>' => &infix:<減>,
        '&infix:<乘>' => &infix:<乘>,
        '&infix:<除>' => &infix:<除>,
        '&infix:<模>' => &infix:<模>,
        '&infix:<冪>' => &infix:<冪>,
        '&infix:<幂>' => &infix:<幂>,
        '&infix:<等於>' => &infix:<等於>,
        '&infix:<等于>' => &infix:<等于>,
        '&infix:<不等於>' => &infix:<不等於>,
        '&infix:<不等于>' => &infix:<不等于>,
        '&infix:<大於>' => &infix:<大於>,
        '&infix:<大于>' => &infix:<大于>,
        '&infix:<小於>' => &infix:<小於>,
        '&infix:<小于>' => &infix:<小于>,
        '&infix:<大於等於>' => &infix:<大於等於>,
        '&infix:<大于等于>' => &infix:<大于等于>,
        '&infix:<小於等於>' => &infix:<小於等於>,
        '&infix:<小于等于>' => &infix:<小于等于>,
        '&infix:<連接>' => &infix:<連接>,
        '&infix:<连接>' => &infix:<连接>,
        '&infix:<重复字符串>' => &infix:<重复字符串>,
        '&infix:<且>' => &infix:<且>,
        '&infix:<或>' => &infix:<或>,
        '&prefix:<非>' => &prefix:<非>,
        '&非' => &非,
        '&infix:<到>' => &infix:<到>,
        '&infix:<直到>' => &infix:<直到>,
        '&infix:<加等於>' => &infix:<加等於>,
        '&infix:<加等于>' => &infix:<加等于>,
        '&infix:<減等於>' => &infix:<減等於>,
        '&infix:<減等于>' => &infix:<減等于>,
        '&infix:<乘等於>' => &infix:<乘等於>,
        '&infix:<乘等于>' => &infix:<乘等于>,
        '&infix:<除等於>' => &infix:<除等於>,
        '&infix:<除等于>' => &infix:<除等于>,
    );

    %exports
}
