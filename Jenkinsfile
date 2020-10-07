pipeline {
    agent {label 'master'}  
    tools {terraform "Terraform"}
     environment {
        AWS_ACCESS_KEY_ID     = credentials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
        TF_IN_AUTOMATION      = '1'
    }
    stages {
      stage('TF Init&Plan') {
        steps {
          sh 'terraform init -input=false'
          sh 'terraform plan'
        }      
      }

    stage('TF Apply') {
        steps {
          sh 'terraform apply -input=false'
        }
      }
    } 
  }