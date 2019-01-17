provider "digitalocean" {
    token = "${var.DigitalOceanToken}"
}

provider "cloudflare" {
    email = "${var.CloudFlareEmail}"
    token = "${var.CloudFlareToken}"
}
