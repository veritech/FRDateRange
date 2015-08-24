//
//  FRDateRange.m
//
//  Created by Jonathan Dalrymple on 16/02/2014.
//  Copyright (c) 2014 Float Right Ltd. All rights reserved.
//

#import "FRDateRange.h"
#import <NSDate-Escort/NSDate+Escort.h>
#import "NSDateFormatter+cache.h"

@interface FRDateRange ()

@property (nonatomic,strong,readwrite) NSDate *startDate;
@property (nonatomic,strong,readwrite) NSDate *endDate;

@end

@implementation FRDateRange

+ (instancetype)dateRangeWithDates:(NSArray *)dates {
    NSArray *sortedDates = [dates sortedArrayUsingSelector:@selector(compare:)];
    
    return [self dateRangeWithStartDate:[sortedDates firstObject]
                                endDate:[sortedDates lastObject]];
}

+ (id)dateRangeWithStartDate:(NSDate *)startDate
                     endDate:(NSDate *)endDate
{
    return [[self alloc] initWithStartDate:startDate
                                   endDate:endDate];
}

- (id)initWithStartDate:(NSDate *)startDate
                endDate:(NSDate *)endDate
{
    
    self = [super init];
    if (self) {
        [self setStartDate:startDate];
        [self setEndDate:endDate];
    }
    return self;
}

#pragma mark - Deverving date ranges
- (FRDateRange *)dateRangeForNextPeriod
{
    return [FRDateRange dateRangeWithStartDate:[self endDate]
                                       endDate:[[self endDate] dateByAddingTimeInterval:[self duration]]];
}

- (FRDateRange *)dateRangeForPreviousPeriod
{
    return [FRDateRange dateRangeWithStartDate:[[self startDate] dateByAddingTimeInterval:[self duration]*-1]
                                       endDate:[self startDate]];
}

- (FRDateRange *)dateRangeByAdvancedByMonths:(NSInteger)monthsToAdd {
    return [FRDateRange dateRangeWithStartDate:[self.startDate dateByAddingMonths:monthsToAdd]
                                       endDate:[self.endDate dateByAddingMonths:monthsToAdd]];
}

- (FRDateRange *)dateRangeByAdvancedByYears:(NSInteger)yearsToAdd {
    return [FRDateRange dateRangeWithStartDate:[self.startDate dateByAddingYears:yearsToAdd]
                                       endDate:[self.endDate dateByAddingYears:yearsToAdd]];
}

#pragma mark - SMhDateRange Utilities
- (BOOL)isDateInRange:(NSDate *)aDate
{
    
    if ([[self startDate] isEarlierThanOrEqualDate:aDate] &&
        [[self endDate] isLaterThanOrEqualDate:aDate]) {
        return YES;
    }
    return NO;
}

- (NSTimeInterval)duration
{
    return [[self endDate] timeIntervalSince1970] - [[self startDate] timeIntervalSince1970];
}

+ (NSPredicate *)predicateWithKeyPath:(NSString *)aKeyPath
                            startDate:(NSDate *)start
                              endDate:(NSDate *)end
{
    return [NSPredicate predicateWithFormat:@"%K >= %@ AND %K <= %@",
            aKeyPath,
            start,
            aKeyPath,
            end
            ];
}

- (NSPredicate *)predicateWithKeyPath:(NSString *)aKeyPath
{
    return [[self class] predicateWithKeyPath:aKeyPath
                                    startDate:[self startDate]
                                      endDate:[self endDate]];
}

- (NSString *)stringRepresentationWithFormat:(NSString *)aFormat
                                   seperator:(NSString *)aSeperator
{
    return [NSString stringWithFormat:@"%@ %@ %@",
            [NSDateFormatter stringWithFormat:aFormat
                                         date:[self startDate]],
            aSeperator,
            [NSDateFormatter stringWithFormat:aFormat
                                         date:[self endDate]]
            ];
}

#pragma mark - NSObject overloaded methods
- (NSString *)description
{
    return [self stringRepresentationWithFormat:@"yyyy-MM-dd'T'HH:mm:sss"
                                      seperator:@"-"];
}

- (id)copyWithZone:(NSZone *)zone
{
    return [FRDateRange dateRangeWithStartDate:[self startDate]
                                        endDate:[self endDate]];
}

- (BOOL)isEqual:(id)object {
    if ([object isKindOfClass:[FRDateRange class]]) {
        return [self isEqualToDateRange:object];
    }
    return NO;
}

- (BOOL)isEqualToDateRange:(FRDateRange *)dateRange {
    return [self.startDate isEqualToDate:dateRange.startDate] && [self.endDate isEqualToDate:dateRange.endDate];
}

@end
