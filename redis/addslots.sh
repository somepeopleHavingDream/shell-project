start=$1
end=$2
port=$3

for slot in `seq ${start} ${end}`
do
	echo "slot:${slot}"

	redis-cli -p ${port} -a 123456 cluster addslots ${slot}
done
