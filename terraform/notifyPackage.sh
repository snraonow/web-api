#!/bin/bash

STEP_NAME=$1
# RESULT=$3  #use result to specify status?
DATE=$(date +%Y-%m-%d" "%H:%M:%S)
ARTIFACT_NAME="docker-image-name"
ARTIFACT_REPO="docker-repo-name"
ARTIFACT_VERSION="$ENV0_DEPLOYMENT_LOG_ID"
ARTIFACT_SEMANTIC_VERSION=""
URL=api/sn_devops/devops/package/registration

# https://docs.env0.com/docs/custom-flows#exposed-env0-system-environment-variables All environment variables

echo "STEP_NAME : $STEP_NAME ,  , TOOL_ID : $TOOL_ID "
echo "Package Registration invoked to $URL?orchestrationToolId=$TOOL_ID "

PACKAGE_INFO="{
    \"name\": \"$ARTIFACT_NAME\",
    \"taskExecutionNumber\": \"$ENV0_DEPLOYMENT_LOG_ID\",
    \"pipelineName\": \"$ENV0_PROJECT_ID/$ENV0_ENVIRONMENT_NAME\",
    \"stageName\": \"$STEP_NAME\",
    \"artifacts\": [
        {
            \"pipelineName\" : \"$ENV0_PROJECT_ID/$ENV0_ENVIRONMENT_NAME\",
            \"stageName\": \"$STEP_NAME\",
            \"taskExecutionNumber\": \"$ENV0_DEPLOYMENT_LOG_ID\",
            \"name\": \"$ARTIFACT_NAME\",
            \"repositoryName\": \"$ARTIFACT_REPO\",
            \"semanticVersion\": \"$ARTIFACT_SEMANTIC_VERSION\",
            \"version\": \"$ARTIFACT_VERSION\"
        }
    ]
}"

echo "Artifact Data $ARTIFACT_DATA" 

curl -X POST -H "Content-Type: application/json" -u "$USERNAME:$PASSWORD" $URL?orchestrationToolId=$TOOL_ID -d "$ARTIFACT_DATA"

