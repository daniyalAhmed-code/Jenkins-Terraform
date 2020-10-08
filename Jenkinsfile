pipeline {
    agent {label 'ssh-slave'}  
    tools {terraform "Terraform"}
    stages {
      stage('fetch_latest_code') {
        steps {
          git url: 'https://github.com/daniyalAhmed-code/Jenkins-Declarative/tree/develop'
        }
      }

      stage('TF Init&Plan') {
        steps {
        withCredentials([[
            $class: 'AmazonWebServicesCredentialsBinding',
            credentialsId: 'aws_credentials',
            accessKeyVariable: 'AWS_ACCESS_KEY_ID',
            secretKeyVariable: 'AWS_SECRET_ACCESS_KEY'
        ]]) {
            sh 'terraform init'
            sh 'terraform plan -input=false -var-file=config/dev.tfvars -lock=false'
        }
        
        }      
      }

    stage('TF Apply') {
        steps {
          withCredentials([[
            $class: 'AmazonWebServicesCredentialsBinding',
            credentialsId: 'aws_credentials',
            accessKeyVariable: 'AWS_ACCESS_KEY_ID',
            secretKeyVariable: 'AWS_SECRET_ACCESS_KEY'
        ]]) {
          sh 'terraform apply -input=false -auto-approve -var-file=config/dev.tfvars -lock=false'
        }
      }
    } 
  }
}  
