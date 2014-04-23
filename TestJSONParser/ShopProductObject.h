//
//  ShopProductObject.h
//  TestJSONParser
//
//  Created by Narongwate Sangsakul on 4/23/2557 BE.
//  Copyright (c) 2557 G-ABLE. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MenuObject.h"

@interface ShopProductObject : NSObject

@property (copy) NSNumber *shopId;
@property (copy) NSString *shopName;
@property (copy) NSString *shopLastipdate;

@property (retain) NSMutableArray *menuObject;

@end
