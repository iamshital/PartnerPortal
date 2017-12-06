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
				
                //powershell script: '.\\PowerShell\\Accept-VHD.ps1'
				powershell returnStatus: true, script: 'Write-Host "Copying VHD.."'
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
				echo "${VMSizeValidation}"
            }
        }
        stage('Validation') {		
				parallel {
					stage('BootValidation') {
						agent {
							label "master"
						}
						when {
							// Only say hello if a "greeting" is requested
							expression { params.BootValidation == 'True' }
						}						
						steps {
							echo "Hello ${CC}"
						}
					}
                stage('Different VM sizes') {
                    agent {
                        label "master"
                    }
					when {
						// Only say hello if a "greeting" is requested
						expression { params.VMSizeValidation == 'True' }
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