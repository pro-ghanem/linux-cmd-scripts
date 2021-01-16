#!/bin/bash
for i in {1..10}; do
    if [[ -f access.log.${i} ]]; then
        mv -f access.log.${i} access.log.$((i+1))
    fi

done
mv -f access.log access.log.1
touch access.log