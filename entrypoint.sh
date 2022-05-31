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

echo "Results"
echo ""
results=$(sh /arm-ttk/arm-ttk/Test-AzTemplate.sh $_args)

echo $results

# return with success 
exit 0
