//
//  FirstViewModel.m
//  PanMVVM
//
//  Created by 王明哲 on 16/1/9.
//  Copyright © 2016年 王明哲. All rights reserved.
//

#import "FirstViewModel.h"
#import "CommentModel.h"

@interface FirstViewModel ()

@end

@implementation FirstViewModel

-(void)initialize {
    [super initialize];
    
    self.shouldInfiniteScrolling = YES;
}

- (RACSignal *)requestRemoteDataSignalWithPage:(NSUInteger)page {
    NSString *pageStr = [NSString stringWithFormat:@"%lu",(unsigned long)page];
    return [[[self.services modelServices] getSYCommentSiginalWithPage:pageStr idString:@"2"]
            doNext:^(RACTuple *tuple) {
                //mantle
                CommentModel* model = [MTLJSONAdapter modelOfClass:[CommentModel class]
                                                fromJSONDictionary:tuple.first
                                                             error:nil];
                NSArray *dataArray  = [MTLJSONAdapter modelsOfClass:[ListModel class]
                                                      fromJSONArray:model.commentList
                                                            error:nil];
                //dataSource
                self.dataSource = @[ self.dataSource.rac_sequence,dataArray.rac_sequence ].rac_sequence.flatten.array;
                
                //总页数
                self.totalPage = model.pagetotal.integerValue;
                
                if (self.totalPage < 2) {
                    self.lastPage = @"1";
                }
    }];
}

@end
