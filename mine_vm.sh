#!/bin/bash

while true; do

  ITEM=$(tail -n 1 $HOME/qub_dir/logs2.txt | awk -F ' ' '{print $6}')
  if [ $ITEM = 'Idling' ]; then
    cd /home/azureuser
    if [[ $(tmux ls) == *"servak_idle"* ]]; then
      echo "ocean уже работает, режим idle у куба"
      sleep 3
    else
      tmux new -ds servak_idle sudo /home/azureuser/xmrig
      echo "режим idle у куба, запустил ocean"
    fi
  else
    echo "куб работает, ocean не нужен или я его удалил"
    tmux kill-session -t servak_idle
    sleep 2
  fi
  sleep 1
done