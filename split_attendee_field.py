#! /usr/bin/env python3

# Copyright (c) 2020-2021 NVIDIA Corporation
#
# Distributed under the Boost Software License v1.0 (boost.org/LICENSE_1_0.txt)

import argparse
import csv
import sys

parser = argparse.ArgumentParser(
  description='Split the attendee field into multiple fields.'
)
parser.add_argument(
  'input', metavar='input', type=str, nargs='?',
  help='A CSV file containing data in the format "attendee,...".'
)
args = parser.parse_args()

with open(args.input) if args.input else sys.stdin as file:
  for entry in csv.reader(file):
    # https://github.com/cplusplus/LEWG/wiki/Telecon-Names
    #
    # attendee:      name (pronouns) {national-body - organization}
    # pronouns:      Completely optional
    # national-body: Use ISO 3166-1 alpha-2 codes. Only list one NB. For
    #                those who are not members of an NB, put "Invited".
    # organization:  Required for US NB members, optional for all other NBs.

    split_left_parens = entry[0].split(" (", 1)

    # `split_left_parens` is either:
    #   ("name", "pronouns) {national-body - organization}")
    #   ("name {national-body - organization}")

    pronouns = ""
    name_affiliation = ""
    if len(split_left_parens) > 1:
      # Entry has pronouns.
      (pronouns, affiliation) = split_left_parens[1].split(")", 1)
      name_affiliation = split_left_parens[0] + affiliation
    else:
      # Entry has no pronouns.
      name_affiliation = split_left_parens[0]

    # `pronouns` is "pronouns".
    # `name_affiliation` is "name {national-body - organization}".

    (name, affiliation) = name_affiliation.split(" {", 1)
    affiliation = affiliation.rstrip("}")

    # `name` is "name".
    # `affiliation` is "national-body - organization".

    split_dash = affiliation.split(" - ", 1)

    # `split_dash` is either:
    #   ("national-body", "organization")
    #   ("organization")

    (national_body, organization) = split_dash \
                                    if len(split_dash) > 1 else \
                                    ("", split_dash[0])

    # `national_body` is "national_body".
    # `organization` is "organization".

    split_entry = [name, pronouns, national_body, organization] + entry[1:]
    print(','.join(split_entry))

