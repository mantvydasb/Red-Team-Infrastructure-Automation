# create a payload droplet
resource "digitalocean_droplet" "payload" {
  image  = "ubuntu-18-04-x64"
  name   = "payload"
  region = "nyc3"
  size   = "s-1vcpu-1gb"
  ssh_keys = ["${digitalocean_ssh_key.dossh.id}"]

  provisioner "remote-exec" {
    inline = [
        # environment
        "apt update",
        "export DEBIAN_FRONTEND=noninteractive; apt-get -y install zip postfix",
        "echo ${var.domain-phish-from} > /etc/mailname",
        "sed -i 's/myhostname = ${digitalocean_droplet.payload.name}/myhostname = ${var.domain-phish-from}/' /etc/postfix/main.cf",
        "sed -i 's/relayhost = /relayhost = ${var.domain-rdir}/' /etc/postfix/main.cf",
        "cd /opt; wget https://github.com/gophish/gophish/releases/download/0.7.1/gophish-v0.7.1-linux-64bit.zip -O gophish.zip",
        "unzip gophish.zip; chmod +x gophish"
    ]
  }

}