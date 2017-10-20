//
//  CZActionSheetTableViewCell.m
//  我是房东
//
//  Created by siu on 2017/4/26.
//  Copyright © 2017年 siu. All rights reserved.
//

#import "CZActionSheetTableViewCell.h"
#import "CZActionSheetItem.h"

@interface CZActionSheetTableViewCell ()
@property (weak, nonatomic) UIButton *contentBtn;
@end

@implementation CZActionSheetTableViewCell

#pragma mark - Override
- (void)setFrame:(CGRect)frame
{
    frame = kRect(frame.origin.x + 12, frame.origin.y, frame.size.width - 24, frame.size.height);
    [super setFrame:frame];
}

#pragma mark - Getter && Setter
- (void)setActionItem:(CZActionSheetItem *)actionItem
{
    _actionItem = actionItem;
    self.contentBtn.tintColor = _actionItem.tintColor;
    [self.contentBtn setTitle:_actionItem.title forState:UIControlStateNormal];
    [self.contentBtn setImage:_actionItem.image forState:UIControlStateNormal];
}

#pragma mark - LifeCycle
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self initSetup];
    }
    return self;
}

- (void)initSetup
{
    self.selectionStyle = UITableViewCellSelectionStyleDefault;
    self.backgroundColor = [UIColor clearColor];
    self.layer.masksToBounds = YES;
    self.layer.cornerRadius = 10;
    
    UIButton *contentBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    contentBtn.userInteractionEnabled = NO;
    contentBtn.backgroundColor = RMColorRGBA(255, 255, 255, .8f);
    contentBtn.titleEdgeInsets = UIEdgeInsetsMake(0, 4, 0, -4);
    contentBtn.imageEdgeInsets = UIEdgeInsetsMake(0, -4, 0, 4);
    contentBtn.titleLabel.font = [UIFont systemFontOfSize:17];
    [self.contentView addSubview:contentBtn];
    self.contentBtn = contentBtn;
    [contentBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0);
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.bottom.mas_equalTo(0);
        make.height.mas_equalTo(44);
    }];
}

- (void)playErrorAminate
{
    CASpringAnimation *animate = [CASpringAnimation animationWithKeyPath:@"transform.translation.x"];
    animate.fromValue = @(-3.0f);
    animate.toValue = @(3.0f);
    animate.duration = .1f;
    animate.repeatCount = 2.0f;
    animate.autoreverses = YES;
    animate.mass = 2;       // 质量，影响图层运动时的弹簧惯性，质量越大，弹簧拉伸和压缩的幅度越大
    animate.damping = 9;        // 阻尼系数，阻止弹簧伸缩的系数，阻尼系数越大，停止越快
    animate.stiffness = 1000;       // 刚度系数(劲度系数/弹性系数)，刚度系数越大，形变产生的力就越大，运动越快
    animate.initialVelocity = 15;   // 初始速率，动画视图的初始速度大小 速率为正数时，速度方向与运动方向一致，速率为负数时，速度方向与运动方向相反
    [self.layer addAnimation:animate forKey:nil];
}

@end
