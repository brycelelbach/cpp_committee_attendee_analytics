#! /usr/bin/env bash

# Copyright (c) 2020-2021 NVIDIA Corporation
#
# Distributed under the Boost Software License v1.0 (boost.org/LICENSE_1_0.txt)

SCRIPT_PATH=$(cd $(dirname ${0}); pwd -P)

cd ${SCRIPT_PATH}

make_report() {
  local OUTPUT="${1}"
  shift # Clear the first argument.
  local INPUTS="${@}"
  mkdir -p reports
  ./make_attendance.bash ${INPUTS} > reports/${OUTPUT}__attendance.csv
  ./make_attendee_histogram.bash ${INPUTS} > reports/${OUTPUT}__attendees.csv
  echo "${OUTPUT}:"
  echo "# of Telecons:                $(./count.py reports/${OUTPUT}__attendance.csv)"
  echo "Mean Attendees Per Telecon:   $(./mean.py reports/${OUTPUT}__attendance.csv)"
  echo "Median Attendees Per Telecon: $(./median.py reports/${OUTPUT}__attendance.csv)"
  echo "# of Attendees:               $(./count.py reports/${OUTPUT}__attendees.csv)"
  echo "Mean Telecons Per Attendee:   $(./mean.py reports/${OUTPUT}__attendees.csv)"
  echo "Median Telecons Per Attendee: $(./median.py reports/${OUTPUT}__attendees.csv)"
  echo ""
}

make_report 2020_04_06_to_2020_10_22_iso_cpp_remote__library_evolution__telecons \
  $(ls -1 data/telecons/2020_{{04,05,06,07,08,09},10_{05,13,19,22}}*library_evolution*attendance.md)

make_report 2020_10_27_to_2021_02_16_iso_cpp_remote__library_evolution__telecons \
  $(ls -1 data/telecons/{2020_{10_27,11,12},2021_{01,02_{02,09,16}}}*library_evolution*attendance.md)

make_report 2021_02_23_to_2021_05_25_iso_cpp_remote__library_evolution__telecons \
  $(ls -1 data/telecons/2021_{02_23,03,04,05_{03,11,17,25}}*library_evolution*attendance.md)

make_report 2021_06_01_to_2021_09_20_iso_cpp_remote__library_evolution__telecons \
  $(ls -1 data/telecons/2021_{06,07,08,09_{09,14,20}}*library_evolution*attendance.md)

make_report 2021_09_28_to_2022_01_25_iso_cpp_remote__library_evolution__telecons \
  $(ls -1 data/telecons/{2021_{09_28,10,11,12},2022_01}*library_evolution*attendance.md)

make_report 2021_09_28_to_2022_01_25_iso_cpp_remote__library_evolution__supertelecons \
  $(ls -1 data/supertelecons/{2021_{10,12},2022_01}*library_evolution*attendance.md)

make_report 2021_09_28_to_2022_01_25_iso_cpp_remote__library_evolution \
  $(ls -1 data/telecons/{2021_{09_28,10,11,12},2022_01}*library_evolution*attendance.md) \
  $(ls -1 data/supertelecons/{2021_{10,12},2022_01}*library_evolution*attendance.md)

make_report iso_cpp_remote__library_evolution__supertelecons \
  $(ls -1 data/supertelecons/*library_evolution*attendance.md)

make_report iso_cpp_remote__library_evolution__telecons \
  $(ls -1 data/telecons/*library_evolution*attendance.md)

make_report iso_cpp_remote__library_evolution \
  $(ls -1 data/*/*library_evolution*attendance.md)

make_report 2020_04_06_to_2021_10_22_iso_cpp_remote__language_evolution__telecons \
  $(ls -1 data/telecons/2020_{{04,05,06,07,08,09},10_{08,14,22}}*language_evolution*attendance.md)

make_report 2020_10_28_to_2021_02_17_iso_cpp_remote__language_evolution__telecons \
  $(ls -1 data/telecons/{2020_{10_28,11,12},2021_{01,02_{03,11,17}}}*language_evolution*attendance.md)

make_report 2021_02_25_to_2021_05_26_iso_cpp_remote__language_evolution__telecons \
  $(ls -1 data/telecons/2021_{02_25,03,04,05_{06,12,20,26}}*language_evolution*attendance.md)

make_report 2021_06_03_to_2021_09_23_iso_cpp_remote__language_evolution__telecons \
  $(ls -1 data/telecons/2021_{06,07,08,09_{01,15,23}}*language_evolution*attendance.md)

make_report 2021_10_07_to_2021_12_16_iso_cpp_remote__language_evolution__telecons \
  $(ls -1 data/telecons/2021_{10,11,12}*language_evolution*attendance.md)

make_report iso_cpp_remote__language_evolution__telecons \
  $(ls -1 data/telecons/*language_evolution*attendance.md)

make_report iso_cpp_remote__language_evolution \
  $(ls -1 data/*/*language_evolution*attendance.md)

./merge_attendee_histograms.py \
  reports/iso_cpp_remote__library_evolution__attendees.csv \
  reports/iso_cpp_remote__language_evolution__attendees.csv \
  > reports/iso_cpp_remote__attendees.csv

./check_attendee_uniqueness.bash reports/iso_cpp_remote__attendees.csv

