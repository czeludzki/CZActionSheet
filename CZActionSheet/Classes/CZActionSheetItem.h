//
//  CZActionSheetItem.h
//  我是房东
//
//  Created by siu on 2017/4/26.
//  Copyright © 2017年 siu. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CZActionSheetItem;
typedef void(^CZActionSheetItemHandler)(CZActionSheetItem *actionItem, NSInteger index);

@interface CZActionSheetItem : NSObject
@property (copy, nonatomic, readonly) NSString *title;
@property (copy, nonatomic, readonly) CZActionSheetItemHandler handler;
@property (strong, nonatomic, readonly) UIImage *image;
/**
 如有特殊情况需要记录,使用此参数
 */
@property (strong, nonatomic) id object;
@property (strong, nonatomic) UIColor *tintColor;
- (instancetype)initWithTitle:(NSString *)title image:(UIImage *)image andAction:(CZActionSheetItemHandler)handler;
+ (instancetype)itemWithTitle:(NSString *)title image:(UIImage *)image andAction:(CZActionSheetItemHandler)handler;
@end
