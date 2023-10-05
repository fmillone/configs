#Common functions to use shell

addToPath() {
	if [[ "$PATH" != *"$1"* ]]; then
		export PATH=$PATH:$1
	fi
}

addToPathFront() {
	if [[ "$PATH" != *"$1"* ]]; then
		export PATH=$1:$PATH
	fi
}

gro() {
	git rebase origin/$1
}

setAwsEnv() {
	if [ -z "$1" ]; then
		echo "No argument passed"
		return 1
	fi
	# check if the profile exists
	if aws configure list-profiles | grep -q "^$1$"; then
		export AWS_REGION=$(aws configure get region --profile $1)
		export AWS_PROFILE=$1
		echo "Now using AWS_PROFILE=$AWS_PROFILE and AWS_REGION=$AWS_REGION"
	else
		echo "Profile $1 does not exist"
		return 1
	fi
}

unsetAwsEnv() {
	unset AWS_REGION
	unset AWS_PROFILE
	echo "AWS_PROFILE and AWS_REGION unset"
}
