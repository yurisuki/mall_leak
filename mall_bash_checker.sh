#!/bin/bash
# This script checks if your password has been leaked in MALL.cz database.

### VARIABLES
leaklink="https://raw.githubusercontent.com/yurisuki/mall_leak_checker/master/mall_leak.txt"
leakfile="mall_leak.txt"

### FUNCTIONS
downloadleak() { # Download the file with leaks if it doesn't exist locally.
	# Check if `curl` is installed.
	! curl --help >/dev/null 2>&1 && printf "File with leaks cannot be downloaded, because \`curl\` isn't installed on your machine.\\n\\nHowever, you can download the file directly from this URL: \"https://raw.githubusercontent.com/yurisuki/mall_leak_checker/master/mall_leak.txt\"\\nand put that file inside your current directory and the script will use that.\\n" && exit

	echo "Downloading file with leaks..."
	# Download file with leaks.
	curl --progress-bar https://raw.githubusercontent.com/yurisuki/mall_leak_checker/master/mall_leak.txt > /tmp/mall_leak.txt
	leakfile="/tmp/mall_leak.txt"
	echo "Downloaded!" && sleep 0.1
	clear
}

convertandcheck() {
	# Convert email to `sha256sum` and drop it inside a variable $emailsum.
	emailsum=$(echo -n "$email" | sha256sum | awk '{print $1}')

	# Grep hashed email address against $leakfile.
	grep "$emailsum" < $leakfile >/dev/null && echo "$email: Leaked!" && status="Leaked!" || echo "$email: Safe!" && status="Safe!"
}

emaillist() {
	[ -z "$emaillist" ] && printf "$0: No file has been selected.\\n" && exit
	! [ -f "$emaillist" ] && printf "$0: This file doesn't exist.\\n" && exit

	echo "I have got $(wc -l < $emaillist) addresses."
	IFS=$'\n'
	for email in $(cat $emaillist); do
		convertandcheck
		echo "$email: $status" >> mall_output.txt
	done
	echo "Everything is done now! See output in \`mall_output.txt\`."
	exit
}

# Use `if` statement for the $leakfile. If the leakfile doesn't exist on your machine, then download it from $leaklink.
! [ -f "$leakfile" ] && downloadleak

! [ -z "$1" ] && case "$1" in
	--l* | -l) emaillist=$2 && emaillist ;;
	*) printf "mall_leak_checker -- This script will check if your e-mail is inside MALL.cz's leaked database.\\nARGUMENTS\\n---------\\n --list | -l: You can feed this script will email list as shown in \`example_email_list.txt\`.\\n" && exit ;;
esac

# Use `if` statement for the $leakfile. If the leakfile doesn't exist on your machine, then download it from $leaklink.
! [ -f "$leakfile" ] && downloadleak

printf "\033[36m\tEnter your e-mail address: "
read email
printf "\033[0m"

while ! echo "$email" | grep ".\+@.\+\\..\+" >/dev/null; do
	echo "This is not a valid e-mail address. Try it again."
	printf "\033[36m\tEnter your e-mail address: "
	read email
	printf "\033[0m"
done
convertandcheck
