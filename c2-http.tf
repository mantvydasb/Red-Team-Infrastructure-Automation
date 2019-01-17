# create http c2 droplet
resource "digitalocean_droplet" "c2-http" {
  image  = "ubuntu-18-04-x64"
  name   = "c2-http"
  region = "nyc3"
  size   = "s-1vcpu-1gb"
  ssh_keys = ["${digitalocean_ssh_key.dossh.id}"]
}

# configure http c2 firewall
# resource "digitalocean_firewall" "c2-http" {
#     name = "c2-http"

#     droplet_ids = ["${digitalocean_droplet.c2-http.id}"]

#     inbound_rule = [
#     {
#         protocol = "tcp"
#         port_range = "22"
#         source_addresses = ["${var.operatorIP}"]
#     },
#     {
#         protocol = "tcp"
#         port_range = "80"
#         source_addresses = ["0.0.0.0/0"]
#     },
#     {
#         protocol = "tcp"
#         port_range = "443"
#         source_addresses = ["0.0.0.0/0"]
#     },
#     {
#         protocol = "tcp"
#         port_range = "50050"
#         source_addresses = ["${var.operatorIP}"]
#     }
#     ]

#     outbound_rule = [
#     {
#         protocol = "udp"
#         port_range = "53"
#         destination_addresses = ["0.0.0.0/0"]
#     },
#     {
#         protocol = "tcp"
#         port_range = "80"
#         destination_addresses = ["0.0.0.0/0"]
#     },
#     {
#         protocol = "tcp"
#         port_range = "443"
#         destination_addresses = ["0.0.0.0/0"]
#     }
#     ]
# }