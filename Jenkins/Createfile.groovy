pipeline {
    agent any
    stages {
        stage('Create File') {
            steps {
                sh '''
                  echo "Hello from Jenkins" > jenkins_output.txt
                '''
            }
        }
    }
}
// This Jenkins pipeline script creates a file named 'jenkins_output.txt'
// with the content "Hello from Jenkins" in the workspace directory.