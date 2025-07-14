FROM maven:3.9.6-eclipse-temurin-17 AS build
COPY src src
COPY pom.xml ./
RUN mvn clean install

# PACKAGE STAGE
FROM eclipse-temurin:17-jdk
COPY --from=build /target/tainada-0.0.1-SNAPSHOT.jar tainada-0.0.1-SNAPSHOT.jar
CMD ["java", "-jar", "tainada-0.0.1-SNAPSHOT.jar"]