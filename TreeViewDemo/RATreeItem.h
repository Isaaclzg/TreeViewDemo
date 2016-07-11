//
//  RATreeItem.h
//  TreeViewDemo
//
//  Created by isaac on 16/5/10.
//  Copyright © 2016年 ultrapower. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RATreeItem : NSObject

/**
 *  显示的内容
 */
@property (strong, nonatomic) NSString *name;

/**
 *  子集
 */
@property (strong, nonatomic) NSArray *children;

/**
 *  类方法初始化
 *
 *  @param name     内容
 *  @param children 子集
 *
 *  @return RATreeItem
 */
+ (id)dataObjectWithName:(NSString *)name children:(NSArray *)children;

/**
 *  初始化模型
 *
 *  @param name  内容
 *  @param array 子集
 *
 *  @return RATreeItem
 */
- (id)initWithName:(NSString *)name children:(NSArray *)array;


/**
 *  添加子集
 *
 *  @param child 子集
 */
- (void)addChild:(id)child;

/**
 *  删除子集
 *
 *  @param child 子集
 */
- (void)removeChild:(id)child;

@end
