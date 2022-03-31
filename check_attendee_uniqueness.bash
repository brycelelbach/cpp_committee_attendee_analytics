#! /usr/bin/env bash

# Copyright (c) 2020-2021 NVIDIA Corporation
#
# Distributed under the Boost Software License v1.0 (boost.org/LICENSE_1_0.txt)

NON_UNIQUE=$(awk -F ',' '{ print $1 }' ${@} | sort | uniq -d)

if [ ! -z "${NON_UNIQUE}" ]; then
  echo "Non-unique attendees found:"
  echo "${NON_UNIQUE}"
fi

