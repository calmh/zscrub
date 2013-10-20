#!/bin/bash

pool="$1"

zgetint() {
	fs="$1"; prop="$2"; default="$3"
	val=$(zfs get -H -o value "$prop" "$fs" | tr -d -)
	echo ${val:-$default}
}

interval=$(zgetint "$pool" se.nym.scrub:interval 30)
interval=$((86400 * interval))

while true ; do
        now=$(date +%s)
        last=$(zgetint "$pool" se.nym.scrub:latest 0)
        next=$((interval + last))

        if ((now > next)) ; then
                zpool scrub "$pool"
                zfs set se.nym.scrub:latest="$now" "$pool"
        fi

        sleep 60
done
