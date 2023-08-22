output "vpc_id" {
  description = "List of IDs of instances"
  value       = ["${aws_vpc.default.id}"]
}

output "internet_gateway" {
  description = "List of availability zones of instances"
  value       = ["${aws_internet_gateway.default.id}"]
}