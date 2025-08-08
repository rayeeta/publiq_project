#  Junior-Intermediate Cloud Engineer Home Assignment

**Focus:** AWS + Terraform etc

**Estimated Time:** Undetermine 
 
**Level:** Beginner–Intermediate  


## 1. Scenario

You're joining a team that manages AWS infrastructure using Terraform. Your first task is to build the infrastructure for a small webapp. It must be **environment-specific**, **secure**, and **repeatable**.

You'll create a simple, reusable Terraform setup with support for two environments: `dev` and `prod`.

##  2. Requirements

### 2.1 Core Infrastructure (For Each Environment)

Use Terraform to provision the following in AWS:

- A **VPC** with:
  - 1 public subnet
- An **EC2 instance** in the public subnet:
  - User data should install and run a simple web server (`python3 -m http.server` or `nginx`)
- A **Security Group** that:
  - Allows HTTP (port 80) only from your own IP  and the IP of bmt (194.78.13.220)
  - Allows SSH (port 22) only from your own IP  and the IP of bmt (194.78.13.220)


### 2.2 Multi-Environment Setup

- Set up two environments: `dev` and `prod`
- Each must:
  - Use a **different remote backend** (S3 state file or folder)
  - Have its own **`.tfvars` file** for custom config

- You should be able to deploy each with:
  ```bash
  Dev env commands
  terraform init -backend-config=envs/dev/backend.hcl
  terraform apply -var-file=envs/dev/dev.tfvars
  
  Prod env commands
  terraform init -backend-config=envs/prod/backend.hcl
  terraform apply -var-file=envs/prod/prod.tfvars

  ```
### 2.3 Best practises
- Use modules for VPC and EC2
- Use variables, outputs, and avoid hardcoding (e.g., IPs, AMI IDs)
- Use terraform fmt and terraform validate before submitting 

## 3. Deliverables
- Your code/files uploaded to PERSONAL Github accounts containing:
  - All Terraform files and modules
  - Separate folders for dev and prod with backend.hcl and tfvars
  - A README.md with:
    - Setup instructions
    - How to deploy each environment
    - Any further explanation you deem necessary 

## 3b. Push your codes to this repo: Pls clone the repo first before you continue
    - mkdir bmt-home-proj
    - cd into "bmt-home-proj" before you clone the Github directory
```bash
git@github.com:bmt-devops/bmt-iac-project.git
```

## 4. AWS credentials & testing
 
To test your Terraform code, please use **your own AWS account** and **your own credentials**.
You can configure credentials locally using the AWS CLI:
```bash
aws configure
```

Or by setting environment variables:
```bash
export AWS_ACCESS_KEY_ID=your-access-key-id
export AWS_SECRET_ACCESS_KEY=your-secret-access-key
export AWS_DEFAULT_REGION=eu-west-1
```

>  **Important:** Do NOT include any AWS credentials or secrets in the code or in the repository. Use `.gitignore` to exclude any local config or `*.tfstate` files.

