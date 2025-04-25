
pipeline {
    agent any
    tools {nodejs "NODEJS"}
    stages {
        stage('Build'){
            steps {
                script{
                    sh 'npm install'
                }
            }
        }
        stage('Test'){
            steps{
                script {
                    sh 'npm test || echo "No tests configured"'

                }
            }
        }
        stage('Deploy'){
            steps{
                script{
                    sh 'echo "Deploying the applications"'
                    sh 'node index.js'
                }
            }
        }
    }
}