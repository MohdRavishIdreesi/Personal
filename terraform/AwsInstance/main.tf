data "aws_instances" "all" {}

data "aws_instance" "details" {
  for_each    = toset(data.aws_instances.all.ids)
  instance_id = each.value
}

output "instance_details" {
  value = {
    for id, inst in data.aws_instance.details :
    id => {
      instance_type = inst.instance_type
      private_ip    = inst.private_ip
      public_ip     = inst.public_ip
      name          = lookup(inst.tags, "Name", "NoName")
      state         = inst.instance_state
    }
  }
}
