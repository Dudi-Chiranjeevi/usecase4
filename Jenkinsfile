pipeline {
    agent any

    environment {
        GIT_REPO = 'https://github.com/Dudi-Chiranjeevi/usecase4.git'
        BRANCH = 'main'
        DEST_USER = 'cdudi'
        DEST_HOST = '35.225.255.73'
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
                '''
            }
        }

        post {
        success {
            archiveArtifacts artifacts: 'logs/*.log', fingerprint: true
 
            emailext(
                subject: "SUCCESS: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]'",
                body: """
                        Job succeeded.
 
                        Job: ${env.JOB_NAME}
                        Build Number: ${env.BUILD_NUMBER}
                        Check console output at: ${env.BUILD_URL}
                    """,
                to: 'chiranjeevigen@gmail.com',
                from: 'chiranjeevidudi3005@gmail.com'
            )
        }
 
        failure {
            archiveArtifacts artifacts: 'logs/*.log', fingerprint: true
 
            emailext(
                subject: "FAILURE: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]'",
                body: """
                        Job failed.
 
                        Job: ${env.JOB_NAME}
                        Build Number: ${env.BUILD_NUMBER}
                        Check console output at: ${env.BUILD_URL}
                    """,
                to: 'chiranjeevigen@gmail.com',
                from: 'chiranjeevidudi3005@gmail.com'
            )
        }
    }
}
    }
