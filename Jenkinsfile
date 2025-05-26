pipeline {
    agent any

    environment {
        GIT_REPO = 'https://github.com/Dudi-Chiranjeevi/usecase4.git'
        BRANCH = 'main'
        DEST_USER = 'cdudi'
        DEST_HOST = '10.128.0.28'
        DEST_PATH = '/home/cdudi/'
        FILE_NAME = 'data.csv'
    }

    stages {
        stage('Clone GitHub Repo') {
            steps {
                git branch: "${BRANCH}", url: "${GIT_REPO}"
            }
        }

        stage('Transfer CSV File') {
            steps {
                sh '''
                pwsh -Command "& { ./transfer.ps1 -DestinationUser \\"${DEST_USER}\\" -DestinationHost \\"${DEST_HOST}\\" -CsvFilePath \\"${FILE_NAME}\\" -TargetPath \\"${DEST_PATH}\\" }"

                mkdir -p logs
                echo "Transfer completed at $(date)" > logs/transfer.log
                '''
            }
        }
    }

    post {
        success {
            script {
                def logFile = 'logs/transfer.log'
                if (fileExists(logFile)) {
                    archiveArtifacts artifacts: logFile, fingerprint: true

                    emailext(
                        subject: "SUCCESS: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]'",
                        body: """<p>Job succeeded.</p>
<p>Job: ${env.JOB_NAME}<br/>
Build Number: ${env.BUILD_NUMBER}<br/>
<a href='${env.BUILD_URL}'>View Build</a></p>""",
                        to: 'chiranjeevigen@gmail.com',
                        from: 'chiranjeevidudi3005@gmail.com',
                        attachmentsPattern: logFile
                    )
                } else {
                    echo "No log file found to attach."
                }
            }
        }

        failure {
            script {
                def logFile = 'logs/transfer.log'
                if (fileExists(logFile)) {
                    archiveArtifacts artifacts: logFile, fingerprint: true

                    emailext(
                        subject: "FAILURE: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]'",
                        body: """<p>Job failed.</p>
<p>Job: ${env.JOB_NAME}<br/>
Build Number: ${env.BUILD_NUMBER}<br/>
<a href='${env.BUILD_URL}'>View Build</a></p>""",
                        to: 'chiranjeevigen@gmail.com',
                        from: 'chiranjeevidudi3005@gmail.com',
                        attachmentsPattern: logFile
                    )
                } else {
                    echo "No log file found to attach."
                }
            }
        }
    }
}
