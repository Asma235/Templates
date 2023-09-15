pipeline {
    agent {
        dockerfile {
            reuseNode true
            filename 'Dockerfile'
            //dir 'templates/terraform' // Change the directory to match your Terraform project directory
            args '--entrypoint=\'\' -v ${WORKSPACE}:/templates'
        }
    }
    stages {
        stage('Run Terraform') {
            steps {
                script {
                    withAWS(credentials: 'my-aws-credentials', region: 'ap-southeast-1') {
                        dir('templates/terraform') {
                            // Initialize and apply Terraform
                            sh """
                                terraform init
                                terraform apply -auto-approve
                            """
                        }
                    }
                }
            }
        }
    }
}
