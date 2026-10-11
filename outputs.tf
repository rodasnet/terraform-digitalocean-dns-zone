output "domain_id" {
  value       = digitalocean_domain.zone.id
  description = "The ID of the DigitalOcean domain."
}

output "name_servers" {
  value       = ["ns1.digitalocean.com", "ns2.digitalocean.com", "ns3.digitalocean.com"]
  description = "DigitalOcean's standard name servers (fixed for every domain, not zone-specific) - point the registrar here to make DigitalOcean authoritative."
}
