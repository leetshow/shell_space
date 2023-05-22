
# 1.Shell脚本接收位置参数，变量的定义、分类和查看
## 1.1 从用户输入获取参数

### 1.1.1 通过$符号配合*、#、数字等来获取
（1）$0表示当前脚本文件名称
```
[root@sulibao ~]# vim aaa.sh
#!/bin/bash
echo "这个脚本文件名称为$0"
[root@sulibao ~]# bash aaa.sh 
这个脚本文件名称为aaa.sh
```
（2）${1.....},表示第几个参数，$1表示第一个参数，用户输入参数时参数间以空格相隔
在运行脚本文件时指定第几个参数

```
[root@sulibao ~]# vim aaa.sh
#!/bin/bash
echo "这个脚本文件名称为$0"
echo "今年上$1年级"
echo "我的邮箱地址是$2"
[root@sulibao ~]# bash aaa.sh 二 666.com
这个脚本文件名称为aaa.sh
今年上二年级
我的邮箱地址是666.com
```
（3）"\$#\"表示统计当前参数总数
（4）"\$*\"表示以整体，“参数1 参数2 参数2”这样的形式返回参数的值

### 1.1.2 通过read （-p）来获取

```
read -p "请输入你的名字和年龄：" name age
echo "你的名字是： $name,你今年$age岁"
```

## 1.2 Shell中的变量
### 1.2.1 变量读取

> echo $变量名
>  echo ${变量名}
> printf "$变量名\n"
>  printf "${变量名}\n"
> set和declare命令可以查看所有的变量和函数
> env命令可以显示是所有的全局变量

## 1.2.2 变量的分类和取消

（2）全局变量，也叫环境变量，可以在shell和shell派生的子进程中使用

- 通过export 变量名或者export 变量名=值进行临时设置
- declare -x 变量名=值或declare +x 变量名来取消全局变量

（3）可以通过unset 变量名来取消变量名 

# 2.流程控制

## If语句

```shell

if [ 可以写一些测试语句 ]
        then     需要执行的命令1
elif [ 可以写一些测试语句 ]
        then     需要执行的命令2
else            
        需要执行的命令3
fi
```

## for

```shell
for 变量 in 值/值列表/值文件
        do
        执行的命令
done

```

## while

```shell

while [ $x -lt 10 ]              //当条件测试语句成立时才执行do内的内容
        do
                echo $x
                ((x++))
done
```

## case

```shell

case "" in                            //""引号内写匹配目标
        模式1)                         //模式后需要以)结束
                执行命令1
                ;;                    //结束标志
        模式2)
                执行命令2
                ;;
        *)                           //其他模式（其他匹配项）
                执行命令3
esac   
```

# 3. 测试语句

## 3.1 基础知识

> vim或touch filename 创建文件
>
> Echo $shell 查看shell解释器
>
>  # !/bin/bash 使用bin/bash作为shell解释器

> Bash xx.sh 运行shell文件
>
>  "#"作为注释符号

> [] 作为测试语句基本格式，开括号与测试语句至少间隔一个空格

## 3.2 文件测试

| 操作符 | 功能                      |
| ------ | ------------------------- |
| -e/-a	| 文件是否存在，存在为真 |
| -b		| 文件是否存在且为块文件，同时满足则结果为真 |
| -c		| 文件是否存在且为字符文件，同时满足则为真 |
| -L		| 文件是否存在且为链接文件，同时满足为真 |
| -f		| 是否为一般文件，是则为真 |
| -d		| 是否为目录，是则为真 |
| -s		| 文件存在且文件大小不为0，是为真 |
| -u		| 文件是否设置suid位，是则为真 |
| -r		| 是否有读权限 |
| -w		| 是否有写权限 |
| -x		| 是否有执行权限 |
| file1 -nt file2	| 	nt指newer than，file1是否比file2新，是则为真 |
| file1 -ot file2	| 	ot指older than，file1是否比file2旧，是则为真 |
|  echo $?	| 	打印测试结果，值为0表示测试语句成立，非0不成立 |

```shell
if [ -e readme.md ]; then
  printf "readme exist"
else
  printf "readme not exist"
fi
```



## 3.3 字符串

| 操作符   | 功能                                      |
| -------- | ----------------------------------------- |
| -n 字符串 | no zero，字符串的长度是否为0，不为0则为真 |
| -z 字符串 | zero，字符串的长度是否为0，为0则为真 |
| "字符串1" = "字符串2" | 字符串1是否等于字符串2，等于则为真，=前后需要加空格 |
| "字符串1" != "字符串2"  | 字符串1是否等于字符串2，不等于则为真，同样需要加空格 |


## 3.4 整数

| 操作符 | 功能                      |
| ------ | ------------------------- |
| -eq    | equal，等于               |
| -gt    | greater than，大于        |
| -lt    | less than，小于           |
| -le    | less equal，小于或等于    |
| -ge    | greater equal，大于或等于 |
| -ne    | not equal，不等于         |





# 参考

https://blog.csdn.net/weixin_64334766/category_12274349.html