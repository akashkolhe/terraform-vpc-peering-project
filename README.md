# AWS VPC Peering Implementation using Terraform

## Project Overview

This project demonstrates Infrastructure as Code (IaC) by provisioning a complete AWS VPC Peering architecture using Terraform.

The infrastructure consists of two independent VPCs connected through a VPC Peering Connection, enabling secure private communication between EC2 instances deployed in separate networks.

## Architecture

### VPC 1

* CIDR: `10.0.0.0/16`
* Public Subnet: `10.0.1.0/24`
* Internet Gateway
* Route Table
* Security Group
* EC2 Instance

### VPC 2

* CIDR: `192.168.0.0/16`
* Public Subnet: `192.168.1.0/24`
* Internet Gateway
* Route Table
* Security Group
* EC2 Instance

### Connectivity

* VPC Peering Connection
* Custom Route Table Entries
* ICMP Communication Between VPCs
* SSH Access to EC2 Instances

---

## Architecture Diagram

```text
                    Internet
                        |
        ---------------------------------
        |                               |
     IGW-1                           IGW-2
        |                               |
   +------------+                 +------------+
   |   VPC-1    |                 |   VPC-2    |
   |10.0.0.0/16 |                 |192.168.0.0/16|
   +------------+                 +------------+
         |                                |
   Public Subnet                    Public Subnet
    10.0.1.0/24                    192.168.1.0/24
         |                                |
      EC2-1  <------ VPC Peering ------> EC2-2
```

---

## Technologies Used

* AWS VPC
* AWS EC2
* AWS Internet Gateway
* AWS Route Tables
* AWS Security Groups
* AWS VPC Peering
* Terraform
* AWS CLI
* Amazon Linux 2023

---

## Project Structure

```text
vpc-peering-project/
│
├── provider.tf
├── variables.tf
├── terraform.tfvars
├── vpc.tf
├── route.tf
├── security.tf
├── peering.tf
├── ec2.tf
├── outputs.tf
└── README.md
```

---

## Infrastructure Components

### Networking

* Created two isolated VPCs with separate CIDR ranges.
* Configured public subnets for resource deployment.
* Attached Internet Gateways to enable internet access.
* Created custom Route Tables and associations.

### Security

* Configured Security Groups for:

  * SSH Access (Port 22)
  * ICMP Communication (Ping)
* Implemented least-privilege network access between VPCs.

### VPC Peering

* Established VPC Peering Connection.
* Updated Route Tables to enable private communication.
* Verified connectivity using private IP addresses.

### Compute

* Provisioned Amazon Linux 2023 EC2 instances.
* Assigned Public IPs for remote access.
* Managed infrastructure entirely through Terraform.

---

## Terraform Workflow

### Initialize Terraform

```bash
terraform init
```

### Validate Configuration

```bash
terraform validate
```

### Review Execution Plan

```bash
terraform plan
```

### Deploy Infrastructure

```bash
terraform apply
```

### Destroy Infrastructure

```bash
terraform destroy
```

---

## Outputs

Example outputs after successful deployment:

```text
server1_private_ip = 10.0.1.224
server2_private_ip = 192.168.1.159
vpc_peering_id     = pcx-xxxxxxxxxxxx
```

---

## Connectivity Verification

### SSH to Server 1

```bash
ssh -i VPC-Prod-Terraform.pem ec2-user@<server1-public-ip>
```

### Ping Server 2

```bash
ping <server2-private-ip>
```

### SSH to Server 2

```bash
ssh -i VPC-Prod-Terraform.pem ec2-user@<server2-public-ip>
```

### Ping Server 1

```bash
ping <server1-private-ip>
```

Successful ICMP responses confirm:

* VPC Peering is operational
* Route Tables are configured correctly
* Security Groups permit communication
* Private connectivity is established

---

## Key Learning Outcomes

* Infrastructure as Code (IaC) using Terraform
* AWS Networking Fundamentals
* VPC Design and CIDR Planning
* Route Table Configuration
* Security Group Management
* Internet Gateway Configuration
* EC2 Deployment Automation
* VPC Peering Implementation
* Terraform State Management
* Cloud Infrastructure Automation

---

## Author

**Akash Kolhe**

Cloud & DevOps Engineer

### Skills Demonstrated

* AWS Cloud
* Terraform
* Linux
* Networking
* Infrastructure Automation
* DevOps Fundamentals
* Cloud Security
* Infrastructure Provisioning
