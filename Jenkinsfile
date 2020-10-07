pipeline {
    agent {
      node {
        label "master"
      } 
    }

    stages {
      stage('TF Init&Plan') {
        steps {
         bat "${tool name: 'Terraform', type: 'com.cloudbees.jenkins.plugins.customtools.CustomTool'}\terraform --version"
          sh 'terraform init'
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