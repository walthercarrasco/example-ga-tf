variable "sshkey" {
  description = "Public SSH key for EC2 instance access"
  type        = string
  sensitive   = true
} 