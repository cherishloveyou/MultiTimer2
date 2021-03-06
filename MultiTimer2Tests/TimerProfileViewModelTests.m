//
//  TimerProfileViewModelTests.m
//  MultiTimer2
//
//  Created by Dennis Lewandowski on 25/08/14.
//  Copyright (c) 2014 laewahn. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "XCTest+CoreDataTestStack.h"

#import "TimerProfileViewModel.h"
#import "TimerProfile.h"

@interface TimerProfileViewModelTests : XCTestCase {
	TimerProfileViewModel* testViewModel;
}

@end

@implementation TimerProfileViewModelTests

- (void)testTimerProfileViewModelCanBeInitializedWithTimerProfile
{
	TimerProfile* testProfile = [self someTimerProfile];
	testViewModel = [[TimerProfileViewModel alloc] initWithTimerProfile:testProfile];
	
	XCTAssertNotNil(testViewModel);
	XCTAssertEqualObjects([testViewModel timerProfile], testProfile, @"Should have the TimerProfile");
}

- (void)testTimerProfileViewModelReturnsProfileName
{
	NSString* timerProfileName = @"Test";
	testViewModel = [[TimerProfileViewModel alloc] initWithTimerProfile:[self someTimerProfileWithName:timerProfileName]];
	
	XCTAssertEqualObjects([testViewModel name], timerProfileName, @"Should return the name");
}

- (void)testTimerProfileViewModelReturnsCorrectlyFormattedDurationLessThan60Seconds
{
	testViewModel = [[TimerProfileViewModel alloc] initWithTimerProfile:[self someTimerProfileWithDuration:34]];
	
	XCTAssertEqualObjects([testViewModel duration], @"00:34", @"Duration should be formatted with leading zeros");
}

- (void)testTimerProfileViewModelReturnsCorretlyFormattedDurationForOneMinute
{
    testViewModel = [[TimerProfileViewModel alloc] initWithTimerProfile:[self someTimerProfileWithDuration:60]];
	
	XCTAssertEqualObjects([testViewModel duration], @"01:00");
}

- (void)testTimerProfileViewModelReturnsCorrectlyFormattedDurationForMoreThanOneMinute
{
    testViewModel = [[TimerProfileViewModel alloc] initWithTimerProfile:[self someTimerProfileWithDuration:133]];
	
	XCTAssertEqualObjects([testViewModel duration], @"02:13");
}


# pragma mark Fixtures generation

- (TimerProfile *)someTimerProfile
{
	return [TimerProfile createWithManagedObjectContext:[self managedObjectTestContext]];
}

- (TimerProfile *)someTimerProfileWithName:(NSString *)name
{
	return [TimerProfile createWithName:name duration:10 managedObjectContext:[self managedObjectTestContext]];
}

- (TimerProfile *)someTimerProfileWithDuration:(NSTimeInterval)duration
{
	return [TimerProfile createWithName:@"Test" duration:duration managedObjectContext:[self managedObjectTestContext]];
}

@end
