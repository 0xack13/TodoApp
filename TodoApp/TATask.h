//
//  TATask.h
//  TodoApp
//
//  Created by 0xack13 on 8/6/14.
//  Copyright (c) 2014 0xack13. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TATask : NSObject


@property (nonatomic, strong) NSString *name;
@property (nonatomic, assign) BOOL done;

-(id) initWithName:(NSString *)name done:(BOOL) done;

@end
