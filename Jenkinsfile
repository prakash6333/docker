pipeline {
    agent any

    environment {
        DOCKER_IMAGE = "prakash6333/mynginx:latest"
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main',
                    url: 'https://github.com/prakash6333/docker.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                echo "🔨 Building Docker image..."
                sh 'docker build -t $DOCKER_IMAGE .'
            }
        }

        stage('Login & Push to Docker Hub') {
            steps {
                withCredentials([usernamePassword(
                    credentialsId: 'docker',
                    usernameVariable: 'DOCKER_USER',
                    passwordVariable: 'DOCKER_PASS'
                )]) {
                    echo "🔐 Logging in to Docker Hub..."
                    sh 'echo $DOCKER_PASS | docker login -u $DOCKER_USER --password-stdin'

                    echo "📤 Pushing Docker image..."
                    sh 'docker push $DOCKER_IMAGE'
                }
            }
        }
    }

    post {
        success {
            echo "✅ Docker image built and pushed successfully!"
        }
        failure {
            echo "❌ Build failed!"
        }
    }
}
