FROM eclipse-temurin:17-jdk-alpine

# Set working directory inside container
WORKDIR /app

# Create non-root user (security best practice)
RUN adduser -D -u 1001 appuser
USER appuser

# Copy only the built JAR from builder stage
COPY --from=builder /app/target/*.jar app.jar

# Optional metadata
LABEL maintainer="devops@example.com"
LABEL version="${VERSION}"

# Expose default port (optional)
EXPOSE 8080

# Run the JAR
ENTRYPOINT ["java", "-jar", "app.jar"]
📂 Required Directory Structure
css
Copy
Edit
my-java-app/
├── Dockerfile
├── .dockerignore
├── pom.xml
└── src/
    └── main/
        └── java/
📦 .dockerignore (Highly Recommended)
bash
Copy
Edit
target/
.git
.gitignore
README.md
Dockerfile
*.log
🛠️ Build the Image
bash
Copy
Edit
docker build \
  --build-arg VERSION=1.0.0 \
  --tag my-java-app:1.0.0 \
  .
▶️ Run the Container
bash
Copy
Edit
docker run -d -p 8080:8080 my-java-app:1.0.0
✅ Summary
Feature	Present?
Multi-stage (build + run)	✅
Non-root user	✅
ARG for ENV/Version	✅
.dockerignore support	✅
Maven-based build	✅

Would you like:

A Gradle version of this Dockerfile?

Integration into Jenkins, GitHub Actions, or Kubernetes?

Dockerfile + docker-compose.yml combo?

Let me know and I’ll tailor it!








Ask ChatGPT
You said:
but in dockerfile and java working directory not matching?


ChatGPT said:
Excellent catch! Let's clarify this — it's a common confusion when building Java apps into Docker images. Here's what's happening and how to correctly align the working directory in the Dockerfile with how your Java build tool (like Maven) produces your .jar file.

🎯 The Issue
In this section of the Dockerfile:

Dockerfile
Copy
Edit
WORKDIR /app
COPY . .
RUN mvn clean package -DskipTests
The Maven build (mvn clean package) runs inside /app

It assumes that /app contains a full Maven project (pom.xml, src/, etc.)

Maven will generate a .jar file in:

bash
Copy
Edit
/app/target/myapp.jar
Then later:

Dockerfile
Copy
Edit
COPY --from=builder /app/target/*.jar app.jar
This line copies the JAR from that expected location.

✅ When It Works
This structure works perfectly when your host project directory is like:

css
Copy
Edit
my-java-app/
├── Dockerfile
├── pom.xml
└── src/
And your Docker context is:

bash
Copy
Edit
cd my-java-app
docker build -t myapp:1.0.0 .
So /app in the container will mirror your Maven project root — hence mvn clean package works correctly in /app.

🔁 Adjusting for a Different Project Layout
🎯 Example: Java project is in a subfolder
css
Copy
Edit
project-root/
├── Dockerfile
└── java-app/
    ├── pom.xml
    └── src/
👉 In this case, update the Dockerfile:

Dockerfile
Copy
Edit
WORKDIR /build
COPY java-app/ .

RUN mvn clean package -DskipTests
And later:

Dockerfile
Copy
Edit
COPY --from=builder /build/target/*.jar app.jar
✅ Summary: Fixing Directory Alignment
Problem	Fix
Docker WORKDIR doesn’t match project root	Set WORKDIR to match project root
.jar not found	Ensure correct COPY path in final image
Project in subfolder	COPY only that subfolder

💡 Tip
To debug:

Dockerfile
Copy
Edit
RUN ls -al /app
RUN ls -al /app/target
Or run:

bash
Copy
Edit
docker run -it <image-id> sh
to explore the file system interactively.

Would you like a full example project with:

Subfolder layout?

Gradle instead of Maven?

Multi-module Maven setup?

Let me know your exact structure and I’ll adjust the Dockerfile for you.








