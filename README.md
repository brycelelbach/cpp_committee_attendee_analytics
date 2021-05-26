Tools for generating attendee histograms from C++ Library Evolution and
Language Evolution attendance data.

* `attendee_histogram.bash input0 [input1 ...]`: Prints out an attendee
  histogram in CSV format: `Name,# of Meetings`.
* `attendance.bash input0 [input1 ...]:` Prints out the attendance count
  in CSV format: `Date of Meeting,# of Attendees`.
* `make_reports.bash`: Creates attendee reports and analytics for all
  attendance data in `data`.
* `merge_attendee_histograms.py input0 [input1 ...]`: Combines multiple
  CSV files in the format `Name,# of Meetings` into a single CSV file in the
  format `Name,# of Meetings (input0)[,# of Meetings (input1) ...])`.
* `report_attendance.bash input0 [input1...]`: Prints out the dates and number
  of attendees for the inputs in the foramt `Date,# of Attendees`.
* `count.py [input0]`: Prints out the number of rows in a CSV file.
  Reads from stdin if no file is provided.
* `mean.py [input0]`: Prints the mean of the second column of a CSV file.
  Reads from stdin if no file is provided.
* `median.py [input0]`: Prints the median of the second column of a CSV file.
  Reads from stdin if no file is provided.
