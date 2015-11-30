#!/usr/bin/env bash

function sd_parse_urls {
  while [[ ${#} > 1 ]]
  do
    local key="${1}";
    case ${key} in
        -f|--file)
        local SD_TEMP_FILE="${2}";
        shift # past argument
        ;;
        *)
                # unknown option
        ;;
    esac
    shift # past argument or value
  done
  # output the file and grep it as per the docs.
  cat "${SD_TEMP_FILE}" | grep '"ip">' | awk 'BEGIN { FS = ">" }; { print $2 }' | awk 'BEGIN { FS = "<" }; { print $1 }'
  return;
}

sd_parse_urls "$@";
