FROM eclipse-temurin:17-jdk-alpine
COPY target/*.jar app.jar

COPY src/main/resources/images/* src/main/resources/images/
COPY src/main/resources/relatorios/* src/main/resources/relatorios/

ENV JAVA_OPTS="-Duser.language=pt -Duser.country=BR"

ENTRYPOINT exec java $JAVA_OPTS -jar /app.jar