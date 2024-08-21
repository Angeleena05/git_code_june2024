provider "aws" {
  region = "ap-northeast-1" 
}

# Create an IAM role for the Lambda function
resource "aws_iam_role" "lambda_role" {
  name = "lambda_execution_role"

  assume_role_policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [{
      "Action": "sts:AssumeRole",
      "Effect": "Allow",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      }
    }]
  })
}

# Attach the necessary policies to the IAM role
resource "aws_iam_role_policy_attachment" "lambda_policy_attach" {
  role       = aws_iam_role.lambda_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}

# Add additional permissions for EC2 and SES
resource "aws_iam_policy" "lambda_additional_permissions" {
  name        = "LambdaAdditionalPermissions"
  description = "Additional permissions for EC2 and SES"

  policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
      {
        "Effect": "Allow",
        "Action": [
          "ec2:DescribeRegions",
          "ec2:DescribeVolumes",
          "ses:SendEmail"
        ],
        "Resource": "*"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "lambda_attach_additional_policy" {
  role       = aws_iam_role.lambda_role.name
  policy_arn = aws_iam_policy.lambda_additional_permissions.arn
}

# Create the Lambda function
resource "aws_lambda_function" "ebs_report" {
  filename         = "lambda_function_payload.zip"  # Zip file containing the Lambda function code
  function_name    = "EBSVolumeReport"
  role             = aws_iam_role.lambda_role.arn
  handler          = "lambda_function.lambda_handler"
  runtime          = "python3.9"
  source_code_hash = filebase64sha256("lambda_function_payload.zip")

  environment {
    variables = {
      EMAIL_RECIPIENT = "singh.angeleena@gmail.com"
      EMAIL_SENDER    = "your-verified-email@example.com"
    }
  }
}

# Trigger the Lambda function using CloudWatch Events (optional)
resource "aws_cloudwatch_event_rule" "lambda_schedule" {
  name        = "ebs_volume_report_schedule"
  description = "Triggers the Lambda function to run every day"
  schedule_expression = "rate(1 day)"
}

resource "aws_cloudwatch_event_target" "lambda_target" {
  rule      = aws_cloudwatch_event_rule.lambda_schedule.name
  target_id = "lambda"
  arn       = aws_lambda_function.ebs_report.arn
}

resource "aws_lambda_permission" "allow_cloudwatch" {
  statement_id  = "AllowExecutionFromCloudWatch"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.ebs_report.function_name
  principal     = "events.amazonaws.com"
  source_arn    = aws_cloudwatch_event_rule.lambda_schedule.arn
}
