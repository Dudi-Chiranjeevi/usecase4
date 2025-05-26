pipeline {
    agent any

    parameters {
        string(name: 'GIT_REPO', defaultValue: 'https://github.com/Dudi-Chiranjeevi/usecase4.git', description: 'GitHub repository URL')
        string(name: 'BRANCH', defaultValue: 'main', description: 'Git branch to checkout')
        string(name: 'DEST_USER', defaultValue: 'cdudi', description: 'Destination username')
        string(name: 'DEST_HOST', defaultValue: '10.128.0.28', description: 'Destination host IP')
        string(name: 'DEST_PATH', defaultValue: '/home/cdudi/', description: 'Destination path on remote host')
        string(name: 'FILE_NAME', defaultValue: 'data.csv', description: 'File to transfer')
    }

    environment {
        LOG_FILE = 'logs/transfer.log'
    }

    stages {
        stage('Clone GitHub Repo') {
            steps {
                script {
                    sh '''
                    mkdir -p logs
                    echo "===== Clone GitHub Repo Stage =====" >> ${LOG_FILE}
                    git_output=$(git clone -b "${BRANCH}" "${GIT_REPO}" 2>&1)
                    echo "$git_output" >> ${LOG_FILE}
                    echo "Git clone completed at $(date)" >> ${LOG_FILE}
                    '''
                }
            }
        }

        stage('Transfer CSV File') {
            steps {
                script {
                    sh '''
                    echo "===== Transfer CSV File Stage =====" >> ${LOG_FILE}
                    pwsh_output=$(pwsh -Command "& { ./transfer.ps1 -DestinationUser \\"${DEST_USER}\\" -DestinationHost \\"${DEST_HOST}\\" -CsvFilePath \\"${FILE_NAME}\\" -TargetPath \\"${DEST_PATH}\\" }" 2>&1)
                    echo "$pwsh_output" >> ${LOG_FILE}
                    echo "Transfer completed at $(date)" >> ${LOG_FILE}
                    '''
                }
            }
        }
    }

    post {
        always {
            script {
                def logFile = "${LOG_FILE}"
                if (fileExists(logFile)) {
                    archiveArtifacts artifacts: logFile, fingerprint: true

                    emailext(
                        subject: "${currentBuild.currentResult}: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]'",
                        body: """<p>Job ${currentBuild.currentResult}.</p>
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
