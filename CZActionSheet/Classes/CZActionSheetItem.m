//
//  CZActionSheetItem.m
//  我是房东
//
//  Created by siu on 2017/4/26.
//  Copyright © 2017年 siu. All rights reserved.
//

#import "CZActionSheetItem.h"

@interface CZActionSheetItem()

@end

@implementation CZActionSheetItem

- (instancetype)initWithTitle:(NSString *)title image:(UIImage *)image andAction:(CZActionSheetItemHandler)handler
{
    if (self = [super init]) {
        _title = title;
        _image = image;
        if (!handler) handler = ^(CZActionSheetItem *actionItem, NSInteger index){};
        _handler = handler;
    }
    return self;
}

+ (instancetype)itemWithTitle:(NSString *)title image:(UIImage *)image andAction:(CZActionSheetItemHandler)handler
{
    CZActionSheetItem *item = [[CZActionSheetItem alloc] initWithTitle:title image:image andAction:handler];
    return item;
}

@end
