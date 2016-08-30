//
//  SYDetailCell2.h
//  PanMVVM
//
//  Created by 班梦 on 16/6/17.
//  Copyright © 2016年 王明哲. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CommentModel.h"

@interface SYDetailCell2 : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *userImageView;
@property (weak, nonatomic) IBOutlet UILabel *userNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *ratedLabel;
@property (weak, nonatomic) IBOutlet UILabel *ratedDetailLabel;
@property (weak, nonatomic) IBOutlet UILabel *dayLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;

- (void)bindingDataWithModel:(ListModel *)model;
@end
