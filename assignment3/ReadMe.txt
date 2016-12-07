This is high Availabilty Architecute with AWS Environment , I have not worked with "Active MQ" and Tomcat(in deep) so I am providing high Availability Architecture without Active MQ  , The Explaination is as below for this diagram

I am using "Auto Scaling with load balancing" technique in AWS, that means it load will distribute among two instances and these two instance will always up due to Autoscaling policy.

Used Services :

VPC (Virtual Private cloud)
R53
EC2 (Elastic compute Cloud) 
RDS (Relational Database Service)
AutoScaling
ELB (Elastic load balancer)
S3 (Simple storage Service)
Cloudfront


It will work as,

1- Request will come from  Route53 DNS service of AWS, then it will go Elastic loadbalancer which will use loadbalancing Algorithm for example "Round-Robin", and distribute load among instance.
2- Instances are in auto scaling group , it means we can define min number of running instance and maximum number of runing instance according to load , these instances will use same AMI (Amazon machine image) to run .
3- Here I am using Centralized storage with gluster configured , which will be mounted on AMI , the website code will be store here .
4- I am Using Multi A-Z Oracle RDS , which means there will be a backup server for RDS in different availibility zone , if primary database server will be down then secondary database will take position of primary.
5- For Static file storage , I am using S3 here , and also to deliver content near to client location, I am using Cloudfront CDN service of AWS.

