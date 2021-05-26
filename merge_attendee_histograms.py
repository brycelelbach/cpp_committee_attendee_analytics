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
  'input', metavar='N', type=str, nargs='+',
  help='A CSV file containing data in the format "name,count".'
)
args = parser.parse_args()

data = {}

for file in range(len(args.input)):
  with open(args.input[file]) as csvfile:
    reader = csv.reader(csvfile)
    for attendee in csv.reader(csvfile):
      assert(len(attendee) == 2)
      if attendee[0] in data:
        data[attendee[0]][file] = int(attendee[1])
      else:
        new_attendee = [0] * len(args.input)
        new_attendee[file] = int(attendee[1])
        data[attendee[0]] = new_attendee

for attendee in sorted(data.items(), key=lambda x: (sum(x[1]), x[1], x[0]), reverse=True):
  print("{0},{1}".format(attendee[0], ','.join(map(str, attendee[1]))))

