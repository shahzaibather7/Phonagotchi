//
//  Phonagotchi.m
//  Phonagotchi
//
//  Created by Mohammad Shahzaib Ather on 2017-08-03.
//  Copyright © 2017 Lighthouse Labs. All rights reserved.
//

#import "Phonagotchi.h"

@interface Phonagotchi()

@property (nonatomic ,readonly) BOOL isGrumpy;

@end

@implementation Phonagotchi

- (instancetype)init
{
    self = [super init];
    if (self) {
        _isGrumpy= NO;
    }
    return self;
}

@end
