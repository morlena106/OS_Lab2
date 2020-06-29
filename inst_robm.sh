#!/bin/bash

сd
mkdir rob_m
cd rob_m/
way=$(pwd)

#Проверяем наличие curl, cargo и rust, если их нет, устанавливаем 
function check_pkg () {

if [[ -z 'ls /usr/bin/curl* | grep "curl"' ]]
then
        sudo apt install curl
else
        echo 'you have curl'
fi

if [[ -z 'ls /usr/bin/cargo* | grep "cargo"' ]]
then
        sudo apt install cargo
else
        echo 'you have cargo'
fi

if [[ -z 'ls /usr/bin/rust* | grep "rust"' ]]
then
        curl https://sh.rustup.rs -sSf | sh
else
        echo 'you have rust'
fi
}

function inst_from_source() {
	rustup update nightly
	rustup target add wasm32-unknown-unknown --toolchain nightly
	rustup update stable
	cargo +nightly install --git https://github.com/alexcrichton/wasm-gc
	sudo apt install cmake git clang libclang-dev libudev-dev
	cargo install --force --git https://github.com/airalab/robonomics --tag v0.18.2 node-cli
}

function make_clone () {
	mkdir -p ws/src && cd ws/src
	git clone https://github.com/airalab/robonomics_comm
	catkin_init_workspace && cd .. && catkin_make
}

function run_the_robonom () {
	cd $way
	wget http://bootstrap.aira.life/robonomics.sh
	chmod +x ./robonomics.sh
	./robonomics.sh init
	./robonomics.sh mainnet
}

function integration_in_ROS () {
	cd 
	source /opt/ros/melodic/setup.bash
	cargo build --release --features ros --bin robonomics
}

check_pkg
inst_from_source
make_clone
integration_in_ROS
run_the_robonom

