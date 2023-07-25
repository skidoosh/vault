path "secret/{{identity.entity.name}}/*" {
  capabilities = [ "create", "read", "update", "patch", "delete", "list" ]
}

path "auth/token/create" {
  capabilities = ["create", "update"]
}

path "auth/token/lookup" {
  capabilities = ["create", "update"]
}

path "auth/token/renew" {
  capabilities = ["create", "update"]
}

path "auth/userpass/users/{{identity.entity.name}}" {
  capabilities = [ "update" ]
  allowed_parameters = {
    "password" = []
  }
}