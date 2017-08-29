//
//  NSObject+Property.m
//  RuntimeTest
//
//  Created by boy on 2017/8/28.
//  Copyright © 2017年 pjy. All rights reserved.
//

#import "NSObject+Property.h"
#import <objc/runtime.h>

//static const void *newPropertyKey = &newPropertyKey;

@implementation NSObject (Property)


- (NSString *)newProperty {
    
    return objc_getAssociatedObject(self, @selector(newProperty));
    
}

- (void)setNewProperty:(NSString *)newProperty {
    ;
    objc_setAssociatedObject(self, @selector(newProperty), newProperty, OBJC_ASSOCIATION_RETAIN_NONATOMIC);

}

@end
