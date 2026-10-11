resource "digitalocean_record" "record" {
  for_each = { for idx, r in var.records : "${r.type}-${r.name}-${idx}" => r }

  domain   = digitalocean_domain.zone.name
  type     = each.value.type
  name     = each.value.name
  value    = each.value.value
  ttl      = each.value.ttl
  priority = each.value.priority
}
