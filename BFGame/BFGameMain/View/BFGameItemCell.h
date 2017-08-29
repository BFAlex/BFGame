//
//  BFGameItemCell.h
//  BFGame
//
//  Created by Readboy_BFAlex on 2017/8/28.
//  Copyright © 2017年 Readboy_BFAlex. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BFGameItemModule.h"

@interface BFGameItemCell : UITableViewCell

+ (instancetype)gameItemCell;
- (void)configurateCellWithModule:(BFGameItemModule *)module;

@end
