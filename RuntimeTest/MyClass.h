//
//  MyClass.h
//  RuntimeTest
//
//  Created by boy on 2017/8/28.
//  Copyright © 2017年 pjy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyClass : NSObject
{
    NSString *address;

}

@property (strong, nonatomic) NSString *name;

@property (strong, nonatomic) NSString *gender;


- (void)printName;

@end



