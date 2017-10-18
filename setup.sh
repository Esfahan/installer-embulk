#!/bin/bash

# java
sudo yum -y install java-1.8.0-openjdk java-1.8.0-openjdk-devel

if [ `cat /etc/profile | grep 'JAVA_HOME' > /dev/null 2>&1; echo $?` == 0 ]; then
  echo '(skipping...)environment is alreday set.'
else
  sudo /bin/bash -lc 'cat java/environment >> /etc/profile'
  source /etc/profile
fi


# embulk

if [ `ls ~/.embulk/bin/embulk > /dev/null 2>&1; echo $?` == 0 ]; then
  echo '(skipping...) embulk is already installed'
else
  curl --create-dirs -o ~/.embulk/bin/embulk -L "https://dl.embulk.org/embulk-latest.jar"
  chmod +x ~/.embulk/bin/embulk
fi

if [ `cat ~/.bash_profile | grep '.embulk/bin' > /dev/null 2>&1; echo $?` == 0 ]; then
  echo '(skipping...) embulk path is already installed'
else
  echo 'export PATH="$HOME/.embulk/bin:$PATH"' >> ~/.bash_profile
  source ~/.bash_profile
fi
