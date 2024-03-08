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

resource "aws_security_group" "grafana_instance" {
  name = "grafana_instance"

  # Allow SSH traffic on port 22
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "prometheus_instance" {
  name = "prometheus_instance"

  # Allow SSH traffic on port 22
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}