# HD-HA-2-VM-2.7.3
HD-HA-2-VM-2.7.3

Hadoop High availability 2.7.3 two machines master and slave in same node:

1- Vagrant up && vagrant hostmanaer
   
   root password: ali

2- Copy roles & config-hadoop.yml to /etc/ansible and add hostnames under [hadoop-cluster] in /etc/ansible/hosts

3- Allow ssh connection without a password between machines ti run ansible script

4- change hostnames based on your machines in and you can change the directories if you want!: config-hadoop.yml 

5- remove this line "127.0.0.1 hostname hostname" from /etc/hosts in both machines

6- run ansible script: ansible-playbook config-hadoop.yml

7- In both VM switch to hadoop user and llow ssh connection without a password between two machines: ssh-keygyn ssh-copy-id "master1"

8- In both VM set value in "Zookeeper-data-dir/myid:1 for master1 or 2 for master2

9- starting Hadoop Service:

- start journalnode in all: hadoop-daemon.sh
  

start journalnode

- In activenode: hdfs namenode -format
  

hadoop-daemon.sh start namenode

- In standbynode: hdfs namenode -bootstrapStandby
  
  hadoop-daemon.sh start namenode

- Start Zookeeper Service in all: zkServer.sh start

- Start DataNodes in all: hadoop-daemon.sh start datanode

- In activenode format and start failover controller: hdfs zkfc -formatZK

hadoop-daemon.sh start zkfc

- In standbynodeformat and start failover controller:

hdfs zkfc -formatZK

hadoop-daemon.sh start zkfc

- check Services: 

ps -ef | grep hadoop | grep -P 'namenode|datanode|ZKFailoverController|zookeeper|journalnode'
