#!/bin/bash


# define default values
MESSAGE=""
LOAD_ANIMATION_NAME="classic"
CMD=""
TIME_INTERVAL=0.05

## ASCII animations ##
# Will work in any terminal, including the TTY.
classic=( '-' "\\" '|' '/' )
box=( ┤ ┴ ├ ┬ )
bubble=( · o O O o · )
breathe=( '  ()  ' ' (  ) ' '(    )' ' (  ) ' )
growing_dots=( '.  ' '.. ' '...' '.. ' '.  ' '   ' )
passing_dots=( '.  ' '.. ' '...' ' ..' '  .' '   ' )
metro=( '[    ]' '[=   ]' '[==  ]' '[=== ]' '[ ===]' '[  ==]' '[   =]' )
snake=( '[=     ]' '[~<    ]' '[~~=   ]' '[~~~<  ]' '[ ~~~= ]' '[  ~~~<]' '[   ~~~]' '[    ~~]' '[     ~]' '[      ]' )
filling_bar=( '█▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒' '██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒' '███▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒' '████▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒' '█████▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒' '██████▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒' '███████▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒' '████████▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒' '█████████▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒' '██████████▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒' '███████████▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒' '████████████▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒' '█████████████▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒' '██████████████▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒' '███████████████▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒' '████████████████▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒' '█████████████████▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒' '██████████████████▒▒▒▒▒▒▒▒▒▒▒▒▒▒' '███████████████████▒▒▒▒▒▒▒▒▒▒▒▒▒' '████████████████████▒▒▒▒▒▒▒▒▒▒▒▒' '█████████████████████▒▒▒▒▒▒▒▒▒▒▒' '██████████████████████▒▒▒▒▒▒▒▒▒▒' '███████████████████████▒▒▒▒▒▒▒▒▒' '████████████████████████▒▒▒▒▒▒▒▒' '█████████████████████████▒▒▒▒▒▒▒' '██████████████████████████▒▒▒▒▒▒' '███████████████████████████▒▒▒▒▒' '████████████████████████████▒▒▒▒' '█████████████████████████████▒▒▒' '██████████████████████████████▒▒' '███████████████████████████████▒' '████████████████████████████████')

## UTF-8 animations ##
# Require Unicode support (will work in most modern terminals, but not in TTY).
# Some animations may not render properly with certain fonts.
classic_utf8=( '—' "\\" '|' '/' )
bounce=( . · ˙ · )
vertical_block=( ▁ ▂ ▃ ▄ ▅ ▆ ▇ █ █ ▇ ▆ ▅ ▄ ▃ ▂ ▁ )
horizontal_block=( ▏ ▎ ▍ ▌ ▋ ▊ ▉ ▉ ▊ ▋ ▌ ▍ ▎ ▏ )
quarter=( ▖ ▘ ▝ ▗ )
triangle=( ◢ ◣ ◤ ◥)
semi_circle=( ◐ ◓ ◑ ◒ )
rotating_eyes=( ◡◡ ⊙⊙ ⊙⊙ ◠◠ )
braille=( ⠁ ⠂ ⠄ ⡀ ⢀ ⠠ ⠐ ⠈ )
braille_whitespace=( ⣾ ⣽ ⣻ ⢿ ⡿ ⣟ ⣯ ⣷ )
trigram=( ☰ ☱ ☳ ☶ ☴ )
arrow=( ▹▹▹▹▹ ▸▹▹▹▹ ▹▸▹▹▹ ▹▹▸▹▹ ▹▹▹▸▹ ▹▹▹▹▸ ▹▹▹▹▹ ▹▹▹▹▹ ▹▹▹▹▹ ▹▹▹▹▹ ▹▹▹▹▹ ▹▹▹▹▹ ▹▹▹▹▹ )
bouncing_ball=( '(●     )' '( ●    )' '(  ●   )' '(   ●  )' '(    ● )' '(     ●)' '(    ● )' '(   ●  )' '(  ●   )' '( ●    )' )
big_dot=( ∙∙∙ ●∙∙ ∙●∙ ∙∙● )
modern_metro=( ▰▱▱▱▱▱▱ ▰▰▱▱▱▱▱ ▰▰▰▱▱▱▱ ▱▰▰▰▱▱▱ ▱▱▰▰▰▱▱ ▱▱▱▰▰▰▱ ▱▱▱▱▰▰▰ ▱▱▱▱▱▰▰ ▱▱▱▱▱▱▰ ▱▱▱▱▱▱▱ ▱▱▱▱▱▱▱ ▱▱▱▱▱▱▱ ▱▱▱▱▱▱▱ )
pong=( '▐⠂       ▌' '▐⠈       ▌' '▐ ⠂      ▌' '▐ ⠠      ▌' '▐  ⡀     ▌' '▐  ⠠     ▌' '▐   ⠂    ▌' '▐   ⠈    ▌' '▐    ⠂   ▌' '▐    ⠠   ▌' '▐     ⡀  ▌' '▐     ⠠  ▌' '▐      ⠂ ▌' '▐      ⠈ ▌' '▐       ⠂▌' '▐       ⠠▌' '▐       ⡀▌' '▐      ⠠ ▌' '▐      ⠂ ▌' '▐     ⠈  ▌' '▐     ⠂  ▌' '▐    ⠠   ▌' '▐    ⡀   ▌' '▐   ⠠    ▌' '▐   ⠂    ▌' '▐  ⠈     ▌' '▐  ⠂     ▌' '▐ ⠠      ▌' '▐ ⡀      ▌' '▐⠠       ▌' )
earth=( 🌍 🌎 🌏 )
clock=( 🕛 🕐 🕑 🕒 🕓 🕔 🕕 🕖 🕗 🕘 🕙 🕚 )
moon=( 🌑 🌒 🌓 🌔 🌕 🌖 🌗 🌘 )
orange_pulse=( 🔸 🔶 🟠 🟠 🔶 )
blue_pulse=( 🔹 🔷 🔵 🔵 🔷 )
football=( ' 👧⚽️       👦' '👧  ⚽️      👦' '👧   ⚽️     👦' '👧    ⚽️    👦' '👧     ⚽️   👦' '👧      ⚽️  👦' '👧       ⚽️👦 ' '👧      ⚽️  👦' '👧     ⚽️   👦' '👧    ⚽️    👦' '👧   ⚽️     👦' '👧  ⚽️      👦' )
blink=( 😐 😐 😐 😐 😐 😐 😐 😐 😐 😑 )
camera=( 📷 📷 📷 📷 📷 📷 📷 📷 📷 📷 📷 📷 📷 📷 📷 📷 📷 📷 📷 📷 📸 📷 📸 )
sparkling_camera=( '📷 ' '📷 ' '📷 ' '📷 ' '📷 ' '📷 ' '📷 ' '📷 ' '📷 ' '📷 ' '📷 ' '📷 ' '📷 ' '📷 ' '📷 ' '📷 ' '📷 ' '📷 ' '📷 ' '📷 ' '📸✨' '📷 ' '📸✨' )
sick=( 🤢 🤢 🤮 )
monkey=( 🙉 🙈 🙊 🙈 )
bomb=( '💣   ' ' 💣  ' '  💣 ' '   💣' '   💣' '   💣' '   💣' '   💣' '   💥' '    ' '    ' )



# check if the first arg exists and if it's equal to "-m"
if [[ -n "$1" && "$1" == "-m" ]] ; then
  if [[ -n "$2" ]] ; then
    MESSAGE="$2"
  else 
    echo "Usage: $0 [MESSAGE] [LOAD_ANIMATION_NAME] [command]"
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
    echo "Usage: $0 [MESSAGE] [LOAD_ANIMATION_NAME] [command]"
    exit 1
  fi
  shift # move to the next arg
  shift # move to the next arg
fi

if ! [[ ${!LOAD_ANIMATION_NAME+x} ]]; then
  echo There is no load animation called "'"$LOAD_ANIMATION_NAME"'"
  exit 1
fi

# check if the first arg exists and if it's equal to "-t"
if [[ -n "$1" && "$1" == "-t" ]] ; then
  if [[ -n "$2" ]] ; then
    TIME_INTERVAL="$2"
  else
    echo "Usage: $0 [MESSAGE] [LOAD_ANIMATION_NAME] [command]"
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
  echo "Usage: $0 [MESSAGE] [LOAD_ANIMATION_NAME] [command]"
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

BLA::stop_loading_animation() {
  kill "${BLA_loading_animation_pid}" > /dev/null 2>&1
  tput cnorm # Restore the terminal cursor
  printf '\e[A\e[K'
}

# Run BLA::stop_loading_animation if the script is interrupted
trap BLA::stop_loading_animation SIGINT

start_loading_animation() {
  tput civis # Hide the terminal cursor

  BLA_active_loading_animation=( "${@}" )

  BLA_loading_animation_frame_interval=$TIME_INTERVAL

  BLA::play_loading_animation_loop "$MESSAGE " &
  BLA_loading_animation_pid="${!}"

  # execute the command
  bash -c "$CMD" > /dev/null 2>&1
}

eval LOAD_ANIMATION=( \${$LOAD_ANIMATION_NAME[@]} )

start_loading_animation "${LOAD_ANIMATION[@]}"

BLA::stop_loading_animation "$BLA_loading_animation_pid"

# tput cnorm # Restore the terminal cursor

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