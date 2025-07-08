# Use slim OpenJDK 17 base image
FROM openjdk:17-jdk-slim

# Set working directory
WORKDIR /app

# Copy only the built JAR file
COPY target/java-maven-app-1.1.0-SNAPSHOT.jar app.jar

# Expose default Spring Boot port (optional)
EXPOSE 8080

# Run the JAR
ENTRYPOINT ["java", "-jar", "app.jar"]

