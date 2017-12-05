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
		
			parallel BootValidation: 
			{
				steps {
					powershell returnStatus: true, script: 'Write-Host "Boot Validation"'
				}
			
			}, VMSizesValiddation: {
				steps {
					powershell returnStatus: true, script: 'Write-Host "VM sizes validation.."'
				}
			failFast: true|false		
			}
		}
        
    }
}