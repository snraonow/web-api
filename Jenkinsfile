def buildNumber = "${env.BUILD_NUMBER}"
def isSnDevopsEnabled = false
def isSnDevopsConfigEnabled = true

def app     
def appName='PaymentDemo'
def snapName=''
def deployableName = 'PROD-US'
def setYamlUpload = true

// Json Example
def configFilePath = "paymentService"
def exportFormat ='json'

// Yaml Example
if(setYamlUpload){
      exportFormat ='yaml'
      configFilePath = "k8s/helm/values"
}

def fileNamePrefix ='exported_file_'
def fullFileName="${fileNamePrefix}-${deployableName}-${currentBuild.number}.${exportFormat}"
def changeSetId=""
def componentName="paymentService-v1.1"
def collectionName="release-1.0"
def snapshotName=""
def exporterName ='k8s-exporter' 
def exporterArgs = '{"component": "' + componentName + '", "collection": "' + collectionName + '", "deployable": "' + deployableName + '"}'
def dockerImageName = "santoshnrao/web-app"
def dockerImageTag=""

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
   when { isSnDevopsConfigEnabled true  }
   steps{
           sh "echo validating configuration file ${configFilePath}.${exportFormat}"
            changeSetId = snDevOpsConfigUpload(applicationName:"${appName}",target:'component',namePath:"${componentName}", fileName:"${configFilePath}", autoCommit:'true',autoValidate:'true',dataFormat:"${exportFormat}")
            echo "validation result $changeSetId"
            
              echo "Change set registration for ${changeSetId}"
              changeSetRegResult = snDevOpsConfigRegisterChangeSet(changesetId:"${changeSetId}")
              echo "change set registration set result ${changeSetRegResult}"
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
