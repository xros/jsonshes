#!/usr/bin/env bash
version="1.0"


# To import JSON raw data to ElasticSearch using Bash in one line of commands
#_index=$1
#_type=$2

#echo $_index

#$formula='{"index": {"_index":$_index, "_type":$type}}'
#formula='{"index": {"_index":'$_index', "_type":'$_type'}}'
#echo $formula
#echo '{"index": {"_index":'$index', "_type":'$type'}}'
##while read LINE do;
    ##echo '{"index": {"_index":$index, "_type":$type}}'
#echo $formula 

#usage="$(basename "$0") [-h] [-s n] -- program to calculate the answer to life, the universe and everything
usage="$(basename "$0") [-hudits] [-s n] 

       _______ ____  _   __     _____ __  __      ___________
      / / ___// __ \/ | / /    / ___// / / /     / ____/ ___/
 __  / /\__ \/ / / /  |/ /_____\__ \/ /_/ /_____/ __/  \__ \ 
/ /_/ /___/ / /_/ / /|  /_____/__/ / __  /_____/ /___ ___/ / 
\____//____/\____/_/ |_/     /____/_/ /_/     /_____//____/  
                                                             
                                                    "$version"

Import raw JSON files into ElasticSearch in one line of bash commands

                                    -- Alexander Liu
                                    alex(at)nervey(dot)com
Options include:
    -h  show this help text
    -u  set the URL of bulk API (default: http://localhost:9200)
    -f  set the JSON data file path for bulk API
    -i  set the bulk index
    -t  set the bulk type

Examples:

    ~$ ./jsonshes.sh -u http://localhost -f /tmp/converted.json -i myindex1 -t mytype1"


url="http://localhost:9200"
_index=""
_type=""
file_path=""

#echo "OPTIND starts at $OPTIND"

#while getopts ":pq:" optname
while getopts ":hu:f:i:t:" optname
  do
    case "$optname" in
      "h")
        echo "$usage"
        exit
        ;;
      "u") # URL for bulk
        #echo "Option $optname has value $OPTARG"
        url=$OPTARG
        ;;
      "f")
        # file path to the raw JSON file
        #echo "Option $optname has value $OPTARG"
        file_path=$OPTARG
        ;;
      "i")
        # index for bulk API
        #echo "Option $optname has value $OPTARG"
        _index=$OPTARG
        ;;
      "t")
        # type for bulk API
        #echo "Option $optname has value $OPTARG"
        _type=$OPTARG
        ;;
      "?")
        echo "Unknown option $OPTARG"
        exit
        ;;
      ":")
        #echo "No argument value for option $OPTARG"
        echo "No argument value for option $OPTARG. It must have."
        exit
        ;;
      #"p")
        #echo "Option $optname is specified"
        #;;
      #"q")
        #echo "Option $optname has value $OPTARG"
        #;;
      #"?")
        #echo "Unknown option $OPTARG"
        #;;
      #":")
        #echo "No argument value for option $OPTARG"
        #;;
      *)
      # Should not occur
        echo "Unknown error while processing options"
        ;;
    esac
    #echo "OPTIND is now $OPTIND"
  done

  echo "curl -s -XPOST $url/$_index/$_type --data-binary @$file_path"
