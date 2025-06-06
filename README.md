
# DevOps Project: Flask App Deployment on AWS EKS with  CI/CD Pipeline

## Tools & Technologies Used: **Python Flask** | **Docker** | **Terraform** | **Jenkins** | **AWS EKS** | **ECR** | **VPC** | **Kubernetes (Deployment, Service)**

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
.
|-- Dockerfile
|-- README.md
|-- app.py
|-- jenkins
|   `-- Jenkinsfile
|-- k8s
|   |-- deployment.yml
|   `-- service.yml
|-- modules
|   |-- ecr
|   |   |-- main.tf
|   |   |-- outputs.tf
|   |   `-- variables.tf
|   |-- eks
|   |   |-- main.tf
|   |   |-- outputs.tf
|   |   `-- variables.tf
|   |-- s3
|   |   |-- main.tf
|   |   |-- outputs.tf
|   |   `-- variables.tf
|   `-- vpc
|       |-- main.tf
|       |-- outputs.tf
|       `-- variables.tf
|-- requirements.txt
`-- terraform
    |-- main.tf
    |-- outputs.tf
    `-- variables.tf
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

- Credentials stored in jenkins
  <img width="849" alt="image" src="https://github.com/user-attachments/assets/535e8a8d-24a1-46ed-a930-e6647ae506f7" />


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
- Access your app using service external IP.
<img width="446" alt="image" src="https://github.com/user-attachments/assets/f43c00ac-ee96-4e7a-a76a-3a48a5e15f08" />


