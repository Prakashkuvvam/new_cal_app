# Calculator Web Application

A simple Java web application that demonstrates basic calculator operations, packaged as a WAR file and deployable using Docker.

## Project Structure
```
├── src/
│   ├── main/
│   │   ├── java/
│   │   │   └── com/
│   │   │       └── example/
│   │   │           ├── App.java
│   │   │           └── Calculator.java
│   │   └── webapp/
│   │       ├── WEB-INF/
│   │       │   └── web.xml
│   │       └── index.jsp
│   └── test/
│       └── java/
│           └── com/
│               └── example/
│                   └── CalculatorTest.java
├── Dockerfile
├── Jenkinsfile
├── pom.xml
└── README.md
```

## Prerequisites
- Java 11 or higher
- Maven 3.6+
- Docker (optional)
- Jenkins (optional)

## Building the Application

### Using Maven
```bash
mvn clean package
```
This will create a WAR file in the `target` directory.

### Using Docker
```bash
# Build the Docker image
docker build -t calculator-app .

# Run the container
docker run -p 8080:8080 calculator-app
```

## Deployment Options

1. **Application Server**
   - Copy the WAR file from `target/simple-java-app.war` to your application server's deployment directory
   - For Tomcat: Copy to `webapps` directory

2. **Docker Container**
   - Use the provided Dockerfile
   - Application will be available at `http://localhost:8080`

3. **CI/CD with Jenkins**
   - Configure Jenkins with required plugins
   - Use the provided Jenkinsfile for automated builds
   - Slack notifications will be sent for build status

## Testing
Run the tests using Maven:
```bash
mvn test
```

## Accessing the Application
Once deployed, access the application at:
- Local development: http://localhost:8080
- Docker container: http://localhost:8080
- Application server: Depends on your server configuration