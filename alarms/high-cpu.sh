#!/bin/bash
# High CPU Alarm creation script
# Replace INSTANCE_ID with your EC2 instance ID

INSTANCE_ID="i-xxxxxxxxxxxx"
ALARM_NAME="HighCPUUtilization"
THRESHOLD=80

aws cloudwatch put-metric-alarm \
  --alarm-name "$ALARM_NAME" \
  --metric-name CPUUtilization \
  --namespace AWS/EC2 \
  --statistic Average \
  --period 300 \
  --threshold $THRESHOLD \
  --comparison-operator GreaterThanThreshold \
  --dimensions Name=InstanceId,Value=$INSTANCE_ID \
  --evaluation-periods 2 \
  --alarm-actions arn:aws:sns:us-east-1:111122223333:MyTopic \
  --unit Percent

# This script sets up a CloudWatch alarm to monitor CPU usage and sends notifications when it exceeds the threshold.
