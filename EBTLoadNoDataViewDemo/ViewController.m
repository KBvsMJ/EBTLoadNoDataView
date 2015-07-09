//
//  ViewController.m
//  EBTLoadNoDataViewDemo
//
//  Created by MJ on 15/7/9.
//  Copyright (c) 2015年 TJ. All rights reserved.
//

#import "ViewController.h"
#import "EBTLoadNoDataView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    
    [EBTLoadNoDataView showInView:self.view andLoadNoDataType:EBTLoadNoDataViewNone];
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
