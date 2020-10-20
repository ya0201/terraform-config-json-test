variable instances {}

locals {
# ipアドレスのlist
  ips = flatten([for machines_in_az in values(var.instances): [for machine_map in machines_in_az: keys(machine_map)]])

# ipアドレスとazのペアのlist
  azs = transpose({for az, machines_in_az in var.instances: az => flatten([for machine_map in machines_in_az: keys(machine_map)])})

# instanceの個数(ipアドレスの個数)
  count = length(flatten(values(var.instances)))

# ipとhostnameの組み合わせのリストっぽいもの
  names = flatten(values(var.instances))
}

output "ips" {
  value = local.ips
}

output "azs" {
  value = local.azs
}

output "count" {
  value = local.count
}

output "names" {
  value = local.names
}
