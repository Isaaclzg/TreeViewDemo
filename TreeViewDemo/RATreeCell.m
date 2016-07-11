//
//  RATreeCell.m
//  TreeViewDemo
//
//  Created by isaac on 16/5/10.
//  Copyright © 2016年 ultrapower. All rights reserved.
//

#import "RATreeCell.h"

@interface RATreeCell()

/*! @brief 标题 */
@property (nonatomic, weak) UILabel *title;

/*! @brief 向上或向下 */
@property (nonatomic, weak) UILabel *upOrdown;

/*! @brief  级别 */
@property (nonatomic, assign) NSInteger level;

/*! @brief  是否展开 */
@property (nonatomic, assign) BOOL isOpen;

@end

@implementation RATreeCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style
              reuseIdentifier:(NSString *)reuseIdentifier
                        level:(NSInteger)level
                       isOpen:(BOOL)isOpen {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    self.level = level;
    
    self.isOpen = isOpen;
    
    [self setupViews];
    
    return self;
}


- (void)setupViews {

    UILabel *title = [[UILabel alloc] init];
    title.textColor = [UIColor blackColor];
    title.font = [UIFont systemFontOfSize:14];
    title.textAlignment = NSTextAlignmentLeft;
    [self.contentView addSubview:title];
    self.title = title;
    
    UILabel *upOrdown = [[UILabel alloc] init];
    upOrdown.textColor = [UIColor blackColor];
    upOrdown.font = [UIFont systemFontOfSize:14];
    upOrdown.textAlignment = NSTextAlignmentCenter;
    upOrdown.text = @"🔽";
    [self.contentView addSubview:upOrdown];
    self.upOrdown = upOrdown;
}

- (void)setContent:(NSString *)content {

    _content = content;
    self.title.text = _content;
}

- (void)setIsOpen:(BOOL)isOpen {

    _isOpen = isOpen;
    
    if (_isOpen) {
        
        self.upOrdown.text = @"🔼";
        
    }else {
    
        self.upOrdown.text = @"🔽";
    }
}
- (void)layoutSubviews {

    [super layoutSubviews];
    
    CGFloat titleX = self.level * 20 + 10;
    CGFloat titleY = 10;
    CGFloat titleW = 200;
    CGFloat titleH = 20;
    self.title.frame = CGRectMake(titleX, titleY, titleW, titleH);
    
    CGFloat upOrdownX = self.frame.size.width - 60;
    CGFloat upOrdownY = 10;
    CGFloat upOrdownW = 40;
    CGFloat upOrdownH = 20;
    self.upOrdown.frame = CGRectMake(upOrdownX, upOrdownY, upOrdownW, upOrdownH);
}
@end
