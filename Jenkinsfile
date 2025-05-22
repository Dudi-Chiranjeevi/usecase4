pipeline {
    agent any

    environment {
        GIT_REPO = 'https://github.com/Dudi-Chiranjeevi/usecase4.git'
        BRANCH = 'main'
        DEST_USER = 'cdudi'                      // Update with your actual VM2 username
        DEST_HOST = '35.225.255.73'           // Replace with actual VM2 IP
        DEST_PATH = '/home/cdudi/'              // Update as needed
        FILE_NAME = 'data.csv'
    }

    stages {
        stage('Clone GitHub Repo') {
            steps {
                git branch: "${env.BRANCH}", url: "${env.GIT_REPO}"
            }
        }

        stage('Transfer CSV File') {
            steps {
                script {
                    sh """
                        pwsh -File transfer.ps1 `
                            -DestinationUser ${DEST_USER} `
                            -DestinationHost ${DEST_HOST} `
                            -CsvFilePath ${FILE_NAME} `
                            -TargetPath ${DEST_PATH}
                    """
                }
            }
        }
    }

    post {
        success {
            echo '✅ File transfer completed successfully!'
        }
        failure {
            echo '❌ File transfer failed.'
        }
    }
}
