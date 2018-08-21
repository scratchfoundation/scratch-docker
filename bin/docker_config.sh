#!/bin/bash

NETWORK_NAME=scratchapi_scratch_network

command=$1
shift
arg=$1
shift

case "$command" in
network)
    if [ -z $(docker network ls --filter name=^${NETWORK_NAME}$ --format="{{ .Name }}") ] ; then 
        docker network create ${NETWORK_NAME} ; 
    fi
    ;;
*)
     echo "usage:"
     echo "    docker_config.sh <command> <arg>"
     echo ""
     echo "  Currently only performs 'docker_config.sh network create'"
     ;;
esac
