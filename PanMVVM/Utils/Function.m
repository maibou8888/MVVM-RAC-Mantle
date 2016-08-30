//
//  Function.m
//  PanMVVM
//
//  Created by 王明哲 on 16/5/6.
//  Copyright © 2016年 王明哲. All rights reserved.
//

#import "Function.h"

@implementation Function

+(void)setExtraCellLineHidden: (UITableView *)tableView
{
    UIView *view = [UIView new];
    view.backgroundColor = [UIColor clearColor];
    [tableView setTableFooterView:view];
}

+(void)ResizeLabel:(UILabel *)label textFont:(CGFloat)fontSize {
    [label setNumberOfLines:0];
    label.lineBreakMode = NSLineBreakByWordWrapping;
    UIFont *font = [UIFont fontWithName:@"Arial" size:fontSize];
    CGSize size = CGSizeMake(320,2000);
    CGSize labelsize = [label.text sizeWithFont:font constrainedToSize:size lineBreakMode:NSLineBreakByWordWrapping];
    
    label.width = labelsize.width;
}

+ (BOOL)StringIsNotEmpty:(NSString *)checkString
{
    if ((NSNull *)checkString == [NSNull null]) {
        return NO;
    }
    if ([checkString isEqualToString:@"(null)"] || checkString.length == 0 || (NSNull *)checkString == [NSNull null] || [checkString isEqualToString:@""]) {
        return NO;
    }
    return YES;
}

+ (void)showHud:(id)vc withText:(NSString *)text{
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:vc animated:YES];
    hud.mode = MBProgressHUDModeIndeterminate;
    hud.labelText = text;
}

+ (void)hiddenHud:(id)vc {
    [MBProgressHUD hideHUDForView:vc animated:YES];
}

//获取拼音首字母(传入汉字字符串, 返回大写拼音首字母)
+ (NSString *)firstCharactor:(NSString *)aString
{
    if (![self StringIsNotEmpty:aString]) {
        return @"";
    }
    //转成了可变字符串
    NSMutableString *str = [NSMutableString stringWithString:aString];
    //先转换为带声调的拼音
    CFStringTransform((CFMutableStringRef)str,NULL, kCFStringTransformMandarinLatin,NO);
    //再转换为不带声调的拼音
    CFStringTransform((CFMutableStringRef)str,NULL, kCFStringTransformStripDiacritics,NO);
    //转化为大写拼音
    NSString *pinYin = [str capitalizedString];
    //获取并返回首字母
    return [pinYin substringToIndex:1];
}

+ (void)showAlertString:(NSString *)string InView:(id)view {
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.mode = MBProgressHUDModeText;  // 选择缓冲的格式
    hud.labelText = string;
    [hud hide:YES afterDelay:1];
}

+(NSString*)zoneChange:(NSString*)spString{
    NSDate *confromTimesp = [NSDate dateWithTimeIntervalSince1970:[spString doubleValue] - 28800];
    NSTimeZone *zone = [NSTimeZone systemTimeZone];
    NSInteger interval = [zone secondsFromGMTForDate:confromTimesp];
    NSDate *localeDate = [confromTimesp  dateByAddingTimeInterval: interval];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd,HH:mm:ss"];
    
    NSString *dateString = [dateFormatter stringFromDate:localeDate];
    
    return dateString;
}

@end
