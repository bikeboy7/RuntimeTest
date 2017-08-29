//
//  MyClass.m
//  RuntimeTest
//
//  Created by boy on 2017/8/28.
//  Copyright © 2017年 pjy. All rights reserved.
//

#import "MyClass.h"

@interface MyClass ()
{
    int age;
}


@property (strong, nonatomic) NSString *str;



@end

@implementation MyClass
- (void)printName {
   
    NSLog(@"%@", @"printName----1");
    
    
}

@end


