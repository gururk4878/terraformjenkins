# Use the base image with Java and Tomcat pre-installed
FROM tomcat:latest

# Set the working directory in the container
WORKDIR /usr/local/tomcat/webapps

# Copy the WAR file from the local filesystem to the container
COPY target/sample-webapp.war .

# Expose the port that Tomcat is running on (default: 8080)
EXPOSE 8080

CMD ["catalina.sh", "run"]
