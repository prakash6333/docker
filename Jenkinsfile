pipeline {
    agent any

    environment {
        DOCKER_IMAGE = "prakash6333/mynginx:latest"
    }

    stages {
        stage('Checkout') {
            steps {
                // Checkout your GitHub repo explicitly
                git branch: 'main',
                    url: 'https://github.com/prakash6333/docker.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh '''
                  echo "🔨 Building Docker image..."
                  docker build -t $DOCKER_IMAGE .
                '''
            }
        }

        stage('Login & Push to Docker Hub') {
            steps {
                withCredentials([usernamePassword(
                    credentialsId: 'dockerhub-credentials', 
                    usernameVariable: 'DOCKERHUB_USER', 
                    passwordVariable: 'DOCKERHUB_PASS'
                )]) {
                    sh '''
                      echo "🔐 Logging in to Docker Hub..."
                      echo $DOCKERHUB_PASS | docker login -u $DOCKERHUB_USER --password-stdin
                      
                      echo "📤 Pushing Docker image..."
                      docker push $DOCKER_IMAGE
                    '''
                }
            }
        }
    }

    post {
        success {
            echo "✅ Build and Push successful!"
        }
        failure {
            echo "❌ Build failed!"
        }
    }
}
