if [[ -z $1 ]]; then 
    echo -e "basename$0 -- internal error: you must specify ...."
elif [[ $1 = "lol" ]]; then
    echo $1
else
    echo "today it's shining, right $1?" 
fi
