#!/bin/bash

# load animatino names
source animations.sh

# define default values
MESSAGE=""
LOAD_ANIMATION_NAME="classic"
CMD=""

# check if the first arg exists and if it's equal to "-m"
if [[ -n "$1" && "$1" == "-m" ]] ; then
  if [[ -n "$2" ]] ; then
    MESSAGE="$2"
  else 
    echo "Usage: $0 [MESSAGE] [LOAD_ANIMATION_NAME] command"
    exit 1
  fi
  shift # move to the next arg
  shift # move to the next arg
fi

# check if the first arg exists and if it's equal to "-a"
if [[ -n "$1" && "$1" == "-a" ]] ; then
  if [[ -n "$2" ]] ; then
    LOAD_ANIMATION_NAME="$2"
  else
    echo "Usage: $0 [MESSAGE] [LOAD_ANIMATION_NAME] command"
    exit 1
  fi
  shift # move to the next arg
  shift # move to the next arg
fi

if ! [[ ${!LOAD_ANIMATION_NAME+x} ]]; then
  echo There is no load animation called "'"$LOAD_ANIMATION_NAME"'"
  exit 1
fi

# check if first arg exists and store it in cmd
if [[ -n "$1" ]] && [[ $1 != "-m" ]] ; then
  CMD="$*"
else 
  echo "Usage: $0 [MESSAGE] [LOAD_ANIMATION_NAME] command"
  exit 1
fi

declare -a BLA_active_loading_animation

BLA::play_loading_animation_loop() {
  while true ; do
    for frame in "${BLA_active_loading_animation[@]}" ; do
      printf "\r%s%s" "$1" "${frame}"
      sleep "${BLA_loading_animation_frame_interval}"
    done
  done
}

BLA::start_loading_animation() {
  BLA_active_loading_animation=( "${@}" )
  # Extract the delay between each frame from array BLA_active_loading_animation
  BLA_loading_animation_frame_interval="${BLA_active_loading_animation[0]}"
  unset "BLA_active_loading_animation[0]"
  tput civis # Hide the terminal cursor
  BLA::play_loading_animation_loop &
  BLA_loading_animation_pid="${!}"
}

BLA::stop_loading_animation() {
  kill "${BLA_loading_animation_pid}" &> /dev/null
  printf "\n"
  tput cnorm # Restore the terminal cursor
}

# Run BLA::stop_loading_animation if the script is interrupted
trap BLA::stop_loading_animation SIGINT

demo_loading_animation() {
  BLA_active_loading_animation=( "${@}" )
  # Extract the delay between each frame from the active_loading_animation array
  BLA_loading_animation_frame_interval=0.05
  unset "BLA_active_loading_animation[0]"

  BLA::play_loading_animation_loop "$MESSAGE " &
  BLA_loading_animation_pid="${!}"

  # execute the command
  bash -c "$CMD" > /dev/null 2>&1

  # kill the loading program after executing your command
  kill "${BLA_loading_animation_pid}" > /dev/null 2>&1 &
}

tput civis # Hide the terminal cursor

eval LOAD_ANIMATION=( \${$LOAD_ANIMATION_NAME[@]} )
# echo ${LOAD_ANIMATION[@]}

demo_loading_animation "${LOAD_ANIMATION[@]}"


tput cnorm # Restore the terminal cursor

printf '\e[A\e[K'
exit 0


:<<'EXAMPLES'

## Put these lines at the top of your script:
((order of flags does matter.))
chmod +x loading.sh
./loading.sh sleep 5
./loading.sh -m downloading sleep 5
./loading.sh -a metro sleep 5
./loading.sh -m downloading -a metro sleep 5
./loading.sh -a metro -m downloading sleep 5 # WRONG
EXAMPLES