# /bin/bash

for i in * ; do 
 awk '!/creationTimestamp/' $i > ${i}.backup && ${i}.backup $i
 awk '!/selfLink/' $i > ${i}.backup && ${i}.backup $i
 awk '!/uid/' $i > ${i}.backup && ${i}.backup $i
 awk '!/revision/' $i > ${i}.backup && ${i}.backup $i

done





