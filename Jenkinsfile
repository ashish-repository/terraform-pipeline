pipeline {
    agent any

    parameters {
        choice(
            name: 'action',
            choices: ['apply', 'destroy'],
            description: 'Terraform action to perform'
        )
    }

    stages {
        stage('Checkout Git Repo') {
            steps {
                checkout scmGit(
                    branches: [[name: '*/main']],
                    extensions: [],
                    userRemoteConfigs: [[
                        url: 'https://github.com/ashish-repository/terraform-pipeline.git'
                    ]]
                )
            }
        }

        stage('Terraform Init') {
            steps {
                sh 'terraform init -upgrade'
            }
        }

        stage('Terraform Validate') {
            steps {
                sh 'terraform validate'
            }
        }

        stage('Terraform Plan') {
            steps {
                sh 'terraform plan'
            }
        }

        stage('Terraform Action') {
            steps {
                script {
                    echo "Terraform action is --> ${params.action}"

                    if (params.action == 'apply') {
                        sh 'terraform apply -auto-approve'
                    } else if (params.action == 'destroy') {
                        sh 'terraform destroy -auto-approve'
                    } else {
                        error 'Invalid action selected'
                    }
                }
            }
        }
    }

    post {
        success {
            echo 'Pipeline executed successfully'
        }

        failure {
            echo 'Pipeline failed'
        }
    }
}
