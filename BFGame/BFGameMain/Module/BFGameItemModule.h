//
//  BFGameItemModule.h
//  BFGame
//
//  Created by Readboy_BFAlex on 2017/8/28.
//  Copyright © 2017年 Readboy_BFAlex. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BFGameItemModule : NSObject

@property (nonatomic, copy) NSString *contentStr;
@property (nonatomic, assign) NSInteger time;

+ (instancetype)itemModuleWithData:(NSDictionary *)data;

@end
