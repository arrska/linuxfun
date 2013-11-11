#!/bin/bash
#counts tktcam pictures taken this month
find ~tkt_cam/public_html/$(date +%Y/%m) -iname *.jpg | wc -l
