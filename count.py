#! /usr/bin/env python3

# Copyright (c) 2020-2021 NVIDIA Corporation
#
# Distributed under the Boost Software License v1.0 (boost.org/LICENSE_1_0.txt)

import argparse
import csv
import sys

parser = argparse.ArgumentParser(
  description='Count the number of rows in a CSV file.'
)
parser.add_argument(
  'input', metavar='input', type=str, nargs='?',
  help='A CSV file containing data in the format "name,count".'
)
args = parser.parse_args()

count = 0

with open(args.input) if args.input else sys.stdin as file:
  for entry in csv.reader(file):
    count += 1

print(count)

