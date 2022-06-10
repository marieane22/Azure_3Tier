# Azure_3Tier
Build terraform module for a Three-Tier application on Azure




What is a 3 Tier Architecture?
![App Screenshot](https://miro.medium.com/max/1172/1*bouN90irlMNJe27impg9rg.png)
Three-tier architecture is a well-established software application architecture that organizes applications into three logical and physical computing tiers: the presentation tier, or user interface; the application tier, where data is processed; and the data tier, where the data associated with the application is stored and managed.

The chief benefit of three-tier architecture is that because each tier runs on its own infrastructure, each tier can be developed simultaneously by a separate development team, and can be updated or scaled as needed without impacting the other tiers.

What is Terraform?
![App Screenshot](https://miro.medium.com/max/600/1*zWzLpuZEFoazW13D24dMkw.png)

Terraform is an open-source infrastructure as code (IaC) software tool that provides a consistent CLI workflow to manage hundreds of cloud services. Terraform codifies cloud APIs into declarative configuration files.

What are Terraform modules?

![App Screenshot](https://miro.medium.com/max/1156/1*3mb57U8UtB9XA0mckjF2ZA.png)

A Terraform module is a set of Terraform configuration files in a single directory. Even a simple configuration consisting of a single directory with one or more .tf files is a module. When you run Terraform commands directly from such a directory, it is considered the root module. A Terraform module (usually the root module of a configuration) can call other modules to include their resources into the configuration. A module that has been called by another module is often referred to as a child module.

What is Terraform Cloud?
![App Screenshot](https://miro.medium.com/max/1034/1*MU2Q9QT9TG4etOQ_Zkl9Vw.png)

Terraform Cloud is an application that helps teams use Terraform together. It manages Terraform runs in a consistent and reliable environment, and includes easy access to shared state and secret data, access controls for approving changes to infrastructure, a private registry for sharing Terraform modules, detailed policy controls for governing the contents of Terraform configurations, and more.

What is Microsoft Azure?

![App Screenshot](https://swimburger.net/media/fbqnp2ie/azure.svg)

Azure is a cloud computing platform and an online portal that allows you to access and manage cloud services and resources provided by Microsoft. These services and resources include storing your data and transforming it, depending on your requirements. To get access to these resources and services, all you need to have is an active internet connection and the ability to connect to the Azure portal.




In this scenario we are being tasked with the following:

Step1 
  
1 VNET 

3 public subnets 

This module should be able to create resource group. Once the VPC module is
ready, please release. Release the module on terraform registry. 
 
 
Step2 

On top of VPC from previous step, please create Linux Scale Set  Linux Scale Set
should use minimum 1 instance.  This Linux Scale Set should create its own
Traffic Manager that is accessible from the internet.  
 
 
Step3 

Create Azure MySQL to use with wordpress autoscaling group.

![App Screenshot](https://storage.googleapis.com/blogs-images/ciscoblogs/1/2020/07/Figure1.png)

        Above figure shows a three-tier architecture for web applications. This architecture has a presentation layer (web tier), an application layer (app tier), and a database layer (database tier). Azure has a shared security model, i.e., the customers are still responsible for protecting workloads, applications, and data.

Prerequisites:

    Azure account
    Github account
    Git
    Terraform
    Terraform Cloud account
    Your preferred IDE (i.e. Visual Studio Code)

A great reference book is Chapter 4 of Scott Winkler’s book “Terraform in Action” 

For the solution, we have created and used five modules:

    1.	resourcegroup - creating resourcegroup
    2.	networking - creating azure virtual network and required subnets
    3.	securitygroup - creating network security group, setting desired security rules and associating them to subnets
    4.	compute - creating availability sets, network interfaces and virtual machines
    5.	database - creating database server and database
![App Screenshot](https://github.com/ukponoobott/azure-3-tier-architecture/raw/main/images/modules.png)



All the stacks are placed in the modules folder and the variable are stored under terraform.tfvars
To run the code you need to append the variables in the terraform.tfvars
Each module consists minimum two files: main.tf, vars.tf
Resource group and networking modules consists of one extra file named output.tf

Deployment. 
Steps

    Step 0 terraform init
used to initialize a working directory containing Terraform configuration files
     
    Step 1 terraform plan
used to create an execution plan
    
    Step 2 terraform validate
validates the configuration files in a directory, referring only to the configuration and not accessing any remote services such as remote state, provider APIs, etc
    
    Step 3 terraform apply




