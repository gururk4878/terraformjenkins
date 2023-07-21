pipeline {
    agent any

    stages {

         stage('Test') {
            steps {
                // Run the unit tests using Maven
                sh 'mvn test'
            }
        }
        
       stage('Build') {
            steps {
                // Clean and compile the project using Maven
                sh 'mvn clean install package'
            }
        }
        
        stage('Archive') {
            steps {
                // Archive the generated WAR file
                archiveArtifacts artifacts: 'target/sample-webapp.war'
            }
        }

        stage('Publish') {
            steps {
                sh "mvn deploy"
            }
        }

         stage('Deploy') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'tomcat-manager-credentials', usernameVariable: 'TOMCAT_USERNAME', passwordVariable: 'TOMCAT_PASSWORD')]) {
                    sh "mvn tomcat7:redeploy -Dtomcat.username=${TOMCAT_USERNAME} -Dtomcat.password=${TOMCAT_PASSWORD} -Dtomcat.url=http://<hostname>:<port>/manager/text -Dmaven.tomcat.path=/my-java-webapp"
                }
            }
    }
}
