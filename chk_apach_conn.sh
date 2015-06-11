#!/bin/bash
# $Author: Mike Yom<mikeyom@gmail.com>
# Nagios plugin script for OPS team checking the established apache connections.

CONN=`sudo netstat -plan | grep ESTABLISHED | grep apache2 | wc -l`

if [ $CONN -gt 200 ]; then
   echo "Warning the over 200 Established Apache connection is connected."
   exit 1
fi

if [ $CONN -gt 400 ]; then
   echo "Critical the over 400 Established Apache connection is connected."
   exit 2
fi

echo "Currently there are $CONN ESTABLISHED Apache Processes Connected."
exit 0