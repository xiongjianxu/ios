//
//  HBNavigationController.m
//  NoteBook
//
//  Created by xubing on 14-9-5.
//  Copyright (c) 2014年 xubing. All rights reserved.
//

#import "BaseNavigationController.h"

@interface BaseNavigationController ()

@end

@implementation BaseNavigationController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.navigationBar.translucent = NO;
        self.navigationItem.leftBarButtonItem.tintColor = [UIColor whiteColor];
        [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    }
    return self;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
