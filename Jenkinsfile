pipeline {
    agent any

    environment {
        KEY_PATH = "/var/lib/jenkins/fazoK.pem"
    }

    stages {

        stage('Checkout Code') {
            steps {
                git branch: 'main', url: 'https://github.com/Ritthik01/git-task.git'
            }
        }

        stage('Terraform Init') {
            steps {
                sh 'terraform init'
            }
        }

        stage('Terraform Apply') {
            steps {
                sh 'terraform apply -auto-approve'
            }
        }

        stage('Get Server IP') {
            steps {
                script {
                    env.SERVER_IP = sh(
                        script: "terraform output -raw public_ip",
                        returnStdout: true
                    ).trim()
                }
                echo "Server IP is ${SERVER_IP}"
            }
        }

        stage('Wait for Server to be Ready') {
            steps {
                echo "Waiting for EC2 instance to finish booting..."
                sh 'sleep 60'
            }
        }
        
    }

    post {
        success {
            echo "🎉 Deployment Successful! Visit: http://${SERVER_IP}"
        }
        failure {
            echo "❌ Pipeline Failed. Check logs above."
        }
    }
}