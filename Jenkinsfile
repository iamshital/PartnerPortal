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
        stage('UploadVHD') {
            steps {
                echo 'Deploying....'
            }
        }
        stage('ValidationTests') {
            steps {
                echo 'Testing..'
            }
        }
    }
}