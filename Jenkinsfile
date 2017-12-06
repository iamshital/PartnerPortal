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
				
                powershell script: '.\\PowerShell\\Accept-VHD.ps1'
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
            parallel {
				if (env.BootValidation == "True") {
					stage('BootValidation') {
						agent {
							label "master"
						}
						steps {
							echo "Hello ${CC}"
						}
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
			failFast false
        }	       
    }
	post {
		always {
			echo "VM Size Validation."
		}
		failure {
			echo "Final Build Failed."
		}
	}		
}