if [ -z "$1" ]; then
    echo "Usage: $0 <stack-name>"
    exit 1
fi
STACK_NAME=$1
FRONTEND_CONFIG_S3_PATH=$(aws cloudformation describe-stacks \
    --stack-name "$STACK_NAME" \
    --query "Stacks[0].Outputs[?OutputKey=='FrontendConfigS3Path'].OutputValue" \
    --output text)
if [ -z "$FRONTEND_CONFIG_S3_PATH" ]; then
    echo "Error: FrontendConfigS3Path not found in stack outputs"
    exit 1
fi
aws s3 cp "$FRONTEND_CONFIG_S3_PATH" "resources/ui/public/appconfig.json"
if [ $? -eq 0 ]; then
    echo "File copied successfully to resources/ui/public/appconfig.json"
else
    echo "Error: Failed to copy the file"
    exit 1
fi