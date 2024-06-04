resource "aws_vpc_peering_connection" "peering" {

    count = var.is_peering_required ? 1 :0
    vpc_id = aws_vpc.main.id  ## Requestor VPC
    peer_vpc_id = var.acceptor_vpc == "" ? data.aws_vpc.default.id  : var.acceptor_vpc.id
    auto_accept = var.acceptor_vpc == "" ? true : false

    tags = merge(

        var.common_tags,
        var.vpc_peering_tags,
        {
            Name = "${local.resource_name}"
        }
    )



}


## count is useful to control when resource required
resource "aws_route" "public_peering_route" {

    count = var.is_peering_required && var.acceptor_vpc == "" ? 1 :0
    route_table_id = aws_route_table.public.id
    destination_cidr_block = data.aws_vpc.default.cidr_block
    vpc_peering_connection_id = aws_vpc_peering_connection.peering[0].id
  
}

resource "aws_route" "private_peering_" {

    count = var.is_peering_required && var.acceptor_vpc == "" ? 1 :0
    route_table_id = aws_route_table.private.id
    destination_cidr_block = data.aws_vpc.default.cidr_block
    vpc_peering_connection_id = aws_vpc_peering_connection.peering[0].id
  
}

resource "aws_route" "database_peering_" {

    count = var.is_peering_required && var.acceptor_vpc == "" ? 1 :0
    route_table_id = aws_route_table.database.id
    destination_cidr_block = data.aws_vpc.default.cidr_block
    vpc_peering_connection_id = aws_vpc_peering_connection.peering[0].id
  
}

resource "aws_route" "default_vpc_peering_" {

    count = var.is_peering_required && var.acceptor_vpc == "" ? 1 :0
    route_table_id = data.aws_route_table.main.id # default vpc route table
    destination_cidr_block = var.cidr_block
    vpc_peering_connection_id = aws_vpc_peering_connection.peering[0].id
  
}