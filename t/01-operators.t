use Test;
use lib 'lib';

# Import the module for testing
use Chinese;

plan 30;

# Test arithmetic operators
is (5 加 3), 8, '加 operator adds';
is (10 減 4), 6, '減 operator subtracts';
is (6 乘 7), 42, '乘 operator multiplies';
is (20 除 4), 5, '除 operator divides';
is (17 餘 5), 2, '餘 operator calculates remainder';
is (2 冪 8), 256, '冪 operator calculates power';

# Test comparison operators
ok (5 等於 5), '等於 operator compares equality';
ok (5 不等於 6), '不等於 operator compares inequality';
ok (10 大於 5), '大於 operator compares greater than';
ok (3 小於 8), '小於 operator compares less than';
ok (5 大於等於 5), '大於等於 operator compares greater or equal';
ok (5 小於等於 5), '小於等於 operator compares less or equal';

# Test logical operators
ok (真 且 真), '且 operator performs logical AND';
ok (真 或 假), '或 operator performs logical OR';
ok 非(假), '非 operator performs logical NOT';

# Test string operators
is ('你好' 連接 '世界'), '你好世界', '連接 operator concatenates strings';
is ('哈' 重複字符串 3), '哈哈哈', '重複字符串 operator repeats string';

# Test range operators
is-deeply (1 到 5), 1..5, '到 creates inclusive range';
is-deeply (1 直到 5), 1..^5, '直到 creates exclusive range';

# Test compound expressions
is ((2 加 3) 乘 4), 20, 'compound expression (2+3)*4';
is (10 除 (2 加 3)), 2, 'compound expression 10/(2+3)';
ok ((5 大於 3) 且 (10 小於 20)), 'compound logical expression';

# Test with variables
my $a = 10;
my $b = 3;
is ($a 加 $b), 13, 'operators work with variables';
is ($a 乘 $b), 30, 'multiplication with variables';

# Test precedence (need parentheses)
is ((5 加 3 乘 2)), 16, 'operators are left-associative (5+3)*2=16';
is ((5 加 (3 乘 2))), 11, 'explicit precedence with parentheses 5+(3*2)=11';

# Test assignment operators
my $x = 10;
$x 加等於 5;
is $x, 15, '加等於 adds and assigns';

$x = 20;
$x 減等於 5;
is $x, 15, '減等於 subtracts and assigns';

$x = 3;
$x 乘等於 4;
is $x, 12, '乘等於 multiplies and assigns';

$x = 20;
$x 除等於 4;
is $x, 5, '除等於 divides and assigns';

done-testing;