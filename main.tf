provider "aws" {
  region = "us-east-1"
}

module "eks_cluster" {
  source            = "terraform-aws-modules/eks/aws"
  cluster_name      = "my-eks-cluster"
  cluster_version   = "1.21"
  subnets           = ["subnet-12345678", "subnet-23456789"]  # Specify subnets
  vpc_id            = "vpc-12345678"  # Specify VPC ID
  node_groups       = {
    eks_nodes = {
      desired_capacity = 2
      instance_type    = "t2.micro"
    }
  }
}
