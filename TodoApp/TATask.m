//
//  TATask.m
//  TodoApp
//
//  Created by 0xack13 on 8/6/14.
//  Copyright (c) 2014 0xack13. All rights reserved.
//

#import "TATask.h"

@implementation TATask

@synthesize name = _name;
@synthesize done = _done;

- (id) initWithName:(NSString *)name done:(BOOL)done {
    self = [super init];
    
    if (self) {
        self.name = name;
        self.done = done;
    }
    return self;
}

@end
