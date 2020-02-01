#!/bin/bash

if [ ! -f /home/ror/sheetbook/make-sheets.sh ]; then
    echo "Mount sheetbook in /home/ror/sheetbook"
    exit 1
fi

cd /home/ror/sheetbook

rm -rf generated
mkdir generated
chown ror:ror generated
su ror -c ./make-sheets.sh || exit $?
chown -R "$(stat -c %u:%g make-sheets.sh)" generated
