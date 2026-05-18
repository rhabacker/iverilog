#!/bin/sh
set -euo pipefail

#
# This shell script exists to run autoconf on source distributions
# that are pulled from git The configure script is not included
# in git, so it is easiest to just run this script whenever needed
# to generate the configure script.
#
echo "Run autoconf in root directory"
autoreconf -fi
