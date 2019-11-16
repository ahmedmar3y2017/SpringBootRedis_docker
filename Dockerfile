FROM openjdk:8
EXPOSE 9090
ADD target/bootRedis.jar bootRedis.jar 
ENTRYPOINT ["java","-jar","/bootRedis.jar"]