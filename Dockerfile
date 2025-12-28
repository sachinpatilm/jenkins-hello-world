FROM maven:3.9.6-eclipse-temurin-17 AS build
WORKDIR /app
COPY . .
RUN mvn clean package -DskipTests
FROM  openjdk:17-ea-3-jdk-slim-buster 
WORKDIR /app
RUN ls /app
COPY --from=build /app/target/hello-demo-0.0.1-SNAPSHOT.jar app.jar
EXPOSE 6767
ENTRYPOINT ["java", "-jar", "app.jar"]
