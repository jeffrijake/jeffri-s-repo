#AWS ECS,ECR&#

**AWS ECS**

•	ECS = Elastic Container Service

•	when we are launching Docket containers in AWS = launching ECS tasks on ECS CLusters.

•	EC2 launch type:- we must provision and maintain the infrastructure.

•	Each EC2 instance must run the ECS Agent to register in the ECS Cluster.

•	AWS takes care of starting/stopping containers


**AWS ECS - Fargate Launch type**
•	launch docker containers on AWS.

•	You do not provision the infrastructure (no EC2 instances to manage)

•	it's all serverless

•	you just create task definitions

•	AWS Just runs ECS Tasks for you based on the CPU / RAM you need.

•	to scale or just increase the number of tasks. simple - no more EC2 instance.

**AWS ECS - IAM roles for ECS**

•	we need to create an EC2 instance profile (EC2 launch type only)

•	it is used by the ECS agent

•	it makes API calls to ECS service

•	it sends continer logs to cloudwatch logs

•	it pulls docker images from ECR

•	reference sensitive data in secrets Manager or SSM parameter store.

**ECS task Role**

•	Allows each task to have a specific roles

•	Use different roles for the different ECS Services you run

•	task role is defined in the task definition
****

**AWS ECS - load balancer integrations**

•	to connect to users from the ECS tasks we use Application load balancers.

1)Application load balancer supports and works for most use cases.

2)Network load balancer is recommended only for high throughput/ high performance use cases, or to pair with AWS private link.


**AWS ECS - data volumes (EFS)**

•	mount EFS file systems onto ECS tasks.

•	works for both EC2 and fargate launch types.

•	tasks running in any AZ will share the same data in the EFS file systems

•	fargate + EFS = serverless (EFS is a pay as you go service)

**ECS Service Auto Scaling**

•	we can automatically increase/decrease the desired number of ECS tasks

•	Amazon ECS Auto Scaling uses AWS application auto scaling

        1)ECS service Average CPU Utilization
        2)ECS Service Average Memory Utilization - scale on RAM
        3)ALB request count per Target - metric coming from the ALB


**Target Tracking** - scale based on target value for a specific CloudWatch metric

**Step Scaling** - scale based on a specified CloudWatch Alarm

**Scheduled Scaling** - scale based on a specific date/time (predictable changes)

--> ECS service Auto Scaling (@ task level) "not equals to" EC2 Auto scaling (@ EC2 instance level)

**EC2 launch type - Auto Scaling EC2 instance**

•	Accommodate ECS Service Scaling by adding underlying EC2 instances

•	type 1:-
o	Auto Scaling Group Scaling
o	Scale your ASG based on CPU utilization
o	Add ec2 instances over time
 
•	type 2:-
o	ECS CLuster Capacity Provider
o	Used to automatically provision and scale the infrastructure for your ECS Tasks
o	capacity provider paired with an Autoscaling group
o	Add ec2 instances when you're missing capacity (CPU, RAM...)

**Amazon ECR**

•	ECR = Elastic container Registry

•	It stores and manages Docker images on AWS

•	Private and public repository (Amazon ECR public Gallery)

•	Fully integrated with ECS, backed by Amazon S3

•	We will assign an IAM role to full the images to the instances

- ECR can scale to meet the demands of storing and retrieving container images. It automatically scales based on usage, ensuring high availability and performance.



- ECR provides image scanning capabilities to help identify vulnerabilities in your container images. This can be integrated into your CI/CD pipeline to ensure that only secure images are deployed.



- ECR supports cross-region replication, allowing you to replicate your container images to different regions for redundancy and faster access.


**Using ECR typically involves the following steps:**

**Create a Repository:** You create a repository in ECR to store your Docker images.

**Push Images:** Use Docker commands or other tools to push your container images to the ECR repository.

**Integrate with AWS Services:** Integrate ECR with other AWS services like ECS, EKS, or CodeBuild to build, deploy, and manage containerized applications.


**Amazon EKS**

- Amazon EKS, or Amazon Elastic Kubernetes Service, is a fully managed Kubernetes service provided by Amazon Web Services (AWS). It simplifies the process of deploying, managing, and scaling containerized applications using Kubernetes on AWS infrastructure.

- With EKS, you can focus on building and running your applications while AWS takes care of the underlying Kubernetes control plane and infrastructure.

- EKS handles the deployment and management of the Kubernetes control plane, which includes the API server, etcd, and other components necessary for the operation of a Kubernetes cluster.



- EKS allows you to easily scale your Kubernetes clusters to meet the demands of your applications. You can add or remove worker nodes based on your application's resource requirements.

- EKS provides a built-in Cluster AutoScaler that automatically adjusts the number of worker nodes in your cluster based on resource demands and constraints.

- EKS allows you to create and manage worker nodes using Managed Node Groups, simplifying the provisioning and scaling of worker nodes.


