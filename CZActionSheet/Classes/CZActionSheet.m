//
//  CZActionSheet.m
//  ZaiHu
//
//  Created by siu on 25/8/15.
//  Copyright (c) 2015年 Remind. All rights reserved.
//

#import "CZActionSheet.h"
#import "CZActionSheetTableViewCell.h"

#import "Masonry.h"
#import "UIColor+CZActionSheetExtension.h"
#import "CZActionSheet_Macro.h"

#define kTableViewBottomInsets 8

@interface CZActionSheet () <UITableViewDelegate,UITableViewDataSource,UIGestureRecognizerDelegate>

@property (weak, nonatomic) UIVisualEffectView *effectView;
@property (weak, nonatomic) UIVisualEffectView *titleAndDetailContent;
@property (weak, nonatomic) UILabel *titleLabel;
@property (weak, nonatomic) UILabel *detailLabel;
@property (weak, nonatomic) UITableView *tableView;
@property (strong, nonatomic) NSMutableArray *items;
@property (strong, nonatomic) NSIndexPath *selectedIndexPath;
@end

@implementation CZActionSheet
static NSString *CZActionSheetTableViewCellID = @"CZActionSheetTableViewCellID";
@synthesize titleFont = _titleFont;

#pragma mark - Getter && Setter
- (void)setTitle:(NSString *)title
{
    _title = title;
    self.titleLabel.text = _title;
}

- (void)setDetail:(NSString *)detail
{
    _detail = detail;
    self.detailLabel.text = _detail;
}

- (void)setStyle:(CZActionStyle)style
{
    _style = style;
    UIBlurEffect *effect = [UIBlurEffect effectWithStyle:(UIBlurEffectStyle)_style];
    self.effectView.effect = effect;
    [self.tableView reloadData];
}

- (UIFont *)titleFont
{
    return self.titleLabel.font;
}

- (UIFont *)detailFont
{
    return self.detailLabel.font;
}

- (void)setTitleFont:(UIFont *)titleFont
{
    self.titleLabel.font = titleFont;
}

- (void)setDetailFont:(UIFont *)detailFont
{
    self.detailLabel.font = detailFont;
}

#pragma mark - LifeCycle
+ (instancetype)actionSheetWithActionItems:(NSArray<CZActionSheetItem *> *)items cancelButtonTitle:(NSString *)cancelBtnTitle
{
    CZActionSheet *sheet = [[CZActionSheet alloc] initWithActionItems:items cancelButtonTitle:cancelBtnTitle];
    return sheet;
}

- (instancetype)initWithActionItems:(NSArray<CZActionSheetItem *> *)items cancelButtonTitle:(NSString *)cancelBtnTitle{
    if (self = [super init]) {
        _style = CZActionStyle_Light;
        _backgroundAlpha = .5f;
        self.items = [NSMutableArray arrayWithArray:items];
        if (cancelBtnTitle.length) {
            CZActionSheetItem *cancelItem = [CZActionSheetItem itemWithTitle:cancelBtnTitle image:nil andAction:nil];
            [self.items addObject:cancelItem];
        }
        [self layoutView];
    }
    return self;
}

- (void)layoutView
{
    self.backgroundColor = [UIColor clearColor];
    
    UIBlurEffect *effect = [UIBlurEffect effectWithStyle:(UIBlurEffectStyle)self.style];
    UIVisualEffectView *effectView = [[UIVisualEffectView alloc] initWithEffect:effect];
    self.effectView = effectView;
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    tableView.backgroundColor = [UIColor clearColor];
    tableView.backgroundView = effectView;
    tableView.showsVerticalScrollIndicator = NO;
    [self addSubview:tableView];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.estimatedRowHeight = 44;
    tableView.estimatedSectionFooterHeight = 0;
    tableView.estimatedSectionHeaderHeight = 0;
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    tableView.contentInset = UIEdgeInsetsMake(0, 0, kTableViewBottomInsets, 0);
    [tableView registerClass:[CZActionSheetTableViewCell class] forCellReuseIdentifier:CZActionSheetTableViewCellID];
    self.tableView = tableView;
    [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.bottom.mas_equalTo(0);
        make.height.mas_equalTo(200);
    }];
    
    UIVisualEffectView *titleNDetailContent = [[UIVisualEffectView alloc] initWithEffect:nil];
    titleNDetailContent.alpha = 0;
    [self addSubview:titleNDetailContent];
    self.titleAndDetailContent = titleNDetailContent;
    [titleNDetailContent mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.bottom.mas_equalTo(tableView.mas_top).mas_offset(0);
    }];
    
    UILabel *titleLabel = [[UILabel alloc] init];
    [titleNDetailContent.contentView addSubview:titleLabel];
    self.titleLabel = titleLabel;
    titleLabel.textColor = [UIColor whiteColor];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.font = [UIFont boldSystemFontOfSize:16];
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(4);
        make.right.mas_equalTo(-16);
        make.left.mas_equalTo(16);
    }];
    
    UILabel *detailLabel = [[UILabel alloc] init];
    [titleNDetailContent.contentView addSubview:detailLabel];
    self.detailLabel = detailLabel;
    detailLabel.numberOfLines = 2;
    detailLabel.textColor = [UIColor darkGrayColor];
    detailLabel.font = [UIFont systemFontOfSize:12];
    [detailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(titleLabel.mas_bottom).mas_offset(0);
        make.left.mas_equalTo(16);
        make.right.mas_equalTo(-16);
        make.bottom.mas_equalTo(-4);
    }];

    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
    tap.delegate = self;
    [self addGestureRecognizer:tap];
}

#pragma mark - Action
- (void)tap:(UITapGestureRecognizer *)tap
{
    switch (tap.state) {
        case UIGestureRecognizerStateEnded:{
            [self removeActionSheet];
        }
            break;
        default:
            break;
    }
}

#pragma mark - UITableViewDelegate && DataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.items.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CZActionSheetTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CZActionSheetTableViewCellID forIndexPath:indexPath];
    cell.style = self.style;
    cell.actionItem = self.items[indexPath.section];
    return cell;
}

- (void)tableView:(UITableView *)tableView willDisplayHeaderView:(UIView *)view forSection:(NSInteger)section
{
    UITableViewHeaderFooterView *header = (UITableViewHeaderFooterView *)view;
    header.backgroundView = [[UIImageView alloc] initWithImage:[[UIColor clearColor] CAS_createImage]];
}

- (void)tableView:(UITableView *)tableView willDisplayFooterView:(UIView *)view forSection:(NSInteger)section
{
    UITableViewHeaderFooterView *footer = (UITableViewHeaderFooterView *)view;
    footer.backgroundView = [[UIImageView alloc] initWithImage:[[UIColor clearColor] CAS_createImage]];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return 8;
    }
    return 4;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 4;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    self.selectedIndexPath = indexPath;
    NSInteger idx = indexPath.section;
    CZActionSheetItem *actionItem = [self.items objectAtIndex:idx];
    if (idx == self.items.count - 1) {      // 点击了取消
        [self removeActionSheet];
        return;
    }
    if ([self.delegate respondsToSelector:@selector(actionSheet:didSelectActionItem:atIndex:)]) {
        [self.delegate actionSheet:self didSelectActionItem:actionItem atIndex:idx];
    }
    actionItem.handler(actionItem, idx);
    [self removeActionSheet];
}

#pragma mark - UIGestureRecognizerDelegate
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch
{
    if ([gestureRecognizer isKindOfClass:[UITapGestureRecognizer class]]) {
        // 如果不进行这个判断,滑动cell删除会失效
        if ([touch.view isKindOfClass:NSClassFromString(@"UITableViewCellContentView")]) {
            return NO;
        }
    }
    return YES;
}

- (void)showInView:(UIView *)view
{
    if (!view) view = [UIApplication sharedApplication].keyWindow;
    [view addSubview:self];
    [self mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsZero);
    }];
    [self layoutIfNeeded];
    
    CGFloat height = self.tableView.contentSize.height + kTableViewBottomInsets;
    if (self.tableView.contentSize.height > UIWindowHeight*.5f) {
        height = UIWindowHeight * .5f - 30; //30是毫无意义的
    }
    [self.tableView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(height);
    }];
    
    self.tableView.transform = CGAffineTransformMakeTranslation(0, height);
    self.titleAndDetailContent.transform = CGAffineTransformMakeTranslation(0, height);
    
    __weak __typeof (self) weakSelf = self;
    [UIView animateWithDuration:.3f delay:0 usingSpringWithDamping:1 initialSpringVelocity:1 options:UIViewAnimationOptionCurveEaseOut animations:^{
        weakSelf.backgroundColor = RMColorRGBA(1, 1, 1, weakSelf.backgroundAlpha);
        weakSelf.tableView.transform = CGAffineTransformIdentity;
        weakSelf.titleAndDetailContent.transform = CGAffineTransformIdentity;
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:.3f animations:^{
            weakSelf.titleAndDetailContent.alpha = 1;
        }];
    }];
}

- (void)removeActionSheet
{
    if ([self.delegate respondsToSelector:@selector(actionSheetShouldRemoveFromScreen)]) {
        if (![self.delegate actionSheetShouldRemoveFromScreen]) {
            [self playErrorAnimate];
            return;
        }
    }
    __weak __typeof (self) weakSelf = self;
    CGFloat height = self.tableView.contentSize.height + kTableViewBottomInsets;
    if (self.tableView.contentSize.height > UIWindowHeight*.5f) {
        height = UIWindowHeight * .5f - 30; // 30是毫无意义的只是不想让他超出屏幕一半高度而已
    }
    [UIView animateWithDuration:.3f delay:.1f usingSpringWithDamping:1 initialSpringVelocity:1 options:UIViewAnimationOptionCurveEaseOut animations:^{
        weakSelf.tableView.transform = CGAffineTransformMakeTranslation(0, height);
        weakSelf.backgroundColor = [UIColor clearColor];
        weakSelf.titleAndDetailContent.alpha = 0;
    } completion:^(BOOL finished) {
        [weakSelf removeFromSuperview];
    }];
}

- (void)playErrorAnimate
{
    if (!self.selectedIndexPath) return;
    CZActionSheetTableViewCell *cell = (CZActionSheetTableViewCell *)[self.tableView cellForRowAtIndexPath:self.selectedIndexPath];
    [cell playErrorAminate];
}

- (void)dealloc
{
    NSLog(@"actionSheet销毁");
}

@end
