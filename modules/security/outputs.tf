output "sg_ids" {
  value = [aws_security_group.allow_http.id, aws_security_group.allow_https.id, aws_security_group.allow_ssh.id, aws_security_group.allow_egress.id]
  description = "List of IDs of all security groups created"
}