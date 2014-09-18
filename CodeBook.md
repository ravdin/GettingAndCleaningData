The tidy data set calculates the mean of a sample of variables in the original data set, grouped by activity and subject.  There are 6 activities and 30 subjects, for a total of 180 observations.

The process is:

-Merge the training and test data sets.
-Merge the training and test activity sets.
-Merge the training and test subject sets.
-Merge the data, activity, and subject sets into a single set, binding by columns.
-Extract the mean and standard deviation measurements.  Mean frequency should be included.
-Join the activity labels table.  We'll leave the activity id in place in case it might be needed later.
-Calculate the mean for each variable, grouped by activity and subject.
-Rename the grouped variables by prepending 'meanOf_' so the grouping method is clear.
-Write the tidy data set to a text file in the working directory.
-Remove temporary objects from memory.