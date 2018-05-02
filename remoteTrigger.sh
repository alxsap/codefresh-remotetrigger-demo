#!/bin/sh

if [ -z "$JENKINS_JOB_URL" ]; then
    echo "Need to set JENKINS_JOB_URL"
    exit 1
fi  

if [ -z "$JENKINS_USER" ]; then
    echo "Need to set JENKINS_USER"
    exit 1
fi  

if [ -z "$JENKINS_PASSWORD" ]; then
    echo "Need to set JENKINS_PASSWORD"
    exit 1
fi  


echo Triggering remote job $JENKINS_JOB_URL

queueUrl=`curl --request POST --basic --user $JENKINS_USER:$JENKINS_PASSWORD --silent -D - '$JENKINS_JOB_URL/build' | grep Location: | sed 's/Location: //'`
buildUrl=`curl --request GET --basic --user $JENKINS_USER:$JENKINS_PASSWORD  --silent "$queueUrl/api/xml?xpath=leftItem/executable/url" | sed 's/<url>//' | sed 's/<\/url>//'`

cf_export buildUrl=$buildUrl