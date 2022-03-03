## terraform-aws-rds-cloudwatch-alarms 

#### Description 
Versus App project has MySQL RDS databases deployed in a multiple environment, one being dev and the other production. This tickets deliverable is to create CloudWatch Alarms that monitor CPUUtilization of Versus db instances and send them to the specified SNS topic. Below diagram is to give you a visual representation of this task.

![rds](https://user-images.githubusercontent.com/94807170/156095603-2ab09417-b35d-4519-ae35-052ad8e29eb2.png)

#### Instructions on how to create an AWS RDS CloudWatch alarm in Terraform 
- Create an alarm and hook it up to specific metric filter. 
- Define the alarm resource. 
- Name the alarm and provide the name of the metric filter, in our case it is CPUUtilization.
- Specify a threshold, a statistic, a period, an evaluation preiod, and a comparison operator to determine when the metric should receive a datapoint. 
The period is the number of seconds that the statistic should be applied over, and the evaluation period tells the alarm after how many periods the data should be compared to the threshold.
- Provide the namespace. In this case namespace is AWS/RDS. 
Providing namespace is necessary, as metrics in AWS are grouped first by namespaces. To find out more information on the namespaces click here.
- Set alarm actions. 
Alarm actions are a list of actions to be performed when the alarm is triggered. They may be listed as ARNs, or Amazon Resource Names. In this task, an SNS ARN is passed as the resulting action.
The biggest thing to note here is the dimensions, where we specify the DBInstanceIdentifier that would point to our db_instance, which we need to have the alarm set for. We can filter Amazon RDS metrics data by using any dimension in the following table.

<img width="978" alt="Screen Shot 2022-02-19 at 10 37 14 PM" src="https://user-images.githubusercontent.com/94807170/156095777-c24fdaca-3126-4ed6-ba97-1a7b7077807a.png">

Reference AWS documentation found [here](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/dimensions.html)

The alarm changes from OK to ALARM state when the average CPU use of an db instance exceeds 80 % in 1 evaluation period that lasts 120 seconds and sends a notification using Amazon SNS Topic when the alarm changes state from OK to ALARM.

<img width="755" alt="Screen Shot 2022-02-20 at 12 22 40 AM" src="https://user-images.githubusercontent.com/94807170/156095974-1e801f8d-fcb8-48ae-b516-5a03abf5bcf4.png">

This configuration example is hardcoded for demonstrative purposes. Actual task configuration files use input variables.

For additional information on aws cloudwatch metric alarms, check out this [terraform documentation](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_alarm)

#### Terraform best practices 

- Use Terraform modules 
Terraform makes it easier to grow our infrastructure and keep its configuration clean. But, as the infrastructure grows, a single directory becomes hard to manage. That’s where Terraform modules come in. Terraform module is a collection of standard configuration files in a dedicated directory, where we are able to group our resources together and reuse this group later, possibly many times.

##### Useful links: 

###### [Terraform Module Blocks](https://www.terraform.io/language/modules/syntax)

###### [Terraform Module Registry](https://registry.terraform.io/browse/modules)

###### [Terraform AWS Modules](https://registry.terraform.io/namespaces/terraform-aws-modules)

###### [Terraform Best Practices](https://www.terraform-best-practices.com)

- Isolate environment 
It's a Terraform best practice to isolate different environments like staging, dev or production. Sure it sounds easy to create a configuration file and share it to all (dev/qa/prod) environments. However, it is not recommended approach. It is best to create resources with different name for each environment and each resource in their respective directories, as it helps us to stay organized and makes it easier to implement changes to our infrastructure at any point. In this task, dev and production configuration files are isolated from each other in different directories. See tree structure below:

<img width="332" alt="Screen Shot 2022-03-01 at 4 06 45 PM" src="https://user-images.githubusercontent.com/94807170/156259478-e8558c05-2c6a-4f97-b62b-e05dc214ce67.png">

- Avoid hardcoding, use variables
- 
###### A sample:
<img width="513" alt="Screen Shot 2022-02-28 at 9 28 42 PM" src="https://user-images.githubusercontent.com/94807170/156099506-11d478bc-5acb-4d4f-9b8a-b2cfbb1e6b0f.png">

###### Other Terraform best practices utilized in this task: 

- Use [consistent file structure](https://www.terraform-best-practices.com/code-structure) within the project 
- Use consistent [naming convention](https://www.terraform.io/plugin/sdkv2/best-practices/naming)
- Use consistent [format and style](https://www.terraform-best-practices.com/code-styling)
- Generate [README](https://www.terraform.io/language/modules/develop/structure) for your modules

