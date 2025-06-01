# 🚀 Terraform EC2 Provisioning

This project provisions a simple **EC2 instance** in AWS using **Terraform**. It's a hands-on lab designed to introduce Infrastructure as Code (IaC) concepts while practicing cloud automation.

---

## 📂 Project Structure

├── first-ec2.tf # Terraform config: provider & EC2 instance
├── terraform.tfstate # Current infrastructure state (auto-generated)
├── terraform.tfstate.backup # Backup state file (auto-generated)
├── .terraform.lock.hcl # Provider lock file (auto-managed)
├── .gitignore # Git ignore rules
└── README.md # Project documentation

---

## 🔧 What This Does

- Initializes the **AWS provider** in the `eu-west-2` (London) region
- Provisions a **t2.micro EC2 instance** using a specified AMI
- Tags the instance with `"1stInstanceAutomated"`

---

## ✅ Prerequisites

| Tool        | Version   |
|-------------|-----------|
| Terraform   | ≥ 1.1.x   |
| AWS CLI     | Configured with `aws configure` |
| Git         | Optional, for version control |

---

## 🧪 How to Use

```bash
# 1. Initialize the working directory
terraform init

# 2. Validate syntax
terraform validate

# 3. Preview infrastructure changes
terraform plan

# 4. Apply changes (provision EC2 instance)
terraform apply
🔐 Security Notice
⚠️ Never hardcode AWS credentials in .tf files.
This project uses the default AWS CLI profile to authenticate. Store secrets securely using environment variables or credential managers.

🔐 GitHub Provider Integration
This module provisions a GitHub repository using the Terraform GitHub Provider.

✅ Steps Implemented
1. Declared the Provider:

provider "github" {
  token = var.github_token
}

2. Declared the Variable (in variables.tf):

variable "github_token" {
  description = "GitHub personal access token"
  type        = string
  sensitive   = true
}

3. Created a Secure Auto-Loaded Variable File (secrets.auto.tfvars):
This file is automatically loaded by Terraform and excluded from Git tracking via .gitignore.

github_token = "ghp_xxx...your_token_here"

4. Added to .gitignore to protect credentials:

*.tfstate
*.tfstate.backup
*.auto.tfvars

5. Provisioned a GitHub Repository:

resource "github_repository" "example" {
  name        = "example"
  description = "mine"
  visibility  = "public"
}

🛡️ Security Note
GitHub tokens are never hardcoded.
They are referenced via var.github_token and securely passed via a .auto.tfvars file.
This keeps secrets out of version control and aligns with Terraform security best practices.

📌 Tags
terraform aws ec2 infrastructure-as-code iac cloud

🧠 Author Notes
This is part of a larger Cloud Security Engineering learning journey — more modules coming soon!