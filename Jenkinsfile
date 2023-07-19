pipeline {
    agent any

    stages {

       stage('Build') {
            withMaven(maven: 'mvn') {
            sh "mvn clean package"
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
