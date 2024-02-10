provider "aws" {
    region = "us-east-1"
}

provider "vault" {
    address = "http://3.83.120.0:8200"
    skip_child_token = true
    
    auth_login {
        path = "auth/approle/login"
        
        parameters = {
        role_id = "<>"
        secret_id = "<>"
    }
  }
}

data "vault_kv_secret_v2" "example" {
    mount = "secret" // change value accordingly
    name  = "test-secret" // change value accordingly
}

resource "aws_instance" "my_instance" {
    ami           = "ami-053b0d53c279acc90"
    instance_type = "t2.micro"

    tags = {
        Secret = data.vault_kv_secret_v2.example.data["username"]
  }
}
