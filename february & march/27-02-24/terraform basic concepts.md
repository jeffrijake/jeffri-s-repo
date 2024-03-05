#  #Terraform introduction

**what is IAC?**

  Infrastructure as a code is managing and provision of infrastructure through code instead of through manual process.

This allows teams to automate infrastructre management and deployment, resulting in faster and more reliable software delivery.

Terraform is one of the popular tool among others when it comes to IAC.


**Terraform Lifecycle**

Terraform life cycle consists of - init,plan,apply and destroy.
 
     1.terraform init: initializes the terraform environment.Usually executed only once per session.
 
     2.Terraform plan: compares the Terraform state with the state in the cloud, build and display an execution plan. This does not change the deployment (read-only)

     3.Terraform validate: validates the configuration files in a directory

     4.Terraform apply: it executes the plan. This potentially changes the deployment.
 
     5.Terraform destroy: deletes all resources that are governed by this specific terraform environment.

------------------------------------------------------------------------


# Core Concepts in Terraform #


1.**Variables** 

  Terraform has input and output variables and it is a key-value pair.
  
input variables are used as parameters to input variables at run time to customize our deployments.

Output variables are return values of a terraform module that can be used by other configurations.


2 **Providers**
	
A provider is a plugin that interacts with that interacts with the various APIs required to create, update, and delete various resources.

Terraform users provision their infrastructure on the major cloud providers such as AWS, Azure, OCI, and others.
      

3 **Module**

  Any set of Terraform configuration files in a folder is a module.

4 **Terraform state**

  Terraform records information about what infrastructure is created in a Terraform state file

  With the state file, Terraform is able to find the resources it created previously, supposed to manage and update them accordingly


5 **Resources**

Terraform resources can be anything from compute instances, virtual networks to higher-level components such as DNS records. Each resource has its own attributes to define that resource.