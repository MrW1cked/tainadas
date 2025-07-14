# Use uma imagem base com JDK para build
FROM openjdk:17-jdk-slim as build

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
FROM openjdk:17-jre-slim

# Define o diretório de trabalho
WORKDIR /app

# Cria um usuário não-root para segurança
RUN addgroup --system spring && adduser --system spring --ingroup spring
USER spring:spring

# Copia o JAR compilado do stage anterior
COPY --from=build /app/target/*.jar app.jar

# Cria o diretório para o ficheiro CSV
RUN mkdir -p src/main/resources

# Copia o ficheiro CSV inicial
COPY --chown=spring:spring src/main/resources/dados.csv src/main/resources/dados.csv

# Expõe a porta da aplicação
EXPOSE 9069

# Define o comando para executar a aplicação
ENTRYPOINT ["java", "-jar", "app.jar"]
