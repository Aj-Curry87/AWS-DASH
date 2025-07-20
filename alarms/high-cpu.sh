#!/bin/bash
# filepath: /Users/aj/Downloads/aws-monitoring-dashboard-pack/alarms/high-cpu.sh

# Usage: ./high-cpu.sh <INSTANCE_ID> <SNS_TOPIC_ARN> <REGION> [THRESHOLD] [ALARM_NAME]
# Example: ./high-cpu.sh i-0abc123def456 arn:aws:sns:us-east-1:111122223333:MyTopic us-east-1 80 WebTierHighCPU

INSTANCE_ID="$1"
SNS_TOPIC_ARN="$2"
REGION="$3"
THRESHOLD="${4:-80}" # Default to 80 if not provided
ALARM_NAME="${5:-HighCPUUtilization-$INSTANCE_ID}"

if [[ -z "$INSTANCE_ID" || -z "$SNS_TOPIC_ARN" || -z "$REGION" ]]; then
  echo "Usage: $0 <INSTANCE_ID> <SNS_TOPIC_ARN> <REGION> [THRESHOLD] [ALARM_NAME]"
  exit 1
fi

aws cloudwatch put-metric-alarm \
  --alarm-name "$ALARM_NAME" \
  --metric-name CPUUtilization \
  --namespace AWS/EC2 \
  --statistic Average \
  --period 300 \
  --threshold "$THRESHOLD" \
  --comparison-operator GreaterThanThreshold \
  --dimensions Name=InstanceId,Value="$INSTANCE_ID" \
  --evaluation-periods 2 \
  --alarm-actions "$SNS_TOPIC_ARN" \
  --unit Percent \
  --region "$REGION"

# This script is now parameterized for automated deployment across multiple tiers and environments.