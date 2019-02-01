# create http c2 droplet
resource "digitalocean_droplet" "c2-http" {
  image  = "ubuntu-18-04-x64"
  name   = "c2-http"
  region = "nyc3"
  size   = "s-1vcpu-1gb"
  ssh_keys = ["${digitalocean_ssh_key.dossh.id}"]

  provisioner "remote-exec" {
    inline = [
        "apt update",
        "apt-get -y install zip default-jre",
        "cd /opt; wget ${var.csDownloadUrl} -O cobaltstrike.zip",
        "echo \"@reboot root cd /opt/cobaltstrike/; ./teamserver ${digitalocean_droplet.c2-http.ipv4_address} ${var.cspw}\" >> /etc/cron.d/mdadm",
        "unzip -P ${var.cspw} cobaltstrike.zip && shutdown -r"
    ]
  }

}

