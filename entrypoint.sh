#!/bin/sh -l

# Ensure the workflow fails on error
set -e

#_template_path=$1
#_template_file=$2
#_test=$3
#_skip=$4

_args="-TemplatePath $1"

if [ $2 ]
then
    $_args="$_args -Test $2"
fi

if [ $3 ]
then
    $_args="$_args -Test $3"
else
    if [ $4 ]
    then
        $_args="$_args -Skip $4"
    fi
fi

sh arm-ttk/Test-AzTemplate.sh $_args


