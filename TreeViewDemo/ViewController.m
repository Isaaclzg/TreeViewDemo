//
//  ViewController.m
//  TreeViewDemo
//
//  Created by isaac on 16/5/10.
//  Copyright © 2016年 ultrapower. All rights reserved.
//

#import "ViewController.h"
#import <RATreeView.h>
#import "RATreeItem.h"
#import "RATreeCell.h"

@interface ViewController ()<RATreeViewDelegate,RATreeViewDataSource>

/*! @brief treeView */
@property (nonatomic, weak) RATreeView *treeView;

/*! @brief  RATreeViewDataSource */
@property (nonatomic, strong) NSArray *datas;

/*! @brief  是否展开 */
@property (nonatomic, assign) BOOL isOpen;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    RATreeView *treeView = [[RATreeView alloc] initWithFrame:self.view.bounds];
    treeView.delegate = self;
    treeView.dataSource = self;
    treeView.rowHeight = 60;
    treeView.treeFooterView = [UIView new];
    [self.view addSubview:treeView];
    self.treeView = treeView;
    
    [self loadData];
    
    
}

- (void)loadData {

    RATreeItem *item1 = [RATreeItem dataObjectWithName:@"111" children:nil];
    
    RATreeItem *itemSub1 = [RATreeItem dataObjectWithName:@"2------11111" children:nil];
    RATreeItem *itemSub2 = [RATreeItem dataObjectWithName:@"2-------22222" children:nil];
    RATreeItem *item2 = [RATreeItem dataObjectWithName:@"222" children:@[itemSub1,itemSub2]];
    
    self.datas = @[item1,item2];
    
    [self.treeView reloadData];
}

#pragma mark - RATreeViewDataSource
/**
 *  Ask the data source to return the number of child items encompassed by a given item. (required)
 *
 *  @param treeView     The tree-view that sent the message.
 *  @param item         An item identifying a cell in tree view.
 *  @param treeNodeInfo Object including additional information about item.
 *
 *  @return The number of child items encompassed by item. If item is nil, this method should return the number of children for the top-level item.
 */
- (NSInteger)treeView:(RATreeView *)treeView numberOfChildrenOfItem:(nullable id)item {

    if (item == nil) {
        return [self.datas count];
    }
    
    RATreeItem *data = item;
    return [data.children count];
}


/**
 *  Asks the data source for a cell to insert for a specified item. (required)
 *
 *  @param treeView     A tree-view object requesting the cell.
 *  @param item         An item identifying a cell in tree view.
 *
 *  @return An object inheriting from UITableViewCell that the tree view can use for the specified row. An assertion is raised if you return nil.
 */
- (UITableViewCell *)treeView:(RATreeView *)treeView cellForItem:(nullable id)item {

    RATreeItem *treeItem = item;
    
    BOOL expanded = [self.treeView isCellForItemExpanded:treeItem];
    NSInteger level = [self.treeView levelForCellForItem:treeItem];
    static NSString *reuseIdentifier = @"RATreeCell";
    
    RATreeCell *cell = [[RATreeCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier level:level isOpen:expanded];
    
    cell.content = treeItem.name;
    
    return cell;
}

/**
 *  Ask the data source to return the child item at the specified index of a given item. (required)
 *
 *  @param treeView The tree-view object requesting child of the item at the specified index.
 *  @param index    The index of the child item from item to return.
 *  @param item     An item identifying a cell in tree view.
 *
 *  @return The child item at index of a item. If item is nil, returns the appropriate child item of the root object.
 */
- (id)treeView:(RATreeView *)treeView child:(NSInteger)index ofItem:(nullable id)item {

    RATreeItem *data = item;
    if (item == nil) {
        return [self.datas objectAtIndex:index];
    }
    
    return data.children[index];
}


#pragma mark - RATreeViewDelegate
- (void)treeView:(RATreeView *)treeView didSelectRowForItem:(id)item {

    
    
    
}

- (BOOL)treeView:(RATreeView *)treeView canEditRowForItem:(id)item {

    return YES;
}

/**
 *  将要展开
 *
 *  @param treeView
 *  @param item
 */
- (void)treeView:(RATreeView *)treeView willExpandRowForItem:(id)item {

    NSLog(@"将要展开");
    
}

/**
 *  将要关闭
 *
 *  @param treeView
 *  @param item
 */
- (void)treeView:(RATreeView *)treeView willCollapseRowForItem:(id)item {

    NSLog(@"将要关闭");
    
}
#pragma mark - Getter 
- (NSArray *)datas {

    if (nil == _datas) {
        
        _datas = [NSArray array];
    }
    
    return _datas;
    
}

@end
