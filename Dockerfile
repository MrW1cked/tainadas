# Use uma imagem base com JDK para build
FROM openjdk:17-jdk-slim AS build

# Define o diretório de trabalho
WORKDIR /app

# Copia os arquivos do Maven
COPY mvnw .
COPY .mvn .mvn
COPY pom.xml .

# Da permissão de execução ao mvnw
RUN chmod +x mvnw

# Baixa as dependências (para cache de layers)
RUN ./mvnw dependency:go-offline

# Copia o código fonte
COPY src src

# Compila a aplicação
RUN ./mvnw clean package -DskipTests

# Use uma imagem mais leve para runtime
FROM eclipse-temurin:17-jre-alpine

# Define o diretório de trabalho
WORKDIR /app

# Cria um usuário não-root para segurança
RUN addgroup -g 1001 -S spring && adduser -u 1001 -S spring -G spring
USER spring:spring

# Copia o JAR compilado do stage anterior
COPY --from=build /app/target/*.jar app.jar

# Cria o diretório para o ficheiro CSV
USER root
RUN mkdir -p src/main/resources && chown -R spring:spring src/
USER spring:spring

# Copia o ficheiro CSV inicial
COPY --chown=spring:spring src/main/resources/dados.csv src/main/resources/dados.csv

# Expõe a porta da aplicação
EXPOSE 9099

# Define o comando para executar a aplicação
ENTRYPOINT ["java", "-jar", "app.jar"]
