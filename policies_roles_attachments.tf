/*
  aws_iam_role_policy_attachment is a resource that attaches an IAM policy to an IAM role.
  In this case, the AWSLambdaBasicExecutionRole policy is attached to the IAM role created earlier.
  This policy provides the necessary permissions for the Lambda function to execute.
  - role: The name of the IAM role to attach the policy to.
  - policy_arn: The ARN of the IAM policy to attach to the role.
*/
resource "aws_iam_role_policy_attachment" "terraform_lambda_policy" {
  role       = aws_iam_role.lambda_push_metrics_vpc_endpoint_func_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}


resource "aws_iam_role_policy_attachment" "lambda_put_metric_policy_attachment" {
  role       = aws_iam_role.lambda_push_metrics_vpc_endpoint_func_role.name
  policy_arn = aws_iam_policy.demo_lambda_put_metric_policy.arn
}