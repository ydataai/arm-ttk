#!/bin/sh -l

# Ensure the workflow fails on error
set -e
sh arm-ttk/Test-AzTemplate.sh -TemplatePath $1
