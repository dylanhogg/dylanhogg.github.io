---
layout: page
title: "Fresh OSX Install"
description: "What I install on a new macbook (Page WIP)"
header-img: "img/apps-bg.jpg"
---

<style>
    a { text-decoration: underline; }
</style>
<!-- []()<br />[]() -->

# Fresh OSX Install

## Helpful guides

- https://sourabhbajaj.com/mac-setup/

## OSX

- Docker
- vscode
- Cursor IDE
- Sublime
  - https://packagecontrol.io/packages/Terminus
  - https://packagecontrol.io/packages/Pretty%20JSON
  - https://packagecontrol.io/packages/Compare%20Side-By-Side (https://bitbucket.org/dougty/sublime-compare-side-by-side)
- iTerm2
- /opt/homebrew/bin/pip3 install aws-adfs
- Kafkatools / OffsetExplorer
- Terraform / Terragrunt
- Bruno API client - https://www.usebruno.com/ (or Postman, Insomnia)
- PostgresApp - https://www.pgadmin.org/download/
- PGAdmin - https://www.pgadmin.org/download/pgadmin-4-macos/
- DB Browser for SQLite - https://sqlitebrowser.org/dl/
- aws command - https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html
- kubectl command (via Docker: /Applications/Docker.app/Contents/Resources/bin/kubectl)
- kfctl command (https://github.com/kubeflow/kfctl/releases)
  - curl -L -O https://github.com/kubeflow/kfctl/releases/download/v1.2.0/kfctl_v1.2.0-0-gbc038f9_darwin.tar.gz
  - tar xf kfctl_v1.2.0-0-gbc038f9_darwin.tar.gz; mv kfctl /usr/local/bin/kfctl
- Diffmerge
- CyberDuck - https://cyberduck.io/
- https://www.zotero.org/download/ - Research organiser
- https://github.com/mermaid-js/mermaid
- Protoege ontology: https://protege.stanford.edu/products.php#desktop-protege
- TadViewer for parquet, duckdb: https://www.tadviewer.com/
- https://iina.io/ - The modern media/video player for macOS.
- https://superwhisper.com/ - Superwhisper - A macOS app for speech-to-text

- OLD:

  - Fig.io autocomplete via dmg (next time: brew install --cask fig)
  - Jetbrains remote dev: https://www.jetbrains.com/help/pycharm/remote-development-a.html
  - https://github.com/vincelwt/chatgpt-mac - ChatGPT - A macOS app for chatting with GPT-2

- Brew Utils Must Have:

  - brew install nushell - A new type of shell (https://www.nushell.sh/)
  - brew install miniforge - https://github.com/conda-forge/miniforge - Linking Binary 'conda' to '/opt/homebrew/bin/conda'
  - brew install python@3.9 - /opt/homebrew/bin/python3
  - brew install pyenv (switch between multiple versions of Python - https://github.com/pyenv/pyenv#homebrew-in-macos)
  - brew install git-lfs
  - brew install zsh-completions
  - brew install ack - replacement for grep with higher speed and more options
  - brew install tree
  - brew install bat (modern cat)
  - brew install node
  - brew install fzf
  - brew install jq
  - brew install httpie
  - brew install exa
  - brew install netron - viewer for neural network models. https://github.com/lutzroeder/netron https://netron.app/
  - brew install md5sha1sum - Microbrew md5sum/sha1sum/ripemd160sum by Bulent Yilmaz
  - brew install ripgrep - recursively searches directories for a regex pattern while respecting your gitignore

- Brew Utils Nice to Have

  - brew install jello - https://github.com/kellyjonbrazil/jello
  - brew install saulpw/vd/visidata - https://github.com/saulpw/visidata - TUI interactive multitool for tabular data.
  - brew install zoxide - A smarter cd command. Supports all major shells.

- Brew k8s

  - brew install kubectl
  - brew install helm (k8s packaging)
  - brew install kind (local k8s cluster: https://kind.sigs.k8s.io/)
  - brew install kops (kubectl for clusters)
  - brew install kubectx (kubectx + kubens: Power tools for kubectl)
  - brew install kube-ps1 (Kubernetes prompt for bash and zsh)
  - brew install kustomize
  - brew install derailed/k9s/k9s - k9s: managing clusters vis CLI - https://k9scli.io/topics/install/
  - Investigate: https://k3s.io/
  - https://k8slens.dev/
  - TODO: https://eksctl.io/introduction/#installation - eksctl - The official CLI for Amazon EKS
  - maybe: https://k8slens.dev/desktop.html

- Brew kafka

  - brew install kafka (/opt/homebrew/etc/kafka/server.properties; brew services restart kafka)
  - brew install kcat

- pip install

  - https://github.com/xonsh/xonsh - Python-powered, cross-platform, Unix-gazing shell
  - https://github.com/prompt-toolkit/ptpython

- npm
  - npm install -g doctoc

## Tools

- https://github.com/mermaid-js/mermaid & https://github.blog/2022-02-14-include-diagrams-markdown-files-mermaid/
- https://app.diagrams.net/ / https://draw.io & https://github.com/jgraph/drawio-desktop/releases (or alternative https://excalidraw.com/)
- https://revealjs.com/ - open source HTML presentation framework
- https://www.geogebra.org/calculator - Graphing calculator online and app
- (todo) https://yadm.io/ - Yet Another Dotfiles Manager
- https://www.gnu.org/software/parallel/ - a shell tool for executing jobs in parallel
- https://it-tools.tech/ - handy tools for devs (also: https://github.com/CorentinTh/it-tools)
- https://elder-plinius.github.io/P4RS3LT0NGV3/ - unicode text transforms

## Local config files

- /Users/<user>/.ssh/config
- /Users/<user>/.aws/config & /Users/<user>/.aws/credentials
- /Users/<user>/.kube/config
- /Users/<user>/.zshrc
- /Users/<user>/.zshenv

## Python local

System v2:
/usr/bin/python

brew install python@3.9
/opt/homebrew/bin/python3
/opt/homebrew/bin/pip3

brew install miniforge
/opt/homebrew/bin/conda

## Zsh

- https://github.com/ohmyzsh/ohmyzsh
- /Users/<user>/.zshrc
- https://www.nushell.sh/ & https://github.com/nushell/nushell

```
alias pwdc='pwd | pbcopy'
```

```
# https://formulae.brew.sh/formula/zsh-completions
# https://unix.stackexchange.com/questions/499317/prevent-completion-of-files-for-make-command-in-zsh-shell
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH
  autoload -Uz compinit
  compinit
  zstyle ':completion:*:*:make:*' tag-order 'targets'
fi
```

## vscode / cursor

- Theme: https://marketplace.visualstudio.com/items?itemName=z4yross.anysphere-dark

- Extensions (Mar 2025)

```bash
code --list-extensions
astro-build.astro-vscode
bradlc.vscode-tailwindcss
dbaeumer.vscode-eslint
donjayamanne.githistory
eamodio.gitlens
esbenp.prettier-vscode
github.copilot
github.copilot-chat
github.vscode-github-actions
golang.go
mechatroner.rainbow-csv
ms-azuretools.vscode-docker
ms-dotnettools.csharp
ms-dotnettools.vscode-dotnet-runtime
ms-python.debugpy
ms-python.python
ms-python.vscode-pylance
ms-toolsai.jupyter
ms-toolsai.vscode-jupyter-cell-tags
ms-toolsai.vscode-jupyter-slideshow
ms-vscode-remote.remote-containers
ms-vscode-remote.remote-ssh
ms-vscode-remote.remote-ssh-edit
ms-vscode.cmake-tools
ms-vscode.cpptools
ms-vscode.cpptools-extension-pack
ms-vscode.cpptools-themes
ms-vscode.remote-explorer
qwtel.sqlite-viewer
redhat.vscode-yaml
tamasfe.even-better-toml
tomoki1207.pdf
twxs.cmake
unifiedjs.vscode-mdx
vscode-icons-team.vscode-icons
waderyan.gitblame
z4yross.anysphere-dark
```
