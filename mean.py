#! /usr/bin/env python3

# Copyright (c) 2020-2021 NVIDIA Corporation
#
# Distributed under the Boost Software License v1.0 (boost.org/LICENSE_1_0.txt)

import argparse
import csv
import sys
import statistics

parser = argparse.ArgumentParser(
  description='Compute the mean of the last column of a CSV file.'
)
parser.add_argument(
  'input', metavar='N', type=str, nargs='?',
  help='A CSV file containing data in the format "...,number".'
)
args = parser.parse_args()

data = []

with open(args.input) if args.input else sys.stdin as file:
  for entry in csv.reader(file):
    data.append(int(entry[-1]))

print(round(statistics.mean(data), 2))

