# this is a sample variables file.

# tokens, api keys
variable "do-token" {
    default = "yourdigitaloceantoken" }

variable "cf-token" {
    default = "yourcloudflaretoken" }

variable "cf-email" {
    default = "xxx@xxx.com" }

# operator IPs
variable "operator-ip" {
    default = "aaa.bbb.ccc.ddd" }

# ssh keys
variable "ssh-public-key" {
    default = "/root/.ssh/id_rsa.pub" }

# domains & subdomains
variable "domain-rdir" {
    default = "example.com" }

variable "domain-c2" {
    default = "example.net" }

variable "sub1" {
    default = "static" }

variable "sub2" {
    default = "ads" }

variable "sub3" {
    default = "js" }

variable "sub4" {
    default = "css" }

variable "sub5" {
    default = "apple" }

variable "sub6" {
    default = "login" }
    
variable "cspw" {
    default = "somecrazystrongpasswordgoesherelel" }
