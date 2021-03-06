//
//  TimerProfileViewModel.h
//  MultiTimer2
//
//  Created by Dennis Lewandowski on 25/08/14.
//  Copyright (c) 2014 laewahn. All rights reserved.
//

#import <Foundation/Foundation.h>

@class TimerProfile;

@interface TimerProfileViewModel : NSObject

- (instancetype) initWithTimerProfile:(TimerProfile *)timerProfile;

@property(readonly) TimerProfile* timerProfile;

@property(readonly) NSString* name;
@property(readonly) NSString* duration;

@end
