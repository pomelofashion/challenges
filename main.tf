resource "aws_sqs_queue" "pomelo_challenge_dlt" {
  name = "pomelo-challenge-dlt"
}

resource "aws_sqs_queue" "pomelo_challenge" {
  name = "pomelo-challenge"
  redrive_policy = jsonencode({
    deadLetterTargetArn = "${aws_sqs_queue.pomelo_challenge_dlt.arn}"
    maxReceiveCount     = 3
  })
}

module "pomelo_challenge" {
  source       = "./modules/sqs_api"
  name         = "pomelo-challenge"
  queue_name   = aws_sqs_queue.pomelo_challenge.name
  queue_arn    = aws_sqs_queue.pomelo_challenge.arn
  queue_region = var.region
}

module "pomelo_lambda" {
  source    = "./modules/sqs_lambda"
  name      = "pomelo-challenge"
  queue_arn = aws_sqs_queue.pomelo_challenge.arn
}