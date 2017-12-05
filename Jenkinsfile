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
        stage('Validation') {
			parallel linux: {
				node('master') {
					checkout scm
					try {
						powershell returnStatus: true, script: 'Write-Host "Testing Started.."'
					}
					finally {
						powershell returnStatus: true, script: 'Write-Host "Testing Done.."'
					}
				}
			},
			windows: {
				node('master') {
					powershell returnStatus: true, script: 'Write-Host "Testing Done.."'
				}
			}		
        }
		        
    }
}