//
//  MyCell.h
//  QTableViewController
//
//  Created by qzp on 15/12/18.
//  Copyright © 2015年 qzp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UserInfo.h"
@interface MyCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *photoImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@property (weak, nonatomic) IBOutlet UILabel *infoLabel;

- (void) setCell: (UserInfo *) userInfo;
@end
