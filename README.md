# AWS Monitoring Dashboard Pack

This repo provides templates and scripts to monitor Linux-based EC2 instances in AWS using CloudWatch.

## Structure

- **dashboards/**: CloudWatch dashboard JSON templates
- **alarms/**: Bash scripts to create CPU and Disk alarms
- **notifications/**: Python script to create SNS topics and email subscriptions

## Requirements

- AWS CLI configured with appropriate IAM permissions
- Python 3.x with `boto3` installed

## Setup Instructions

1. Run the SNS setup script to create an email notification channel.
2. Deploy alarms for CPU and Disk using the shell scripts.
3. Upload the JSON dashboard via AWS Console or CLI.

## License

MIT
