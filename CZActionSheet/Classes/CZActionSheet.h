//
//  CZActionSheet.h
//  ZaiHu
//
//  Created by siu on 25/8/15.
//  Copyright (c) 2015年 Remind. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CZActionSheetItem.h"

@class CZActionSheet;
@protocol CZActionSheetDeleagte <NSObject>
@optional
/**
 actionSheet被点击了
 */
- (void)actionSheet:(CZActionSheet *)sheet didSelectActionItem:(CZActionSheetItem *)actionItem atIndex:(NSInteger)index;
/**
 *  CZActionSheet将要从屏幕中移除
 */
- (BOOL)actionSheetShouldRemoveFromScreen;
@end

typedef NS_ENUM(NSUInteger, CZActionStyle) {
    CZActionStyle_Light = UIBlurEffectStyleLight, // default
    CZActionStyle_Dark = UIBlurEffectStyleDark
};

@interface CZActionSheet : UIView
/**
 *  delegate
 */
@property (nonatomic ,weak) id<CZActionSheetDeleagte> delegate;
@property (nonatomic, copy) NSString *title;
@property (copy, nonatomic) NSString *detail;
@property (assign, nonatomic) CZActionStyle style;
/**
 *  显示CZActionSheet
 */
- (void)showInView:(UIView *)view;
/**
 *  创建CZActionSheet
 *
 *  @return CZActionSheet
 */
- (instancetype)initWithActionItems:(NSArray <CZActionSheetItem *>*)items cancelButtonTitle:(NSString *)cancelBtnTitle;
+ (instancetype)actionSheetWithActionItems:(NSArray <CZActionSheetItem *>*)items cancelButtonTitle:(NSString *)cancelBtnTitle;
@end
