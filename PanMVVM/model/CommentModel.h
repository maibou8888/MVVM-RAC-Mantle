//
//  CommentModel.h
//  PanMVVM
//
//  Created by 王明哲 on 16/6/29.
//  Copyright © 2016年 王明哲. All rights reserved.
//

#import <Mantle/Mantle.h>

@interface ListModel : MTLModel <MTLJSONSerializing>

@property (nonatomic , strong) NSString *content;
@property (nonatomic , strong) NSString *cover;
@property (nonatomic , strong) NSString *time;
@property (nonatomic , strong) NSString *score;
@property (nonatomic , strong) NSString *username;

@end

@interface CommentModel : MTLModel <MTLJSONSerializing>

@property (nonatomic , strong) NSArray  *commentList;
@property (nonatomic , strong) NSString *pagetotal;

@end

@interface JianceListModel : MTLModel <MTLJSONSerializing>

@property (nonatomic , strong) NSArray  *jianceList;

@end

@interface JianceModel : MTLModel <MTLJSONSerializing>

@property (nonatomic , strong) NSString *jianceName;

@end

