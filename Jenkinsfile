pipeline {
    agent {label 'master'}  
    tools {terraform "Terraform"}
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