//
//  AboutAJKListTableViewCell.m
//  Anjuke2
//
//  Created by xubing on 14-4-29.
//  Copyright (c) 2014年 anjuke inc. All rights reserved.
//

#import "AboutAJKListTableViewCell.h"

@interface AboutAJKListTableViewCell ()

@property (strong, nonatomic) UILabel *cellName;
@property (strong, nonatomic) UIView *topLineView;
@property (strong, nonatomic) UIView *bottomLineView;
@property (strong, nonatomic) UIView *shortLineView;

@property (nonatomic, assign) NSInteger totalRow;
@property (nonatomic, strong) NSIndexPath *indexPath;

@end

@implementation AboutAJKListTableViewCell

- (void)awakeFromNib
{
    // Initialization code
}

- (UIView *)topLineView
{
    if (!_topLineView) {
        _topLineView = [[UIView alloc] init];
        _topLineView.backgroundColor = [UIColor grayColor];
    }
    return _topLineView;
}

- (UIView *)bottomLineView
{
    if (!_bottomLineView) {
        _bottomLineView = [[UIView alloc] init];
        _bottomLineView.backgroundColor = [UIColor grayColor];
    }
    return _bottomLineView;
}

- (UIView *)shortLineView
{
    if (!_shortLineView) {
        _shortLineView = [[UIView alloc] init];
        _shortLineView.backgroundColor = [UIColor grayColor];
    }
    return _shortLineView;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)configWithData:(NSDictionary *)dic
{
    self.cellName.text = dic[@"title"];
}

- (void)drawLineWithIndexPath:(NSIndexPath *)indexPath sectionTotalRow:(NSInteger)totalRow
{
    self.indexPath = indexPath;
    self.totalRow = totalRow;
    if (indexPath.row == 0 && totalRow != 1) {
        [self.contentView addSubview:self.topLineView];
    } else if(indexPath.row == 0 && totalRow == 1){
        [self.contentView addSubview:self.topLineView];
        [self.contentView addSubview:self.bottomLineView];
    }
    [self.contentView addSubview:self.shortLineView ];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    if (self.topLineView.superview) {
        self.topLineView.frame = CGRectMake(0, 0, 320, 1);
    }
    
    if (self.bottomLineView.superview) {
            self.bottomLineView.frame = CGRectMake(0, 44, 320, 1);    }
    
    if (self.shortLineView.superview) {
            self.shortLineView.frame = CGRectMake(20, 0, 320 - 20, 1);    }
    
}

@end