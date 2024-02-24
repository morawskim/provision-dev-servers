resource "dockerhub_repository" "opensuse_leap_kde5_devel" {
  name        = "opensuse-leap-kde5-devel"
  namespace   = "morawskim"
  description = "KDE development environment in docker for opensuse leap"
  full_description = ""
}

resource "dockerhub_repository" "opensuse_leap_kde5" {
  name        = "opensuse-leap-kde5"
  namespace   = "morawskim"
  description = "KDE environment in docker for opensuse leap"
  full_description = ""
}

resource "dockerhub_repository" "jsonplaceholder" {
  name        = "jsonplaceholder"
  namespace   = "morawskim"
  description = "JSONPlaceholder is a simple fake REST API for testing and prototyping"
  full_description = <<-EOT
  # JSONPlaceholder

  [JSONPlaceholder](https://jsonplaceholder.typicode.com) is a simple fake REST API for testing and prototyping.

  It's like an [image placeholder](http://placehold.it/) but for web developers.

  JSONPlaceholder is powered by [JSON Server](https://github.com/typicode/json-server).
  EOT
}

resource "dockerhub_repository" "lorem_space_backend" {
  name        = "lorem-space-backend"
  namespace   = "morawskim"
  description = "lorem.space - placeholder images but useful!"
  full_description = <<-EOT
  # Backend service for https://lorem.space/

  [Lorem.space](https://lorem.space/) is API for placeholder images.

  The difference between this image and [official image](https://github.com/manasky/lorem-server) is very little.
  This image contains one photo, which the backend api can returns.
  This allows to test integration with self-hosted lorem.space for example in package [faker-images](https://github.com/morawskim/faker-images).
  In lorem.space project exists open task [to share image collection](https://github.com/manasky/lorem.space/issues/9).
  When that task will be resolve the shared photos will be added to this container image.
  EOT
}

resource "dockerhub_repository" "restic" {
  name        = "restic-aws-backup"
  namespace   = "morawskim"
  description = "Tools to create backup of mysql and store it in AWS S3"
  full_description = <<-EOT
  # Restic AWS backup

  The image contains following tools:
  * mysqldump
  * restic
  * pigz
  * awscli

  All these tools are helpful to create backups of MySQL database and store it in AWS S3.

  Additional a bash script `aws-assume-role.sh` exists which helps retrieve temporary AWS credentials.
  Usage `aws-assume-role.sh AWS_ROLE_ARN AWS_ROLE_SESSION_NAME -- restic-command-with-arguments`
  EOT
}

resource "dockerhub_repository" "swaks" {
  name        = "swaks"
  namespace   = "morawskim"
  description = "Swaks - Swiss Army Knife for SMTP"
  full_description = <<-EOT
  # Swaks - Swiss Army Knife for SMTP

  Swaks is a featureful, flexible, scriptable, transaction-oriented SMTP test tool written and maintained by [John Jetmore](https://jetmore.org/john/).  It is free to use and licensed under the GNU GPLv2. Features include:

  * SMTP extensions including TLS, authentication, pipelining, PROXY, PRDR, and XCLIENT
  * Protocols including SMTP, ESMTP, and LMTP
  * Transports including UNIX-domain sockets, internet-domain sockets (IPv4 and IPv6), and pipes to spawned processes
  * Completely scriptable configuration, with option specification via environment variables, configuration files, and command line

  The official project page is [https://jetmore.org/john/code/swaks/](https://jetmore.org/john/code/swaks/).

  The image is build via packer. The source code can be found [here](https://github.com/morawskim/packer-images).
  EOT
}
