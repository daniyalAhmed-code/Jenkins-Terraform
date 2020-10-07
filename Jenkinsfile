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
          sh 'terraform init'
          sh 'terraform plan -out'
        }      
      }
      }
      stage('Approval') {
        steps {
          script {
            def userInput = input(id: 'confirm', message: 'Apply Terraform?', parameters: [ [$class: 'BooleanParameterDefinition', defaultValue: false, description: 'Apply terraform', name: 'confirm'] ])
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
  