provider "digitalocean" {
    token = "${var.do-token}"
}

provider "cloudflare" {
    email = "${var.cf-email}"
    token = "${var.cf-token}"
}
