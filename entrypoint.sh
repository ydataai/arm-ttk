#!/bin/sh -l

# Ensure the workflow fails on error
set -e

cd /github/workspace
sh arm-ttk/Test-AzTemplate.sh 
