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

		  stage "Stage Parallel"
		  def branches = [:]
		  for (int i = 0; i < 5; i++) {
			def index = i
			branches["split${i}"] = {
			  stage "Stage parallel- #"+index
			  node('remote') {
			   echo  'Starting sleep'
			   sleep 10
			   echo  'Finished sleep'
			  }
			}
		  }
		  parallel branches
  
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