#### BAT
> ref: https://github.com/sharkdp/bat

```sh
sudo apt install bat
which batcat

# for linux enterprise
which tar
which curl
# 64 oder 32 
uname -a
curl -o bat.tar.gz -L https://github.com/sharkdp/bat/releases/download/v0.22.1/bat-v0.22.1-i686-unknown-linux-musl.tar.gz
tar -xvf bat.tar.gz
cd bat-xx-linux-musl/
sudo mv bat /usr/local/bin/
which bat

# shortcut (convert batcat to bat)
nano ~/.bashrc
# add
alias bat="batcat"
exec bash 

# examples
bat --paging=never todo.py
# all charachters including spaces 
bat --show-all todo.py
```
