# docker splash
sudo docker pull scrapinghub/splash
sudo docker run -p 5023:5023 -p 8050:8050 -p 8051:8051 scrapinghub/splash
sudo docker ps
sudo docker stop 55573ef3bf2a
sudo service docker stop

bin/zookeeper-server-start.sh config/zookeeper.properties
bin/kafka-topics.sh --create --zookeeper localhost:2181 --replication-factor 3 -partitions 1 --topic Multibrokerapplication
bin/kafka-topics.sh --describe --zookeeper localhost:2181 
--topic Multibrokerapplication

bin/kafka-console-producer.sh --broker-list localhost:9092 --topic Multibrokerapplication

bin/kafka-console-consumer.sh --zookeeper localhost:2181 
--topic Multibrokerapplica-tion —from-beginning



docker network ls

docker network inspect bridge

docker run -itd --name=container1 busybox
docker run -itd --name=container2 busybox

docker network disconnect bridge container1

docker network create -d bridge new_bridge

docker run -d --net=new_bridge --name db training/postgres

docker inspect --format='{{json .NetworkSettings.Networks}}'  db

docker inspect --format='{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' web


docker exec -it db bash
ping ...

docker network connect new_bridge web

docker inspect --format='{{json .NetworkSettings.Networks.new_bridge}}'  web

docker network create <<network name>>
docker network connect <<network name>> <<Container name>>
docker network inspect <<network name>>
docker network disconnect <<network name>> <<container name>>
docker network rm <<network name>>


----------
```bash
docker pull nginx
	aufs
	devicemapper
	overlay2
	overlay
	zfs
docker info

/etc/docker/daemon.json

{
  "storage-driver": "devicemapper"
}

service docker start

docker run -d -P --name web -v /webapp training/webapp python app.py
docker inspect web
```

Volumnes

```bash
docker volume create --name a_volume
docker volume inspect a_volume
docker volume ls
docker volume prune

docker run --rm --volumes-from dbstore -v $(pwd):/backup ubuntu tar cvf /backup/backup.tar /dbdata
docker run --rm --volumes-from dbstore2 -v $(pwd):/backup ubuntu bash -c "cd /dbdata && tar xvf /backup/backup.tar --strip 1"
```

```bash
docker create -v /dbdata --name dbstore training/postgres /bin/true
docker run -d --volumes-from dbstore --name db1 training/postgres
docker run -d --volumes-from dbstore --name db2 training/postgres
```
