variable "domain" {
  description = "The domain name to manage as a DigitalOcean DNS zone."
  type        = string
}

variable "records" {
  description = <<-EOT
    Flat list of DNS records - one DigitalOcean record per entry. Same list
    shape as terraform-azure-dns-zone's `records` variable, so one domain's
    record data can drive both modules without translation. FQDN-style
    values (CNAME, MX, NS targets) must include the trailing dot, matching
    what Azure's provider already expects.
  EOT
  type = list(object({
    type     = string           # A, AAAA, CNAME, MX, TXT, or NS
    name     = string           # record name relative to the zone apex, "@" for apex
    value    = string           # target: IP, CNAME/MX target, TXT content, or NS hostname
    ttl      = optional(number, 3600)
    priority = optional(number) # required for MX, ignored otherwise
  }))
  default = []
}
