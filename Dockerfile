# Use an official Maven image to build the app
FROM maven:3.8.1-openjdk-21 AS builder

# Set the working directory
WORKDIR /app

# Copy the pom.xml and the source code to the container
COPY pom.xml .

# Download the dependencies (this will cache the dependencies layer)
RUN mvn dependency:go-offline

# Copy the rest of the application source code
COPY src /app/src

# Package the app (this will create the target JAR file)
RUN mvn clean package -DskipTests

# Now, build the actual runtime image
FROM openjdk:21-slim

# Set the working directory
WORKDIR /app

# Copy the JAR file from the builder stage to the runtime stage
COPY --from=builder /app/target/*.jar /app/application.jar

# Expose the port your app runs on
EXPOSE 8080

# Command to run the application
ENTRYPOINT ["java", "-jar", "/app/application.jar"]
