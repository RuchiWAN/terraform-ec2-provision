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

📌 Tags
terraform aws ec2 infrastructure-as-code iac cloud

🧠 Author Notes
This is part of a larger Cloud Security Engineering learning journey — more modules coming soon!