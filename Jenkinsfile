pipeline {
    agent any

    parameters {
        string(name: 'GIT_REPO', defaultValue: 'https://github.com/Dudi-Chiranjeevi/usecase4.git', description: 'GitHub repository URL')
        string(name: 'BRANCH', defaultValue: 'main', description: 'Git branch to checkout')
        string(name: 'DEST_USER', defaultValue: 'cdudi', description: 'Destination username')
        string(name: 'DEST_HOST_1', defaultValue: '10.128.0.28', description: 'First destination host IP')
        string(name: 'DEST_HOST_2', defaultValue: '10.128.0.29', description: 'Second destination host IP')
        string(name: 'DEST_PATH', defaultValue: '/home/cdudi/', description: 'Destination path on remote host')
        string(name: 'FILE_NAME', defaultValue: 'data3.csv', description: 'File to transfer')
    }

    environment {
        LOG_FILE = 'logs/transfer.log'
    }

    stages {
        stage('Checkout SCM') {
            steps {
                checkout scm
            }
        }

        stage('Log Git Status') {
            steps {
                script {
                    sh """
                        mkdir -p logs
                        echo "===== Git Status =====" >> ${LOG_FILE}
                        git status >> ${LOG_FILE} 2>&1
                        echo "Git status logged at \$(date)" >> ${LOG_FILE}
                    """
                }
            }
        }

        stage('Transfer CSV File to Two Hosts') {
            steps {
                script {
                    sh """
                        echo "===== Transfer to DEST_HOST_1 =====" >> ${LOG_FILE}
                        pwsh -Command "& { ./transfer.ps1 -DestinationUser '${params.DEST_USER}' -DestinationHost '${params.DEST_HOST_1}' -CsvFilePath '${params.FILE_NAME}' -TargetPath '${params.DEST_PATH}' }" >> ${LOG_FILE} 2>&1

                        echo "===== Transfer to DEST_HOST_2 =====" >> ${LOG_FILE}
                        pwsh -Command "& { ./transfer.ps1 -DestinationUser '${params.DEST_USER}' -DestinationHost '${params.DEST_HOST_2}' -CsvFilePath '${params.FILE_NAME}' -TargetPath '${params.DEST_PATH}' }" >> ${LOG_FILE} 2>&1

                        echo "Transfer to both hosts completed at \$(date)" >> ${LOG_FILE}
                    """
                }
            }
        }
    }

    post {
        always {
            script {
                def summaryLog = "logs/build_history.log"
                def buildInfo = "Build #${env.BUILD_NUMBER} | Status: ${currentBuild.currentResult} | Time: ${new Date().format("yyyy-MM-dd HH:mm:ss")}"

                sh "mkdir -p logs"
                sh "echo '${buildInfo}' >> ${summaryLog}"

                archiveArtifacts artifacts: 'logs/*.log', fingerprint: true

                emailext(
                    subject: "${currentBuild.currentResult}: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]'",
                    body: """<p>Job ${currentBuild.currentResult}.</p>
<p>Job: ${env.JOB_NAME}<br/>
Build Number: ${env.BUILD_NUMBER}<br/>
<a href='${env.BUILD_URL}'>View Build</a></p>""",
                    to: 'chiranjeevigen@gmail.com',
                    from: 'chiranjeevidudi3005@gmail.com',
                    attachmentsPattern: 'logs/transfer.log'
                )
            }
        }
    }
}

