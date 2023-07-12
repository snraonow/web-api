#!/bin/bash

STEP_NAME=$1
UPSTREAM_STEP_NAME=$2
# RESULT=$3  #use result to specify status?
RESULT=$3
DATE=$(date +%Y-%m-%d" "%H:%M:%S)
# TOOL_ID=env0
URL=https://$INSTANCE_NAME.service-now.com/api/sn_devops/devops/tool/orchestration
#URL=https://webhook.site/eb4a87b3-6006-4d14-ba01-44c447927db8
#app.env0.com/p/$ENV0_PROJECT_ID/environments/$ENV0_ENVIRONMENT_ID/deployments/$ENV0_DEPLOYMENT_LOG_ID#$UPSTREAM_STEP_NAME\
# https://docs.env0.com/docs/custom-flows#exposed-env0-system-environment-variables All environment variables

echo "STEP_NAME : $STEP_NAME , UPSTREAM_STEP_NAME : $UPSTREAM_STEP_NAME , RESULT : $RESULT , TOOL_ID : $TOOL_ID "
echo "Webhook notification invoked to $URL $URL?toolId=$TOOL_ID "

PIPELINE_URL=api.env0.com/p/$ENV0_PROJECT_ID/environments/$ENV0_ENVIRONMENT_ID

if [[ -z "$UPSTREAM_STEP_NAME" ]]; then
   # $var is empty, do what you want
   UPSTREAM_ID=''
   UPSTREAM_TASK_URL=''
else
  UPSTREAM_ID=$UPSTREAM_STEP_NAME#$ENV0_DEPLOYMENT_LOG_ID
  UPSTREAM_TASK_URL=$PIPELINE_URL/$UPSTREAM_STEP_NAME/#$ENV0_DEPLOYMENT_LOG_ID
fi


WEBHOOK_DATA="{
  \"taskExecution\": {
    \"toolId\": \"$TOOL_ID\",
    \"buildNumber\": \"$ENV0_DEPLOYMENT_LOG_ID\",
    \"nativeId\": \"$ENV0_DEPLOYMENT_LOG_ID\",
    \"name\": \"$STEP_NAME#$ENV0_DEPLOYMENT_LOG_ID\",
    \"id\": \"$STEP_NAME/$ENV0_DEPLOYMENT_LOG_ID\",
    \"url\": \"$PIPELINE_URL/$STEP_NAME/#$ENV0_DEPLOYMENT_LOG_ID\",
    \"isMultiBranch\": \"false\",
    \"branchName\": \"main\",
    \"pipelineExecutionUrl\": \"$PIPELINE_URL$STEP_NAME/$ENV0_DEPLOYMENT_LOG_ID\",
    \"orchestrationTaskUrl\": \"$PIPELINE_URL/$STEP_NAME/\",
    \"orchestrationTaskName\": \"$ENV0_PROJECT_ID/$ENV0_ENVIRONMENT_NAME#$STEP_NAME\",
    \"result\": \"$RESULT\",
    \"startDateTime\": \"$DATE\",
    \"endDateTime\":\"$DATE\",
    \"upstreamId\": \"$UPSTREAM_ID\",
    \"upstreamTaskUrl\": \"$UPSTREAM_TASK_URL\"
  },
  \"orchestrationTask\": {
    \"orchestrationTaskURL\": \"$PIPELINE_URL/$STEP_NAME/\",
    \"orchestrationTaskName\": \"$ENV0_PROJECT_ID/$ENV0_ENVIRONMENT_NAME#$STEP_NAME\",
    \"branchName\": \"main\",
    \"toolId\": \"$TOOL_ID\"
  }
}"


echo "Webhook Data $WEBHOOK_DATA" 

curl -X POST -H "Content-Type: application/json" -u "$USERNAME:$PASSWORD" $URL?toolId=$TOOL_ID -d "$WEBHOOK_DATA"

