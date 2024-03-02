#!/bin/bash

volume_path="/Users/ihahyeon/docker_volume"
mariadb_path="${volume_path}/mariadb"
wordpress_path="${volume_path}/wordpress"

rm -rf "$mariadb_path"
rm -rf "$wordpress_path"
