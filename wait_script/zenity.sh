cd() {
    if (( RANDOM % 3 == 0 )); then
        builtin cd "$@"
    else
        i=0
        (while [ $((i <= 100)) '=' 1 ]
        do
            echo $i
            sleep 1
            i=$((i + 5))
        done) | zenity --progress --auto-close --title="tu t'es fait script 😄" --text="lock ton pc la prochaine fois 😉" --no-cancel
    fi
}
