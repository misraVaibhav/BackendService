# ---------- Build Stage ----------
FROM openjdk:21-jdk-slim AS build

WORKDIR /app

COPY mvnw .
COPY .mvn .mvn
COPY pom.xml .

# Give execute permissions
RUN chmod +x ./mvnw

# Pre-download dependencies
RUN ./mvnw dependency:go-offline

# Copy the source code
COPY src src

# Give execute permissions
RUN chmod +x ./mvnw

# Package the application
RUN ./mvnw clean package -DskipTests


# ---------- Runtime Stage ----------
FROM openjdk:21-jdk-slim

WORKDIR /app

# Copy only the built JAR from the build stage
COPY --from=build /app/target/*.jar app.jar

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "app.jar"]