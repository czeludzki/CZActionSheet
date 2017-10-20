//
//  UIColor+CZActionSheetExtension.m
//  CZActionSheet
//
//  Created by siu on 20/10/17.
//

#import "UIColor+CZActionSheetExtension.h"

@implementation UIColor (CZActionSheetExtension)

- (UIImage*)createImage
{
    CGRect rect=CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [self CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}

@end
