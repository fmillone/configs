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
  git rebase origin/"$1"
}

setAwsEnv() {
  if [ -z "$1" ]; then
    echo "No argument passed"
    return 1
  fi
  # check if the profile exists
  if aws configure list-profiles | grep -q "^$1$"; then
    export AWS_REGION=$(aws configure get region --profile "$1")
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

strToJson() {
  read -r string
  echo "$string" | sed 's/\\"/"/g' | sed 's/^"//g' | sed 's/"$//g'
}

getSecretByArn() {
  # if arn is in params use it else read from stdin
  local arn=""
  if [ "$1" ]; then
    arn="$1"
  else
    read -r arn
  fi
  aws secretsmanager get-secret-value --secret-id "$arn" |
    jq ".SecretString" |
    strToJson
}

seckgrep() {
  getSecretByArn "$1" | jq "[ to_entries[] |select(.key| test(\"$2\")) ] | from_entries "
}

check_installed() {
  local tools=("$@")
  local result=0
  for tool in "${tools[@]}"; do
    if ! command -v "$tool" &>/dev/null; then
      echo "Error: $tool is not installed." >&2
      result=1
    else
      echo "$tool is installed"
    fi
  done
  return $result
}

cdf() {
  cd "$(fd --type d --hidden | fzf --query="$1")" || exit
}
