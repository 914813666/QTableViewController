//
//  QTableDataDelegate.h
//  QTableViewController
//
//  Created by qzp on 15/12/18.
//  Copyright © 2015年 qzp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef void (^ TableViewCellConfigureBlock) (NSIndexPath * indexPath, id item, UITableViewCell * cell);
typedef CGFloat (^ CellHeightBlock) (NSIndexPath * indexPath, id item);
typedef void (^ DidSelectCellBlock) (NSIndexPath * indexPath, id item);

@interface QTableViewHandler : NSObject <UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, copy) TableViewCellConfigureBlock configureBlock;
@property (nonatomic, copy) DidSelectCellBlock didSelectBlock;
@property (nonatomic, copy) CellHeightBlock cellHeightBlock;
@property (nonatomic, assign) UITableViewCellStyle  style;

///初始化并回调
-(id)initWithItems:(NSArray *)items
    cellIdentifier:(NSString *)cellIdentifier
    configureCellBlock:(TableViewCellConfigureBlock)aConfigure
   cellHeightBlock:(CellHeightBlock)cellheightBlock
    didSelectBlock:(DidSelectCellBlock)didSelectBlock;

/////初始化方法: 传数据源, cellIdentifier == xib的名称
- (id) initWithItems: (NSArray *) items cellIdentifier: (NSString *) cellIdentifier;

///初始化系统默认表格
- (id) initWithItems:(NSArray *)items;

/// 将UITableViewDataSource和UITableViewDelegate设于QTableDataDelegate
- (void) handleTableViewDataSourceAndDelegate: (UITableView *) tableView;




@end
