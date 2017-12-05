pipeline {
    agent any

    stages {
        stage('CopyVHDtoQueue') {
            steps {
                powershell returnStatus: true, script: 'Write-Host "Copying VHD.."'
            }
        }
        stage('ProcessVHD') {
            steps {
                powershell returnStatus: true, script: 'Write-Host "Processing VHD.."'
            }
        }
        stage('UploadVHD') {
            steps {
                powershell returnStatus: true, script: 'Write-Host "Uploading VHD.."'
            }
        }
        stage('ValidationTests') {
            steps {
                powershell returnStatus: true, script: 'Write-Host "Running Tests.."'
            }
        }
    }
}