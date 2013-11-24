#!/bin/bash
#rewrites consecutive spaces and every slash to a comma
sed -e 's/\(\/\)\|\(\ \)\+/,/g'
