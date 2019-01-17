# create http redirector droplet
resource "digitalocean_droplet" "redir-http" {
  image  = "ubuntu-18-04-x64"
  name   = "redir-http"
  region = "nyc3"
  size   = "s-1vcpu-1gb"
  ssh_keys = ["${digitalocean_ssh_key.dossh.id}"]
}


# configure http c2 firewall
# resource "digitalocean_firewall" "redir-http" {
#     name = "redir-http"

#     droplet_ids = ["${digitalocean_droplet.redir-http.id}"]

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