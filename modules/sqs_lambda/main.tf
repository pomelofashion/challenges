data "archive_file" "sqs_lambda" {
  source_dir  = "${path.module}/script/"
  output_path = "${path.module}/script/${var.name}.zip"
  type        = "zip"
}

resource "aws_lambda_function" "sqs_lambda" {
  function_name = var.name
  handler       = "handler.lambda_handler"
  role          = aws_iam_role.sqs_lambda.arn
  runtime       = "python3.7"

  filename         = data.archive_file.sqs_lambda.output_path
  source_code_hash = data.archive_file.sqs_lambda.output_base64sha256

  timeout = 30

  depends_on = [
    aws_iam_role_policy_attachment.sqs_lambda
  ]
}

resource "aws_lambda_permission" "sqs_lambda" {
  statement_id  = "AllowExecutionFromSQS"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.sqs_lambda.function_name
  principal     = "sqs.amazonaws.com"
  source_arn    = var.queue_arn
}

resource "aws_lambda_event_source_mapping" "sqs_lambda" {
  batch_size       = 1
  event_source_arn = var.queue_arn
  enabled          = true
  function_name    = aws_lambda_function.sqs_lambda.arn
}