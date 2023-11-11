#!/bin/bash
# ----------------------------------------------------------------------------
# File: build.sh
# Author: Copyright (c) 2023 Jens Kallup - paule32
#
# Licence: MIT - only for education, and non-profit.
# ----------------------------------------------------------------------------
GHDL="ghdl"
modules_array=(
    "and_gate"
    "or_gate" "or_gate_7432"
    "master"
)
# ----------------------------------------------------------------------------
# helper tool functions ...
# ----------------------------------------------------------------------------
function run_check () {
    if [[ $1 -gt 0 ]]; then
        echo "$2"
        exit 1
    fi
}
# ----------------------------------------------------------------------------
# Module syntax check ...
# ----------------------------------------------------------------------------
function module_check () {
    cmd=$(ghdl -s $1.vhdl 2>&1); run_check $? "Syntax-Fehler im $1.vhdl Skript."
    cmd=$(ghdl -a $1.vhdl 2>&1); run_check $? "Analyse-Fehler im $1.vhdl Skript."
    cmd=$(ghdl -e $1      2>&1); run_check $? "Eloborat-Fehler im $1 Skript."
}

# ----------------------------------------------------------------------------
# main loop for transpile the GHDL files ...
# ----------------------------------------------------------------------------
for i in ${!modules_array[@]}; do
    vhdl_file="${modules_array[$i]}"
    echo "proceed: ${vhdl_file}"
    module_check ${vhdl_file}
done

# ----------------------------------------------------------------------------
# master syntax/analyse check, and test ...
# ----------------------------------------------------------------------------
cmd=$(ghdl -r master 2>&1); run_check $? "Test-Fehler: ${cmd}"

# ----------------------------------------------------------------------------
# when we land here, all is okay, and done.
# ----------------------------------------------------------------------------
echo "done."
