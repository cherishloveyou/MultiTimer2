//
//  TimerProfileStore.m
//  MultiTimer2
//
//  Created by Dennis Lewandowski on 26/08/14.
//  Copyright (c) 2014 laewahn. All rights reserved.
//

#import "TimerProfileStore.h"

#import "TimerProfile.h"

@implementation TimerProfileStore

@synthesize timerProfilesFetchedResultsController = _timerProfilesFetchedResultsController;

- (TimerProfile *)createTimerProfileWithName:(NSString *)name duration:(NSTimeInterval)duration
{
	return [TimerProfile createWithName:name duration:duration managedObjectContext:[self managedObjectContext]];
}

- (NSArray *)fetchTimerProfiles
{
	return [self.managedObjectContext executeFetchRequest:[self fetchRequest]error:nil];
}

- (NSFetchedResultsController *) timerProfilesFetchedResultsController
{
	if (_timerProfilesFetchedResultsController == nil) {
		NSFetchRequest* fetchRequest = [self fetchRequest];
		NSArray* sortDescriptors = [NSArray arrayWithObject:[NSSortDescriptor sortDescriptorWithKey:@"name" ascending:YES]];
		[fetchRequest setSortDescriptors:sortDescriptors];
		
		_timerProfilesFetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest
																			  managedObjectContext:[self managedObjectContext]
																				sectionNameKeyPath:nil
																						 cacheName:nil];

	}
	
	return _timerProfilesFetchedResultsController;
}

- (NSFetchRequest *)fetchRequest
{
	return [NSFetchRequest fetchRequestWithEntityName:@"TimerProfile"];
}

@end
