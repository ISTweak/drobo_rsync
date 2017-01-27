#!/bin/sh
#
# rsyncd file server

. /etc/service.subr

prog_dir=`dirname \`realpath $0\``

name="rsync"
version="3.1.2"
pidfile=${prog_dir}/var/run/rsyncd.pid
logfile=${prog_dir}/var/log/rsyncd.log
conffile=${prog_dir}/etc/rsyncd.conf

start()
{
  if [ ! -f $conffile ]; then
    cp ${conffile}.default ${conffile} > /dev/null 2>&1
  fi

  ${prog_dir}/bin/rsync --daemon --config=${conffile} --log-file=${logfile} >> ${logfile} 2>&1
  echo `/bin/pidof -s rsync` > ${pidfile}
}

case "$1" in
start)
        start_service
        ;;
stop)
        stop_service
        ;;
restart)
        stop_service
        sleep 3
        start_service
        ;;
status)
        status
        ;;
*)
        echo "Usage: $0 [start|stop|restart|status]"
        exit 1
        ;;
esac


