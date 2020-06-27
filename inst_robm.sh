#!/bin/bash

#cd
mkdir rob_m2
cd rob_m2/
way=$(pwd)

#git clone https://github.com/airalab/robonomics_comm.git

function install_nix () {
	#Install Nix package manager
	sudo apt install curl
	sudo apt install eth-keyfile
	curl https://nixos.org/nix/install | sh
	nix-shell --run "cargo run --release"
				}

function inst_from_source() {
	#Building from source
	sudo apt install curl
	curl https://sh.rustup.rs -sSf | sh

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
	source /opt/ros/melodic/setup.bash
	cargo build --release --features ros --bin robonomics
}

#install_nix
inst_from_source
make_clone
integration_in_ROS
run_the_robonom

