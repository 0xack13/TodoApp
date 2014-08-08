//
//  TATaskEntity.h
//  TodoApp
//
//  Created by 0xack13 on 8/8/14.
//  Copyright (c) 2014 0xack13. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface TATaskEntity : NSManagedObject

@property (nonatomic, retain) NSDate * created;
@property (nonatomic, retain) NSNumber * isDone;
@property (nonatomic, retain) NSString * title;

@end
