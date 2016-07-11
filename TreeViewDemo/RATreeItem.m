//
//  RATreeItem.m
//  TreeViewDemo
//
//  Created by isaac on 16/5/10.
//  Copyright © 2016年 ultrapower. All rights reserved.
//

#import "RATreeItem.h"

@implementation RATreeItem

+ (id)dataObjectWithName:(NSString *)name
                children:(NSArray *)children {
    
    return [[self alloc] initWithName:name children:children];
}


- (id)initWithName:(NSString *)name
          children:(NSArray *)children {
    
    self = [super init];
    if (self) {
        self.children = [NSArray arrayWithArray:children];
        self.name = name;
    }
    return self;
}


- (void)addChild:(id)child {
    
    NSMutableArray *children = [self.children mutableCopy];
    [children insertObject:child atIndex:0];
    self.children = [children copy];
}

- (void)removeChild:(id)child {
    
    NSMutableArray *children = [self.children mutableCopy];
    [children removeObject:child];
    self.children = [children copy];
}


@end
