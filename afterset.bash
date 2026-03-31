## first download that : https://www.ubuntu-fr.org/download/xubuntu
sudo apt update && sudo apt upgrade -y

## after put regolith linux : 
sudo add-apt-repository ppa:regolith-linux/release
sudo apt update
sudo apt install regolith-desktop

## If regolith working, remove xfce
sudo apt remove xfce4 xfce4-* lightdm
sudo apt install gdm3
sudo reboot

## BASE INSTALL
sudo apt update && sudo apt upgrade
sudo apt install -y \
build-essential \
curl \
wget \
git \
pkg-config \
cmake \
ninja-build \
gdb \
lldb \
strace \
ltrace \
file \
htop \
unzip

## CARGO & RUST
bash
curl https://sh.rustup.rs -sSf | sh
source $HOME/.cargo/en

rustup update
rustup component add rustfmt clippy  

## ADVANCED TOOLCHAIN
sudo apt install -y \
clang \
llvm \
llvm-dev \
libclang-dev \
flex \
bison

## NETWORKS
sudo apt install -y \
netcat \
socat \
tcpdump \
wireshark
  
## OS
sudo apt install -y \
qemu-system \
qemu-utils \
nasm \
xorriso \
grub-pc-bin

## TOOLS
sudo apt install -y \
alacritty \
tmux \
vim \
ripgrep \
fd-find \
bat

## DEBUG
sudo apt install -y \
valgrind \
linux-tools-common \
linux-tools-generic

## GITHUB
git config --global user.name "TonNom"
git config --global user.email "ton@email.com"
git config --global core.editor "nvim"

## AUTOCOMPLETE
sudo apt install -y clangd
rustup component add rust-analyzer
