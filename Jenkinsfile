pipeline {
  agent 'master'
  stages {
    stage('CopyVHDtoQueue') {
      steps {
        powershell(script: 'Write-Host "CopyVDHDtoQueue"', returnStatus: true, returnStdout: true)
      }
    }
  }
}