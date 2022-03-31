Tools for generating attendee histograms from C++ Library Evolution and
Language Evolution attendance data.

* `make_reports.bash`: Creates attendee reports and analytics for all
  attendance data in `data`.
* `attendee_histogram.bash input0 [input1 ...]`: Prints out an attendee
  histogram in CSV format: `Attendee,# of Meetings`.
* `attendance.bash input0 [input1 ...]:` Prints out the attendance count
  in CSV format: `Date of Meeting,# of Attendees`.
* `check_attendee_uniqueness.bash`: Check whether the names in the first column
  of a CSV file are unique.
* `merge_attendee_histograms.py input0 [input1 ...]`: Combines
  multiple CSV files in the format `...,# of Meetings` into a single
  CSV file in the format `...,# of Meetings (input0)[,# of Meetings (input1)]...)`.
* `split_attendee_field.py input0`: Take a CSV file in
  the format `Name (Pronouns) {National-Body - Organization},...` and print out
  the data with the attendee field split into `Name,Pronouns,National Body,Organization`.
* `attendance.bash input0 [input1...]`: Prints out the dates and number
  of attendees for the inputs in the foramt `Date,# of Attendees`.
* `count.py [input0]`: Prints out the number of rows in a CSV file.
  Reads from stdin if no file is provided.
* `mean.py [input0]`: Prints the mean of the last column of a CSV file.
  Reads from stdin if no file is provided.
* `median.py [input0]`: Prints the median of the last column of a CSV file.
  Reads from stdin if no file is provided.
