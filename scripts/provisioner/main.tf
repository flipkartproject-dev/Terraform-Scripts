resource "aws_instance" "my_instance" {

    ami = "ami-0a4a70bd98c6d6441"
    instance_type = "t2.micro"
    security_groups = [ aws_security_group.allow_ssh.name]
    
    tags = {
        Name = "my_instance"
    }

    key_name = "New_king"
    
    provisioner "local-exec" {
      command = "echo ${aws_instance.my_instance.private_ip} > private_ips.txt"

    }
    
    provisioner "local-exec" {
      command = "echo '<h1> hello Devi Prasad </h1>' > index.html"

    }
}

resource "aws_security_group" "allow_ssh" {
  name        = "allow_sshone"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
    ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_ssh"
  }
}
    


resource "aws_eip" "my_eip" {

    instance = aws_instance.my_instance.id
    vpc = true 
}

output "eip" {

    value = aws_eip.my_eip.public_ip
}


resource "null_resource" "ssh_instance" {

     connection {
            host = aws_eip.my_eip.public_ip
            type = "ssh"
            port = 22
            user = "ubuntu"
            private_key = file("/home/deviprasad/Downloads/New_king.pem")
            timeout = "1m" 
            agent = false
               } 

     provisioner "file"  {
             source = "index.html"
             destination = "/home/ubuntu/index.html"
            }

     provisioner "remote-exec" {
          inline = [
		"sudo apt update -y",
		"sudo apt install nginx -y",
		"sudo systemctl start nginx",
		"sudo systemctl enable nginx",
		"sudo cp /home/ubuntu/index.html /var/www/html/index.html",
		]
        }
}
