FROM openjdk:11-jre-slim
COPY target/selenium-demo-1.0-SNAPSHOT.jar /app/selenium-demo.jar
ENTRYPOINT ["java", "-jar", "/app/selenium-demo.jar"]
