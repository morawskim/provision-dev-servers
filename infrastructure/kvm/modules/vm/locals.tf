locals {
  distribution_map = {
    "ubuntu-20-lts": {
      iso: "https://cloud-images.ubuntu.com/focal/current/focal-server-cloudimg-amd64.img",
    },
    "ubuntu-22-lts": {
      iso: "https://cloud-images.ubuntu.com/jammy/current/jammy-server-cloudimg-amd64.img",
    },
  }
}
