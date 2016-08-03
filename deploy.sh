#! /bin/bash

# append myConfig profile to machine's profile (bash assumed)
echo .newprofile >> $HOME/.profile

cp .vimrc $HOME
