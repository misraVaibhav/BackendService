# Use a minimal base image with Java 21 JDK
FROM openjdk:21-jdk-slim

# Set environment variables
ENV SPRING_OUTPUT_ANSI_ENABLED=ALWAYS \
    JAVA_OPTS=""

# Set the working directory in the container
WORKDIR /app

# Copy the JAR file into the container (replace `target/*.jar` if needed)
COPY target/*.jar app.jar

# Expose the application port
EXPOSE 8080

# Run the JAR file
ENTRYPOINT ["sh", "-c", "java $JAVA_OPTS -jar app.jar"]
