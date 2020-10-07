pipeline {
    agent {label 'master'}  
    tools {terraform "Terraform"}
    stages {
      stage('TF Init&Plan') {
        steps {
        withCredentials([[
            $class: 'AmazonWebServicesCredentialsBinding',
            credentialsId: 'aws_credentials',
            accessKeyVariable: 'AWS_ACCESS_KEY_ID',
            secretKeyVariable: 'AWS_SECRET_ACCESS_KEY'
        ]]) {
            sh 'AWS_ACCESS_KEY_ID=${AWS_ACCESS_KEY_ID} AWS_SECRET_ACCESS_KEY=${AWS_SECRET_ACCESS_KEY} AWS_DEFAULT_REGION=us-east-2'

        }
        
        }      
      }

    stage('TF Apply') {
        steps {
          sh 'terraform apply -input=false'
        }
      }
    } 
  }