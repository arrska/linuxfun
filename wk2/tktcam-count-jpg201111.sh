#!/bin/bash
# count jpg files inside november 2011 directory of exactum camera recursively
ls -R /cs/fs2/home/tkt_cam/public_html/2011/11/ | grep .*.jpg$ | wc -l
