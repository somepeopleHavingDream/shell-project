#!/bin/bash

# tput sgr0 表示光标回归正常模式
resettem=$(tput sgr0)

# nginx服务器地址
nginxServer='localhost:80'
# mysql从服务器地址
mysqlSlaveServer='localhost'

# mysql服务器帐号和密码
mysqlUser='root'
mysqlPassword='123456'

# 检查Nginx服务的状态
checkNginxServer()
{
	# -m 请求最大处理时间，单位为秒
	# -s slient，静默显示
	# -w 提取指定的信息
	# -o 将内容输出到指定位置
	statusCode=$(curl -m 5 -s -w %{http_code} ${nginxServer} -o /dev/null)
	if [ $statusCode -eq 000 -o $statusCode -ge 500 ]; then
		echo -e "check http server error! response status code is" $resettem $statusCode
	else
		# $()是取括号中命令执行的结果
		httpContent=$(curl -s ${nginxServer})
		echo -e "check http server ok! \n" $resettem $httpContent
	fi
}

# 检查mysql服务器的状态
checkMySQLServer()
{
	# -z表示zero，表示扫描时不发送任何数据
	# -w表示超时秒数，后面跟数字
	# -v输出交互或出错信息，新手调试时尤为有用
	nc -z -w2 $mysqlSlaveServer 3306
	if [ $? -eq 0 ]; then
		echo "connect $mysqlSlaveServer ok!"
	fi
}

checkNginxServer
echo
checkMySQLServer
