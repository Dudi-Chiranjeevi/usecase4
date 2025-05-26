pipeline {
    agent any

    parameters {
        string(name: 'GIT_REPO', defaultValue: 'https://github.com/Dudi-Chiranjeevi/usecase4.git', description: 'Git repository URL')
        string(name: 'BRANCH', defaultValue: 'main', description: 'Branch to clone')
        string(name: 'DEST_USER', defaultValue: 'cdudi', description: 'Destination VM username')
        string(name: 'DEST_HOST', defaultValue: '10.128.0.28', description: 'Destination VM host/IP')
        string(name: 'DEST_PATH', defaultValue: '/home/cdudi/', description: 'Path on destination VM to copy the file')
        string(name: 'FILE_NAME', defaultValue: 'data.csv', description: 'Name of the CSV file to transfer')
    }

    environment {
        LOG_FILE = 'logs/transfer.log'
    }

    stages {
        stage('Clone GitHub Repo') {
            steps {
                git branch: "${params.BRANCH}", url: "${params.GIT_REPO}"
            }
        }

        stage('Transfer CSV File') {
            steps {
                sh """
                pwsh -Command "& { ./transfer.ps1 -DestinationUser \\"${params.DEST_USER}\\" -DestinationHost \\"${params.DEST_HOST}\\" -CsvFilePath \\"${params.FILE_NAME}\\" -TargetPath \\"${params.DEST_PATH}\\" }"

                mkdir -p logs
                echo "Transfer completed at \$(date)" > ${env.LOG_FILE}
                """
            }
        }
    }

    post {
        success {
            script {
                if (fileExists(env.LOG_FILE)) {
                    archiveArtifacts artifacts: env.LOG_FILE, fingerprint: true

                    emailext(
                        subject: "SUCCESS: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]'",
                        body: """<p>Job succeeded.</p>
<p>Job: ${env.JOB_NAME}<br/>
Build Number: ${env.BUILD_NUMBER}<br/>
<a href='${env.BUILD_URL}'>View Build</a></p>""",
                        to: 'chiranjeevigen@gmail.com',
                        from: 'chiranjeevidudi3005@gmail.com',
                        attachmentsPattern: env.LOG_FILE
                    )
                } else {
                    echo "No log file found to attach."
                }
            }
        }

        failure {
            script {
                if (fileExists(env.LOG_FILE)) {
                    archiveArtifacts artifacts: env.LOG_FILE, fingerprint: true

                    emailext(
                        subject: "FAILURE: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]'",
                        body: """<p>Job failed.</p>
<p>Job: ${env.JOB_NAME}<br/>
Build Number: ${env.BUILD_NUMBER}<br/>
<a href='${env.BUILD_URL}'>View Build</a></p>""",
                        to: 'chiranjeevigen@gmail.com',
                        from: 'chiranjeevidudi3005@gmail.com',
                        attachmentsPattern: env.LOG_FILE
                    )
                } else {
                    echo "No log file found to attach."
                }
            }
        }
    }
}
