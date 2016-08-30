//
//  Function.h
//  PanMVVM
//
//  Created by 王明哲 on 16/5/6.
//  Copyright © 2016年 王明哲. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Function : NSObject

+(void)setExtraCellLineHidden: (UITableView *)tableView;

+(void)ResizeLabel:(UILabel *)label textFont:(CGFloat)fontSize;

+ (BOOL)StringIsNotEmpty:(NSString *)checkString;

+ (void)showHud:(id)vc withText:(NSString *)text;

+ (void)hiddenHud:(id)vc;

+ (NSString *)firstCharactor:(NSString *)aString;

+ (void)showAlertString:(NSString *)string InView:(id)view;

+(NSString*)zoneChange:(NSString*)spString;

+(NSDate *)stringDateToDate:(NSString *)dateString;

@end
