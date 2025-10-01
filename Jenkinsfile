pipeline {
    agent any

    stages {
        stage('Clone Repo') {
            steps {
                git branch: 'main',
                    url: 'https://github.com/prakash6333/docker.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t prakash-test .'
            }
        }

        stage('Run Docker Container') {
            steps {
                sh '''
                docker rm -f prakash-container || true
                docker run -d -p 8081:80 --name prakash-container prakash-test
                '''
            }
        }
    }
}
