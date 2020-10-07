pipeline {
    agent {label 'master'}  
    tools {terraform "Terraform"}
    stages {
      stage('TF Init&Plan') {
        steps {
          sh 'which terraform'
        }      
      }
    } 
  }