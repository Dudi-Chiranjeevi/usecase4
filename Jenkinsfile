// pipeline {
//     agent any

//     parameters {
//         string(name: 'GIT_REPO', defaultValue: 'https://github.com/Dudi-Chiranjeevi/usecase4.git', description: 'GitHub repository URL')
//         string(name: 'BRANCH', defaultValue: 'main', description: 'Git branch to checkout')
//         string(name: 'DEST_USER', defaultValue: 'cdudi', description: 'Destination username')
//         string(name: 'DEST_HOST1', defaultValue: '10.128.0.28', description: 'Destination host 1 IP')
//         string(name: 'DEST_HOST2', defaultValue: '10.128.0.24', description: 'Destination host 2 IP')
//         string(name: 'DEST_PATH', defaultValue: '/home/cdudi/', description: 'Destination path on remote host')
//         string(name: 'FILE_NAME', defaultValue: 'data4.csv', description: 'File to transfer')
//     }

//     environment {
//         LOG_FILE = 'logs/transfer.log'
//     }

//     stages {
//         stage('Checkout SCM') {
//             steps {
//                 checkout scm
//             }
//         }

//         stage('Log Git Status') {
//             steps {
//                 script {
//                     sh """
//                         mkdir -p logs
//                         echo "===== Git Status =====" >> ${LOG_FILE}
//                         git status >> ${LOG_FILE} 2>&1
//                         echo "Git status logged at \$(date)" >> ${LOG_FILE}
//                     """
//                 }
//             }
//         }

//         stage('Transfer CSV File to Multiple Hosts') {
//             steps {
//                 script {
//                     sh """
//                         echo "===== Transfer CSV File to Multiple Hosts =====" >> ${LOG_FILE}
//                         pwsh -NoProfile -Command "\$ErrorActionPreference = 'Stop'; ./transfer.ps1 -DestinationUser '${params.DEST_USER}' -DestinationHosts @('${params.DEST_HOST1}', '${params.DEST_HOST2}') -CsvFilePath '${params.FILE_NAME}' -TargetPath '${params.DEST_PATH}'" >> ${LOG_FILE} 2>&1
//                         echo "Transfer completed at \$(date)" >> ${LOG_FILE}
//                     """
//                 }
//             }
//         }

//     }

//     post {
//         always {
//             script {
//                 def summaryLog = "logs/build_history.log"
//                 def buildInfo = "Build #${env.BUILD_NUMBER} | Status: ${currentBuild.currentResult} | Time: ${new Date().format("yyyy-MM-dd HH:mm:ss")}"

//                 sh "mkdir -p logs"
//                 sh "echo '${buildInfo}' >> ${summaryLog}"

//                 archiveArtifacts artifacts: 'logs/*.log', fingerprint: true

//                 emailext(
//                     subject: "${currentBuild.currentResult}: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]'",
//                     body: """<p>Job ${currentBuild.currentResult}.</p>
// <p>Job: ${env.JOB_NAME}<br/>
// Build Number: ${env.BUILD_NUMBER}<br/>
// <a href='${env.BUILD_URL}'>View Build</a></p>""",
//                     to: 'chiranjeevigen@gmail.com',
//                     from: 'chiranjeevidudi3005@gmail.com',
//                     attachmentsPattern: 'logs/transfer.log'
//                 )
//             }
//         }
//     }
// }


// pipeline {
//     agent any
 
//     parameters {
//         string(name: 'GIT_REPO', defaultValue: 'https://github.com/Dudi-Chiranjeevi/usecase4.git', description: 'GitHub repository URL')
//         string(name: 'BRANCH', defaultValue: 'main', description: 'Git branch to checkout')
//         string(name: 'DEST_USER', defaultValue: 'cdudi', description: 'Destination username')
//         string(name: 'DEST_HOST1', defaultValue: '10.128.0.28', description: 'Destination host IP')
//         string(name: 'DEST_HOST2', defaultValue: '10.128.0.24', description: 'Destination host IP')
//         string(name: 'DEST_PATH', defaultValue: '/home/cdudi/', description: 'Destination path on remote host')
//         string(name: 'FILE_NAME', defaultValue: 'data4.csv', description: 'File to transfer')
//     }
 
//     environment {
//         LOG_FILE = 'logs/transfer.log'
//     }
 
//     stages {
//         stage('Checkout SCM') {
//             steps {
//                 checkout scm
//             }
//         }
 
//         stage('Log Git Status') {
//             steps {
//                 script {
//                     sh """
//                         mkdir -p logs
//                         echo "===== Git Status =====" > ${LOG_FILE}
//                         git status > ${LOG_FILE} 2>&1
//                         echo "Git status logged at \$(date)" > ${LOG_FILE}
//                     """
//                 }
//             }
//         }
 
//         stage('Transfer CSV File') {
//             steps {
//                 script {
//                     sh """
//                         echo "===== Transfer CSV File Stage =====" >> ${LOG_FILE}
//                         pwsh -Command "& { ./transfer.ps1 -DestinationUser '${params.DEST_USER}' -DestinationHosts @('${params.DEST_HOST1}', '${params.DEST_HOST2}') -CsvFilePath '${params.FILE_NAME}' -TargetPath '${params.DEST_PATH}' }" > ${LOG_FILE} 2>&1
//                         echo "Transfer completed at \$(date)" >> ${LOG_FILE}
//                     """
//                 }
//             }
//         }
//     }
 
//     post {
//         always {
//             script {
//                 def summaryLog = "logs/build_history.log"
//                 def buildInfo = "Build #${env.BUILD_NUMBER} | Status: ${currentBuild.currentResult} | Time: ${new Date().format("yyyy-MM-dd HH:mm:ss")}"
 
//                 sh "mkdir -p logs"
//                 sh "echo '${buildInfo}' > ${summaryLog}"
 
//                 archiveArtifacts artifacts: 'logs/*.log', fingerprint: true
 
//                 emailext(
//                     subject: "${currentBuild.currentResult}: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]'",
//                     body: """<p>Job ${currentBuild.currentResult}.</p>
// <p>Job: ${env.JOB_NAME}<br/>
// Build Number: ${env.BUILD_NUMBER}<br/>
// <a href='${env.BUILD_URL}'>View Build</a></p>""",
//                     to: 'chiranjeevigen@gmail.com',
//                     from: 'chiranjeevidudi3005@gmail.com',
//                     attachmentsPattern: 'logs/transfer.log'
//                 )
//             }
//         }
//     }
// }

// pipeline {
//     agent any

//     parameters {
//         string(name: 'GIT_REPO', defaultValue: 'https://github.com/Dudi-Chiranjeevi/usecase4.git', description: 'GitHub repository URL')
//         string(name: 'BRANCH', defaultValue: 'main', description: 'Git branch to checkout')
//         string(name: 'DEST_USER', defaultValue: 'cdudi', description: 'Destination username')
//         string(name: 'DEST_HOST1', defaultValue: '10.128.0.28', description: 'Destination host 1 IP')
//         string(name: 'DEST_HOST2', defaultValue: '10.128.0.24', description: 'Destination host 2 IP')
//         string(name: 'DEST_PATH', defaultValue: '/home/cdudi/', description: 'Destination path on remote host')
//         string(name: 'FILE_NAME', defaultValue: './data4.csv', description: 'File to transfer')
//     }

//     environment {
//         LOG_FILE = 'logs/transfer.log'
//     }

//     stages {

//         stage('Checkout SCM') {
//             steps {
//                 git branch: "${params.BRANCH}", url: "${params.GIT_REPO}"
//             }
//         }

//         stage('Log Git Status') {
//             steps {
//                 script {
//                     sh '''
//                         mkdir -p logs
//                         echo "===== Git Status =====" >> ${LOG_FILE}
//                         git status >> ${LOG_FILE} 2>&1
//                         echo "Git status logged at $(date)" >> ${LOG_FILE}
//                     '''
//                 }
//             }
//         }

//         stage('Transfer CSV File to Hosts') {
//             parallel {
//                 stage('Transfer to DEST_HOST1') {
//                     steps {
//                         script {
//                             sh """
//                                 echo "===== Transfer to ${params.DEST_HOST1} =====" >> ${LOG_FILE}
//                                 pwsh -Command "& { ./transfer.ps1 -DestinationUser '${params.DEST_USER}' -DestinationHosts '${params.DEST_HOST1}' -CsvFilePath '${params.FILE_NAME}' -TargetPath '${params.DEST_PATH}' }" >> ${LOG_FILE} 2>&1
//                                 echo "Transfer to ${params.DEST_HOST1} completed at \$(date)" >> ${LOG_FILE}
//                             """
//                         }
//                     }
//                 }

//                 stage('Transfer to DEST_HOST2') {
//                     steps {
//                         script {
//                             sh """
//                                 echo "===== Transfer to ${params.DEST_HOST2} =====" >> ${LOG_FILE}
//                                 pwsh -Command "& { ./transfer.ps1 -DestinationUser '${params.DEST_USER}' -DestinationHosts '${params.DEST_HOST2}' -CsvFilePath '${params.FILE_NAME}' -TargetPath '${params.DEST_PATH}' }" >> ${LOG_FILE} 2>&1
//                                 echo "Transfer to ${params.DEST_HOST2} completed at \$(date)" >> ${LOG_FILE}
//                             """
//                         }
//                     }
//                 }
//             }
//         }
//     }

//     post {
//         always {
//             script {
//                 def summaryLog = "logs/build_history.log"
//                 def buildInfo = "Build #${env.BUILD_NUMBER} | Status: ${currentBuild.currentResult} | Time: ${new Date().format("yyyy-MM-dd HH:mm:ss")}"

//                 sh '''
//                     mkdir -p logs
//                     echo '${buildInfo}' >> logs/build_history.log
//                 '''

//                 archiveArtifacts artifacts: 'logs/*.log', fingerprint: true

//                 emailext(
//                     subject: "${currentBuild.currentResult}: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]'",
//                     body: """<p>Job ${currentBuild.currentResult}.</p>
// <p>Job: ${env.JOB_NAME}<br/>
// Build Number: ${env.BUILD_NUMBER}<br/>
// <a href='${env.BUILD_URL}'>View Build</a></p>""",
//                     to: 'chiranjeevigen@gmail.com',
//                     from: 'chiranjeevidudi3005@gmail.com',
//                     attachmentsPattern: 'logs/transfer.log'
//                 )
//             }
//         }
//     }
// }

pipeline {
    agent any

    parameters {
        string(name: 'GIT_REPO', defaultValue: 'https://github.com/Dudi-Chiranjeevi/usecase4.git', description: 'GitHub repository URL')
        string(name: 'BRANCH', defaultValue: 'main', description: 'Git branch to checkout')
        string(name: 'DEST_USER', defaultValue: 'cdudi', description: 'Destination username')
        string(name: 'DEST_HOST', defaultValue: '10.128.0.28', description: 'Destination host IP')
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

        stage('Transfer CSV File') {
            steps {
                script {
                    sh """
                        echo "===== Transfer CSV File Stage =====" >> ${LOG_FILE}
                        pwsh -Command "& { ./transfer.ps1 -DestinationUser '${params.DEST_USER}' -DestinationHost '${params.DEST_HOST}' -CsvFilePath '${params.FILE_NAME}' -TargetPath '${params.DEST_PATH}' }" >> ${LOG_FILE} 2>&1
                        echo "Transfer completed at \$(date)" >> ${LOG_FILE}
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