function usage (){
    printf "%s\n" "Usage: `basename $0` [options]"
    printf "%s\n" "       -x SOMETHING       Do something."
    printf "%s\n" "       -x SOMETHING2      Do something."
    printf "%s\n" "       -d SOMETHING3      Do something3."
    printf "%s\n" "       -v                 Script version."
}

[[ -z $1 ]] && usage 
