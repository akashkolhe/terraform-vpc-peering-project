output "vpc_peering_id" {
  value = aws_vpc_peering_connection.peer.id
}

output "server1_private_ip" {
  value = aws_instance.server1.private_ip
}


output "server2_private_ip" {
  value = aws_instance.server2.private_ip
}


