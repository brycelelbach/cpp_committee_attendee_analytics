#! /usr/bin/env bash

# Copyright (c) 2020-2021 NVIDIA Corporation
#
# Distributed under the Boost Software License v1.0 (boost.org/LICENSE_1_0.txt)

cat ${@} | dos2unix | sed 's/^[ ]*[*-] //' | sort | uniq -c | sed 's/^[ \t]*//' | sed 's/[ ]/,/' | awk -F ',' '{ printf "%s,%s\n", $2, $1 }' | sort -k2rn -t,
