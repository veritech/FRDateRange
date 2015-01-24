FRDateRange
===========

FRDateRange exists to encapsulate date ranges, and provide helper methods for calcuating if a date lies within it's range;

Usage
-----

Firstly you'll need to create a Date range

    FRDateRange *range = [FRDateRange dateRangeWithStartDate:[NSDate distantPast] endDate:[NSDate futureDate]];
	
Once you've got that range you can few different things like:

Discover if a date is within that range.

    if ([range isDateInRange:otherDate]) {
      //
    }
	
Get the duration of the range.

    NSTimeInterval length = [range duration];
	
Get a predicate for the range, useful with working with CoreData or collections.

    [range predicateWithKeyPath:keyPathOfYourObject]
	
Get the next period using the same date range duration.

	FRDateRange *nextRange = [range dateRangeForNextPeriod];

	FRDateRange *previousRange = [range dateRangeForPreviousPeriod];

Move the date range "window" forward (or backward using negative values) by years or months.

	FRDateRange *advancedRanage = [range dateRangeByAdvancedByMonths:1];
	
Get in Contact
---------------

[Twitter](http://twitter.com/veritech)
[Email](mailto:jonathan@float-right.co.uk)