pipeline {
    agent any

    stages {

       stage('Build') {
            steps {
                // Clean and compile the project using Maven
                sh 'mvn clean install package'
            }
        }

        stage('Test') {
            steps {
                // Run the unit tests using Maven
                sh 'mvn test'
            }
        }
        
        stage('Archive') {
            steps {
                // Archive the generated WAR file
                archiveArtifacts artifacts: 'target/sample-webapp.war'
            }
        }
    }
}
