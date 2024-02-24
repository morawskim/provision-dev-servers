## Usage

1. Call `tofu init`
1. Call `DOCKER_PASSWORD=yourToken tofu apply`

To get token, log-in to docker hub, click on your avatar and from menu chose "My Account".
From left menu click on "Security" and add a new token via clicking on button "New Access Token".
You can also directly go to [Security page](https://hub.docker.com/settings/security)

## Import existing repository to state file

`terraform import dockerhub_repository.<nameUsedInTfFile> <repositoryNameInDockerHub>`
