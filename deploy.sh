#! /bin/bash

# append myConfig profile to machine's profile (bash assumed)
cat .newprofile >> $HOME/.profile

cp .vimrc $HOME
