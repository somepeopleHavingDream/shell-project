#!/bin/bash
for ((i = 0; i < 10; i++))
do
	# 记录光标位置，及隐藏光标
	tput sc; tput civis

	# 显示时间
	# echo会将输入的字符串送往标准输出，输出的字符串间以空白字符隔开，并在最后加上换行符
	# -n 不要在最后自动换行
	# -e 若字符串中出现特殊字符，则特别加以处理，而不会将它当成一般文字输出
	echo -ne $(date +'%Y-%m-%d %H:%M:%S')

	sleep 1

	# 恢复光标到记录位置
	tput rc
done	

# 退出时清理终端，恢复光标显示
# tput el 清除到行尾
# tput cnorm 光标可见
tput el; tput cnorm
