#!/bin/bash
# lists jpg files of exactum camera taken this month
ls -R /cs/fs2/home/tkt_cam/public_html/$(date +2011/%m)/ | grep .*.jpg$
