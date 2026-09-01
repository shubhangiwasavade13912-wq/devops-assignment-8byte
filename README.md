
In this project, I deployed an application on AWS using Terraform and Docker.
I created the AWS infrastructure using Terraform and deployed my application on an EC2 instance using Docker. I also used ECR for storing the Docker image, ALB for accessing the application, and RDS PostgreSQL for the database.
AWS Services Used
* VPC
* EC2
* ECR
* Application Load Balancer
* RDS PostgreSQL
* IAM
* Security Groups
* Subnets
* Route Tables
* Internet Gateway

Project Setup :
I created one VPC with four subnets:
* 2 Public Subnets
* 2 Private Subnets
The public subnets are used for the Application Load Balancer.
The EC2 and database are configured according to the network setup in the Terraform files.

Terraform:
I used Terraform to create the AWS resources.
The Terraform files include configuration for:
* VPC
* Subnets
* Route Tables
* Internet Gateway
* Security Groups
* EC2
* IAM
* Application Load Balancer
* Target Group
* RDS

I used Terraform commands such as:
bash
terraform init
terraform validate
terraform plan
terraform apply

After completing the deployment, I also checked the infrastructure using:
bash
terraform plan

It showed:
text
No changes. Your infrastructure matches the configuration.

Docker and ECR
I created a Dockerfile for my application and built the Docker image.
I pushed the Docker image to an Amazon ECR repository.
The EC2 instance gets permission to access ECR using an IAM role. The EC2 instance then pulls the Docker image and runs the application.

Application Load Balancer
I created an Application Load Balancer and a target group.
The EC2 instance was registered with the target group.
The target showed as healthy, and I was able to access my application using the ALB DNS name.

RDS:
I created a PostgreSQL database using Amazon RDS.
The database was configured with the private subnet setup and a security group.

Final Result:
After completing the setup, the application was running successfully on AWS.
The basic flow of the application is:

Internet
   ↓
Application Load Balancer
   ↓
EC2
   ↓
Docker Container
   ↓
Application

The application also uses the PostgreSQL database configured through RDS.

Challenges Faced:
During the project, I faced some issues with AWS credentials, Terraform configuration, EC2 setup, and AWS region selection.
I fixed these issues by checking the Terraform configuration, AWS settings, IAM permissions, and testing the resources step by step.
The detailed challenges and solutions are included in the Challenges document.

Cleanup:
After completing the project and recording the demonstration, I used Terraform destroy to remove the AWS resources.
bash
terraform destroy
This was done so that I would not leave the AWS resources running after completing the assignment.
