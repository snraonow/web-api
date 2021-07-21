def buildNumber = "${env.BUILD_NUMBER}"
pipeline {
 agent any
 tools {
    	maven 'Maven'
 }
 stages {
  stage("Checkout"){
   agent any
   steps{
     checkout scm
   }
  }
  
  stage("Tests") {
   agent any
   steps {
    checkout scm
    sh 'mvn clean test'
    step([$class: 'Publisher', reportFilenamePattern: '**/testng-results.xml'])
   // writeFile file: 'testng-results.xml', text: '{\"name\":\"com.slokam.automation.opencart.testscripts - 44\",\"passedTests\":4,\"failedTests\":0,\"skippedTests\":0,\"blockedTests\":0,\"totalTests\":4,\"startTime\":\"2020-10-26T02:37:57.485Z\",\"finishTime\":\"2020-10-26T02:37:57.489Z\",\"duration\":0.004,\"buildNumber\":52,\"stage\":\"Tests\",\"pipelineName\":\"ScriptedPipelineVK\",\"passingPercent\":100,\"jenkinsUrl\":\"jenkins",\"branch\":\"\",\"isMultiBranch\":\"false\"}'
   // writeFile file: 'testng-results.xml', text: '{"name":"com.slokam.automation.opencart.testscripts - 55","passedTests":4,"failedTests":0,"skippedTests":0,"blockedTests":0,"totalTests":4,"startTime":"2020-10-27T04:20:30.124Z","finishTime":"2020-10-27T04:20:30.137Z","duration":0.013,"buildNumber":"${buildNumber}","stageName":"Tests","pipelineName":"ScriptedTestPipeline","passingPercent":100,"url":"http://MSJC7FBCA825.local:3000/jenkins/job/ScriptedTestPipeline/${buildNumber}/testReport/com.slokam.automation.opencart.testscripts","branch":"","isMultiBranch":"false"}'
   //sleep 10
   }
  }
  stage('Deploy'){
   agent any
   steps{
     echo "Deploying"
     checkout scm
     //bzt "load_test1.yml"
     //junit '**/xunit.xml'
    //sh 'mvn clean test'
    writeFile file: 'aggregate-results-3.xml', text: '<?xml version="1.0" encoding="UTF-8"?><FinalStatus><TestDuration>60.0</TestDuration><Group label="http://localhost:8089/"><throughput value="104"><name>throughput</name><value>104</value></throughput><concurrency value="1"><name>concurrency</name><value>1</value></concurrency><succ value="104"><name>succ</name><value>104</value></succ><fail value="0"><name>fail</name><value>0</value></fail><avg_rt value="0.06435"><name>avg_rt</name><value>0.06435</value></avg_rt><stdev_rt value="0.03491"><name>stdev_rt</name><value>0.03491</value></stdev_rt><avg_lt value="0.01359"><name>avg_lt</name><value>0.01359</value></avg_lt><avg_ct value="0.00088"><name>avg_ct</name><value>0.00088</value></avg_ct><bytes value="156896844"><name>bytes</name><value>156896844</value></bytes><rc value="104" param="200"><name>rc/200</name><value>104</value></rc><perc value="0.04400" param="0.0"><name>perc/0.0</name><value>0.04400</value></perc><perc value="0.05800" param="50.0"><name>perc/50.0</name><value>0.05800</value></perc><perc value="0.08300" param="90.0"><name>perc/90.0</name><value>0.08300</value></perc><perc value="0.10300" param="95.0"><name>perc/95.0</name><value>0.10300</value></perc><perc value="0.12400" param="99.0"><name>perc/99.0</name><value>0.12400</value></perc><perc value="0.38100" param="99.9"><name>perc/99.9</name><value>0.38100</value></perc><perc value="0.38100" param="100.0"><name>perc/100.0</name><value>0.38100</value></perc></Group><Group label=""><throughput value="170"><name>throughput</name><value>170</value></throughput><concurrency value="2"><name>concurrency</name><value>2</value></concurrency><succ value="170"><name>succ</name><value>170</value></succ><fail value="0"><name>fail</name><value>0</value></fail><avg_rt value="0.20195"><name>avg_rt</name><value>0.20195</value></avg_rt><stdev_rt value="0.22618"><name>stdev_rt</name><value>0.22618</value></stdev_rt><avg_lt value="0.02789"><name>avg_lt</name><value>0.02789</value></avg_lt><avg_ct value="0.00098"><name>avg_ct</name><value>0.00098</value></avg_ct><bytes value="365675109"><name>bytes</name><value>365675109</value></bytes><rc value="170" param="200"><name>rc/200</name><value>170</value></rc><perc value="0.04400" param="0.0"><name>perc/0.0</name><value>0.04400</value></perc><perc value="0.07000" param="50.0"><name>perc/50.0</name><value>0.07000</value></perc><perc value="0.41700" param="90.0"><name>perc/90.0</name><value>0.41700</value></perc><perc value="0.48100" param="95.0"><name>perc/95.0</name><value>0.48100</value></perc><perc value="0.71200" param="99.0"><name>perc/99.0</name><value>0.71200</value></perc><perc value="2.12800" param="99.9"><name>perc/99.9</name><value>2.12800</value></perc><perc value="2.12800" param="100.0"><name>perc/100.0</name><value>2.12800</value></perc></Group><Group label="http://localhost:8080/"><throughput value="66"><name>throughput</name><value>66</value></throughput><concurrency value="1"><name>concurrency</name><value>1</value></concurrency><succ value="66"><name>succ</name><value>66</value></succ><fail value="0"><name>fail</name><value>0</value></fail><avg_rt value="0.41877"><name>avg_rt</name><value>0.41877</value></avg_rt><stdev_rt value="0.23020"><name>stdev_rt</name><value>0.23020</value></stdev_rt><avg_lt value="0.05044"><name>avg_lt</name><value>0.05044</value></avg_lt><avg_ct value="0.00112"><name>avg_ct</name><value>0.00112</value></avg_ct><bytes value="208778265"><name>bytes</name><value>208778265</value></bytes><rc value="66" param="200"><name>rc/200</name><value>66</value></rc><perc value="0.27700" param="0.0"><name>perc/0.0</name><value>0.27700</value></perc><perc value="0.36900" param="50.0"><name>perc/50.0</name><value>0.36900</value></perc><perc value="0.52600" param="90.0"><name>perc/90.0</name><value>0.52600</value></perc><perc value="0.63600" param="95.0"><name>perc/95.0</name><value>0.63600</value></perc><perc value="2.12800" param="99.0"><name>perc/99.0</name><value>2.12800</value></perc><perc value="2.12800" param="99.9"><name>perc/99.9</name><value>2.12800</value></perc><perc value="2.12800" param="100.0"><name>perc/100.0</name><value>2.12800</value></perc></Group></FinalStatus>'
    //writeFile file: 'unitReport.xml', text: '{"name":"(root).com - 177","passedTests":1,"failedTests":0,"skippedTests":0,"blockedTests":0,"totalTests":1,"startTime":"2020-10-23T07:11:29.379Z","finishTime":"2020-10-23T07:11:29.379Z","duration":0,"buildNumber":17,"stageName":"Deploy","pipelineName":"ScriptedPipeline_Tst_Vk","passingPercent":100,"url":"http://jenkins5.sndevops.xyz/job/ScriptedPipeline_Tst_Vk/17/testReport/(root)","branch":"","isMultiBranch":"false"}'
    //junit '**/unitReport.xml'  
//     snDevOpsChange()
   }
  }
 }
}