
#  DevOps Project:  Python Flask App | Dockerfile | Terraform | Jenkins | Aws Eks | ECR | VPC | Deployment yaml | Service yaml | Horizontal Pod autoScaler

This project demonstrates a complete DevOps pipeline to provision AWS infrastructure using **Terraform**, build and deploy a **Flask** web application via **Docker** and **AWS ECR**, and automate the CI/CD process with **Jenkins** and **Kubernetes on EKS**.


##   Deliverables

- **Infrastructure as Code (Terraform)**  
- **Dockerfile for Flask App**  
- **Jenkins Pipeline (Jenkinsfile)**  
- **Kubernetes Deployment and Service YAMLs**  
- **Detailed Setup Instructions (README)**

---

##  Project Structure

```bash

├── Dockerfile # Dockerfile for Flask app
├── README.md # Setup documentation
├── app.py # Sample Flask app
├── requirements.txt # Python dependencies

├── jenkins/
│ └── Jenkinsfile # CI/CD pipeline stages

├── k8s/
│ ├── deployment.yml # K8s deployment definition
│ └── service.yml # K8s service (LoadBalancer)

├── modules/ # Modular Terraform structure
│ ├── ecr/ # ECR repository setup
│ ├── eks/ # EKS cluster configuration
│ ├── s3/ # S3 backend for remote state
│ └── vpc/ # VPC, subnets, gateway, etc.


├── main.tf # Root Terraform configuration
├── outputs.tf # Terraform outputs
└── variables.tf # Terraform variables
```



##   Setup Instructions

###  Prerequisites

- AWS CLI configured (`aws configure`)
- Terraform installed
- Docker installed
- A running Jenkins server (on EC2)
- kubectl installed
- AWS IAM user with sufficient permissions
- ECR repository (or create using Terraform)
---

### 1. Clone the Repository

```bash
git clone https://github.com/<your-username>/<repo-name>.git
cd <repo-name>
```

### 2. Provision Infrastructure Using Terraform

```bash
cd <repo-name>
terraform init
terraform apply
```

- This provisions:

- VPC with public/private subnets

- EKS cluster

- S3 backend

- Outputs required for Jenkins/EKS access

### 3. Flask Application 

- Run the Flask app locally to validate:

```bash
pip install -r requirements.txt
python app.py
```
### 4. Jenkins Pipeline Setup

- Install required Jenkins plugins:

- Docker Pipeline

- Git

- AWS CLI (via shell)

- Kubernetes CLI (kubectl)

- Add credentials in Jenkins:

- AWS_ACCESS_KEY_ID, AWS_SECRET_ACCESS_KEY

- AWS_ACCOUNT_ID

- ECR_REPO_NAME

- KUBECONFIG (for EKS access)

- Git (for GitHub auth)

- Create a new Jenkins Pipeline job:

- Use pipeline script from jenkins/Jenkinsfile

### 5. CI/CD Pipeline Breakdown

- The pipeline automates:

-  Source code checkout (Git)

- Build Docker image

- Push image to AWS ECR

- Configure kubectl for EKS

- Deploy Flask app on EKS using Kubernetes manifests

- Configure Horizontal Pod Autoscaler (HPA)


### 6. Kubernetes Deployment
- Apply Kubernetes manifests manually or via Jenkins:

```bash
kubectl apply -f k8s/deployment.yml
kubectl apply -f k8s/service.yml
```

Then expose the service:

```bash
kubectl get svc my-app-service
```
- Access your app at the external LoadBalancer URL.

