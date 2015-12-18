//
//  MyCell.m
//  QTableViewController
//
//  Created by qzp on 15/12/18.
//  Copyright © 2015年 qzp. All rights reserved.
//

#import "MyCell.h"

@implementation MyCell

- (void)awakeFromNib {
    // Initialization code
    self.photoImageView.layer.cornerRadius = CGRectGetHeight(self.photoImageView.bounds)/2;
    self.photoImageView.clipsToBounds = YES;
    self.photoImageView.layer.borderWidth = 1;
    self.photoImageView.layer.borderColor = [UIColor colorWithRed:1.0 green:0.5 blue:0.0 alpha:1.0].CGColor;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setCell:(UserInfo *)userInfo {
   
    
    
    NSURL * url = [NSURL URLWithString: userInfo.photo];
    NSData * data = [NSData dataWithContentsOfURL:url];
    UIImage * img = [UIImage imageWithData:data];
    
    self.photoImageView.image = img;
    self.nameLabel.text = userInfo.name;
    self.infoLabel.text = userInfo.info;
}
@end
