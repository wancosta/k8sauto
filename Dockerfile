# Utilizando uma imagem base que contenha o java
FROM openjdk:17-jdk-slim

# Definir o diretório de trabalho dentro do container
WORKDIR /app

# Copiar o arquivo app.jar do diretório local para o container
COPY /app/build/libs/app.jar /app/app.jar

# Expondo a porta na qual o aplicativo estará rodando
EXPOSE 8080

# Comando para rodar o aplicativo
ENTRYPOINT ["java", "-jar", "app.jar"]


