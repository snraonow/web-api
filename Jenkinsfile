def buildNumber = "${env.BUILD_NUMBER}"
def isSnDevopsEnabled = false
pipeline {
 agent any
 tools {
    	maven 'maven'
 }
 stages {
  stage("Checkout"){

      agent any
   
   steps{
    
    script {
       if( env.ENABLE_SN_DEVOPS  == true ){
        echo " ServiceNow Devops Is not enabled"
        isSnDevopsEnabled = true
      }
    }
     checkout scm
   }
  }
  
  stage("Unit Tests") {
   agent any
   steps {
    checkout scm
    sh 'mvn clean verify'
   }
  }
  
  stage("Config Validation"){
   agent any
   when { isSnDevopsEnabled true  }
   steps{
    echo "snDevops is enabled"
   }

  }
  
  stage('Deploy'){
   agent any
   steps{
     echo "Deploying"
     checkout scm
     if(isSnDevopsEnabled){
      snDevOpsChange()
     }
   }
  }
 }
}
