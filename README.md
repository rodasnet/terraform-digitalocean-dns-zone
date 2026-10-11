# terraform-digitalocean-dns-zone

Creates a DigitalOcean DNS zone and its records from a flat, provider-agnostic
record list - the same list shape consumed by
[`terraform-azure-dns-zone`](https://github.com/rodasnet/terraform-azure-dns-zone),
so one domain's record data can drive a primary Azure zone and a standby
DigitalOcean zone without translation.

## Usage

```hcl
module "rodasnet_com_standby" {
  source  = "app.terraform.io/rodasnet/dns-zone/digitalocean"
  version = "~> 1.0"

  domain = "rodasnet.com"

  records = [
    { type = "A", name = "@", value = "164.90.146.223" },
    { type = "MX", name = "@", value = "rodasnet-com.mail.protection.outlook.com.", priority = 0 },
    { type = "TXT", name = "@", value = "v=spf1 include:spf.protection.outlook.com -all" },
  ]
}
```

<!-- terraform-docs markers below - BEGIN_TF_DOCS/END_TF_DOCS populated by
     the terraform_docs pre-commit hook, not written by hand. -->
