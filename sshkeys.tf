resource "digitalocean_ssh_key" "dossh" {
    name = "home-kali"
    public_key = "${file("${var.sshkeyFile}")}"
}