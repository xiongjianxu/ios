//
//  FirstViewController.m
//  Tel
//
//  Created by xubing on 13-12-20.
//  Copyright (c) 2013年 xubing. All rights reserved.
//

#import "FirstViewController.h"
#import "AboutAJKListTableViewCell.h"


@interface FirstViewController ()

@property (nonatomic, strong) NSArray *sectionArray;
@property (nonatomic, strong) NSArray *cellTitleArray;
@property (nonatomic, strong) UILabel *cellName;

@end

@implementation FirstViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.sectionArray = @[@1, @2, @3];
        self.cellTitleArray = @[@[@1], @[@1, @2],@[@1, @2, @3]];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewWillAppear:(BOOL)animated{
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 320, self.view.frame.size.height) style:UITableViewStylePlain];
    tableView.dataSource = self;
    tableView.delegate = self;
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    //    tableView.tableHeaderView = [self headView];
    tableView.scrollEnabled = YES;
    tableView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:tableView];
    [tableView reloadData];
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
    view.backgroundColor = [UIColor grayColor];
    return view ;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"identifierCell";
    AboutAJKListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[AboutAJKListTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"identifierCell"];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleBlue;
    self.cellName.frame = CGRectMake(20, 20, 200, 50) ;
    [cell addSubview:self.cellName];
    
    NSString *cellString = [[self.cellTitleArray objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
    
    NSDictionary *celldata = @{@"title":cellString};
    int sectionTotalRow = [[self.sectionArray objectAtIndex:indexPath.section] integerValue];
    [cell configWithData:celldata];
    [cell drawLineWithIndexPath:indexPath sectionTotalRow:sectionTotalRow];
    return cell;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
