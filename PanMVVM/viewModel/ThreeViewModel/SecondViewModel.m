//
//  SecondViewModel.m
//  PanMVVM
//
//  Created by 王明哲 on 16/1/9.
//  Copyright © 2016年 王明哲. All rights reserved.
//

#import "SecondViewModel.h"
#import "CommentModel.h"
#import "Function.h"

@interface SecondViewModel ()

@end

@implementation SecondViewModel

-(void)initialize {
    [super initialize];
}

- (RACSignal *)requestRemoteDataSignalWithPage:(NSUInteger)page {
    return [[[self.services modelServices] getjianceList] doNext:^(RACTuple *tuple) {
        
        //mantle
        JianceListModel* model = [MTLJSONAdapter modelOfClass:[JianceListModel class]
                                           fromJSONDictionary:tuple.first
                                                        error:nil];
        NSArray *dataArray  = [MTLJSONAdapter modelsOfClass:[JianceModel class]
                                              fromJSONArray:model.jianceList
                                                      error:nil];
        //data
        self.sectionIndexTitles = [dataArray.rac_sequence map:^(JianceModel*model) {
            return [Function firstCharactor:model.jianceName];
        }].array;
        
        //data seperate
        NSMutableArray *mutDataArray = [NSMutableArray array];
        NSMutableArray *muTemptArray = [NSMutableArray array];
        for (NSString *jianceName in self.sectionIndexTitles) {
            [muTemptArray removeAllObjects];
            for (JianceModel *model in dataArray) {
                if ([[Function firstCharactor:model.jianceName] isEqualToString:[Function firstCharactor:jianceName]]) {
                    [muTemptArray addObject:model];
                }
            }
            [mutDataArray addObject:[muTemptArray mutableCopy]];
        }

        self.dataSource = mutDataArray;
    }];
}

@end
