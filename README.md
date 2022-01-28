# cli-ansible
This repository contains my personal dotfile setup for CLI. If you wish to try it out for yourself please use the docker container to avoid messing up your local environment. I would recommend that you fork this repository and adapt it for your own needs rather than using it directly.
## Install
### Locally
```
❯ asible-playbook --ask-become-pass local.yml
```
### Docker
I would highly recommend you checkout how this works in a Docker container before you try to run this on yuseruserour own system.
Build the image like so:
```
❯ docker-compose build
Successfully tagged lokraszewski.cli-ansible:latest
```

Then run:
```
❯ docker run -it --rm lokraszewski.cli-ansible:latest /bin/zsh
```
This way you can play around with my CLI setup without messing up your local machine.

### ansible-pull
You can run this playbook directly from the repo:
```
ansible-pull -K -U https://github.com/lokraszewski/cli-ansible.git
```
