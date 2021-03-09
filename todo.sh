# to-do list

todo() {

  # path to list file
  LIST='/home/ellio/Documents/todo'

  # new task
  # make usr input into a string and write it to the list
  if [[ $1 != done ]] && [[ -n "$1" ]]; then
    phrase=""
    for word in "$@"; do
      phrase+="${word} "
    done
    echo $phrase >>$LIST

  # complete all tasks
  # wipe todo file
  elif [[ $1 = done ]] && [[ $2 = "all" ]]; then
    truncate -s 0 $LIST

  # complete specific task
  # remove line(s) matching usr input string w/o 'done' cmd
  elif [[ $1 = done ]] && [[ -n "$2" ]]; then
    shift
    phrase=""
    for word in "$@"; do
      phrase+="${word} "
    done
    phrase=${phrase%?}
    sed -i "/$phrase/d" $LIST
  fi

  # print todo list contents or message
  [[ -s $LIST ]] && cat $LIST || echo "all done"
}
