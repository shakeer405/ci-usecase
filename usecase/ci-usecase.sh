#/bin/bash
# Exit on any failure
set -e

# -------- CONFIGURATIONS --------
PROJECT_NAME="my-java-app"
DOCKER_IMAGE="myregistry.example.com/${PROJECT_NAME}:latest"
SONAR_PROJECT_KEY="my-sonar-project"
SONAR_HOST_URL="http://localhost:9000"
SONAR_TOKEN="your-sonarqube-token"
NEXUS_REPO_URL="http://nexus.example.com/repository/maven-releases/"
NEXUS_USERNAME="your-nexus-username"
NEXUS_PASSWORD="your-nexus-password"
JFROG_REPO_URL="http://jfrog.example.com/artifactory/docker-local"
JFROG_USERNAME="your-jfrog-username"
JFROG_PASSWORD="your-jfrog-password"
DOCKERFILE_PATH="."
