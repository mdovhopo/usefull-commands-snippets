#!/bin/bash
# credits - shykes/docker-wordpress and paulczar/docker-wordpress

echo
echo "Create MySQL Servers (master / slave repl)"
echo "-----------------"

echo "* Create MySQL01"

MYSQL01=$(docker run --name master-db -e MYSQL_ROOT_PASSWORD=root -d mysql:5.7 --server-id=1 --log-bin=mysql-bin --log-slave-updates=1 --auto_increment_increment=2 --auto_increment_offset=2)
MYSQL01_IP=$(docker inspect -f "{{.NetworkSettings.IPAddress}}" $MYSQL01)

echo "* Create MySQL02"

MYSQL02=$(docker run --name slave-db -e MYSQL_ROOT_PASSWORD=root -d mysql:5.7 --server-id=2 --log-bin=mysql-bin --log-slave-updates=1 --auto_increment_increment=2 --auto_increment_offset=2)
MYSQL02_IP=$(docker inspect -f "{{.NetworkSettings.IPAddress}}" $MYSQL02)

echo "* Sleep for two seconds for servers to come online..."
sleep 2

echo "* Creat replication user"

docker exec $MYSQL01 mysql -uroot -p$MASTER_PASSWORD -e 'GRANT REPLICATION SLAVE ON . TO "replication"@"%" IDENTIFIED BY "password";'
docker exec $MYSQL01 mysql -uroot -p$MASTER_PASSWORD -e 'flush privileges;'


echo "* Export Data from MySQL01 to MySQL02"
# --single-transaction - locks master node
docker exec $MYSQL01 mysqldump -uroot -p$MASTER_PASSWORD --single-transaction --all-databases | docker exec -i $MYSQL02 mysql -uroot -p$SLAVE_PASSWORD

echo "* Set MySQL01 as master on MySQL02"

MYSQL01_Position=$(docker exec $MYSQL01 mysql -uroot -p$MASTER_PASSWORD -e "show master status \G" | grep Position | awk '{print $2}')
MYSQL01_File=$(docker exec $MYSQL01 mysql -uroot -p$MASTER_PASSWORD -e "show master status \G"     | grep File     | awk '{print $2}')

docker exec $MYSQL02 mysql -uroot -p$SLAVE_PASSWORD -e "CHANGE MASTER TO master_host='$MYSQL01_IP', master_port=3306, \
	master_user='replication', master_password='password', master_log_file='$MYSQL01_File', \
	master_log_pos=$MYSQL01_Position;"

# echo "* Set MySQL02 as master on MySQL01"

# MYSQL02_Position=$(docker exec $MYSQL02 mysql -uroot -p$SLAVE_PASSWORD -e "show master status \G" | grep Position | awk '{print $2}')
# MYSQL02_File=$(docker exec $MYSQL02 mysql -uroot -p$SLAVE_PASSWORD -e "show master status \G"     | grep File     | awk '{print $2}')

# docker exec $MYSQL01 mysql -uroot -p$MASTER_PASSWORD -e "CHANGE MASTER TO master_host='$MYSQL02_IP', master_port=3306, \
# 	master_user='replication', master_password='password', master_log_file='$MYSQL02_File', \
# 	master_log_pos=$MYSQL02_Position;"

echo "* Start Slave on both Servers"
docker exec $MYSQL01 mysql -uroot -p$MASTER_PASSWORD -e "start slave;"
docker exec $MYSQL02 mysql -uroot -p$SLAVE_PASSWORD -e "start slave;"


echo "* Create database 'mydata' on MySQL01"

docker mysql -uroot -proot -h $MYSQL01_IP -e "create database mydata;"

echo "* Sleep 2 seconds, then check that database 'mydata' exists on MySQL02"

sleep 2
mysql -uroot -proot -h $MYSQL02_IP -e "show databases; \G" | grep mydata


echo "MySQL servers created!"
echo "--------------------"
echo
echo Variables available fo you :-
echo
echo MYSQL01_IP       : $MYSQL01_IP
echo MYSQL02_IP       : $MYSQL02_IP
