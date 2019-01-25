
output "phishing-rdr" {
  value = [
    "phishing ${cloudflare_record.phishing-a1.name}.${var.domain-c2} - ${digitalocean_droplet.phishing.ipv4_address}", 
    "phishing redirector ${digitalocean_record.phishing-rdr-a0.name}${var.domain-rdir} - ${digitalocean_droplet.phishing-rdr.ipv4_address}", 
    "phishing redirector ${digitalocean_record.phishing-rdr-a1.name}.${var.domain-rdir} - ${digitalocean_droplet.phishing-rdr.ipv4_address}", 
    "Mail redirector ${digitalocean_record.phishing-rdr-mail-a1.name}.${var.domain-rdir} - ${digitalocean_droplet.phishing-rdr.ipv4_address}",
    "To finalise the infrastructure, run ./finalize.sh and update the DNS DKIM in DigitalOcean for ${var.domain-rdir} which the script will provide."
    ]
}