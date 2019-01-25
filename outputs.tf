
output "payload-rdr" {
  value = [
    "Payload ${cloudflare_record.payload-a1.name}.${var.domain-c2} - ${digitalocean_droplet.payload.ipv4_address}", 
    "Payload redirector ${digitalocean_record.payload-rdr-a0.name}${var.domain-rdir} - ${digitalocean_droplet.payload-rdr.ipv4_address}", 
    "Payload redirector ${digitalocean_record.payload-rdr-a1.name}.${var.domain-rdir} - ${digitalocean_droplet.payload-rdr.ipv4_address}", 
    "Mail redirector ${digitalocean_record.payload-rdr-mail-a1.name}.${var.domain-rdir} - ${digitalocean_droplet.payload-rdr.ipv4_address}",
    "To finalise the infrastructure, run ./finalize.sh and update the DNS DKIM in DigitalOcean for ${var.domain-rdir} which the script will provide."
    ]
}