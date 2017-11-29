# ASIM Vagrant Environment

This vagrant definition provides a running environment for executing the INTERLACE ASIMs. During the provisioning process it is setting up an ubuntu vagrant box and installs the necessary components on that box. It is cloning and building the biomics/icef framework as well as the ASIM Specification (InterlaceProject/ASIMSpec) into the data directory where it is finally ready for usage.

## Prerequisites

**Download & Install**
  - Virtual Box: https://www.virtualbox.org/
  - git https://git-scm.com/downloads
  - vagrant https://www.vagrantup.com/

## Install environment

First clone this respository into a directory of your choice and then you setup the virtual machine by calling vagrant:

```bash
git clone https://github.com/InterlaceProject/ASIMVagrantEnvironment.git
vagrant up
```

## Execution

Call

```bash
execute.sh
```

in the *data* directory in order to let the INTERLACE specifications run.

More detailed: This script starts the manger as well as one brapper. Then it is
submitting the specification *run.icef* in *data/ASIMSpec/* to the manager.
When done the script is waiting for a *stop* command or may also be stopped using
ctrl + c.

## Stopping

To stop a executing script call

```bash
stop.sh
```

When doing so a *stop* command is send to the executing script ending all
running processes needed to execute the specifications.
