### Install uv:
```sh
curl -LsSf https://astral.sh/uv/install.sh | sh
```

### To check the uv version:
```sh
uv --version
```

### create uv project for flask:
```sh
uv init service_2
cd service_2
```

### create requirements file:
```sh
nano requirements.txt
and add Flask, gunicorn
```

### To install the requirements to run the flask code:
```sh
uv add -r requirements.txt
Edit the main.py as per the wish
```

### Dockerising the project:
```sh
# create docker network:
docker create network dpdzero_network

# build and run the service_1:
cd service_1
docker build -t service1_image:latest
docker run -d -p 8001:8001 --network dpdzero_network --name service1
http://localhost:8001/ping
http://localhost:8001/hello

# build and run the service_2:
cd service_2
docker build -t service2_image:latest
docker run -d -p 8002:8002 --network dpdzero_network --name service2
http://localhost:8002/ping
http://localhost:8002/hello

# build and run the nginx for reverse_proxy:
cd mynginx
docker build -t mynginx_image:latest
docker run -d -p 8080:8000 --network dpdzero_network --name nginx_container

http://localhost:8080/service1/ping
http://localhost:8001/service1/hello
http://localhost:8080/service2/ping
http://localhost:8001/service2/hello
```


### Docker-compose:
```sh
docker-compose up -d
(run in background)

http://localhost:8080/service1/ping
http://localhost:8001/service1/hello
http://localhost:8080/service2/ping
http://localhost:8001/service2/hello


docker-compose down (stops the containers)
```

### How routing works:
Once all 3 containers spin up

http://localhost:8080
You will get default nginx web page

http://localhost:8080/service1/ping
nginx reverse-proxy will route the traffic to service1-container
this container contains the code to serve /ping and /hello routes.


http://localhost:8080/service2/hello
it will route the traffic to service2-container
this container contains the code to server /ping and /hello routes.

![dpdzero_image](https://github.com/user-attachments/assets/8a2f49da-ae88-4654-8301-d5c95e18ab60)
