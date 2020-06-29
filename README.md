# OS_Lab2
# Лабораторная работа 2. Bash-скрипты. Git

#Дополнительные пакеты, которые потребоалось установить:

#curl 

#$ sudo apt install curl

#rust

#$ curl https://sh.rustup.rs -sSf | sh

#https://rustup.rs/ помощник в установке, если не работает

#cargo

#$ sudo apt install cargo

#Сначала я пробовала установить с Nixos, но возникло много проблем на WSL 

#Для установки используется функция inst_from_source(), но для этого должны быть установлены  curl и Rust, поэтому сначала проверяем наличие этих пакетов, если нет- устанавливаем

#make_clone () создает копию директории с github

#integration_in_ROS () интегрирует робономикс в РОС

#run_the_robonom () запучкает скрипт robonomics.sh c опциями init и mainnet

 #Options:
 
 #init            /install all the necessary packages and dependencies
 
 #mainnet [name]  /launch the Robonomics stack in Mainnet (default: airalab)
 
 #sidechain       /launch the Robonomics stack in Sidechain
