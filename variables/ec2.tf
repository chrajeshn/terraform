resource "aws_instance" "db" {
    ami = var.image_id
    vpc_security_group_ids = [aws_security_group.allow_ssh.id]
    instance_type = var.instance_type
# Left side things are called as arguments, right side are values.
    tags = var.tags    
}

resource "allow_security_group" "allow_ssh" {
    name = var.sg_name
    description = var.sg_description

# This is block

    ingress{
        from_port = var.shh_port
        to_port = var.ssh_port
        protocol = var.protocol
        cidr_blocks = var.allowed_cidr
    }    

    egress{
        from_port = 0 # from 0 to 0 means, opening all protocoles
        to_port = 0
        protocol = -1 # -1 all proticols
        cidr_blocks = var.allowed_cidr
    }

    tags = {
        Name = "allow_ssh"
        CreatedBy = "Rajesh"
    }
}