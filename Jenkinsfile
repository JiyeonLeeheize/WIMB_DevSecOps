pipeline {
    agent any

    environment {
        IMAGE_NAME = "devsecops-app"
    }

    stages {
        stage('Checkout') {
            steps {
                echo "(1) GitHub 레포에서 코드 가져오기"
                checkout scm
            }
        }

        stage('Docker Build') {
            steps {
                echo "(2) Docker 이미지 빌드 시작"
                sh 'docker build -t $IMAGE_NAME .'
            }
        }

        stage('Trivy Scan') {
            steps {
                echo "(3) Trivy로 보안 검사 실행"
                sh 'mkdir -p scan-results && trivy image $IMAGE_NAME > scan-results/trivy-result.txt || true'
            }
        }
    }

    post {
        always {
            echo "(4) 파이프라인 완료. trivy 결과는 워크스페이스에만 저장."
        }
    }
}
