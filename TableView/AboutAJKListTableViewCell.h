//
//  AboutAJKListTableViewCell.h
//  Anjuke2
//
//  Created by xubing on 14-4-29.
//  Copyright (c) 2014年 anjuke inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AboutAJKListTableViewCell : UITableViewCell

- (void)configWithData:(NSDictionary *)dic;

- (void)drawLineWithIndexPath:(NSIndexPath *)indexPath sectionTotalRow:(NSInteger)totalRow;

@end
