resource "aws_api_gateway_rest_api" "sqs_api" {
  name        = var.name
  description = "API feeding message to ${var.queue_name} queue"
}

# resource "aws_api_gateway_request_validator" "pomelo_api" {
#   rest_api_id           = "${aws_api_gateway_rest_api.pomelo_api.id}"
#   name                  = "payload-validator"
#   validate_request_body = true
# }

resource "aws_api_gateway_model" "sqs_api" {
  rest_api_id  = aws_api_gateway_rest_api.sqs_api.id
  name         = "pomeloApi"
  description  = "Pomelo API schema"
  content_type = "application/json"

  schema = <<EOF
{
	"$schema": "http://json-schema.org/draft-04/schema#",
	"title": "Message",
	"description": "Message to feed to queue",
	"type": "object",
	"properties":
	{
		"id":
		{
			"description": "Identifier of the message",
			"type": "number"
		},
		"message":
		{
			"description": "Content of the message",
			"type": "string"
		}
	},
	"required": ["id", "message"]
}
EOF
}


resource "aws_api_gateway_method" "sqs_api" {
  rest_api_id      = aws_api_gateway_rest_api.sqs_api.id
  resource_id      = aws_api_gateway_rest_api.sqs_api.root_resource_id
  api_key_required = false
  http_method      = "POST"
  authorization    = "NONE"
  # request_validator_id = "${aws_api_gateway_request_validator.api.id}"

  request_models = {
    "application/json" = aws_api_gateway_model.sqs_api.name
  }
}

resource "aws_api_gateway_integration" "sqs_api" {
  rest_api_id             = aws_api_gateway_rest_api.sqs_api.id
  resource_id             = aws_api_gateway_rest_api.sqs_api.root_resource_id
  http_method             = aws_api_gateway_method.sqs_api.http_method
  type                    = "AWS"
  integration_http_method = "POST"
  uri                     = "arn:aws:apigateway:${var.queue_region}:sqs:path/${var.queue_name}"
  credentials             = aws_iam_role.sqs_api.arn

  request_parameters = {
    "integration.request.header.Content-Type" = "'application/x-www-form-urlencoded'"
  }

  passthrough_behavior = "NEVER"
  request_templates = {
    "application/json" = "Action=SendMessage&MessageBody=$input.body"
  }
}

resource "aws_api_gateway_method_response" "response_200" {
  rest_api_id = aws_api_gateway_rest_api.sqs_api.id
  resource_id = aws_api_gateway_rest_api.sqs_api.root_resource_id
  http_method = aws_api_gateway_method.sqs_api.http_method
  status_code = 200

  response_models = {
    "application/json" = "Empty"
  }
}

resource "aws_api_gateway_integration_response" "response_200" {
  rest_api_id       = aws_api_gateway_rest_api.sqs_api.id
  resource_id       = aws_api_gateway_rest_api.sqs_api.root_resource_id
  http_method       = aws_api_gateway_method.sqs_api.http_method
  status_code       = aws_api_gateway_method_response.response_200.status_code
  selection_pattern = "^2[0-9][0-9]"
  response_templates = {
    "application/json" = "{\"message\": \"great success!\"}"
  }

  depends_on = [aws_api_gateway_integration.sqs_api]
}


resource "aws_api_gateway_deployment" "sqs_api" {
  rest_api_id = aws_api_gateway_rest_api.sqs_api.id
  stage_name  = "prod"

  depends_on = [aws_api_gateway_integration.sqs_api]
}