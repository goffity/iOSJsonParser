//
//  ViewController.m
//  TestJSONParser
//
//  Created by Narongwate Sangsakul on 4/23/2557 BE.
//  Copyright (c) 2557 G-ABLE. All rights reserved.
//

#import "ViewController.h"
#import "ShopProductObject.h"
#import "MenuObject.h"
#import "ProductObject.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    NSURL *url =[NSURL URLWithString:@"http://61.19.242.24/mhc/product/get/1"];
    
    NSData *data = [NSData dataWithContentsOfURL:url];
    
    NSError *error;
    
    //    NSString* jsonStr       = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    //    NSString* jsonStrMod    = [jsonStr stringByReplacingOccurrencesOfString:@"[]" withString:@"\"\""];
    
    NSMutableDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
    
    NSLog(@"JSON: %@",json);
    //    NSLog(@"shopID %@",[json objectForKey:@"shopId"]);
    
    ShopProductObject *shop = [[ShopProductObject alloc] init];
    
    shop.shopId = [json objectForKey:@"shopId"];
    shop.shopName = [json objectForKey:@"shopName"];
    shop.shopLastipdate = [json objectForKey:@"lastupdate"];
    
    NSLog(@"shopId: %@",shop.shopId);
    NSLog(@"shopName: %@",shop.shopName);
    NSLog(@"shopLastipdate: %@",shop.shopLastipdate);
    
    NSLog(@"Menu %@",json[@"menus"]);
    
    //    NSData *jsonMenu = [NSKeyedArchiver archivedDataWithRootObject:json[@"menus"]];
    //    NSLog(@"jsonMenu data: %@",jsonMenu);
    //
    //    NSMutableDictionary *menu = [NSJSONSerialization JSONObjectWithData:jsonMenu options:NSJSONReadingMutableContainers error:&error];
    //
    //    NSLog(@"Menu dict %@",menu);
    
    
    //    NSMutableArray *refArray = [[NSMutableArray alloc] init];
    //    NSMutableArray *preiodArray = [[NSMutableArray alloc] init];
    //
    //    NSArray *responseArray = json[@"menus"];
    
    //    NSLog(@"json[@\"menus\"] %@",json[@"menus"]);
    //    NSLog(@"Menus: %@",responseArray);
    
    NSMutableArray *menuArray = [[NSMutableArray alloc] init];
    
    
    for (NSDictionary *dict in json[@"menus"]) {
        //        [refArray addObject:[dict valueForKey:@"menuId"]];
        //        [preiodArray addObject:[dict valueForKey:@"menuName"]];
        MenuObject *menu = [[MenuObject alloc] init];
        
        NSLog(@"Menu Id: %@",[dict valueForKey:@"menuId"]);
        menu.menuId =[dict valueForKey:@"menuId"];
        
        NSLog(@"Menu name: %@",[dict valueForKey:@"menuName"]);
        menu.menuName = [dict valueForKey:@"menuName"];
        
        NSLog(@"Menu Description: %@",[dict valueForKey:@"menuDescription"]);
        menu.menuDescription = [dict valueForKey:@"menuDescription"];
        
        NSLog(@"Menu Lastupdate: %@",[dict valueForKey:@"menuLastupdate"]);
        menu.menuLastupdate = [dict valueForKey:@"menuLastupdate"];
        
        [menuArray addObject:menu];
        
        NSMutableArray *productArray = [[NSMutableArray alloc] init];
        
        //product
        NSLog(@"products: %@",[dict valueForKey:@"products"]);
        for (NSDictionary *productDict in dict[@"products"]) {
            
            ProductObject *product = [[ProductObject alloc] init];
            
            NSLog(@"Product name %@",[productDict valueForKey:@"productName"]);
            product.productName =[productDict valueForKey:@"productName"];
            
            NSLog(@"Product price %@",[productDict valueForKey:@"productPrice"]);
            product.productPrice =[productDict valueForKey:@"productPrice"];
            
            NSLog(@"Product Description %@",[productDict valueForKey:@"productDescription"]);
            product.productDescription =[productDict valueForKey:@"productDescription"];
            
            
            [productArray addObject:product];
            
        }
        
    }
    
    shop.menuObject = menuArray;
    
    NSLog(@"Menu %@",menuArray);
    
    for (NSArray *menuObjects in menuArray) {
        MenuObject *menuobj = menuObjects;
        
        NSLog(@"Menu Id: %@",menuobj.menuId);
        NSLog(@"Menu name: %@",menuobj.menuName);
        NSLog(@"Menu Desc: %@",menuobj.menuDescription);
        
    }
    
    //    for (NSDictionary *dict in menuArray) {
    //        NSLog(@"Menu %@",dict);
    //    }
    
    //    NSLog(@"%@",refArray);
    //    NSLog(@"%@",preiodArray);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
