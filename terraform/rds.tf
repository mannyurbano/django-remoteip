resource "aws_db_instance" "postgres-db" {
  allocated_storage    = 20
  storage_type         = "gp2"
  engine               = "PostgreSQL"
  engine_version       = "12.4"
  instance_class       = "db.t3.micro"
  name                 = "mydb"
  username             = "foo"
  password             = "foobarbaz"
  parameter_group_name = "default.postgres12"
  db_subnet_group_name = "private-db"
}

resource "aws_db_subnet_group" "private-db" {
  name       = "private-db"
  subnet_ids = [aws_subnet.main-private-1.id, aws_subnet.main-private-2.id]

  tags = {
    Name = "private-db"
  }
}
