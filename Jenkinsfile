pipeline {
    agent any

    environment {
        DOCKERHUB_CREDENTIALS = credentials('docker')  // Jenkins credentials ID
        IMAGE_NAME = "prakash6333/mynginx"
        IMAGE_TAG = "latest"
    }

    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/prakash6333/docker.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh '''
                echo "Building Docker image..."
                docker build -t $IMAGE_NAME:$IMAGE_TAG .
                '''
            }
        }

        stage('Login & Push to Docker Hub') {
            steps {
                sh '''
                echo "Logging into Docker Hub..."
                echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin
                
                echo "Pushing Docker image..."
                docker push $IMAGE_NAME:$IMAGE_TAG
                '''
            }
        }
    }

    post {
        success {
            echo "✅ Docker image pushed successfully to Docker Hub: $IMAGE_NAME:$IMAGE_TAG"
        }
        failure {
            echo "❌ Build failed!"
        }
    }
}
