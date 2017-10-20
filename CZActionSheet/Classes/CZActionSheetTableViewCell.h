//
//  CZActionSheetTableViewCell.h
//  我是房东
//
//  Created by siu on 2017/4/26.
//  Copyright © 2017年 siu. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CZActionSheetItem,CZActionSheetTableViewCell;

@interface CZActionSheetTableViewCell : UITableViewCell
@property (strong, nonatomic) CZActionSheetItem *actionItem;
- (void)playErrorAminate;
@end
