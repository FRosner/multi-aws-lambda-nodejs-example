resource "aws_lambda_function" "concatenator" {
  filename         = "${local.concatenator-zip}"
  function_name    = "${local.project-name}-concatenator"
  role             = "${aws_iam_role.concatenator.arn}"
  handler          = "src/lambda.handler"
  source_code_hash = "${base64sha256(file(local.concatenator-zip))}"
  runtime          = "nodejs8.10"
  timeout          = 3
}

resource "aws_iam_role" "concatenator" {
  name = "${local.project-name}-concatenator"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}
