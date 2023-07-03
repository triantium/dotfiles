#!/bin/bash

displays=$(xrandr | grep connected |grep -v disconnected | awk '{print $1}')

echo "Displays"
i=0
for disp in ${displays} ; do
  ((i=i+1))
  echo "  (${i}) ${disp}"
  selections[$i]=${disp}
done

echo "Select display"
read selected

selected_disp=${selections[selected]}
# echo "Changing to ${selected}"
echo "Changing to ${selected_disp}"


wacoms=$(xinput --list| grep -i Wacom | sed 's/.*id=\([0-9]\+\).*/\1/p')

# echo ${wacoms}

for id in ${wacoms}; do
  echo "Setting id=${id} to Display ${selected_disp}"
  xinput map-to-output ${id} ${selected_disp}
done
