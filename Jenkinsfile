pipeline {
    agent any

    environment {
        IMAGE_NAME = "prakash6333/mynginx:latest"
    }

    stages {
        stage('Build Docker Image') {
            steps {
                echo "🔨 Building Docker image..."
                sh "docker build -t ${IMAGE_NAME} ."
            }
        }

        stage('Login & Push to Docker Hub') {
            steps {
                withCredentials([usernamePassword(
                    credentialsId: 'docker',
                    usernameVariable: 'DOCKER_USER',
                    passwordVariable: 'DOCKER_PASS'
                )]) {
                    sh """
                        echo $DOCKER_PASS | docker login -u $DOCKER_USER --password-stdin
                        docker push ${IMAGE_NAME}
                    """
                }
            }
        }
    }
}
