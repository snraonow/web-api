#!/bin/bash

STEP_NAME=$1
UPSTREAM_STEP_NAME=$2
# RESULT=$3  #use result to specify status?
RESULT=$3
DATE=$(date +%Y-%m-%d" "%H:%M:%S)
# TOOL_ID=env0
URL=https://$INSTANCE_NAME.service-now.com/api/sn_devops/devops/tool/orchestration
#URL=https://webhook.site/eb4a87b3-6006-4d14-ba01-44c447927db8
#app.env0.com/p/$ENV0_PROJECT_ID/environments/$ENV0_ENVIRONMENT_ID/deployments/$ENV0_DEPLOYMENT_ID#$UPSTREAM_STEP_NAME\

curl -X POST -H "Content-Type: application/json" -u "$USERNAME:$PASSWORD" $URL?toolId=$TOOL_ID -d "{
\"taskExecution\": {
  \"toolId\": \"$TOOL_ID\",
  \"buildNumber\": \"$ENV0_DEPLOYMENT_ID\",
  \"nativeId\": \"$ENV_NAME#$STEP_NAME/$ENV0_DEPLOYMENT_ID\",
  \"name\": \"$ENV_NAME#$STEP_NAME/$ENV0_DEPLOYMENT_ID\",
  \"id\": \"$ENV_NAME#$STEP_NAME/$ENV0_DEPLOYMENT_ID\",
  \"url\": \"app.env0.com/p/$ENV0_PROJECT_ID/environments/$ENV0_ENVIRONMENT_ID/deployments/$ENV0_DEPLOYMENT_ID#$STEP_NAME\",
  \"isMultiBranch\": \"false\",
  \"branchName\": \"$ENV0_DEPLOYMENT_REVISION\",
  \"pipelineExecutionUrl\": \"api.env0.com/p/$ENV0_PROJECT_ID/environments/$ENV0_ENVIRONMENT_ID/deployments/$ENV0_DEPLOYMENT_ID\",
  \"orchestrationTaskUrl\": \"api.env0.com/p/$ENV0_PROJECT_ID/environments/$ENV0_ENVIRONMENT_ID/$STEP_NAME\",
  \"orchestrationTaskName\": \"$ENV_NAME#$STEP_NAME\",
  \"result\": \"$RESULT\",
  \"startDateTime\": \"$DATE\",
  \"upstreamId\": \"$ENV_NAME#$UPSTREAM_STEP_NAME\"
},
\"orchestrationTask\": {
  \"orchestrationTaskURL\": \"api.env0.com/p/$ENV0_PROJECT_ID/environments/$ENV0_ENVIRONMENT_ID/$STEP_NAME\",
  \"orchestrationTaskName\": \"$ENV_NAME#$STEP_NAME\",
  \"branchName\": \"$ENV0_DEPLOYMENT_REVISION\",
  \"toolId\": \"$TOOL_ID\"
}
}"

