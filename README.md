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

To start the manager and one single brapper execute 

```bash
startEnvironment.sh
```

in the *data* directory in order to send a icef definition on the manager.

Finally

```bash
execute.sh
```

can be used to start the *run.icef* specification of the ASIMSpec definition.
