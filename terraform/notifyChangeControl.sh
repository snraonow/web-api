#!/bin/bash

STEP_NAME=$1
UPSTREAM_STEP_NAME=$2
DATE=$(date +%Y-%m-%d" "%H:%M:%S)
URL=https://$INSTANCE_NAME.service-now.com/api/sn_devops/devops/orchestration/changeControl

# https://docs.env0.com/docs/custom-flows#exposed-env0-system-environment-variables All environment variables

echo "STEP_NAME : $STEP_NAME ,  , TOOL_ID : $TOOL_ID "

echo "Change control invoked to $URL?toolId=$TOOL_ID "
PIPELINE_URL=api.env0.com/p/$ENV0_PROJECT_ID/environments/$ENV0_ENVIRONMENT_ID

if [[ -z "$UPSTREAM_STEP_NAME" ]]; then
   # $var is empty, do what you want
   UPSTREAM_ID=''
   UPSTREAM_TASK_URL=''
else
  UPSTREAM_ID=$UPSTREAM_STEP_NAME#$ENV0_DEPLOYMENT_LOG_ID
  UPSTREAM_TASK_URL=$PIPELINE_URL/$UPSTREAM_STEP_NAME/#$ENV0_DEPLOYMENT_LOG_ID
fi


CHANGE_CONTROL="{
    \"toolId\": \"$TOOL_ID\",
    \"callbackURL\": \"$PIPELINE_URL/$STEP_NAME/#$ENV0_DEPLOYMENT_LOG_ID\",
    \"orchestrationTaskURL\": \"$PIPELINE_URL/$STEP_NAME/\",
    \"orchestrationTaskName\": \"$ENV0_PROJECT_ID/$ENV0_ENVIRONMENT_NAME#$STEP_NAME\",
    \"orchestrationTaskDetails\": {
        \"message\" : \"ENV0 Change Creation\",
        \"triggerType\": \"upstream\",
        \"taskExecutionURL\": \"$PIPELINE_URL/$STEP_NAME/#$ENV0_DEPLOYMENT_LOG_ID\",
        \"orchestrationTaskURL\": \"$PIPELINE_URL/$STEP_NAME/\",
        \"orchestrationTaskName\": \"$ENV0_PROJECT_ID/$ENV0_ENVIRONMENT_NAME#$STEP_NAME\",
        \"branchName\": \"main\",
        \"upstreamTaskExecutionURL\": \"$PIPELINE_URL/$UPSTREAM_STEP_NAME/#$ENV0_DEPLOYMENT_LOG_ID\" ,
        \"toolId\": \"$TOOL_ID\"
    }    
}"

echo "Change Control Data $CHANGE_CONTROL" 

curl -X POST -H "Content-Type: application/json" -u "$USERNAME:$PASSWORD" $URL?toolId=$TOOL_ID -d "$CHANGE_CONTROL"