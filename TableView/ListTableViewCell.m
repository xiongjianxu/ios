//
//  AboutAJKListTableViewCell.m
//  Anjuke2
//
//  Created by xubing on 14-4-29.
//  Copyright (c) 2014年 anjuke inc. All rights reserved.
//

#import "ListTableViewCell.h"

@interface ListTableViewCell ()

@property (strong, nonatomic) UILabel *cellName;
@property (nonatomic, assign) NSInteger totalRow;

@end

@implementation ListTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)configWithData:(NSDictionary *)dic
{
    self.cellName = [[UILabel alloc] initWithFrame:CGRectMake(20, 10, 200, 30)];
    [self.contentView addSubview:self.cellName];
    self.cellName.text = dic[@"title"];
    self.cellName.font = [UIFont systemFontOfSize:15];
}

@end