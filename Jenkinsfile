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
        dir('selenium-demo') {
            sh 'docker build -t israfilalam22/selenium-demo .'
        }
    }
}


        stage('Docker Scan') {
            steps {
                sh 'docker run --rm -v $(pwd):/project aquasec/trivy image --severity HIGH,CRITICAL israfilalam22/selenium-demo'
            }
        }

        stage('Test') {
            steps {
                // Selenium Plugin steps with ChromeDriver path specified
                seleniumSetup(
                    browsers: [chrome(chromeDriverPath: '/usr/local/bin/chromedriver')]
                )
                seleniumScript(script: 'mvn test')
            }
        }

        stage('Publish HTML Report') {
            steps {
                publishHTML(target: [
                    reportDir: 'target/surefire-reports',
                    reportFiles: 'index.html',
                    reportName: 'HTML Report',
                    keepAll: true,
                    alwaysLinkToLastBuild: true,
                    allowMissing: false
                ])
            }
        }

        stage('Debug') {
            steps {
                sh 'ls -l /usr/local/bin/'
            }
        }
    }

    post {
        always {
            junit 'target/surefire-reports/*.xml'
        }
    }
}
