//
//  MenuObject.h
//  TestJSONParser
//
//  Created by Narongwate Sangsakul on 4/23/2557 BE.
//  Copyright (c) 2557 G-ABLE. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MenuObject : NSObject

@property (copy) NSNumber *menuId;
@property (copy) NSString *menuName;
@property (copy) NSString *menuDescription;
@property (copy) NSString *menuLastupdate;

@property (retain) NSMutableArray *products;

@end
