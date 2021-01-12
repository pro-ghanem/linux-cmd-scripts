#! /bin/bash

for i in ~/Desktop/test/* ; do 
sed -i 's/staging/prod/' $i
 gawk -i inplace '!/uid/' $i
 gawk -i inplace '!/creationTimestamp/' $i
done




