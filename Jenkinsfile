pipeline {
    agent any

    stages {

       stage('Build') {
            steps {
                // Clean and compile the project using Maven
                sh 'mvn clean compile'
            }
        }
        stage('Package') {
            steps {
                // Package the web application into a WAR file
                sh 'mvn package'
            }
        }
        stage('Archive') {
            steps {
                // Archive the generated WAR file
                archive includes: 'target/sample-webapp.war'
            }
        }
    }
}
