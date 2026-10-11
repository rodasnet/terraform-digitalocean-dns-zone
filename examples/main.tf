module "example" {
  source = "../"

  domain = "example.com"

  records = [
    { type = "A", name = "@", value = "203.0.113.10" },
    { type = "A", name = "dev", value = "203.0.113.11" },
    { type = "CNAME", name = "www", value = "example.com." },
    { type = "MX", name = "@", value = "mail.example.com.", priority = 10 },
    { type = "TXT", name = "@", value = "v=spf1 -all" },
  ]
}
