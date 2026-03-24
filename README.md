# Ottawa Patient Management Hub

A sophisticated, cloud-native microservices ecosystem designed for scalable and secure patient data management. This project simulates a professional-grade AWS production environment locally using **LocalStack Pro** and **AWS CDK**, demonstrating high proficiency in distributed systems, event-driven architecture, and Infrastructure as Code (IaC).

---

## 🏗️ Architecture Overview

The system consists of five specialized microservices orchestrated within a simulated AWS VPC, ensuring high availability and fault tolerance.

* **API Gateway**: Built with **Spring Cloud Gateway**. It handles centralized routing and security, featuring a custom **JWT Validation Filter** to enforce zero-trust security.
* **Auth Service**: Manages user identity and JWT issuance. It uses **Spring Security** and a dedicated **RDS PostgreSQL** instance for persistent credential storage.
* **Patient Service**: The core business engine. It implements complex workflows, including synchronous **gRPC** calls to the Billing Service and asynchronous event publishing to **Apache Kafka**.
* **Billing Service**: A high-performance **gRPC server** that handles financial account provisioning, ensuring transactional integrity during patient onboarding.
* **Analytics Service**: An event-driven consumer that monitors **AWS MSK (Kafka)** topics to process patient metrics and audit trails for compliance reporting.

---

## 🛠️ Tech Stack

| Category           | Technologies                                                                 |
|:-------------------|:-----------------------------------------------------------------------------|
| **Languages** | Java 21, SQL, Protocol Buffers (proto3)                                      |
| **Frameworks** | Spring Boot 3.x, Spring Cloud Gateway, Hibernate/JPA                         |
| **Cloud & IaC** | AWS CDK (Java), LocalStack Pro, AWS ECS (Fargate), AWS RDS, AWS MSK (Kafka)  |
| **Communication** | gRPC, REST, Apache Kafka                                                    |
| **Testing** | JUnit 5, Mockito, IntelliJ HTTP Client                                       |
| **DevOps** | Docker, Maven, Bash Scripting                                                |

---

## 🌟 Key Features

* **Infrastructure as Code (IaC)**: The entire AWS environment (VPC, Subnets, Security Groups, Cluster) is defined in Java using **AWS CDK**, ensuring environment consistency.
* **Hybrid Communication Strategy**: 
    * **Synchronous**: gRPC for critical, low-latency inter-service calls (Patient -> Billing).
    * **Asynchronous**: Kafka for decoupled, scalable event processing (Patient -> Analytics).
* **Security Compliance**: Implements the **Circuit Breaker** pattern and centralized authentication, aligning with Canadian data privacy standards (PIPEDA-friendly architecture).
* **Local Cloud Simulation**: Leveraging **LocalStack** to develop and test cloud-native features without incurring AWS costs, significantly accelerating the Dev loop.

---

## 🚀 Getting Started

### Prerequisites
* **Java 21** & Maven 3.9+
* **Docker Desktop**
* **LocalStack CLI** (Pro version required for MSK/ECS simulation)

### Deployment Steps
1. **Start LocalStack**:
   ```bash
   localstack start -d
