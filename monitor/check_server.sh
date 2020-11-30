#!/bin/bash

# tput sgr0 表示光标回归正常模式
resettem=$(tput sgr0)

nginxServer='localhost:80'
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

checkNginxServer
