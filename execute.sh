#!/bin/bash
#set environment variables
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
. $DIR/data/asimrc

function start_asim_vm {
  echo "------ starting vagrant environment ..."
  vagrant up
  echo "------ starting done."
}

function execute_asim_specs {
  echo "------ execute asim on guest"
  vagrant ssh -c "'${project}/execute.sh'"
  return $?
}

function pause {
  read -n1 -r -p "Press any key to start execution..." key
}

function check_vagrant_status {
  echo "------ checking vagrant status ..."
  VM_STATUS=`vagrant status --machine-readable | grep ",state," | egrep -o '([a-z_]*)$'`
  case "${VM_STATUS}" in
    running)
      execute_asim_specs
    ;;
    poweroff | aborted | not_created)
      start_asim_vm
      pause
      execute_asim_specs
    ;;
    *)
       echo "Unhandled: ${VM_STATUS}"
       exit 1
    ;;
  esac
}

execute_asim_specs
if [ $? -ne 0 ]; then
  check_vagrant_status
fi

echo "------ done."
exit 0
