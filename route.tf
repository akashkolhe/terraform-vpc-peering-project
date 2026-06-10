resource "aws_route_table" "rt1" {
  vpc_id = aws_vpc.vpc1.id
}



resource "aws_route_table" "rt2" {
  vpc_id = aws_vpc.vpc2.id
}


resource "aws_route" "internet1" {
  route_table_id         = aws_route_table.rt1.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw1.id
}


resource "aws_route" "internet2" {
  route_table_id         = aws_route_table.rt2.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw2.id
}


resource "aws_route_table_association" "assoc1" {
  subnet_id      = aws_subnet.subnet1.id
  route_table_id = aws_route_table.rt1.id
}

resource "aws_route_table_association" "assoc2" {
  subnet_id      = aws_subnet.subnet2.id
  route_table_id = aws_route_table.rt2.id
}

resource "aws_route" "peer_route1" {
  route_table_id            = aws_route_table.rt1.id
  destination_cidr_block    = var.vpc2_cidr
  vpc_peering_connection_id = aws_vpc_peering_connection.peer.id
}


resource "aws_route" "peer_route2" {
  route_table_id            = aws_route_table.rt2.id
  destination_cidr_block    = var.vpc1_cidr
  vpc_peering_connection_id = aws_vpc_peering_connection.peer.id
}

