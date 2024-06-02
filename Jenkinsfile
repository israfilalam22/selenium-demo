pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/israfilalam22/selenium-demo.git'
            }
        }

        stage('Build') {
            steps {
                sh 'mvn clean package'
            }
        }

        stage('Docker Build') {
            steps {
                sh 'docker build -t israfilalam22/selenium-demo .'
            }
        }

        stage('Docker Scan') {
            steps {
                sh 'trivy image --severity HIGH,CRITICAL israfilalam22/selenium-demo'
            }
        }

        stage('Test') {
            steps {
                sh 'mvn test'
            }
        }
    }
}
