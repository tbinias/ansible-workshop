#!/bin/bash

if [[ ! -d venvans ]]; then

  # install pip
  if ! type pip ; then
    sudo easy_install pip
  fi

  # install virtualenv
  if ! type virtualenv ; then
    sudo pip install virtualenv
  fi

  echo ""
  echo "creating virtualenv ./venvans"
  virtualenv venvans 2>&1 | sed 's/^/   > /'
  source venvans/bin/activate

  echo ""
  echo "installing ansible"
  pip install ansible 2>&1 | sed 's/^/   > /'

  ansible x00 -m ping

else 
  source venvans/bin/activate  
fi

echo ""
ansible --version
