#!/usr/bin/env bash

## Author : Aditya Shakya (adi1090x)
## Github : @adi1090x

cd $(dirname $0); dir=$(pwd)
theme='style'

## Run
pkill rofi || rofi \
    -show ${1:-drun} \
    -theme ${dir}/${theme}.rasi
