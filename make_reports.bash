#! /usr/bin/env bash

# Copyright (c) 2020-2021 NVIDIA Corporation
#
# Distributed under the Boost Software License v1.0 (boost.org/LICENSE_1_0.txt)

make_report() {
  local OUTPUT="${1}"
  shift # Clear the first argument.
  local INPUTS="${@}"
  mkdir -p reports
  ./attendance.bash ${INPUTS} > reports/${OUTPUT}__attendance.csv
  ./attendee_histogram.bash ${INPUTS} > reports/${OUTPUT}__attendees.csv
  echo "${OUTPUT}:"
  echo "# of Telecons:                $(./count.py reports/${OUTPUT}__attendance.csv)"
  echo "Mean Attendees Per Telecon:   $(./mean.py reports/${OUTPUT}__attendance.csv)"
  echo "Median Attendees Per Telecon: $(./median.py reports/${OUTPUT}__attendance.csv)"
  echo "# of Attendees:               $(./count.py reports/${OUTPUT}__attendees.csv)"
  echo "Mean Telecons Per Attendee:   $(./mean.py reports/${OUTPUT}__attendees.csv)"
  echo "Median Telecons Per Attendee: $(./median.py reports/${OUTPUT}__attendees.csv)"
  echo ""
}

make_report 2020_04_06_to_2020_10_22_iso_cpp_remote__library_evolution \
  $(ls -1 data/2020_{{04,05,06,07,08,09},10_{05,13,19,22}}*__library_evolution__attendance.md)

make_report 2020_10_27_to_2021_02_16_iso_cpp_remote__library_evolution \
  $(ls -1 data/{2020_{10_27,11,12},2021_{01,02_{02,09,16}}}*__library_evolution__attendance.md)

make_report 2021_02_23_to_2021_05_25_iso_cpp_remote__library_evolution \
  $(ls -1 data/2021_{02_23,03,04,05_{03,11,17,25}}*__library_evolution__attendance.md)

make_report iso_cpp_remote__library_evolution \
  $(ls -1 data/*__library_evolution__attendance.md)

make_report 2020_04_06_to_2021_10_22_iso_cpp_remote__language_evolution \
  $(ls -1 data/2020_{{04,05,06,07,08,09},10_{08,14,22}}*__language_evolution__attendance.md)

make_report 2020_10_28_to_2021_02_17_iso_cpp_remote__language_evolution \
  $(ls -1 data/{2020_{10_28,11,12},2021_{01,02_{03,11,17}}}*__language_evolution__attendance.md)

make_report 2021_02_25_to_2021_05_26_iso_cpp_remote__language_evolution \
  $(ls -1 data/2021_{02_25,03,04,05_{06,12,20,26}}*__language_evolution__attendance.md)

make_report iso_cpp_remote__language_evolution \
  $(ls -1 data/*__language_evolution__attendance.md)

./merge_attendee_histograms.py \
  reports/iso_cpp_remote__library_evolution__attendees.csv \
  reports/iso_cpp_remote__language_evolution__attendees.csv \
  > reports/iso_cpp_remote__attendees.csv

