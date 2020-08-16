#!/bin/sh -l

# Ensure the workflow fails on error
set -e

echo "one $1 two $2 "

ls -al

cd /github/workspace
sh /download/arm-ttk/Test-AzTemplate.sh
