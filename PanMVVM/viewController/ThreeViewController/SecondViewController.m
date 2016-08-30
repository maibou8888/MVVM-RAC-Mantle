//
//  SecondViewController.m
//  PanMVVM
//
//  Created by 王明哲 on 16/1/9.
//  Copyright © 2016年 王明哲. All rights reserved.
//

#import "SecondViewController.h"
#import "SecondViewModel.h"

#import "SecondCell.h"
#import "CommentModel.h"

@interface SecondViewController ()

@property (nonatomic, strong, readonly) SecondViewModel *viewModel;

@end

@implementation SecondViewController
@dynamic viewModel;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"SecondCell" bundle:nil] forCellReuseIdentifier:@"SecondCell"];
}

- (UITableViewCell *)tableView:(UITableView *)tableView dequeueReusableCellWithIdentifier:(NSString *)identifier
                  forIndexPath:(NSIndexPath *)indexPath {
    return [tableView dequeueReusableCellWithIdentifier:@"SecondCell" forIndexPath:indexPath];
}

- (void)configureCell:(SecondCell *)cell atIndexPath:(NSIndexPath *)indexPath withObject:(JianceModel *)model {
    [cell bindingDataWithModel:model];
}

@end
