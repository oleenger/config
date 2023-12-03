sudo apt-get install -y sudo apt-utils curl git-core gnupg tmux zsh wget gcc g++ locales fonts-powerline gh vim pip python3-dev libc-dev libffi-dev graphviz graphviz-dev tmuxinator htop scala libfuse2
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
sudo cp nvim.appimage /usr/bin/nvim
sudo chmod a+x /usr/bin/nvim
gh auth login
gh repo clone oleenger/config
sudo apt-get install apt-transport-https curl gnupg -yqq
echo "deb https://repo.scala-sbt.org/scalasbt/debian all main" | sudo tee /etc/apt/sources.list.d/sbt.list
echo "deb https://repo.scala-sbt.org/scalasbt/debian /" | sudo tee /etc/apt/sources.list.d/sbt_old.list
curl -sL "https://keyserver.ubuntu.com/pks/lookup?op=get&search=0x2EE0EA64E40A89B84B2DF73499E82A75642AC823" | sudo -H gpg --no-default-keyring --keyring gnupg-ring:/etc/apt/trusted.gpg.d/scalasbt-release.gpg --import
sudo chmod 644 /etc/apt/trusted.gpg.d/scalasbt-release.gpg
sudo apt-get install sbt
git clone --depth 1 https://github.com/wbthomason/packer.nvim  ~/.local/share/nvim/site/pack/packer/start/packer.nvim
nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
