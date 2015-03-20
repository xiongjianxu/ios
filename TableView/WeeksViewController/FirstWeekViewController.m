//
//  FirstWeekViewController.m
//  TableView
//
//  Created by xbmac on 15/3/18.
//  Copyright (c) 2015年 xubing. All rights reserved.
//

#import "FirstWeekViewController.h"

@interface FirstWeekViewController ()

@property (nonatomic,strong) UISwitch *switchButton;
@property (nonatomic,strong) UIButton *button;
@property (nonatomic,strong) NSURLRequest *request;
@property (nonatomic,strong) NSURL *url;
@property (nonatomic,strong) UILabel *myLabel;

@end

@implementation FirstWeekViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"第一周";
     //Do any additional setup after loading the view.
//    _switchButton = [[UISwitch alloc] initWithFrame:CGRectMake(100, 100, 20, 20)];
//    [_switchButton setOn:YES];
//    [_switchButton addTarget:self action:@selector(switchAction:) forControlEvents:UIControlEventValueChanged];
//    [self.view addSubview:_switchButton];
    //_button = [[UIButton alloc]];
    _button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _button.frame = CGRectMake(30, 30, 250, 30);
    _button.showsTouchWhenHighlighted = YES;
    _button.backgroundColor = [UIColor clearColor];
    [_button setTitle:@"点我啊！" forState:(UIControlStateNormal)];
    [_button addTarget:self action:@selector(onClickAction:) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:_button];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)switchAction:(id)sender
{
    UISwitch *switchButton = (UISwitch *)sender;
    BOOL isButtonOn = [switchButton isOn];
    if (isButtonOn) {
        NSLog(@"是");
    } else {
        NSLog(@"否");
    }
}

- (void)onClickAction:(id)sender
{
    UIButton *button = (UIButton *)sender;
//    BOOL isOnclick = [button isTouchInside];
//    if (isOnclick) {
//
//    }
    NSLog(@"您已点击按钮");
    [button setTitle:@"我被点了!" forState:(UIControlStateNormal)];
    _url = [NSURL URLWithString:@"http://member.xiongjianxu.dev.angejia.com/inventories/tags?city_id=1"];
    _request = [[NSURLRequest alloc] initWithURL:_url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:10];
    NSData *received = [NSURLConnection sendSynchronousRequest:_request returningResponse:nil error:nil];
    NSDictionary *tags = [NSJSONSerialization JSONObjectWithData:received options:NSJSONReadingMutableLeaves error:nil];
    NSLog(@"%@",tags);
    [self showData:tags];
}

- (void)showData:(NSDictionary *)dictionary
{
    _myLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 100, 300 , 20)];
    [_myLabel setFont:[UIFont fontWithName:@"2123" size:20.0]];
    [_myLabel setNumberOfLines:0];
    [_myLabel setBackgroundColor:[UIColor clearColor]];
    _myLabel.shadowOffset = CGSizeMake(1.0, 1.0);
    _myLabel.adjustsFontSizeToFitWidth = YES;
    NSString *hash = [dictionary objectForKey:@"hash"];
    [_myLabel setText:hash];
    [self.view addSubview:_myLabel];
}
@end
