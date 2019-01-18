# configure http c2 firewall
resource "digitalocean_firewall" "c2-http" {
    name = "c2-http"

    droplet_ids = [
        "${digitalocean_droplet.c2-http.id}", 
        "${digitalocean_droplet.c2-http-rdr.id}",
        "${digitalocean_droplet.payload.id}",
        "${digitalocean_droplet.payload-rdr.id}"        
        ]

    inbound_rule = [
    {
        protocol = "tcp"
        port_range = "22"
        source_addresses = ["${var.operator-ip}"]
    },
    {
        protocol = "tcp"
        port_range = "80"
        source_addresses = ["0.0.0.0/0"]
    },
    {
        protocol = "tcp"
        port_range = "443"
        source_addresses = ["0.0.0.0/0"]
    }
    ]

    outbound_rule = [
    {
        protocol = "udp"
        port_range = "53"
        destination_addresses = ["0.0.0.0/0"]
    },
    {
        protocol = "tcp"
        port_range = "80"
        destination_addresses = ["0.0.0.0/0"]
    },
    {
        protocol = "tcp"
        port_range = "443"
        destination_addresses = ["0.0.0.0/0"]
    }
    ]
}

resource "digitalocean_firewall" "operator-access" {
    name = "teamserver-operator"

    droplet_ids = ["${digitalocean_droplet.c2-http.id}", "${digitalocean_droplet.payload.id}"]

    inbound_rule = [
    {
        protocol = "tcp"
        port_range = "50050"
        source_addresses = ["${var.operator-ip}"]
        
    }
    ]
}