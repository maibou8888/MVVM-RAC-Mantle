//
//  FirstViewController.m
//  PanMVVM
//
//  Created by 王明哲 on 16/1/9.
//  Copyright © 2016年 王明哲. All rights reserved.
//

#import "FirstViewController.h"
#import "FirstViewModel.h"

#import "SYDetailCell2.h"
#import "CommentModel.h"

@interface FirstViewController ()

@property (nonatomic, strong, readonly) FirstViewModel *viewModel;

@end

@implementation FirstViewController

@dynamic viewModel;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"SYDetailCell2" bundle:nil] forCellReuseIdentifier:@"SYDetailCell2"];
}

- (UITableViewCell *)tableView:(UITableView *)tableView dequeueReusableCellWithIdentifier:(NSString *)identifier
                  forIndexPath:(NSIndexPath *)indexPath {
    return [tableView dequeueReusableCellWithIdentifier:@"SYDetailCell2" forIndexPath:indexPath];
}

- (void)configureCell:(SYDetailCell2 *)cell atIndexPath:(NSIndexPath *)indexPath withObject:(ListModel *)model {
    [cell bindingDataWithModel:model];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 130.0f;
}

@end
