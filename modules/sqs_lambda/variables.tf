variable "name" {
  default     = "my-lambda"
  description = "Lambda name"
}

variable "queue_arn" {
  description = "ARN of the SQS queue the lambda read from"
}