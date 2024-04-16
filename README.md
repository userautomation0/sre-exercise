# Exercise-spa

## Workflow
- Simple workflow which runs on update to any branch
- Deployment/Apply steps are not performed until a PR has been successfully merged.
- (More complicated branching strategy could be incorporated as required, ie only perform work flow if branch regex is met)
- Testing steps would be added into the workflow and be performed prior to any deployments
- Changes in the subdirectories are used to determine what workflows, jobs and steps are run

## Github 
Depends on AWS access key and secret being added into repository as secrets, OIDC and roles would have been better 

## For the terraform repositories :-
Default.tfvars where present should be changed to match the target environment

### Bootstrap :-
Should be run first to create the required terraform state backends
State/backend files must be changed to match the bucket created by bootstrap

### Backend :-
Provides an ECS cluster and service which is accessible behind an internal load balancer

### Frontend :-
Cloudfront distribution with an S3 origin serving a simple html page

### Pages :-
Extremely simple html document to be uploaded and served from S3