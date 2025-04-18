Step-1: create custom docker network:
```sh
$docker network create mynetwork
```

Step-2: create a mysql offical docker image and attach custom network:
```sh
$docker run --name mydb --network mynetwork -d -p 3306:3306 -e MYSQL_ROOT_PASSWORD="yourpassword" mysql:latest
```

Step-3: go inside mysql docker container:
```sh
$docker ps (to get the docker container id)
$docker exec -it <container_id> /bin/bash
```

Step-4: initalize database and create a table:
```sh
$mysql -u <username> -p <password>
```
use init.sql file to run the queries


Step-5: give a database access to grafana:
create grafana user in mysql to access database in grafan dashboard:
```sh
CREATE USER 'grafana'@'%' IDENTIFIED BY 'grafanapassword';
GRANT SELECT ON project_db.* TO 'grafana'@'%';
FLUSH PRIVILEGES;
```
(now exit from mysql container)

Step-6: build and run python app with custom network:
```sh
$docker build -t python_grafana_image:1.0 .
$docker run --network mynetwork -d -p 5000:5000 python_grafana_image:1.0
```
localhost:5000 (you can see app running)

Step-7: run offical grafana docker image with custom network:
```sh
$ocker run --network mynetwork -d -p 3000:3000 grafana/grafana
```
localhost:3000 (you can see grafana dashboard)

Step-8:settings in grafana dashboard to see the mysql data
``sh
hosturl=mydb:3306   #mysql container name 
databasename=project_db
username=grafana
password=grafanapassword
```
Test the connection
