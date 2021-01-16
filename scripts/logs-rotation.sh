#!/bin/bash
# i got 0 in the exam so this script didn't work as expected
for i in {9..1}; do
    if [[ -f access.log.${i} ]]; then
        mv -f access.log.${i} access.log.$((${i}+1))
    fi
    if [[ -f error.log.${i} ]]; then
        mv -f error.log.${i} error.log.$((${i}+1))
    fi
done

mv -f access.log access.log.1
touch access.log

mv -f error.log error.log.1
touch error.log