//
//  QTableDataDelegate.m
//  QTableViewController
//
//  Created by qzp on 15/12/18.
//  Copyright © 2015年 qzp. All rights reserved.
//

#import "QTableViewHandler.h"
#import "UITableViewCell+Extension.h"
@interface QTableViewHandler ()
@property (nonatomic, strong) NSArray * items;
@property (nonatomic, copy) NSString * cellIdentifier;


@end

@implementation QTableViewHandler

- (id)initWithItems:(NSArray *)items
     cellIdentifier:(NSString *)cellIdentifier
 configureCellBlock:(TableViewCellConfigureBlock)aConfigure
    cellHeightBlock:(CellHeightBlock)cellheightBlock
     didSelectBlock:(DidSelectCellBlock)didSelectBlock {
    self = [super init];
    if (self) {
        self.items = items;
        self.cellIdentifier = cellIdentifier;
        self.configureBlock = aConfigure;
        self.didSelectBlock = didSelectBlock;
        self.cellHeightBlock = cellheightBlock;
    }
    return self;
}



- (id)initWithItems:(NSArray *)items cellIdentifier:(NSString *)cellIdentifier {
    self = [super init];
    if (self) {
        self.items = items;
        self.cellIdentifier = cellIdentifier;
    }
    return self;
}

- (id)initWithItems:(NSArray *)items {
    self = [super init];
    if (self) {
        self.items = items;
        self.cellIdentifier = @"Q_System";
    }
    return self;
}

///默认indexPath.row对应每个dataSource .相应返回item
- (id)itemAtIndexPath:(NSIndexPath *)indexPath {
    return self.items[indexPath.row];
}

- (void)handleTableViewDataSourceAndDelegate:(UITableView *)tableView {
    tableView.delegate = self;
    tableView.dataSource = self;
//    tableView.rowHeight = UITableViewAutomaticDimension;
    tableView.estimatedRowHeight = 44;
}


#pragma mark -UITableViewDataSource-
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return  self.items.count;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    id item = [self itemAtIndexPath: indexPath];
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier: self.cellIdentifier];
    if (!cell) {
        if ([self.cellIdentifier isEqualToString: @"Q_System"]) {
            cell = [[UITableViewCell alloc] initWithStyle: UITableViewCellStyleDefault reuseIdentifier:@"Q_System"];
            
        } else {
            [UITableViewCell registerTable:tableView nibName:self.cellIdentifier];
            cell = [tableView dequeueReusableCellWithIdentifier:self.cellIdentifier];
        }
    }
    self.configureBlock(indexPath,item,cell);
    return cell;
    
}

#pragma mark -UITableViewDelegate-

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    id item = [self itemAtIndexPath: indexPath];
    if (self.cellHeightBlock) {
        return  self.cellHeightBlock(indexPath,item);
    }
    return UITableViewAutomaticDimension;
   
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    id  item = [self itemAtIndexPath: indexPath];
    if (self.didSelectBlock) {
          self.didSelectBlock(indexPath, item);
    }
  
}

@end
