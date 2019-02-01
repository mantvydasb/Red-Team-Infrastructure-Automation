# c2 redirector A #1
resource "digitalocean_record" "c2-http-rdr-a1" {
    domain = "${var.domain-rdir}"
    name   = "${var.sub1}"
    value  = "${digitalocean_droplet.c2-http-rdr.ipv4_address}"
    type   = "A"
    ttl    = 6020
}
# c2 redirector A #2
resource "digitalocean_record" "c2-http-rdr-a2" {
    domain = "${var.domain-rdir}"
    name   = "${var.sub2}"
    value  = "${digitalocean_droplet.c2-http-rdr.ipv4_address}"
    type   = "A"
    ttl    = 6020
}

# c2 http A #2
resource "cloudflare_record" "c2-http-a1" {
    domain = "${var.domain-c2}"
    name   = "${var.sub3}"
    value  = "${digitalocean_droplet.c2-http.ipv4_address}"
    type   = "A"
    ttl    = 6020
}
# c2 http A #2
resource "cloudflare_record" "c2-http-a2" {
    domain = "${var.domain-c2}"
    name   = "${var.sub4}"
    value  = "${digitalocean_droplet.c2-http.ipv4_address}"
    type   = "A"
    ttl    = 6020
}



# phishing redirector A #1
resource "digitalocean_record" "phishing-rdr-a0" {
    domain = "${var.domain-rdir}"
    name   = "@"
    value  = "${digitalocean_droplet.phishing-rdr.ipv4_address}"
    type   = "A"
    ttl    = 60
}
# phishing redirector A #3
resource "digitalocean_record" "phishing-rdr-a1" {
    domain = "${var.domain-rdir}"
    name   = "${var.sub6}"
    value  = "${digitalocean_droplet.phishing-rdr.ipv4_address}"
    type   = "A"
    ttl    = 60
}



# mail relay A
resource "digitalocean_record" "phishing-rdr-mail-a1" {
    domain = "${var.domain-rdir}"
    name   = "mail"
    value  = "${digitalocean_droplet.phishing-rdr.ipv4_address}"
    type   = "A"
    ttl    = 60
}
# mail relay MX
resource "digitalocean_record" "phishing-rdr-mail-mx" {
    domain = "${var.domain-rdir}"
    name   = "@"
    value  = "mail.${var.domain-rdir}."
    type   = "MX"
    priority = 5
    ttl    = 60
}
# mail relay TXT SPF
resource "digitalocean_record" "phishing-rdr-mail-spf" {
    domain = "${var.domain-rdir}"
    name   = "@"
    value  = "v=spf1 ip4:${digitalocean_droplet.phishing-rdr.ipv4_address} include:_spf.google.com ~all"
    type   = "TXT"
    ttl    = 60
}
# mail relay TXT DKIM placeholder
resource "digitalocean_record" "phishing-rdr-mail-dkim" {
    domain = "${var.domain-rdir}"
    name   = "mail._domainkey"
    value  = "I am DKIM, but change me with the DKIM provided by finalize.sh"
    type   = "TXT"
    ttl    = 60
}
# mail relay TXT DMARC
resource "digitalocean_record" "phishing-rdr-mail-dmarc" {
    domain = "${var.domain-rdir}"
    name   = "_dmarc"
    value  = "v=DMARC1; p=reject"
    type   = "TXT"
    ttl    = 60
}



# phishing server
resource "cloudflare_record" "phishing-a1" {
    domain = "${var.domain-c2}"
    name   = "${var.sub6}"
    value  = "${digitalocean_droplet.phishing.ipv4_address}"
    type   = "A"
    ttl    = 120
}
