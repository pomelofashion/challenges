resource "aws_iam_role" "sqs_lambda" {
  name               = "${var.name}-sqs-lambda"
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

resource "aws_iam_policy" "sqs_lambda" {
  name        = "${var.name}-sqs-lambda"
  description = "IAM policy for lambda Being invoked by SQS"

  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
          "Action": [
              "sqs:DeleteMessage",
              "sqs:ReceiveMessage",
              "sqs:GetQueueAttributes"
          ],
          "Resource": "${var.queue_arn}",
          "Effect": "Allow"
      },
      {
        "Action": [
            "logs:CreateLogGroup",
            "logs:CreateLogStream",
            "logs:PutLogEvents"
        ],
        "Resource": "arn:aws:logs:*:*:*",
        "Effect": "Allow"
      }
    ]
}
EOF

}


resource "aws_iam_role_policy_attachment" "sqs_lambda" {
  role       = aws_iam_role.sqs_lambda.name
  policy_arn = aws_iam_policy.sqs_lambda.arn
}
