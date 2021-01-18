在Shell中`$`是一个特殊的字符，在不同场景中有不同的用法。



## 引用变量

使用`$`直接引用变量，包括循环变量。

```shell
root@iZ2ze43t8c5urajez7ws4eZ:~# x=1
root@iZ2ze43t8c5urajez7ws4eZ:~# echo $x
1
```

双引号`"`括起来的字符串支持变量插值。

```shell
root@iZ2ze43t8c5urajez7ws4eZ:~# x=1
root@iZ2ze43t8c5urajez7ws4eZ:~# echo "x = $x"
x = 1
```

使用`${}`作为单词边界。

```shell
root@iZ2ze43t8c5urajez7ws4eZ:/var/log/nginx# x=1
root@iZ2ze43t8c5urajez7ws4eZ:/var/log/nginx# echo "x = ${x}yz"
x = 1yz
```

使用${#}获取变量字符串长度。

```shell
root@iZ2ze43t8c5urajez7ws4eZ:/var/log/nginx# s=hello
root@iZ2ze43t8c5urajez7ws4eZ:/var/log/nginx# echo "s.length = ${#s}"
s.length = 5
```

## 引用脚本或函数参数

基于下标的引用方式，0表示shell脚本文件名，n从1开始表示第n个参数，第1个参数是$1。

```shell
root@iZ2ze43t8c5urajez7ws4eZ:~# echo 'echo $0 $1' > test.sh
root@iZ2ze43t8c5urajez7ws4eZ:~# cat test.sh
echo $0 $1
root@iZ2ze43t8c5urajez7ws4eZ:~# sh test.sh 1 2 3
test.sh 1
```

注意，单引号`'`括起来的字符串不会进行插值。

使用`$#`获取脚本或函数参数个数。

```shell
root@iZ2ze43t8c5urajez7ws4eZ:~# echo 'echo $#' > test.sh
root@iZ2ze43t8c5urajez7ws4eZ:~# sh test.sh 1 2 3
3
```

使用`$@`或`$*`以数组的形式引用参数列表。它们的区别在于使用双引号括起来用时，假设传入的参数为`1 2 3`，那么`"$@"`的值为”1”、”2”、”3”三个变量，`$*`的值为”1 2 3”一个变量。

test.sh

```shell
echo using '$@'
for x in "$@"
do
  echo + $x
done
echo using '$*'
for x in "$*"
do
  echo - $x
done
root@iZ2ze43t8c5urajez7ws4eZ:~# sh test.sh 1 2 3
using $@
+ 1
+ 2
+ 3
using $*
- 1 2 3
```

## 上一次命令的返回值

使用`$?`上一次命令的返回值。0表示执行成功，非零值表示出错，注意这里与C语言的不同之处。

`$?`的命名很好记，问号表示询问OS，上一次执行的命令结果怎么样啦？需要注意每执行一个命令都会覆盖这个变量。

```shell
root@iZ2ze43t8c5urajez7ws4eZ:~# true
root@iZ2ze43t8c5urajez7ws4eZ:~# echo $?
0
root@iZ2ze43t8c5urajez7ws4eZ:~# false
root@iZ2ze43t8c5urajez7ws4eZ:~# echo $?
1
```

## 执行并获取命令输出

使用`$()`执行并获取命令输出赋值给变量，等同于双引号的功能。

```shell
root@iZ2ze43t8c5urajez7ws4eZ:~# echo `date`
Sat Dec 2 15:07:50 CST 2017
root@iZ2ze43t8c5urajez7ws4eZ:~# echo $(date)
Sat Dec 2 15:07:56 CST 201
```

## 表达式求值

使用`$[]`对表达式进行求值，与`expr`命令不同的是，`$[]`用于插值，而`expr`则将值输出。

```shell
root@iZ2ze43t8c5urajez7ws4eZ:~# $[ 1 + 1 ]
2: command not found
root@iZ2ze43t8c5urajez7ws4eZ:~# echo $[ 1 + 1 ]
2
root@iZ2ze43t8c5urajez7ws4eZ:~# expr 1 + 1
2
```

## 获取当前进程ID

使用`$$`获取当前进程ID。

```shell
root@iZ2ze43t8c5urajez7ws4eZ:~# echo $$
16150
```

## 后台运行的最后一个进程ID

使用`$!`获取后台运行的最后一个进程ID，在命令后面使用`&`即可以创建后台进程。

```shell
root@iZ2ze43t8c5urajez7ws4eZ:~# tail -f /var/log/nginx/access.log &
[1] 16176
root@iZ2ze43t8c5urajez7ws4eZ:~# echo $!
16176
root@iZ2ze43t8c5urajez7ws4eZ:~# kill $!
```

## 获取shell选项

使用`$-`获取当前shell的选项。具体的选项意义可以参考[segmentfault上的回答](https://segmentfault.com/q/1010000000306472)。

```shell
root@iZ2ze43t8c5urajez7ws4eZ:~# echo $-
himBH
```