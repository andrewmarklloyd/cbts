#!/bin/bash

scriptDir=$(pwd)

mkdir -p "${HOME}/vagrant"
cd "${HOME}/vagrant"

install_tools() {
  echo "Installing homebrew"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

  echo "Installing virtualbox"
  brew install --cask virtualbox

  echo "Installing vagrant"
  brew install --cask vagrant
}

get_config() {
  if [[ ${DEBUG} ]]; then
    cp ${scriptDir}/Vagrantfile.template .
  else
    echo "Downloading config files"
    curl -s -H 'Cache-Control: no-cache' https://raw.githubusercontent.com/andrewmarklloyd/cbts/master/Vagrantfile.template > Vagrantfile.template
  fi
}

sed_iso() {
  ISO=$(find ${HOME}/Desktop -type f -name *.ISO -depth 1)
  if [[ -z ${ISO} ]]; then
    echo "ISO file not found! Ensure the CBT ISO file is on the Desktop."
    exit 1
  fi
  numFiles=$(echo "${ISO}" | wc -l)
  if [[ ${numFiles} -gt 1 ]]; then
    echo "More than one ISO file found on Desktop but exactly one file is expected. Please remove all but the expected ISO file."
    exit 1
  fi
  subISO=$(echo $ISO | sed 's/\//\\\//g')
  sed "s/{{.ISO}}/${subISO}/g" Vagrantfile.template > Vagrantfile
}

reload_course() {
  course=$(find ${HOME}/Desktop -type f -name reload*.zip -depth 1)
  if [[ -z ${course} ]]; then
    echo "CBT course reload file not found! Ensure the CBT course reload zip file is on the Desktop."
    exit 1
  fi
  numFiles=$(echo "${course}" | wc -l)
  if [[ ${numFiles} -gt 1 ]]; then
    echo "More than one course reload zip file found on Desktop but exactly one file is expected. Please remove all but the expected course reload zip file."
    exit 1
  fi
  unzip -q ${course} -d ${HOME}/Desktop/cbt_mount
}

start_vm() {
  echo "Starting virtual machine"
  vagrant up
}
