todo() {

  # todo file path - change target to .todo to hide
  LIST="$HOME/Documents/todo"
  phrase=""

  # erase list
  if [[ $1 = alldone ]]; then
    truncate -s 0 $LIST
  
  # write usr input string to todo file w/spaces
  elif [[ $1 != done ]] && [[ -n "$1" ]]; then
    phrase=""
    for word in "$@"; do
      phrase+="${word} "
    done
    echo $phrase >>$LIST
  
  # delete all rows w/usr input string match
  elif [[ $1 = done ]] && [[ -n "$2" ]]; then
    shift
    for word in "$@"; do
      phrase+="${word} "
    done
    phrase=${phrase%?}
    sed -i "/$phrase/d" $LIST
  fi

  # print list contents or blank line if empty
  [[ -s $LIST ]] && cat $LIST || echo ""
}
