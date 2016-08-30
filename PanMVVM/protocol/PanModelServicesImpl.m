//
//  PanModelServicesImpl.m
//  PanMVVM
//
//  Created by 王明哲 on 16/1/14.
//  Copyright © 2016年 王明哲. All rights reserved.
//

#import "PanModelServicesImpl.h"

@interface PanModelServicesImpl()<PanModelServices>

@end

@implementation PanModelServicesImpl

-(RACSignal *)getSYCommentSiginalWithPage:(NSString *)page idString:(NSString *)idString {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager new];
    RACSignal *investSignal = [manager rac_GET:CombineURL(CommentURL) parameters:@{@"page":page,@"id":idString}];
    return [investSignal replayLazily];
}

-(RACSignal *)getjianceList {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager new];
    RACSignal *investSignal = [manager rac_GET:CombineURL(JianceURL) parameters:nil];
    return [investSignal replayLazily];
}

@end
