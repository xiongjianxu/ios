//
//  BuyViewController.m
//  TableView
//
//  Created by xuxiongjian on 15/3/23.
//  Copyright (c) 2015年 xubing. All rights reserved.
//

#import "BuyViewController.h"
#import "ListTableViewCell.h"

@interface BuyViewController ()<UIPickerViewDelegate, UIPickerViewDataSource>

@property (nonatomic ,strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *sectionArray;
@property (nonatomic, strong) NSArray *cellTitleArray;
@property (nonatomic ,strong) UIButton *addressButton;
@property (nonatomic ,strong) UITextField *roomsTextField;
@property (nonatomic ,strong) UITextField *priceTextField;
@property (nonatomic ,strong) UITextField *tagsTextField;
@property (nonatomic ,strong) UITextField *phoneNumberTextField;
@property (nonatomic ,strong) UIPickerView *addressPickerView;

@end

@implementation BuyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
        //_tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.scrollEnabled = NO;
        if ([_tableView respondsToSelector:@selector(setSeparatorInset:)]) {
            [_tableView setSeparatorInset:UIEdgeInsetsZero];
        }
        if ([_tableView respondsToSelector:@selector(setLayoutMargins:)]) {
            [_tableView setLayoutMargins:UIEdgeInsetsZero];
        }
        _tableView.translatesAutoresizingMaskIntoConstraints = NO;
    }
    return _tableView;
}

- (void)initUI
{
    self.sectionArray = @[@5];
    self.cellTitleArray = @[@[@"地点", @"户型", @"买卖预算", @"重点关注", @"手机号"]];
    UITableView *tableView = self.tableView;
    [self.view addSubview:tableView];
}

- (UIButton *)addressButton
{
    if (!_addressButton) {
        _addressButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        _addressButton.frame = CGRectMake(10, 0, self.view.frame.size.width, 30);
      //  _addressButton = [[UIButton alloc] initWithFrame:CGRectMake(10, 0, self.view.frame.size.width, 30)];
        [_addressButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_addressButton setTitle:@"地点" forState:(UIControlStateNormal)];
        _addressButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    }
    return _addressButton;
}

- (UITextField *)roomsTextField
{
    if (!_roomsTextField) {
        _roomsTextField = [[UITextField alloc] initWithFrame:CGRectMake(10, 0, 140, 30)];
        _roomsTextField.keyboardType = UIKeyboardTypeNumberPad;
        _roomsTextField.placeholder = @"户型";
    }
    return _roomsTextField;
}

- (UITextField *)priceTextField
{
    if (!_priceTextField) {
        _priceTextField = [[UITextField alloc] initWithFrame:CGRectMake(10, 0, 200, 30)];
        _priceTextField.keyboardType = UIKeyboardTypeNumberPad;
        _priceTextField.placeholder = @"购买预算";
    }
    return _priceTextField;
}

- (UITextField *)phoneNumberTextField
{
    if (!_phoneNumberTextField) {
        _phoneNumberTextField = [[UITextField alloc] initWithFrame:CGRectMake(10, 0, 200, 30)];
        _phoneNumberTextField.keyboardType = UIKeyboardTypeNumberPad;
        _phoneNumberTextField.placeholder = @"手机号";
    }
    return _phoneNumberTextField;
}

- (UITextField *)tagsTextField
{
    if (!_tagsTextField) {
        _tagsTextField = [[UITextField alloc] initWithFrame:CGRectMake(10, 0, 200, 30)];
        _tagsTextField.enabled = NO;
        _tagsTextField.placeholder = @"重点关注";
    }
    return _tagsTextField;
}

#pragma mark - delegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return self.sectionArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [[self.sectionArray objectAtIndex:section] integerValue];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 20;
}

-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 1;
}


- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UIView *view=[[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 1)];
    view.backgroundColor = [UIColor clearColor];
    return view ;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] init];
    switch (indexPath.row) {
        case 0:
        {
            [cell.contentView addSubview:self.addressButton];
            [_addressButton addTarget:self action:@selector(drawAddressPickerView:) forControlEvents:(UIControlEventTouchUpInside)];
            //self.addressTextField.center = cell.contentView.center;
        }
            break;
        case 1:
        {
            [cell.contentView addSubview:self.roomsTextField];
        }
            break;
        case 2:
        {
            UILabel *unitLabel = [[UILabel alloc] initWithFrame:CGRectMake(280, 0, 40, 30)];
            unitLabel.font = [UIFont systemFontOfSize:16];
            unitLabel.textColor = [UIColor blackColor];
            unitLabel.text = @"万";
            [cell.contentView addSubview:unitLabel];
            [cell.contentView addSubview:self.priceTextField];
        }
            break;
        case 3:
        {
            [cell.contentView addSubview:self.tagsTextField];
        }
            break;
        case 4:
        {
            [cell.contentView addSubview:self.phoneNumberTextField];
        }
            break;
        default:
            break;
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (void)drawAddressPickerView:(id)sender
{
    NSLog(@"选中了地址栏");
    if (!_addressPickerView) {
        _addressPickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height/2, self.view.frame.size.width, self.view.frame.size.height/2)];
        _addressPickerView.delegate = self;
        _addressPickerView.dataSource = self;
        //_addressPickerView.showsSelectionIndicator = YES;
    }
    [self.view addSubview:_addressPickerView];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 2;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return 5;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
