# create payload redirector droplet
resource "digitalocean_droplet" "payload-rdr" {
  image  = "ubuntu-18-04-x64"
  name   = "payload-rdr"
  region = "nyc3"
  size   = "s-1vcpu-1gb"
  ssh_keys = ["${digitalocean_ssh_key.dossh.id}"]

  provisioner "remote-exec" {
    inline = [
      "export DEBIAN_FRONTEND=noninteractive; apt update && apt-get -y -qq install apache2",      
      "a2enmod rewrite proxy proxy_http && service apache2 restart"
    ]
  }
  provisioner "file" {
    source = "./configs/.htaccess"
    destination = "/var/www/html/.htaccess"
  }
  provisioner "file" {
    source = "./configs/apache2.conf"
    destination = "/etc/apache2/apache2.conf"
  }
  provisioner "remote-exec" {
    inline = [
      "chmod 644 /var/www/html/.htaccess"
    ]
  }
  provisioner "remote-exec" {
    inline = [
      "a2enmod rewrite proxy proxy_http && service apache2 restart"
    ]
  }
}
