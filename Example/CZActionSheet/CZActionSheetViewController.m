//
//  CZActionSheetViewController.m
//  CZActionSheet
//
//  Created by czeludzki on 10/20/2017.
//  Copyright (c) 2017 czeludzki. All rights reserved.
//

#import "CZActionSheetViewController.h"
#import <CZActionSheet/CZActionSheet.h>
#import <Masonry/Masonry.h>

@interface CZActionSheetViewController ()

@end

@implementation CZActionSheetViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    UIButton *b = [UIButton buttonWithType:UIButtonTypeInfoDark];
    [self.view addSubview:b];
    [b mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(0);
    }];
    [b addTarget:self action:@selector(btnOnClick:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)btnOnClick:(UIButton *)sender
{
    CZActionSheetItem *item0 = [[CZActionSheetItem alloc] initWithTitle:@"哈哈" image:nil andAction:^(CZActionSheetItem *actionItem, NSInteger index) {
        
    }];
    
    CZActionSheetItem *item1 = [[CZActionSheetItem alloc] initWithTitle:@"哈哈" image:nil andAction:^(CZActionSheetItem *actionItem, NSInteger index) {
        
    }];

    CZActionSheetItem *item2 = [[CZActionSheetItem alloc] initWithTitle:@"哈哈" image:nil andAction:^(CZActionSheetItem *actionItem, NSInteger index) {
        
    }];
    
    CZActionSheetItem *item3 = [[CZActionSheetItem alloc] initWithTitle:@"哈哈" image:nil andAction:^(CZActionSheetItem *actionItem, NSInteger index) {
        
    }];

    CZActionSheetItem *item4 = [[CZActionSheetItem alloc] initWithTitle:@"哈哈" image:nil andAction:^(CZActionSheetItem *actionItem, NSInteger index) {
        
    }];

    CZActionSheetItem *item5 = [[CZActionSheetItem alloc] initWithTitle:@"哈哈" image:nil andAction:^(CZActionSheetItem *actionItem, NSInteger index) {
        
    }];

    CZActionSheetItem *item6 = [[CZActionSheetItem alloc] initWithTitle:@"哈哈" image:nil andAction:^(CZActionSheetItem *actionItem, NSInteger index) {
        
    }];

    CZActionSheetItem *item7 = [[CZActionSheetItem alloc] initWithTitle:@"哈哈" image:nil andAction:^(CZActionSheetItem *actionItem, NSInteger index) {
        
    }];
    item7.tintColor = [UIColor redColor];

    CZActionSheetItem *item8 = [[CZActionSheetItem alloc] initWithTitle:@"哈哈" image:nil andAction:^(CZActionSheetItem *actionItem, NSInteger index) {
        
    }];
    
    CZActionSheetItem *item9 = [[CZActionSheetItem alloc] initWithTitle:@"哈哈" image:nil andAction:^(CZActionSheetItem *actionItem, NSInteger index) {
        
    }];
    item9.tintColor = [UIColor redColor];
    
    CZActionSheetItem *item10 = [[CZActionSheetItem alloc] initWithTitle:@"哈哈" image:nil andAction:^(CZActionSheetItem *actionItem, NSInteger index) {
        
    }];
    item10.tintColor = [UIColor redColor];
    
    CZActionSheetItem *item11 = [[CZActionSheetItem alloc] initWithTitle:@"哈哈" image:nil andAction:^(CZActionSheetItem *actionItem, NSInteger index) {
        
    }];
    item11.tintColor = [UIColor redColor];
    
    CZActionSheet *sheet = [CZActionSheet actionSheetWithActionItems:@[item0,item1,item2,item3,item4,item5,item6,item7,item8,item9,item10,item11] cancelButtonTitle:@"cancel"];
    sheet.title = @"哈哈哈哈哈哈";
//    sheet.style = CZActionStyle_Dark;
    [sheet showInView:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
