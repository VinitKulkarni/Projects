step1: create custom docker network
```sh
$docker network create mynetwork
```

step2: create a mysql offical docker image with network:
```sh
$docker run --name mydb --network mynetwork -d -p 3306:3306 -e MYSQL_ROOT_PASSWORD="yourpassword" mysql:latest
```

step3: go inside mysql docker container
$docker ps (to get the docker container id)
$docker exec -it <container_id> /bin/bash

step4: initalize database and create a table:
$mysql -u <username> -p <password>
use init.sql file to run the queries

step5: give a database access to grafana:
create user in mysql to access database in grafan dashboard:

CREATE USER 'grafana'@'%' IDENTIFIED BY 'grafanapassword';
GRANT SELECT ON project_db.* TO 'grafana'@'%';
FLUSH PRIVILEGES;
(now exit from mysql container)

step6: build and run python app with network:
$docker build -t python_grafana_image:1.0 .
$docker run --network mynetwork -d -p 5000:5000 python_grafana_image:1.0

step7: localhost:5000 
(app should work without error)

step8: run offical grafana docker image with network:
$ocker run --network mynetwork -d -p 3000:3000 grafana/grafana
localhost:3000 (you can see grafana dashboard)

step9:settings in grafana dashboard to see the mysql data
hosturl=mydb:3306   #mysql container name
databasename=project_db
username=grafana
password=grafanapassword

Test the connection
