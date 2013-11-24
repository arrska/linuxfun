#!/bin/bash
#creates an archive and compresses all shell scripts with multiple compressions
#shows file sizes


#bzip2
tar cjf script-archive.tar.bz2 ../../*/*.sh

#gzip
tar czf script-archive.tar.gz ../../*/*.sh

#without compression
tar cf script-archive.tar ../../*/*.sh

ls -lh script-archive.*
