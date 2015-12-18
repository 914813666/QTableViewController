//
//  UITableViewCell+Extension.m
//  QTableViewController
//
//  Created by qzp on 15/12/18.
//  Copyright © 2015年 qzp. All rights reserved.
//

#import "UITableViewCell+Extension.h"

@implementation UITableViewCell (Extension)

///通过nibname获取nib
+ (UINib *) nibWithName: (NSString *) nibName {
    
    return  [UINib nibWithNibName: nibName bundle: nil];
}

+ (void)registerTable:(UITableView *)table nibName:(NSString *)nibName {
    
    [table registerNib:[self nibWithName: nibName] forCellReuseIdentifier:nibName];
}

+ (CGFloat)getCellHeightWithCustomObj:(id)obj indexPath:(NSIndexPath *)indexPath {
    if (!obj) {
        return 0;
    }
    return 44.0;
}

- (void)configure:(UITableViewCell *)cell customObj:(id)obj indexPath:(NSIndexPath *)indexPath {
    
}
@end
