# cli-ansible
## Roles

- git
- zsh
- htop
- tmux
- inputrc
- vim
- packages
- pip
- utils
- devtools
- fonts

## Objectives
I have been using this repo to learn Ansible. Here are my objectives:
- [ ] Install dotfiles for given user.
  - [ ] Consider using the logged in user
- [ ] Setup my user account (variable)
  - [ ] Default shell

TODO:
- [ ] Autoupdate
- [ ] Fix the needless copy of font files
## Install
Run locally:
```
❯ asible-playbook --ask-become-pass cli.yml
```
## docker
I would highly recommend you checkout how this works in a Docker container before you try to run this on your own system.
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