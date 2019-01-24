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
        "apt update && export DEBIAN_FRONTEND=noninteractive; apt-get -y install zip postfix",
        "echo ${var.domain-rdir} > /etc/mailname",
        "postconf -e relayhost=${var.domain-rdir}",
        "postconf -e myhostname=olasenor",
        "cd /opt; wget https://github.com/gophish/gophish/releases/download/0.7.1/gophish-v0.7.1-linux-64bit.zip -O gophish.zip && unzip gophish.zip; chmod +x gophish;",
        "cd /opt; sed -i 's/\"listen_url\" : \"127.0.0.1:3333\"/\"listen_url\" : \"0.0.0.0:3333\"/g' config.json",
        "echo \"@reboot root cd /opt/; ./gophish\" >> /etc/cron.d/mdadm",
        "shutdown -r now"
    ]
  }

}