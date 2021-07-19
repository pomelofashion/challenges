# Pomelo DevOps (AWS Serverless) Challenge

Welcome to the Pomelo DevOps challenge!

## Principles & Ground Rules

Please focus on those four principles while writing code: **clarity**, **simplicity**, **defensiveness** and  **resilience**.

- **Clarity**: write clear code that any developer can read and understand in one go.

- **Simplicity**: write gimmick-free and straightforward code with no ambiguities.

- **Defensiveness**: cover edge cases and treat user inputs with care.

- **Resilience**: gracefully handling an error and unexpected behaviour.


* We prefer well-thought-out solutions over the quick-and-dirty kind. So take your time, if you need it. A swift rejection usually matches a rushed job.
* Submission is made via a zip archive of your git-based project. 
* Send your submission to [coding-challenge@pomelofashion.com](mailto:coding-challenge@pomelofashion.com?subject=devops-coding-challenge)

## The assignment

Since we are heavy users of the Hashicorp Toolchain (Terraform, Vault, Consul and Packer). Your challenge will be to implement a set of infrastructure components on AWS using Terraform.

Specifically:

* Create AWS API Gateway Resources
* Connect to AWS SQS
** Additionally create a Dead-letter Queue
* Create a Lambda function that receives messages from said Queue via triggers
** Forward messages to AWS Cloudwatch
** Write messages AWS Kinesis into AWS Glue and AWS S3

* Create Postman collection that:
** Sends messages successfully to API gateway and into SQS
** Sends message failures into DLQ for Lambda and logs into AWS Cloudwatch

Alternatively, if time permits, you can redesign the solution to be based on AWS EventBridge.

### Guidelines

- Don't forget documentation 
- Pay attention to linting/validating as well as formatting your HCL.
- Ensure the infrastructure resources you're creating comply with secuirty best practices.

