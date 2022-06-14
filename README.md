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

![App Screenshot](data:image/png;base64,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)

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





