//
//  BFGameItemModule.m
//  BFGame
//
//  Created by Readboy_BFAlex on 2017/8/28.
//  Copyright © 2017年 Readboy_BFAlex. All rights reserved.
//

#import "BFGameItemModule.h"

@implementation BFGameItemModule

+ (instancetype)itemModuleWithData:(NSDictionary *)data {
    
    BFGameItemModule *module = [[BFGameItemModule alloc] init];
    
    NSString *content = [data objectForKey:@"BFAddViewContent"];
    NSString *time = [data objectForKey:@"BFAddViewTime"];
    
    module.contentStr = content;
    module.time = [time integerValue];
    
    return module;
}

@end
