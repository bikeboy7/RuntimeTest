//
//  MyClass+New.m
//  RuntimeTest
//
//  Created by boy on 2017/8/29.
//  Copyright © 2017年 pjy. All rights reserved.
//

#import "MyClass+New.h"
#import <objc/runtime.h>
@implementation MyClass (New)

+ (void)load {
    
    Method oldMethod = class_getInstanceMethod([MyClass class], @selector(printName));
    
    Method newMethod = class_getInstanceMethod([MyClass class], @selector(printNewName));
    
    method_exchangeImplementations(oldMethod, newMethod);
    
    Method oldClassM = class_getClassMethod(self, @selector(classMethod));
    Method newClassM = class_getClassMethod(self, @selector(newClassMethod));
    
    method_exchangeImplementations(oldClassM, newClassM);

}

- (void)printNewName {
    NSLog(@"printNewName---3");
}

+ (void)classMethod {
    
    NSLog(@"classMethod");
    
}

+ (void)newClassMethod {
    
    NSLog(@"newClassMethod");
    
}

@end
