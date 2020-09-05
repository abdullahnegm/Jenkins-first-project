pipeline {
    agent {label "slave"}
    stages {
        stage('Build') {
            steps {
               sh "docker build -t respect1/djangoapp ."
            }
        }
        stage('Push') {
            steps {
                withCredentials([usernamePassword(credentialsId:'docker', usernameVariable:"USERNAME", passwordVariable:"PASSWORD")]){
                sh "docker login --username $USERNAME --password $PASSWORD"
                sh "docker push respect1/djangoapp"
                }
            }
        }
            stage('deploy') {
                steps {
                    sh "docker run -itd respect1/djangoapp"   
                }
                post {
                  success{
                        slackSend (color: '#00FF00', message: "SUCCESSFUL: Job '${env.JOB_NAME}  [${env.BUILD_NUMBER}]' (${env.BUILD_URL}console)")
                  }
                    failure{
                        slackSend (color: '#E83009', message: "FAILED: Job '${env.JOB_NAME}  [${env.BUILD_NUMBER}]' (${env.BUILD_URL}console)")
                  }
                    aborted{
                        slackSend (color: '#E8E209', message: "ABORTED: Job '${env.JOB_NAME}  [${env.BUILD_NUMBER}]' (${env.BUILD_URL}console)")
                  }
            }
            }
        }
        }
