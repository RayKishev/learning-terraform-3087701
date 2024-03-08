provider "aws" {
  region = "us-west-2"
}

module "eks_cluster" {
  source            = "terraform-aws-modules/eks/aws"
  cluster_name      = "my-eks-cluster"
  cluster_version   = "1.21"
  subnets           = ["subnet-abcde012", "subnet-bcde012a"]  # Specify subnets
  vpc_id            = "vpc-12345678"  # Specify VPC ID
  node_groups       = {
    eks_nodes = 1
      desired_capacity = 2
      instance_type    = "t2.micro"
    }
  }
}
