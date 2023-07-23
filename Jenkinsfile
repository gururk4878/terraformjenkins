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

          stage('Build and Publish') {
            steps {
     withCredentials([usernamePassword(credentialsId: 'DOCKERHUB_CREDENTIALS', passwordVariable: 'DOCKER_PASSWORD', usernameVariable: 'DOCKER_USERNAME')]) {
                        sh "docker build -t $(DOCKER_USERNAME)/sample-webapp:jenkins ."
                        sh "docker login -u ${DOCKER_USERNAME} -p ${DOCKER_PASSWORD}"
                        sh "docker push $(DOCKER_USERNAME)/sample-webapp:jenkins"           
            }
        }
    }
}
