output "vpc_id" {
  value       = aws_vpc.sample_vpc.id
}

output "public_subnet_id" {
  value       = aws_subnet.public.id
}

output "private_subnet_id" {
  value       = aws_subnet.private.id
}

output "aws_internet_gateway_id" {
    value = aws_internet_gateway.new_igw.id
}
