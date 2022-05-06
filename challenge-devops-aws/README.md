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

Since we are heavy users of the Hashicorp Toolchain (Terraform, Vault, Consul, Nomad and Packer), your challenge will be implementing a set of infrastructure components on AWS using Terraform.

#### Part 1

* Create AWS API Gateway Resources
* Publish received messages to Eventbridge Bus
* Set up EventBridge Rules to transform messages
* Attach a Dead-letter Queue
* Create a rule to forward messages to Kinesis Firehose
* Process message via transformation Lambda function and forward to S3 via AWS Glue
* Create secondary Evenbridge Rule to forward messages to AWS Cloudwatch



- Don't forget documentation
- Pay attention to linting/validating as well as formatting your HCL.
- Ensure the infrastructure resources you're creating comply with security best practices.
