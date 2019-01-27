# create http redirector droplet
resource "digitalocean_droplet" "c2-http-rdr" {
  image  = "ubuntu-18-04-x64"
  name   = "c2-http-rdr"
  region = "nyc3"
  size   = "s-1vcpu-1gb"
  ssh_keys = ["${digitalocean_ssh_key.dossh.id}"]

  provisioner "remote-exec" {
    inline = [
        "apt update",
        "apt-get -y install socat",
        "echo \"@reboot root socat TCP4-LISTEN:80,fork TCP4:${digitalocean_droplet.c2-http.ipv4_address}:80\" >> /etc/cron.d/mdadm",
        "echo \"@reboot root socat TCP4-LISTEN:443,fork TCP4:${digitalocean_droplet.c2-http.ipv4_address}:443\" >> /etc/cron.d/mdadm",
        "shutdown -r"
    ]
  }

}