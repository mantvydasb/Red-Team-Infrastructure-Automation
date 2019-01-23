# # DNS configuration

# # c2 http redirector
# resource "cloudflare_record" "c2-http-rdr-a1" {
#     domain = "${var.domain-rdir}"
#     name   = "${var.sub1}"
#     value  = "${digitalocean_droplet.c2-http-rdr.ipv4_address}"
#     type   = "A"
#     ttl    = 120
# }
# resource "cloudflare_record" "c2-http-rdr-a2" {
#     domain = "${var.domain-rdir}"
#     name   = "${var.sub2}"
#     value  = "${digitalocean_droplet.c2-http-rdr.ipv4_address}"
#     type   = "A"
#     ttl    = 120
# }

# # c2 teamserver
# resource "cloudflare_record" "c2-http-a1" {
#     domain = "${var.domain-c2}"
#     name   = "${var.sub3}"
#     value  = "${digitalocean_droplet.c2-http.ipv4_address}"
#     type   = "A"
#     ttl    = 120
# }
# resource "cloudflare_record" "c2-http-a2" {
#     domain = "${var.domain-c2}"
#     name   = "${var.sub4}"
#     value  = "${digitalocean_droplet.c2-http.ipv4_address}"
#     type   = "A"
#     ttl    = 120
# }

# payload redirector
resource "digitalocean_record" "payload-rdr-a0" {
    domain = "${var.domain-rdir}"
    name   = "@"
    value  = "${digitalocean_droplet.payload-rdr.ipv4_address}"
    type   = "A"
    ttl    = 60
}

resource "digitalocean_record" "payload-rdr-a1" {
    domain = "${var.domain-rdir}"
    name   = "${var.sub6}"
    value  = "${digitalocean_droplet.payload-rdr.ipv4_address}"
    type   = "A"
    ttl    = 60
}

# mail records
resource "digitalocean_record" "payload-rdr-mail-a1" {
    domain = "${var.domain-rdir}"
    name   = "mail"
    value  = "${digitalocean_droplet.payload-rdr.ipv4_address}"
    type   = "A"
    ttl    = 60
}
resource "digitalocean_record" "payload-rdr-mail-mx" {
    domain = "${var.domain-rdir}"
    name   = "@"
    value  = "mail.${var.domain-rdir}."
    type   = "MX"
    priority = 5
    ttl    = 60
}

# spf record for smtp relay
resource "digitalocean_record" "payload-rdr-mail-spf" {
    domain = "${var.domain-rdir}"
    name   = "@"
    value  = "v=spf1 ip4:${digitalocean_droplet.payload-rdr.ipv4_address} include:_spf.google.com ~all"
    type   = "TXT"
    ttl    = 60
}
# dkim record for smtp relay
resource "digitalocean_record" "payload-rdr-mail-dkim" {
    domain = "${var.domain-rdir}"
    name   = "mail._domainkey"
    value  = "changeme from /etc/opendkim/keys/dkim.txt"
    type   = "TXT"
    ttl    = 1
}
# dmarc record for smtp relay
resource "digitalocean_record" "payload-rdr-mail-dmarc" {
    domain = "${var.domain-rdir}"
    name   = "_dmarc"
    value  = "v=DMARC1; p=reject"
    type   = "TXT"
    ttl    = 1
}

# payload server
resource "cloudflare_record" "payload-a1" {
    domain = "${var.domain-c2}"
    name   = "${var.sub6}"
    value  = "${digitalocean_droplet.payload.ipv4_address}"
    type   = "A"
    ttl    = 120
}
