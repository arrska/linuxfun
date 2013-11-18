#!/bin/bash
#picks unique processor temperatures in celcius from temps.txt -files
grep -h -r --include "hp-temps.txt" PROCESSOR_ZONE monitor/2011.12.25/ | cut -c32-42 | cut -d"/" -f1 | sort -u
