//
//  RATreeCell.h
//  TreeViewDemo
//
//  Created by isaac on 16/5/10.
//  Copyright © 2016年 ultrapower. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RATreeCell : UITableViewCell

/**
 *  标题内容
 */
@property (nonatomic, strong) NSString *content;



/**
 *  初始化cell
 *
 *  @param style           样式
 *  @param reuseIdentifier id
 *  @param level           级别
 *
 *  @return cell
 */
- (instancetype)initWithStyle:(UITableViewCellStyle)style
              reuseIdentifier:(NSString *)reuseIdentifier
                        level:(NSInteger)level
                       isOpen:(BOOL)isOpen;

@end
