#!/bin/bash
line="%wheel ALL=(ALL) ALL"; sed -i "/^#$line/ c$line" testfile.txt

# line=A2; sed -i "/^#$server/ c$server" file.txt
