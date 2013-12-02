#!/bin/bash
#hipstafy daemon initializer

boxfolder=~/Desktop/hipstafy-dropbox
pidfile=hipsta.pid

start_daemon() {
	if [ -e $pidfile ] && kill -0 $(cat $pidfile) 2>/dev/null
	then
		echo Daemon is already running
		exit 1
	else
		nohup ./hipstafy-wait.sh "$boxfolder" 2>>hipstafy_err.log 1>>hipstafy.log &
		
		echo $! >hipsta.pid
		echo Hipstafy daemon is now running with pid $!
	fi
}

stop_daemon() {
	if [ -e $pidfile ] && kill -0 $(cat $pidfile) 2>/dev/null
	then
		pkill -TERM -P $(cat $pidfile)
		rm hipsta.pid
		echo Hipstafy daemon stopped
	else
		echo Hipstafy daemon is not running
		exit 1
	fi
}

daemon_status() {
	if [ -e $pidfile ] && kill -0 $(cat $pidfile) 2>/dev/null
	then
		echo Hipstafy-daemon is running with pid $(cat $pidfile)
	else
		echo Hipstafy-daemon is not running
	fi
}

case "$1" in
	start)
		start_daemon
		;;
	stop)
		stop_daemon
		;;
	restart)
		stop_daemon
		start_daemon
		;;
	status)
		daemon_status
		;;
esac
