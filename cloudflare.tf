resource "cloudflare_record" "redirector-http" {
    domain = "${var.domainRedirector}"
    name   = "${var.sub1}"
    value  = "${digitalocean_droplet.redir-http.ipv4_address}"
    type   = "A"
    ttl    = 120
}

resource "cloudflare_record" "c2-http" {
    domain = "${var.domainhttpc2}"
    name   = "${var.sub2}"
    value  = "${digitalocean_droplet.c2-http.ipv4_address}"
    type   = "A"
    ttl    = 120
}
