pipeline {
	agent {
		label "master"
	}    
    environment { 
        CC = 'clang'
    }
    parameters {
        string(name: 'Greeting', defaultValue: 'Hello', description: 'How should I greet the world?')
    }	
    stages {
        stage('Inspect File') {
            steps {
                powershell returnStatus: true, script: 'Write-Host "Cheking the File."'
            }
        }
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
			failFast true		
            parallel {
                stage('BootValidation') {
                    agent {
                        label "master"
                    }
                    steps {
                        echo "Hello ${CC}"
                    }
                }
                stage('Different VM sizes') {
                    agent {
                        label "master"
                    }
                    steps {
                        echo "VM Size Validation."
                    }
                }
            }			
        }	       
    }
	post {
		always {
			echo "VM Size Validation."
		}
		failure {
			echo "Failed."
		}
	}		
}