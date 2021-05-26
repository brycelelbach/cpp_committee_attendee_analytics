#! /usr/bin/env bash

# Copyright (c) 2020-2021 NVIDIA Corporation
#
# Distributed under the Boost Software License v1.0 (boost.org/LICENSE_1_0.txt)

wc -l ${@} | head -n -1 | sed 's|[ \t]*\([0-9]\+\) .*\([0-9]\{4\}\)_\([0-9]\{2\}\)_\([0-9]\{2\}\).*|\2-\3-\4, \1|'

