# OS_Lab2
# Лабораторная работа 2. Bash-скрипты. Git
---
Установка robonomics 
Дополнительные пакеты, которые потребоалось установить:
---
curl 

>$ sudo apt install curl

rust

>$ curl https://sh.rustup.rs -sSf | sh

>https://rustup.rs/ помощник в установке, если не работает

cargo

>$ sudo apt install cargo
***
Сначала я пробовала установить с Nixos, но возникли проблемы на WSL 
***
Для установки используется функция inst_from_source(), но для этого должны быть установлены  curl и Rust, поэтому сначала проверяем наличие этих пакетов, если нет- устанавливаем
***
make_clone () создает копию директории с github
***
integration_in_ROS () интегрирует робономикс в РОС
***
run_the_robonom () запучкает скрипт robonomics.sh c опциями init и mainnet
***
 ***Options:
 
 1. init            _/install all the necessary packages and dependencies
 
 2. mainnet [name]  _/launch the Robonomics stack in Mainnet (default: airalab)
 
 3. sidechain       _/launch the Robonomics stack in Sidechain
