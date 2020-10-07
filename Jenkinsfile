  pipeline {
    agent { label "master"}
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
          sh 'terraform init -input=false'
          sh 'terraform plan -out=tfplan -input=false'
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
        ]])
          {sh 'terraform apply -input=false'
        }
        }
      }
    } 
  }
  