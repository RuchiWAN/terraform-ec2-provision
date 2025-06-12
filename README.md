# 🚀 Terraform EC2 Provisioning with Secure Firewall Templates

This project provisions a simple **EC2 instance** in AWS using **Terraform**, with a focus on applying Infrastructure as Code (IaC) best practices and building reusable **secure firewall templates** for cloud environments.

👉 This is part of my **Cloud IAM Architect learning path** — progressively building a modern cloud security engineering portfolio.

---

## 📂 Project Structure

├── first-ec2.tf # Terraform config: provider & EC2 instance
├── terraform.tfstate # Current infrastructure state (auto-generated)
├── terraform.tfstate.backup # Backup state file (auto-generated)
├── .terraform.lock.hcl # Provider lock file (auto-managed)
├── .gitignore # Git ignore rules
├── README.md # Project documentation
├── variables.tf # Terraform input variables
├── docs/secure-firewall-templates/ # Reusable secure baseline firewall templates
│ ├── aws_baseline_sg.tf
│ ├── azure_baseline_nsg.tf
│ └── gcp_baseline_fw.tf
└── .gitmessage.txt # Git commit message template

---

## 🔧 What This Does

- Initializes the **AWS provider** in the `eu-west-2` (London) region
- Provisions a **t2.micro EC2 instance** using a specified AMI
- Creates a **dedicated Security Group** using Terraform
- Demonstrates reusable **secure firewall templates** across AWS, Azure, and GCP
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
🛡️ Secure Baseline Firewall Templates (AWS / Azure / GCP)

As part of my ongoing Cloud IAM Architect learning path, I started building a set of reusable secure baseline firewall templates across AWS, Azure, and GCP. These ensure I can fully control ingress/egress behavior and apply security by design in my Terraform deployments.

Highlights:

Explicit ingress & egress in all providers → no surprises

Easily auditable and reusable

First step toward Zero Trust posture & segmentation

Aligns with CIS, NIST, and PCI DSS expectations

📂 See: /docs/secure-firewall-templates

🔐 Security Notes

⚠️ Never hardcode AWS credentials in .tf files.
This project uses the default AWS CLI profile to authenticate. Store secrets securely using environment variables or credential managers.

GitHub tokens (if used) are never hardcoded.
They are referenced via var.github_token and securely passed via .auto.tfvars.

This keeps secrets out of version control and aligns with Terraform security best practices.

📌 Tags

terraform aws ec2 iac cloud-security firewall cloud-iam-architect

🧠 Author Notes

This project is part of my Cloud IAM Architect / Cloud Security Engineer learning journey.
More modules coming soon:

✅ Terraform modules → baseline IAM & security
✅ CI/CD pipelines → GitHub Actions
✅ Multi-cloud federation → AWS + Azure + Okta
✅ Secrets & Vault integration