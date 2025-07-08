@Library('Jenkins-shared-library-v2') _  // make sure library name is correct

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
                    buildJar()  // your existing function to build jar
                }
            }
        }

        stage("docker login") {
            steps {
                script {
                    dockerLogin()  // from shared library to login docker
                }
            }
        }

        stage("build image") {
            steps {
                script {
                    dockerBuild(IMAGE_NAME)  // build docker image with tag
                }
            }
        }

        stage("push image") {
            steps {
                script {
                    dockerPush(IMAGE_NAME)  // push the image to registry
                }
            }
        }

        stage("deploy") {
            steps {
                script {
                    deployApp()  // your deploy step
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
