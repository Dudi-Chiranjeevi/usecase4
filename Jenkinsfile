pipeline {
    agent any

    environment {
        GIT_REPO = 'https://github.com/Dudi-Chiranjeevi/usecase4.git'
        BRANCH = 'main'
        DEST_USER = 'cdudi'
        DEST_HOST = '35.225.255.73'
        DEST_PATH = '/home/cdudi'
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
                    def psScript = """
                    powershell -File transfer.ps1 `
                      -DestinationUser ${env.DEST_USER} `
                      -DestinationHost ${env.DEST_HOST} `
                      -CsvFilePath ${env.FILE_NAME} `
                      -TargetPath ${env.DEST_PATH}
                    """
                    sh psScript
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
