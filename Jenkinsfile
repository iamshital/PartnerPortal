pipeline {
    agent any

    stages {
        stage('CopyVHDtoQueue') {
            steps {
                echo 'Building..'
            }
        }
        stage('ProcessVHD') {
            steps {
                echo 'Testing..'
            }
        }
        stage('UploadVHDtoAzure') {
            steps {
                echo 'Deploying....'
            }
        stage('Validation') {
            steps {
                echo 'Deploying....'
            }			
        }
    }
}