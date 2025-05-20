pipeline {
    agent {label "EC2_CHILD"}

    stages {
        stage("CODE") {
            steps {
                echo "This is to clone the project on server"
                git url: "https://github.com/MohdRavishIdreesi/webapp_01.git", branch: "main"
            }
        }

        stage("BUILD") {
            steps {
                echo "This is for building the project docker instances using docker-compose"
                sh "docker-compose build"
            }
        }

        stage("DEPLOY") {
            steps {
                echo "This is for deploying the project docker instances using docker-compose"
                sh "docker-compose down"
                sh "docker-compose up -d"
            }
        }

        stage("TEST") {
            steps {
                echo "This is for testing"
            }
        }
    }
}
