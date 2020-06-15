Tools for generating attendee histograms from attendance data.

* `attendee_histogram.bash input0 [input1 ...]`: Prints out an attendee
  histogram in CSV format: `Name,# of Meetings`.
* `merge_attendee_histograms.py input0 [input1 ...]`: Combines multiple
  CVS files in the format `Name,# of Meetings` into a single CVS file in the
  format `Name,# of Meetings (input0)[,# of Meetings (input1) ...])`.

