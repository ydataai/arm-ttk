#!/bin/sh -l
# Ensure the workflow fails on error
set -e

# List of args
# -TemplatePath => $1
# -File => $2
# -Test => $3
# -Skip => $4

_args="-TemplatePath '$1'"

if [ "$2" ]
then
    _args="$_args -File '$2'"
fi

if [ "$3" ]
then
    _args="$_args -Test '$3'"
fi

if [ "$4" ]
then
    _args="$_args -Skip '$4'"
fi

echo "Running: sh /arm-ttk/arm-ttk/Test-AzTemplate.sh $_args"
results=$(sh /arm-ttk/arm-ttk/Test-AzTemplate.sh $_args)

echo "Results: $results"
# https://github.com/actions/create-release/issues/25
results="${results//'%'/'%25'}"
results="${results//$'\n'/'%0A'}"
results="${results//$'\r'/'%0D'}"

#this sets the output
echo "::set-output name=results::'$results'"
