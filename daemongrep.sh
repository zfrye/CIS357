#!/bin/bash

grep -c $1 "/var/log/daemon.log"
