#!/bin/bash

echo -en "Enter full path:"
read path

echo -en "Enter user remote host:"
read remote

echo -en "Enter ip remote host:"
read ip


full_path=/$path/*

scp $full_path $remote@$ip:.
