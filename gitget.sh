#!/bin/bash

# GLOBALS

# shellcheck disable=SC1117
regex="^(https|git)(:\\/\\/|@)([^\\/:]+)[\\/:]([^\\/:]+)\\/(.+).git$"


# FUNCTIONS

function usage { 
  echo ""
  echo "Usage: $0 <source> <destination>" 1>&2;
  echo ""
  echo "Source: ${source} should be a valid git URL:"
  echo -e "\t git://github.com/some-user/my-repo.git"
  echo -e "\t git@github.com:some-user/my-repo.git"
  echo -e "\t https://github.com/some-user/my-repo.git"

  exit "$1"; 
}

## PARSE INPUT & RUN GIT

# Validate source was set and valid.
if [ -z "${1}" ]; then
  echo "Must provide a git source."
  usage 1;
fi

source="${1}";

if [[ "${source}" =~ ${regex} ]]; then    
    # protocol=${BASH_REMATCH[1]}
    # separator=${BASH_REMATCH[2]}
    # hostname=${BASH_REMATCH[3]}
    user=${BASH_REMATCH[4]}
    repo=${BASH_REMATCH[5]}
else 
  echo "\"${source}\" is not a valid git repository"
  usage 1
fi

# Validate destination and set
if [[ -z "${2}" && -z "${CODE_PATH}" ]]; then
  echo "A destination was not provided and your CODE_PATH environment variable isn't set."
  usage 1
fi

destination="${2:-$CODE_PATH}"

if [ ! -d "$destination" ]; then
  echo "\"${destination}\" is not a valid Directory"
  usage 1
fi


# Run git clone

git clone "${source}" "${destination}/${user}/${repo}"



