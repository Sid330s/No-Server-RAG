This AWS Lambda function processes queries using Amazon Bedrock models, integrates with LanceDB for vector storage, and retrieves the identity ID from AWS Cognito. It supports streaming responses in different formats.
- [AWS Lambda Function for Querying with Bedrock Models](#aws-lambda-function-for-querying-with-bedrock-models)
  - [Table of Contents](#table-of-contents)
  - [Environment Variables](#environment-variables)
  - [Usage](#usage)
  - [Sample Events](#sample-events)
The Lambda function requires the following environment variables to be set:
- `s3BucketName`: The S3 bucket name where LanceDB embeddings are stored.
- `region`: The AWS region for your services.
- `IDENTITY_POOL_ID`: The Cognito Identity Pool ID.
- `USER_POOL_ID`: The Cognito User Pool ID.
Invoke the Lambda function via Lambda Function URL. Ensure that the request includes the necessary ID token.
```json
{
    "idToken": "your-id-token",
    "query": "What models are available in Amazon Bedrock?",
    "model": "anthropic.claude-instant-v1",
    "streamingFormat": "fetch-event-source"
}
```
```json
{
    "query": "What models are available in Amazon Bedrock?"
}
```
```json
{
    "query": "What models are available in Amazon Bedrock?",
    "model": "anthropic.claude-instant-v1"
}
```
```json
{
    "query": "What models are available in Amazon Bedrock?",
    "model": "anthropic.claude-v2",
    "streamingFormat": "fetch-event-source"
}
```