output "instance_ip_addr" {
  description = "The public IP address of the example instance"
  value = aws_instance.exampleinstance.public_ip
}

