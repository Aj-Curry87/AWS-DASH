import boto3

# This script creates an SNS topic and subscribes an email to it

sns = boto3.client("sns")

topic_name = "EC2AlertsTopic"
email_address = "your-email@example.com"

# Create SNS topic
response = sns.create_topic(Name=topic_name)
topic_arn = response["TopicArn"]
print(f"Created topic: {topic_arn}")

# Subscribe email
sns.subscribe(
    TopicArn=topic_arn,
    Protocol="email",
    Endpoint=email_address
)
print(f"Subscription request sent to {email_address}. Please confirm the subscription.")
