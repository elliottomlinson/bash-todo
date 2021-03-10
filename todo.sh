todo() {
  LIST="$HOME/Documents/todo"

  if [[ $1 = alldone ]]; then
    truncate -s 0 $LIST

  elif [[ $1 != done ]] && [[ -n "$1" ]]; then
    phrase=""
    for word in "$@"; do
      phrase+="${word} "
    done
    echo $phrase >>$LIST

  elif [[ $1 = done ]] && [[ -n "$2" ]]; then
    shift
    phrase=""
    for word in "$@"; do
      phrase+="${word} "
    done
    phrase=${phrase%?}
    sed -i "/$phrase/d" $LIST
  fi

  [[ -s $LIST ]] && cat $LIST || echo "null"
}
