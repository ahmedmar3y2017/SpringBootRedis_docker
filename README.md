# SpringBootRedis_docker

in this standalone application we use redis server to cach inserted user endpoint and retrieve it if exists . 

there are two containers
1 -  springboot app 
2 -  redis server 

Dockerfile

FROM openjdk:8
EXPOSE 9090
ADD target/bootRedis.jar bootRedis.jar 
ENTRYPOINT ["java","-jar","/bootRedis.jar"]

copy jar file to container insode docker file system then run command java -jar <warName> 
  
  
when run docker contianer 
- docker build -t username/imageName. 
- docker run -p 9090:9090 <username/imageName>


call webservice endpoint localhost:8080

http://localhost:9090/api/addUser

there are error occures because application container call redis container and connection faild so 
how we can connect to containers on docker ? 

using docker compose we can share containers over network to connect each other . 

we need compose file to connect two contaisner over network 

docker-compose.yml

version: '3'
services:
  redis-server:
    image: "redis"
  bootredis:
    restart : "always"
    build: .
    ports:
      - "9090:9090"

web defined two services 
1 - redis-server and its image downloaded from dockerHub . 
2 - bootredis and build in port 9090 

when call end point http://localhost:9090/api/addUser 
everything works successfully . 

