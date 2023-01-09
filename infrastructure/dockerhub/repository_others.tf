resource "dockerhub_repository" "up_to_date_exporter" {
  name        = "up-to-date-exporter"
  namespace   = "morawskim"
  description = "Monitor the versions of the docker images, github releases and github tags."
  full_description = ""
}

resource "dockerhub_repository" "packtpub_free_learning" {
  name        = "packtpub-free-learning"
  namespace   = "morawskim"
  description = "Extract a title of daily free Packt Publishing eBook and send notification to rocket chat"
  full_description = <<-EOT
    This app downloads the title and cover of packtpub's free book.
    Uses the `puppeteer` package to control google-chrome in headless mode.
    It sends the downloaded information to the chat system (rocketchat) via the `axios` library. Integration with rocketchat involves the use of webhooks (incoming integration).
  EOT
}
