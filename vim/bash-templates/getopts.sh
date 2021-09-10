while getopts ":a:h:z" opt; do
  case $opt in
    a)
      echo "-a was triggered, parameter: $optarg" >&2
      ;;
    
    h)
      echo "-h was triggered, parameter: $optarg" >&2
     ;;
    z) 
      echo "-z was triggered, parameter: $optarg" >&2
     ;;
   \?)
      echo "Invalid option: -$OPTARG" >&2
      exit 1
      ;;
    :)
      echo "Option -$OPTARG requires an argument." >&2
      exit 1
      ;;
  esac
done

