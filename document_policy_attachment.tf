/*
  aws_iam_policy_document is a data source that generates an IAM policy document that can be referenced by other resources.
  This policy document will allow the Lambda function to assume the role and execute the function.
  - statement: The policy statement that allows the Lambda function to assume the role.
    - actions: The actions that the Lambda function is allowed to perform.
    - effect: The effect of the policy statement (Allow in this case).
    - principals: The entities that are allowed to assume the role.
      - type: The type of entity (Service in this case).
      - identifiers: The identifiers of the entity (lambda.amazonaws.com in this case).
*/

data "aws_iam_policy_document" "LambdaAWSLambdaTrustPolicy" {
  statement {
    actions = ["sts:AssumeRole"]
    effect  = "Allow"
    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }
  }
}

/**
  * Create an IAM role for the Lambda function.
  * The role will have the permissions to assume the role and execute the function.
  * The role will be associated with the policy document that allows the Lambda function to assume the role.
  */
resource "aws_iam_policy" "demo_lambda_put_metric_policy" {
  name        = "LambdaPutMetricPolicy"
  description = "Policy to allow Lambda to put custom metrics to CloudWatch"
  policy      = <<EOF
    {
      "Version": "2012-10-17",
      "Statement": [
        {
          "Effect": "Allow",
          "Action": "cloudwatch:PutMetricData",
          "Resource": "*"
        }
      ]
    }
  EOF
}