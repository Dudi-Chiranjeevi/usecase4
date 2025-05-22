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
    }
