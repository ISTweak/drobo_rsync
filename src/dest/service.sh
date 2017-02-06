#!/usr/bin/env sh
#
# rsyncd file server

. /etc/service.subr

name="rsyncd"
version="3.1.2"

prog_dir=`dirname \`realpath $0\``
pidfile=${prog_dir}/var/run/${name}.pid
logfile=${prog_dir}/var/log/${name}.log
conffile=${prog_dir}/etc/${name}.conf

start()
{
	if [ ! -f ${conffile} ]; then cp ${conffile}.default ${conffile}; fi
	if [[ ! -d "${prog_dir}/var/run" ]]; then mkdir -p "${prog_dir}/var/run"; fi
	if [[ ! -d "${prog_dir}/var/log" ]]; then mkdir -p "${prog_dir}/var/log"; fi

	${prog_dir}/bin/rsync --daemon --config=${conffile} --log-file=${logfile} >> ${logfile} 2>&1
	echo `/bin/pidof -s rsync` > ${pidfile}
}

_mk_link() {
	rm -f "/bin/rsync"
	ln -s "${prog_dir}/bin/rsync" "/bin/rsync"
}

_rm_link() {
	rm -f "/bin/rsync"
}

case "$1" in
start)
		_mk_link
        start_service
        ;;
stop)
        stop_service
		_rm_link
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

