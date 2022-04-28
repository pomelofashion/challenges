variable "name" {
  default     = "my-api"
  description = "API name"
}

variable "queue_name" {
  description = "Name of the SQS queue feed by the API"
}

variable "queue_arn" {
  description = "ARN of the SQS queue feed by the API"
}

variable "queue_region" {
  description = "AWS region of the SQS queue feed by the API"
}