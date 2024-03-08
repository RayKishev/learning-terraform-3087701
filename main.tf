provider "aws" {
  region = "us-west-2"
}

resource "aws_instance" "prometheus_instance" {
  ami           = "ami-08f7912c15ca96832"  # Specify AMI ID
  instance_type = "t2.micro"
  tags = {
    Name = "PrometheusInstance"
  }
}

resource "aws_instance" "grafana_instance" {
  ami           = "ami-08f7912c15ca96832"  # Specify AMI ID
  instance_type = "t2.micro"
  tags = {
    Name = "GrafanaInstance"
  }
}
