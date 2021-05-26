# Create a Simple Amazon ECR Registry

## How to push to Registry

```aws ecr get-login-password --region <regions> | docker login --username AWS --password-stdin <accountid>.dkr.ecr.<region>.amazonaws.com```

```docker build -t <registry-name> .``

```docker tag <registry-name>:<tag> <accountid>.dkr.ecr.<region>.amazonaws.com/<registry-name>:<tag>```

```docker push <accountid>.dkr.ecr.<region>.amazonaws.com/<registry-name>:<tag>```