#!/bin/sh
xclip -i /dev/null
touch blank
xclip -selection clipboard blank
rm blank
