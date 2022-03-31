#! /usr/bin/env python3

# Copyright (c) 2020-2021 NVIDIA Corporation
#
# Distributed under the Boost Software License v1.0 (boost.org/LICENSE_1_0.txt)

import argparse
import csv

parser = argparse.ArgumentParser(
  description='Combine attendee histograms.'
)
parser.add_argument(
  'input', metavar='input', type=str, nargs='+',
  help='A CSV file containing data in the format "...,count".'
)
args = parser.parse_args()

data = {} # Schema: {attendee : [count0, count1, ..., countN]}

for fileidx in range(len(args.input)):
  with open(args.input[fileidx]) as file:
    for entry in csv.reader(file):
      attendee = tuple(entry[:-1])
      count = entry[-1]
      if attendee in data:
        data[attendee][fileidx] = int(count)
      else:
        new_record = [0] * len(args.input)
        new_record[fileidx] = int(count)
        data[attendee] = new_record

for record in sorted(data.items(), key=lambda x: (sum(x[1]), x[1], x[0]), reverse=True):
  print("{0},{1}".format(','.join(record[0]), ','.join(map(str, record[1]))))

