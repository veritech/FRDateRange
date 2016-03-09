//
//  FRDateRange.h
//
//  Created by Jonathan Dalrymple on 16/02/2014.
//  Copyright (c) 2014 Float Right Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FRDateRange : NSObject <NSCopying>

@property (nonnull, nonatomic,strong,readonly) NSDate *startDate;
@property (nonnull, nonatomic,strong,readonly) NSDate *endDate;

/**
 *  Create a data range with dates, without having to check when the order
 *  It will sort the dates and create a range with earliest date, and the latest date
 */
+ (instancetype)dateRangeWithDates:(NSArray * _Nonnull)dates;

+ (instancetype)dateRangeWithStartDate:(NSDate * _Nonnull)startDate
							   endDate:(NSDate * _Nonnull)endDate;

- (instancetype)initWithStartDate:(NSDate * _Nonnull)startDate
                          endDate:(NSDate * _Nonnull)endDate;

- (BOOL)isDateInRange:(NSDate * _Nonnull)aDate;

- (BOOL)isEqualToDateRange:(FRDateRange * _Nonnull)dateRange;

+ (NSPredicate * _Nonnull)predicateWithKeyPath:(NSString * _Nonnull) aKeyPath
                            startDate:(NSDate * _Nonnull)start
                              endDate:(NSDate * _Nonnull)end;

- (NSPredicate * _Nonnull)predicateWithKeyPath:(NSString * _Nonnull)aKeyPath;

- (NSString * _Nonnull)stringRepresentationWithFormat:(NSString * _Nonnull)aFormat
                                   seperator:(NSString * _Nonnull)aSeperator;

- (NSTimeInterval)duration;

/*
 *  Date range of exactly the same duration starting the day after the end
 */
- (FRDateRange * _Nonnull)dateRangeForNextPeriod;
- (FRDateRange * _Nonnull)dateRangeForPreviousPeriod;

/**
 *  Keep the same date range, and advance both the start and end date by the given amount
 */
- (FRDateRange * _Nonnull)dateRangeByAdvancedByMinutes:(NSInteger)minutesToAdd;
- (FRDateRange * _Nonnull)dateRangeByAdvancedByHours:(NSInteger)hoursToAdd;
- (FRDateRange * _Nonnull)dateRangeByAdvancedByDays:(NSInteger)daysToAdd;
- (FRDateRange * _Nonnull)dateRangeByAdvancedByMonths:(NSInteger)monthsToAdd;
- (FRDateRange * _Nonnull)dateRangeByAdvancedByYears:(NSInteger)yearsToAdd;

@end
