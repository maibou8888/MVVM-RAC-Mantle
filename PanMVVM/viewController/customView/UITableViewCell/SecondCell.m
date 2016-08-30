//
//  SecondCell.m
//  PanMVVM
//
//  Created by 王明哲 on 16/7/3.
//  Copyright © 2016年 王明哲. All rights reserved.
//

#import "SecondCell.h"

@implementation SecondCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)bindingDataWithModel:(JianceModel *)model {
    self.textLabel.font = [UIFont systemFontOfSize:15.0f];
    self.textLabel.text = model.jianceName;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
