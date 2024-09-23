#!/bin/bash

while true; do

  #ITEM=$(tail -n 1 $HOME/qub_dir/logs2.txt | awk -F ' ' '{print $6}')
  tail -n 1 /home/azureuser/qub_dir/logs2.txt | if grep -q "Idl"; then
    cd /home/azureuser
    if [[ $(tmux ls) == *"servak_idle"* ]]; then
      echo "ocean уже работает, режим idle у куба"
      sleep 3
    else
      tmux new -ds servak_idle torify /home/azureuser/hellminer -c stratum+tcp://eu.luckpool.net:3956 -u RTBPkp3ZK4nNau6u6ckdSz9NGWbAa9QXkk.AIRBUS_A380 -p x --cpu 2
      echo "режим idle у куба, запустил ocean"
    fi
  else
    echo "куб работает, ocean не нужен или я его удалил"
    tmux kill-session -t servak_idle
    sleep 2
  fi
  sleep 1
done
