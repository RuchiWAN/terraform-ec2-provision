# 🚀 Terraform EC2 Provisioning

This project provisions a simple **EC2 instance** in AWS using **Terraform**. It's a hands-on lab designed to introduce Infrastructure as Code (IaC) concepts while practicing cloud automation.

---

## 📂 Project Structure

├── first-ec2.tf                     # Terraform config: provider & EC2 instance
├── variables.tf                     # Variable declarations (AWS region, instance type, etc.)
├── terraform.tfstate                # Current infrastructure state (auto-generated) - not tracked in Git
├── terraform.tfstate.backup         # Backup state file (auto-generated) - not tracked in Git
├── .terraform.lock.hcl              # Provider lock file (auto-managed)
├── .gitignore                       # Git ignore rules
├── README.md                        # Project documentation (this file)
├── docs/                            # Project notes & additional documentation
│   └── secure-firewall-templates.md # Secure firewall baseline notes (AWS/Azure/GCP patterns)

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

6. 🛡️ Secure Baseline Firewall Templates (AWS / Azure / GCP)

As part of my ongoing Cloud IAM Architect learning path, I started building a set of reusable secure baseline firewall templates across AWS, Azure, and GCP. These ensure I can fully control ingress/egress behavior and apply security by design in my Terraform deployments.

**Highlights:**
- Explicit ingress & egress in all providers → no surprises
- Easily auditable and reusable
- First step toward Zero Trust posture & segmentation
- Aligns with CIS, NIST, and PCI DSS expectations

See: [/docs/secure-firewall-templates](./docs/secure-firewall-templates)

---

🛡️ Security Note
GitHub tokens are never hardcoded.
They are referenced via var.github_token and securely passed via a .auto.tfvars file.
This keeps secrets out of version control and aligns with Terraform security best practices.

📌 Tags
terraform aws ec2 infrastructure-as-code iac cloud

🧠 Author Notes
This is part of a larger Cloud Security Engineering learning journey — more modules coming soon!