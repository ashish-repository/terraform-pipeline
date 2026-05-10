pipeline {
    agent any

    parameters {

        booleanParam(
            name: 'autoApprove',
            defaultValue: false,
            description: 'Automatically approve Terraform apply'
        )

        choice(
            name: 'action',
            choices: ['apply', 'destroy'],
            description: 'Choose Terraform action'
        )
    }

    environment {
        AWS_ACCESS_KEY_ID     = credentials('aws-access-key-id')
        AWS_SECRET_ACCESS_KEY = credentials('aws-secret-access-key')
        AWS_DEFAULT_REGION    = 'us-east-1'
    }

    stages {

        stage('Checkout') {
            steps {

                git branch: 'main',
                url: 'https://github.com/YOUR_GITHUB_USERNAME/YOUR_REPO.git'

            }
        }

        stage('Terraform Init') {
            steps {
                sh 'terraform init'
            }
        }

        stage('Terraform Format Check') {
            steps {
                sh 'terraform fmt -check'
            }
        }

        stage('Terraform Validate') {
            steps {
                sh 'terraform validate'
            }
        }

        stage('Terraform Plan') {
            steps {
                sh 'terraform plan -out=tfplan'
                sh 'terraform show -no-color tfplan > tfplan.txt'
            }
        }

        stage('Approval') {

            when {
                expression {
                    return params.action == 'apply' && !params.autoApprove
                }
            }

            steps {

                script {

                    def plan = readFile('tfplan.txt')

                    input(
                        message: 'Approve Terraform Apply?',
                        parameters: [

                            text(
                                name: 'Terraform Plan',
                                defaultValue: plan,
                                description: 'Review Terraform Plan'
                            )
                        ]
                    )
                }
            }
        }

        stage('Terraform Apply / Destroy') {

            steps {

                script {

                    if (params.action == 'apply') {

                        sh 'terraform apply -input=false tfplan'

                    } else if (params.action == 'destroy') {

                        sh 'terraform destroy -auto-approve'

                    } else {

                        error "Invalid action selected"

                    }
                }
            }
        }
    }

    post {

        success {
            echo 'Terraform deployment completed successfully!'
        }

        failure {
            echo 'Terraform deployment failed!'
        }

        always {
            archiveArtifacts artifacts: 'tfplan.txt', onlyIfSuccessful: false
        }
    }
}