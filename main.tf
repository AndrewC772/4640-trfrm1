terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}

# Set the variable value in *.tfvars file
# or using -var="do_token=..." CLI option
variable "do_token" {}

# Configure the DigitalOcean Provider
provider "digitalocean" {
  token = var.do_token
}

# data blocks contained here

#declare the ssh key
data "digitalocean_ssh_key" "lab_ssh_key" {
  name = "River"
  #name = "4640_Lab"
}

#declares the project name
data "digitalocean_project" "lab_project" {
  name = "4640_labs"
  #name = "BCIT_4640"
}

# resource blocks contained here

#Create a tag
resource "digitalocean_tag" "do_tag" {
  name = "Web"
}

#Create a new VPC
resource "digitalocean_vpc" "web_vpc" {
  name   = "web"
  region = "sfo3"
}

#Create a new VM
resource "digitalocean_droplet" "web" {
  image    = "rockylinux-9-x64"
  name     = "web-1"
  tags     = [digitalocean_tag.do_tag.id]
  region   = "sfo3"
  size     = "s-1vcpu-512mb-10gb"
  vpc_uuid = digitalocean_vpc.web_vpc.id
  ssh_keys = [data.digitalocean_ssh_key.lab_ssh_key.id]
}

# adds the droplet to an existing project
resource "digitalocean_project_resources" "project_attach" {
    project = data.digitalocean_project.lab_project.id
    resources = [
        digitalocean_droplet.web.urn
    ]
}

#
output "server_ip" {
    value = digitalocean_droplet.web.ipv4_address
}