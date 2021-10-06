# Pomelo QA automation Challenge

Welcome to the Pomelo QA automation Challenge !!!

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

Including 2 parts:
* Requirement analysis and test cases
* Automated test execution

### Part 1 : Analyst the requirements and create test scenarios

Here are requirements for Ecommerce websites . Please do requirement analysis and create test cases for  these features.
If you have any questions, please note and send them back with the assignment. Format of test cases is not fixed, please feel free to create your own. 

* Assume that you are assigned as a QA in a new project. We start developing an Ecommerce website 
* Project Manager gives you the following requirements which you have to create test scenarios for all of them. You can ask questions if you have some  (Mark as QUESTION). You can suggest if you have some idea for each requirement (Mark as IDEA).

#### Requirements
* As a customer I would like to browse through the website to see products that are in each category.
* As a customer I would quickly access the particular product by searching.
* As a customer I would add products to the shopping cart and be able to continue shopping.
* As a customer I would like to update product quantities in the shopping cart.
* As a customer I would like to checkout and  it requires membership.* As a customer I would like to track orders I made on my account.

#### Wireframe user flow for requirement

![Alt text](/challenge-qa-automation/wireframe-qa-test.png?raw=true "Wireframe")

### Part 2 : Automated test assignment

The assignment is to ask the candidate to write code/test scripts to automate test execution. 

The candidate uses appropriate automation tools to develop the test scripts and validate the software. The goal is to complete test execution in a less amount of time.

* Please go to https://www.pomelofashion.com/th/en/ and focus automate testing on "My Shopping Bag" page 

* A customer register into our system with their credential
* A customer adds the products any cetegory and click "Cart" Icon
* A customer be able to adjusts quantity of product items or items.
* A customer be able to adjusts size of product items or items.
* A customer be able to adjust and delete product items or items.
* A customer be able to fill-in and click apply promo code. (even if promocode is not eligible)
* A customer be able to validate proceed to checkout button.

candidate can create automated test script with preferred automate test tool or any language and integrate with any CI/CD pipeline e.g. jenkins or github action.

### Guidelines
- Please consider secrete managment for security. 
- Don't forget documentation 
- Pay attention to linting/validating as well as formatting your HCL.
- Ensure the infrastructure resources you're creating comply with security best practices.




