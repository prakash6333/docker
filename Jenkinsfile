pipeline {
    agent any

    environment {
        IMAGE_NAME = "prakash6333/mynginx:latest"
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/prakash6333/docker.git'
            }
        }

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

    post {
        success {
            echo "✅ Docker image pushed successfully to Docker Hub!"
        }
        failure {
            echo "❌ Build failed!"
        }
    }
}
