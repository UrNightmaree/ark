#!/usr/bin/env bash

# -------------------- #
# Build script for Ark #
# -------------------- #

c_reset="$(echo -e "\e[0m")"

c_tcolor() {
	echo -e "\e[38;5;${1}m"
}

_indent() {
	printf "    "
}

e_info() {
	local msg="$*"
	local blue;blue="$(c_tcolor 117)"
	local green;green="$(c_tcolor 115)"

	echo -e "${blue}[${c_reset}${green}#${c_reset}${blue}]: ${msg}${c_reset}"
}

e_error() {
	local msg="$*"
	local blue;blue="$(c_tcolor 117)"
	local red;red="$(c_tcolor 198)"

	echo -e "${blue}[${c_reset}${red}!${c_reset}${blue}]: ${msg}${c_reset}"
}

e_warning() {
	local msg="$*"
	local blue;blue="$(c_tcolor 117)"
	local yellow;yellow="$(c_tcolor 222)"

	echo -e "${blue}[${c_reset}${yellow}!${c_reset}${blue}]: ${msg}${c_reset}"
}

run_cmd() {
	local cmd="$*"

	e_info "$ ${cmd}"

	touch ./build.log
	echo "$ ${cmd}" >> ./build.log
	eval "${cmd} 2>&1" | tee -a ./build.log
}

run_cmd "git add ."
