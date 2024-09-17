
/* 
  This file contains the configuration for the AWS Lambda function that will be invoked by the CloudWatch Event Rule.
  The Lambda function will be triggered by the CloudWatch Event Rule every 5 minutes. See aws_cloudwatch_event_rule.lambda_timely_invoked_schedule
  - filename: The path to the .zip file containing the Lambda function code.
  - function_name: The name of the Lambda function.
  - role: The ARN of the IAM role that the Lambda function will assume.
  - handler: The name of the handler function in the Lambda code.
  - runtime: The runtime environment for the Lambda function.
  - source_code_hash: The base64-encoded SHA-256 hash of the .zip file containing the Lambda function code.
*/
resource "aws_lambda_function" "lambda_push_metrics_vpc_endpoint_func" {
  filename         = "lambda_function_payload.zip"
  function_name    = "lambda-push-metrics-vpc-endpoint-func"
  role             = aws_iam_role.lambda_push_metrics_vpc_endpoint_func_role.arn
  handler          = "index.handler"
  runtime          = "nodejs20.x"
  source_code_hash = data.archive_file.lambda_push_metrics_vpc_endpoint_func_archive.output_base64sha256
}