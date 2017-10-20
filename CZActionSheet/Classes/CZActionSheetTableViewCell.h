//
//  CZActionSheetTableViewCell.h
//  我是房东
//
//  Created by siu on 2017/4/26.
//  Copyright © 2017年 siu. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, CZActionStyle);

@class CZActionSheetItem,CZActionSheetTableViewCell;

@interface CZActionSheetTableViewCell : UITableViewCell
@property (strong, nonatomic) CZActionSheetItem *actionItem;
@property (assign, nonatomic) CZActionStyle style;
- (void)playErrorAminate;
@end
