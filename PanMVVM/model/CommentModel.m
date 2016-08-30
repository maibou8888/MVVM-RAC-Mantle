//
//  CommentModel.m
//  PanMVVM
//
//  Created by 王明哲 on 16/6/29.
//  Copyright © 2016年 王明哲. All rights reserved.
//

#import "CommentModel.h"
#import <MTLJSONAdapter.h>

@implementation ListModel

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"content"     : @"content",
             @"cover"       : @"cover",
             @"time"        : @"create_time",
             @"score"       : @"score",
             @"username"    : @"user_name"
            };
}

+ (NSValueTransformer *)recordListJSONTransformer
{
    return [MTLJSONAdapter arrayTransformerWithModelClass:[ListModel class]];
}

@end

@implementation CommentModel

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"commentList" : @"data.list",
             @"pagetotal"   : @"data.page.pagetotal",
            };
}

@end

@implementation JianceListModel

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"jianceList"  : @"data",
            };
}

@end

@implementation JianceModel

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"jianceName"  : @"srtc_name",
            };
}

+ (NSValueTransformer *)recordListJSONTransformer
{
    return [MTLJSONAdapter arrayTransformerWithModelClass:[JianceModel class]];
}
@end


