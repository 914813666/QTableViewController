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


/////初始化方法: 传数据源, cellIdentifier .
- (id) initWithItems: (NSArray *) items cellIdentifier: (NSString *) cellIdentifier;



/// 将UITableViewDataSource和UITableViewDelegate设于QTableDataDelegate
- (void) handleTableViewDataSourceAndDelegate: (UITableView *) tableView;
///默认indexPath.row对应每个dataSource .相应返回item
- (id) itemAtIndexPath: (NSIndexPath *) indexPath;



@end
