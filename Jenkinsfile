pipeline {
    agent {label "slave"}
    stages {
        stage('Push') {
            steps {
                sh "echo lmaao"
            }
            post {
              succuss{
                slackSend (color: '#00FF00', message: "SUCCESSFUL: Job '${env.JOB_NAME}  [${env.BUILD_NUMBER}]' (${env.BUILD_URL}console)")
              }
            }
        }
        }
    }
