@Library('Jenkins-shared-library-v2') _

pipeline {
    agent any

    tools {
        maven 'maven-latest'
    }

    environment {
        IMAGE_NAME = "agneypatel/test-repoo:1.7"
    }

    stages {
        stage("build jar") {
            steps {
                script {
                    buildJar()
                }
            }
        }

        stage("docker login") {
            steps {
                script {
                    dockerLogin()
                }
            }
        }

        stage("build image") {
            steps {
                script {
                    buildImage()  // <-- fixed name here
                }
            }
        }

        stage("push image") {
            steps {
                script {
                    dockerPush(IMAGE_NAME)
                }
            }
        }

        stage("deploy") {
            steps {
                script {
                    deployApp()
                }
            }
        }
    }

    post {
        success {
            echo "Pipeline completed successfully!"
        }
        failure {
            echo "Pipeline failed. Check logs above."
        }
    }
}

