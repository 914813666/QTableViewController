//
//  UITableViewCell+Extension.h
//  QTableViewController
//
//  Created by qzp on 15/12/18.
//  Copyright © 2015年 qzp. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableViewCell (Extension)

+ (void) registerTable: (UITableView *) table
         nibName: (NSString *) nibName;

- (void) configure: (UITableViewCell *) cell
         customObj: (id) obj
         indexPath: (NSIndexPath *) indexPath;

+ (CGFloat) getCellHeightWithCustomObj: (id) obj
                             indexPath: (NSIndexPath *) indexPath;

@end
