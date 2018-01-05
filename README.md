# ASIM Vagrant Environment

This vagrant definition provides a running environment for executing the INTERLACE ASIMs. During the provisioning process it is setting up an ubuntu vagrant box and installs the necessary components on that box. It is cloning and building the biomics/icef framework as well as the ASIM Specification (InterlaceProject/ASIMSpec) into the data directory where it is finally ready for usage.

## Prerequisites

**Download & Install**
  - Virtual Box: https://www.virtualbox.org/
  - git https://git-scm.com/downloads
  - vagrant https://www.vagrantup.com/

## Install environment

First clone this respository into a directory of your choice:

```bash
git clone https://github.com/InterlaceProject/ASIMVagrantEnvironment.git
```

## Execution

Call

```bash
execute.sh
```

in the main directory in order to let the INTERLACE specifications run.

More detailed:

  1. On the very first execution the script is provisioning a virtual machine
  based on ubuntu by using *vagrant up*
  2. If the virtual machine is not yet running it tries to start the virtual
  machine.
  3. If the VM is running the script *data/execute.sh* is called on the guest
  vm.

The actual execution:

The script *data/execute.sh* starts the icef manager as well as one brapper. Then
it is submitting the specification (*run.icef*) located in *data/ASIMSpec/* to the manager.
When done the script is waiting for a *stop* command or may also be stopped
using **ctrl + c**.

## Stopping

To stop an executing script call

```bash
stop.sh
```
or just press **ctrl + c** in the window *data/execute.sh* is running.

When calling *stop.sh* a stopping command is send to the executing script,
ending all running processes needed to execute the specifications.
