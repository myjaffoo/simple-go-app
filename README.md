# simple-go-app
Build AWS infrastructure and deploy a simple go application with Terraform

### pre-requisites ###
* terraform binary installed on workstation
* AWS sandbox environment (Free Tier AWS account)

### vpc ###
The `vpc` module is a blueprint/pattern. It builds the following AWS resources:
* one VPC 
* one Internet Gateway and adds a route in the default route table of the new VPC for all requests outside the vpc to go via the internet gateway 
* three Public Subnets; one in each Availability Zone

### app-server ###
The `app-server` module sources the `vpc` module and builds the following additional AWS resources:
* one Auto Scaling Group with a minimum of 2 and maximum of 2 instances
* one ELB which proxies and load balances requests to the instances in the ASG
* one ELB security group allowing ingress on 8080 from anywhere
* one EC2 instance security group allowing ingress on 8484 from the ELB

## usage ##
Prior to cloning this source code and running terraform plan or apply, you need to provide AWS credentials and the region 
where you are are provisioning the infrastructure to the Terraform aws provider. 

This can be done either by exporting them as environment variables in your shell e.g.
```
$ export AWS_DEFAULT_REGION=eu-west-1
$ export AWS_ACCESS_KEY_ID=xxxxx
$ export AWS_SECRET_ACCESS_KEY=xxxxx

$ git clone https://github.com/yas360/simple-go-app.git
$ cd app-server
$ terraform plan
$ terraform apply
```
OR 

passing them as command line variables when running terraform plan or apply e.g.
```
$ git clone https://github.com/yas360/simple-go-app.git
$ cd app-server
$ terraform plan -var region=eu-west-1 -var access_key=xxxxx -var secret_key=xxxxx
$ terraform apply
```
There are other ways of providing AWS credentials for authentications - see [here](https://www.terraform.io/docs/providers/aws/#authentication)

## access the application ##
Open a web browser and go to this URL:
```
http://${elb_dns_name}:8080
```

## screenshot ##
If it works, it should look this:
![alt text](https://github.com/yas360/simple-go-app/blob/master/images/go-web-app.png "Go app screenshot")