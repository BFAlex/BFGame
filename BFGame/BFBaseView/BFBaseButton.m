//
//  BFBaseButton.m
//  BFGame
//
//  Created by Readboy_BFAlex on 2017/8/28.
//  Copyright © 2017年 Readboy_BFAlex. All rights reserved.
//

#import "BFBaseButton.h"

@implementation BFBaseButton

#pragma mark - Life Cycle

- (void)awakeFromNib {
    [super awakeFromNib];
    
    [self cornerBorder];
}

#pragma mark - Private

- (void)cornerBorder {
//    NSLog(@"%s%d", __func__, __LINE__);
    self.layer.borderWidth = 1.0;
    self.layer.borderColor = [[UIColor clearColor] CGColor];
    self.layer.cornerRadius = self.bounds.size.height/2;
}

@end
