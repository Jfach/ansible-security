#!/bin/bash

set -o errexit

rmf="docker rm -f"
rmi="docker rmi -f"


echo "========================================="
echo "autostager and ansible runnnin containers"
echo "if there are no PIDS - it's cleaned "
echo "========================================="
as_containers=($(docker ps -a | grep autostager | awk '{print $1}'))
ac_containers=($(docker ps -a | grep ansible | awk '{print $1'}))
as_container_pids=" ${as_containers[*]} "
ac_container_pids=" ${ac_containers[*]} "
as_data=($(docker ps -a | grep staging-data | awk '{print $1'}))

echo "====================================="
echo "finding autostager and ansible images"
echo "if there are no images - it's cleaned "
echo "====================================="
as_images=($(docker images | grep autostager | awk '{print $1}'))
ac_images=($(docker images | grep ansible | awk '{print $1}'))
as_image_ids=" ${as_images[*]} "
ac_image_ids=" ${ac_images[*]} "

echo "=================================="
echo "containers that will be cleaned up"
echo "=================================="
echo $as_container_pids
echo $ac_container_pids

echo "=============================="
echo "images that will be cleaned up"
echo "=============================="
echo $as_image_ids
echo $ac_image_ids
echo $as_data

echo $as_container_pids | xargs -r $rmf
echo $ac_container_pids | xargs -r $rmf
echo $as_image_ids | xargs -r $rmi
echo $ac_image_ids | xargs -r $rmi
echo $as_data | xargs -r $rmf
echo "==========================================="
echo "Done: autostager and ansible docker cleaned"
echo "==========================================="