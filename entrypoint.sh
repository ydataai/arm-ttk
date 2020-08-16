#!/bin/sh -l

# Ensure the workflow fails on error
set -e

ls -al

cd /github/workspace
sh /download/arm-ttk/Test-AzTemplate.sh
