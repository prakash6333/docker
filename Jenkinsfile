pipeline {
    agent any

    stages {
        stage('Clone Repo') {
            steps {
                echo "Cloning from GitHub..."
                checkout([$class: 'GitSCM', branches: [[name: '*/main']],
                          userRemoteConfigs: [[url: 'https://github.com/prakash6333/docker.git']]])
            }
        }

        stage('Build Docker Image') {
            steps {
                echo "Building Docker image..."
                sh 'docker build -t prakash6333/mynginx:latest .'
            }
        }

        stage('Push to Docker Hub') {
            steps {
                withCredentials([usernamePassword(
                    credentialsId: 'docker',
                    usernameVariable: 'DOCKER_USER',
                    passwordVariable: 'DOCKER_PASS'
                )]) {
                    sh """
                    echo "$DOCKER_PASS" | docker login -u "$DOCKER_USER" --password-stdin
                    docker push prakash6333/mynginx:latest
                    """
                }
            }
        }
    }
}
