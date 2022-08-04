## Mirror repositories

Since GitLab 13.9. the feature "Pull from a remote repository" has been moved to premium tier.

The script to mirror repositories has been downlaoded from [Mirroring Git Repositories](https://www.edwardthomson.com/blog/mirroring_git_repositories.html)

### Setup GitLab repositories

Generate ssh key - `ssh-keygen -t ed25519 -C "git-mirror" -f $PWD/id_ed25519`
Paste your new ssh public key to `playbook.yml`.
Adjust GitLab projects.

You need to have docker or ansible with python3-gitlab package.
For docker you can use this command: `docker run --rm -it -eGITLAB_API_TOKEN=youAPiToken -v $PWD:/app opensuse/tumbleweed bash -c 'zypper ref && zypper install -y ansible python310-python-gitlab && ansible-galaxy collection install community.general && ansible-playbook /app/playbook.yml'`
Remember to update env variable `GITLAB_API_TOKEN`!

Or you can manually add Deployment key in all your repositories.

### Setup GitLab project with scheduler pipeline

Create a new project in GitLab.
Add a new file `mirror.sh` and paste content from `mirror.sh`.
Add a new file `.gitlab-ci.yml` add paste content:

```
stages:
  - sync

sync-repositories:
  stage: sync
  image: edbizarro/gitlab-ci-pipeline-php:7.4
  before_script:
    - 'which ssh-agent || ( apt-get update -y && apt-get install openssh-client -y )'
    - eval $(ssh-agent -s)
    - ssh-add <(echo "$SSH_PRIVATE_KEY_FOR_SYNC")
    - mkdir -p ~/.ssh
    - 'echo -e "Host *\n\tStrictHostKeyChecking no\n\n" > ~/.ssh/config'
  script:
    - bash ./mirror.sh https://github.com/yourusername/repo.git git@gitlab.com:yourusername/repo.git

```

Adjust URL to GitHub and GitLab repositories.
Add scheduler in GitLab.
Add CI/CD variable `SSH_PRIVATE_KEY_FOR_SYNC` with content of your private ssh key.
Run pipeline, your repositories should be synced.
