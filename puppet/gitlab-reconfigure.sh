#!/usr/bin/env bash

TMP="/tmp"
CONFIGFILENAME="gitlab.rb"
CONFIG="$TMP/$CONFIGFILENAME"

run_reconfigure() {
    gitlab-ctl reconfigure
}

create_mountpoints() {
    mkdir -p /git-data/
    mkdir -p /git-data/1
    ln-s
}

# main
create_mountpoints
# create configfile
mkdir -p /etc/gitlab/ && cp $CONFIG /etc/gitlab/gitlab.rb
run_reconfigure
