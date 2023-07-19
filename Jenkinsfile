pipeline {
    agent any

    stages {

       stage('Build') {
            steps {
                // Clean and compile the project using Maven
                sh 'mvn clean install package'
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
