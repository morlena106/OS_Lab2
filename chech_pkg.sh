#!/bin/bash


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
