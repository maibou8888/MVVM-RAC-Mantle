//
//  MRCTableViewModel.h
//  MVVMReactiveCocoa
//
//  Created by leichunfeng on 14/12/27.
//  Copyright (c) 2014年 leichunfeng. All rights reserved.
//

#import "PanViewModel.h"

@interface MRCTableViewModel : PanViewModel

// The data source of table view.
@property (nonatomic, copy) NSArray *dataSource;

// The list of section titles to display in section index view.
@property (nonatomic, copy) NSArray *sectionIndexTitles;

//页数
@property (nonatomic, assign) NSUInteger page;

//服务器返回总页数
@property (nonatomic, assign) NSUInteger totalPage;

//是否是最后一页
@property (nonatomic, assign) NSString *lastPage;

//无限滚动
@property (nonatomic, assign) BOOL shouldInfiniteScrolling;

//选中当前行响应的信号
@property (nonatomic, strong) RACCommand *didSelectCommand;

//请求远程数据的信号
@property (nonatomic, strong, readonly) RACCommand *requestRemoteDataCommand;

//根据页数请求远程数据
- (RACSignal *)requestRemoteDataSignalWithPage:(NSUInteger)page;

@end
