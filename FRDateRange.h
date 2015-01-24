//
//  FRDateRange.h
//
//  Created by Jonathan Dalrymple on 16/02/2014.
//  Copyright (c) 2014 Float Right Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FRDateRange : NSObject <NSCopying>

@property (nonatomic,strong,readonly) NSDate *startDate;
@property (nonatomic,strong,readonly) NSDate *endDate;

/**
 *  Create a data range with dates, without having to check when the order
 *  It will sort the dates and create a range with earliest date, and the latest date
 */
+ (instancetype)dateRangeWithDates:(NSArray *)dates;

+ (instancetype)dateRangeWithStartDate:(NSDate *)startDate
                     endDate:(NSDate *)endDate;



- (instancetype)initWithStartDate:(NSDate *)startDate
                endDate:(NSDate *)endDate;

- (BOOL)isDateInRange:(NSDate *)aDate;

+ (NSPredicate *)predicateWithKeyPath:(NSString *) aKeyPath startDate:(NSDate *)start endDate:(NSDate *)end;

- (NSPredicate *)predicateWithKeyPath:(NSString *)aKeyPath;

- (NSString *)stringRepresentationWithFormat:(NSString *)aFormat
                                   seperator:(NSString *)aSeperator;

- (NSTimeInterval)duration;

/*
 *  Date range of exactly the same duration starting the day after the end
 */
- (FRDateRange *)dateRangeForNextPeriod;
- (FRDateRange *)dateRangeForPreviousPeriod;

/**
 *  Keep the same date range, and advance both the start and end date by the given amount
 */
- (FRDateRange *)dateRangeByAdvancedByMonths:(NSInteger)monthsToAdd;
- (FRDateRange *)dateRangeByAdvancedByYears:(NSInteger)yearsToAdd;

@end
