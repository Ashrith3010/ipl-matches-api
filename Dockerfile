FROM eclipse-temurin:22-alpine

COPY target/backend-assignment-0.0.1.jar app.jar
EXPOSE 9999
ENV KAFKA_HOST=host.docker.internal:9094
ENV REDIS_HOST=host.docker.internal
ENV MYSQL_URL=jdbc:mysql://host.docker.internal:3300/ipl2
ENTRYPOINT ["java", "-jar", "-Dspring.kafka.bootstrap-servers=${KAFKA_HOST}", "-Dspring.data.redis.host=${REDIS_HOST}", "-Dspring.datasource.url=${MYSQL_URL}", "/app.jar"]