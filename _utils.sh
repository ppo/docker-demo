RESET_STYLE=`tput sgr0`
H1_STYLE=`echo -e "setaf 6\nbold" | tput -S`
H2_STYLE=`echo -e "setaf 7\nbold" | tput -S`
COMMAND_STYLE=`echo -e "setaf 3\nbold" | tput -S`
ACTION_STYLE=`tput setaf 2`


function clear_screen () {
  clear
  echo "${H1_STYLE}DOCKER DEMO: ${DEMO_NAME}${RESET_STYLE}"
}

function heading () {
  echo
  echo "${H2_STYLE}## ${1}${RESET_STYLE}"
}

function echo_command () {
  echo ">> ${COMMAND_STYLE}$@${RESET_STYLE}"
}

function echo_run () {
  echo_command "$@"
  command "$@"
}

function action_required () {
  echo
  echo "${ACTION_STYLE}${1}${RESET_STYLE}"
}

function ask_continue () {
  echo
  read -p "${ACTION_STYLE}${1}${RESET_STYLE}"
  clear_screen
}

function demo_over () {
  echo
  echo "${H1_STYLE}Demo is over.${RESET_STYLE}"
}
