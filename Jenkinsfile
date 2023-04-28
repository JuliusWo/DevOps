pipeline {
    agent any
    environment {
        DOCKERHUB_USERNAME = 'dasjulow'
        DOCKERHUB_PASSWORD = 'Suiluj1998'
        IMAGE_NAME = 'devops_cw'
    }
    stages {
        stage('Checkout code') {
            steps {
                git 'https://github.com/JuliusWo/DevOps.git'
            }
        }
        stage('Build Docker image') {
            steps {
                script {
                    docker.build("${IMAGE_NAME}")
                }
            }
        }
        stage('Test container') {
            steps {
                script {
                    def container = docker.run("${IMAGE_NAME}")
                    sh 'sleep 5'
                    def running = container.inspect().State.Running
                    if (running) {
                        echo 'Container is running'
                        container.stop()
                    } else {
                        error 'Container is not running'
                    }
                }
            }
        }
        stage('Push Docker image') {
            steps {
                script {
                    docker.withRegistry('https://index.docker.io/v1/', 'dockerhub_id') {
                        docker.image("${IMAGE_NAME}").push('latest')
                    }
                }
            }
        }
    }
}

