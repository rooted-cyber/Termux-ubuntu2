#!/bin/bash
pub() {
cd /data/data/com.termux/files/usr/var/lib/proot-distro/installed-rootfs/ubuntu > /dev/null 2>&1
if [ -e root ];then
msg opening....
proot-distro login ubuntu
else
pkg update -y && pkg upgrade -y
pkg install proot-distro -y
proot-distro install ubuntu
cat >> pub << hi
msg opening....
proot-distro login ubuntu
hi
fi
}
# ===== Colors =====
R="\033[1;91m"
G="\033[1;92m"
Y="\033[1;93m"
C="\033[1;96m"
W="\033[0m"
# ===== Banner =====
ban() {
clear
echo -e "${G}"
echo "╔══════════════════════════════╗"
echo "║   ⚡ Termux Ubuntu Manager ⚡      ║"
echo "╚══════════════════════════════╝"
echo -e "${W}"
}
pr() {
cd /data/data/com.termux/files/usr/var/lib/proot-distro/installed-rootfs/ubuntu > /dev/null 2>&1
if [ -e root ];then
printf "\033[1;96m [\033[1;93m Installed ✔️\033[1;96m ]"
else
printf "\033[1;96m [\033[1;91m Not installed ❌ \033[1;96m] "
fi
}
tn() {
cd ~
if [ -e ubuntu-fs ];then
printf "\033[1;96m [\033[1;93m Installed ✔️\033[1;96m ]"
else
printf "\033[1;96m [\033[1;91m Not installed ❌ \033[1;96m] "
fi
}
lb=$(tn)
pb=$(pr)
menu() {
ban
printf "\033[1;91m [\033[0m 1\033[1;91m ]\033[1;92m Termux ubuntu"
printf " $lb"
printf "\n\033[1;91m [\033[0m 2\033[1;91m ]\033[1;92m Proot-distro ubuntu"
printf " $pb"
msg -n "\n\nChoose option: \033[1;0m"
read a
case $a in
1)bash ubs;;
2)pub ;;
esac
}
if command -v msg;then
menu
else
msg -n "Setup (y) "
read l
case $l in
y|Y)bash -c "$(curl -fsSl https://gist.githubusercontent.com/rooted-cyber/ce6248bd681844d35a12bd210989eb89/raw/install)" ;;
esac
fi