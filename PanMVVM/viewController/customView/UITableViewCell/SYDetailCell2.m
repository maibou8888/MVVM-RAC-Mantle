//
//  SYDetailCell2.m
//  PanMVVM
//
//  Created by 班梦 on 16/6/17.
//  Copyright © 2016年 王明哲. All rights reserved.
//

#import "SYDetailCell2.h"
#import <UIImageView+WebCache.h>

#define SatisfyDic @{@"1":@"不满意",@"3":@"满意",@"5":@"非常满意"}

@implementation SYDetailCell2

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    self.dayLabel.textColor = [UIColor grayColor];
    self.timeLabel.textColor = [UIColor grayColor];
    
    self.ratedLabel.textAlignment = NSTextAlignmentCenter;
    self.ratedLabel.textColor = [UIColor whiteColor];
    self.ratedLabel.layer.masksToBounds = YES;
    self.ratedLabel.layer.cornerRadius = 4.0f;
    self.userImageView.layer.masksToBounds = YES;
    self.userImageView.layer.cornerRadius = 30.f;
    
}

- (void)bindingDataWithModel:(ListModel *)model{
    [self.userImageView sd_setImageWithURL:[NSURL URLWithString:model.cover]];
    
    self.userNameLabel.text    = model.username;
    self.ratedLabel.text       = [SatisfyDic objectForKey:model.score];
    self.ratedDetailLabel.text = model.content;
    self.dayLabel.text         =  @"2016-12-12";
    self.timeLabel.text        = @"10:10:10";
    
    if ([model.score isEqual:@"1"]) {
        self.ratedLabel.backgroundColor = unSatisfyColor;
    }else if ([model.score isEqual:@"3"]) {
        self.ratedLabel.backgroundColor = satisfyColor;
    }else if ([model.score isEqual:@"5"]) {
        self.ratedLabel.backgroundColor = tabbarColor;
    }else {
        self.ratedLabel.backgroundColor = [UIColor whiteColor];
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
