pipeline {
    agent any

    stages {

        stage('Health Check') {
            steps {
                sh 'chmod +x health_check.sh'
                sh './health_check.sh'
            }
        }

        stage('Archive Report') {
            steps {
                archiveArtifacts artifacts: 'reports/report.html'
            }
        }
    }
}