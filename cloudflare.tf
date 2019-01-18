# DNS configuration

# c2 http redirector
resource "cloudflare_record" "c2-http-rdr-a1" {
    domain = "${var.domain-rdir}"
    name   = "${var.sub1}"
    value  = "${digitalocean_droplet.c2-http-rdr.ipv4_address}"
    type   = "A"
    ttl    = 120
}
resource "cloudflare_record" "c2-http-rdr-a2" {
    domain = "${var.domain-rdir}"
    name   = "${var.sub2}"
    value  = "${digitalocean_droplet.c2-http-rdr.ipv4_address}"
    type   = "A"
    ttl    = 120
}

# c2 teamserver
resource "cloudflare_record" "c2-http-a1" {
    domain = "${var.domain-c2}"
    name   = "${var.sub3}"
    value  = "${digitalocean_droplet.c2-http.ipv4_address}"
    type   = "A"
    ttl    = 120
}
resource "cloudflare_record" "c2-http-a2" {
    domain = "${var.domain-c2}"
    name   = "${var.sub4}"
    value  = "${digitalocean_droplet.c2-http.ipv4_address}"
    type   = "A"
    ttl    = 120
}

# payload redirector
resource "cloudflare_record" "payload-rdr-a1" {
    domain = "${var.domain-rdir}"
    name   = "${var.sub6}"
    value  = "${digitalocean_droplet.payload-rdr.ipv4_address}"
    type   = "A"
    ttl    = 120
}

# payload server
resource "cloudflare_record" "payload-a1" {
    domain = "${var.domain-c2}"
    name   = "${var.sub6}"
    value  = "${digitalocean_droplet.payload.ipv4_address}"
    type   = "A"
    ttl    = 120
}
