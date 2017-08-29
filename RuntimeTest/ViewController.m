//
//  ViewController.m
//  RuntimeTest
//
//  Created by boy on 2017/8/28.
//  Copyright © 2017年 pjy. All rights reserved.
//

#import "ViewController.h"
#import "NSObject+Property.h"
#import "MyClass.h"
#import "MyClass+New.h"
#import <objc/runtime.h>


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self iVarTest];
    
    NSLog(@"\n\n");
    
    [self propertyTest];
   
}

//属性
- (void)propertyTest {
    unsigned int count = 0;
    objc_property_t *properties = class_copyPropertyList([MyClass class], &count);
    for (unsigned int i = 0; i < count; i ++) {
        objc_property_t property = properties[i];
        const char *name = property_getName(property);
        const char *att = property_getAttributes(property);
        
        NSLog(@"属性 名字：%s， 类型：%s", name, att);

    }
    
    free(properties);
    

}


//成员变量
- (void)iVarTest {
    
    unsigned int count = 0;
    Ivar *ivars = class_copyIvarList([MyClass class], &count);
    for (unsigned int i = 0; i < count; i ++) {
        Ivar ivar = ivars[i];
        const char *name = ivar_getName(ivar);
        const char *type = ivar_getTypeEncoding(ivar);
        
        NSLog(@"成员变量 名字：%s， 类型：%s", name, type);
        
    }
    
    //释放
    free(ivars);
    

}


//方法替换
- (void)methodTest {

    
    [[[MyClass alloc] init] printName];
    
    Method oldMethod = class_getInstanceMethod([MyClass class], @selector(printName));
    
    Method newMethod = class_getInstanceMethod([self class], @selector(printNewName));
    
    method_exchangeImplementations(oldMethod, newMethod);
    
    
    [[[MyClass alloc] init] printName];
    
    [[[MyClass alloc] init] printNewName];
    
    
    [MyClass classMethod];
    
    [MyClass newClassMethod];
    

}

// 类别添加属性
- (void)addProperty {

    self.newProperty = @"222";
    
    NSLog(@"%@", self.newProperty);
    
}




- (void)printNewName {
    NSLog(@"printNewName---2");
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
