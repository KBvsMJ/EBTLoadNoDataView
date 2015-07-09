//
//  SecondViewController.m
//  EBTLoadNoDataViewDemo
//
//  Created by MJ on 15/7/9.
//  Copyright (c) 2015年 TJ. All rights reserved.
//

#import "SecondViewController.h"
#import "TestCell.h"
#import "EBTLoadNoDataView.h"
@interface SecondViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UIView *maskView;
@property (weak, nonatomic) IBOutlet UITableView *testTableView;

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _testTableView.hidden = YES;
    
    [EBTLoadNoDataView showInView:_maskView andLoadNoDataType:EBTLoadNoDataViewNone];
    
    
    
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    TestCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TestCell" forIndexPath:indexPath];
    return cell;
}




@end
