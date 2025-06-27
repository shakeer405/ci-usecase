#/bin/bash
# Exit on any failure
set -e

# -------- CONFIGURATIONS --------
PROJECT_NAME="my-java-app"
DOCKER_IMAGE="shakeer123/ciusecase:latest"
SONAR_PROJECT_KEY="ci-usecase"
SONAR_HOST_URL="http://localhost:9000"
SONAR_TOKEN="your-sonarqube-token"
NEXUS_REPO_URL="http://nexus.example.com/repository/maven-releases/"
NEXUS_USERNAME="your-nexus-username"
NEXUS_PASSWORD="your-nexus-password"
JFROG_REPO_URL="http://jfrog.example.com/artifactory/docker-local"
JFROG_USERNAME="your-jfrog-username"
JFROG_PASSWORD="your-jfrog-password"
DOCKERFILE_PATH="."
: '
For Specific Packaging Types:
JAR: mvn clean package -Pproduction

WAR: mvn clean package -Pproduction (ensure packaging is war in pom.xml)

Spring Boot: mvn clean package -Pproduction -Dspring-boot.repackage=true
'
echo "Building Maven Project"
#mvn clean package -Pprod -DskipTests --batch-mode --update-snapshots -Dmaven.compile.fork=true -T 1C
#mvn -f /path/to/pom.xml clean install -DskipTests
mvn clean install -DskipTests

echo "Unit testing stage"
mvn test
echo "Generating jacoco report"
mvn clean test jacoco:report

echo "Running sonar stage"
mvn sonar:sonar \
    -Dsonar.projectKey=$SONAR_PROJECT_KEY \
    -Dsonar.host.url=$SONAR_HOST_URL \
    -Dsonar.login=$SONAR_TOKEN

docker build -t registry.example.com/myteam/myapp:1.0.0 --file Dockerfile
