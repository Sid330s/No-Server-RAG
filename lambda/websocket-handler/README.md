This AWS Lambda function handles WebSocket connections and messages, integrating with Amazon API Gateway to manage connections and send messages. It supports different message types and routes.
- [Environment Variables](#environment-variables)
- [Functionality](#functionality)
  - [Connection Handling](#connection-handling)
  - [Message Handling](#message-handling)
- [Usage](#usage)
The Lambda function requires the following environment variable to be set:
- `WEBSOCKET_ENDPOINT`: The endpoint of the WebSocket API in API Gateway.
The function handles WebSocket connections through the following routes:
- `$connect`: Triggered when a new connection is established. The connection ID is logged.
- `$disconnect`: Triggered when a connection is disconnected. The connection ID is logged.
The function handles incoming messages and responds based on the route key:
- `message`: Logs the received message and sends it back to the client.
- `whoami`: Responds with the connection ID.
- Default: Handles unknown routes by sending a default message.
The function uses the `PostToConnectionCommand` from the `@aws-sdk/client-apigatewaymanagementapi` package to send messages to the connected clients.
Invoke the Lambda function via its API Gateway WebSocket endpoint. Ensure that the WebSocket endpoint is correctly set up and that the Lambda function is integrated with it.
1. **Connecting to the WebSocket**:
   The `$connect` route is automatically triggered when a client connects to the WebSocket.
2. **Disconnecting from the WebSocket**:
   The `$disconnect` route is automatically triggered when a client disconnects from the WebSocket.
3. **Sending a Message**:
   Send a message to the WebSocket with the route `message`. The Lambda function will log the message and echo it back to the client.
4. **Who Am I Request**:
   Send a message with the route `whoami`. The Lambda function will respond with the connection ID.