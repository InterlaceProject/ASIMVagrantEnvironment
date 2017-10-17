# ASIM Vagrant Environment

This vagrant enironment provides an running environment executing the INTERLACE ASIMs.

## Prerequisites

**Download & Install**
  - Virtual Box: https://www.virtualbox.org/
  - git https://git-scm.com/downloads
  - vagrant https://www.vagrantup.com/
  
## Install environment

First clone this respository into a directory of your choice and then you can setup the virtual machine by calling vagrant:

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
