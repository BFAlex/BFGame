//
//  BFAddView.h
//  BFGame
//
//  Created by Readboy_BFAlex on 2017/8/28.
//  Copyright © 2017年 Readboy_BFAlex. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BFAddView;
@protocol BFAddViewDelegate <NSObject>

@optional
- (void)addView:(BFAddView *)addView didAddNewItem:(NSDictionary *)dict;

@end

@interface BFAddView : UIView

@property (nonatomic, strong) id<BFAddViewDelegate> delegate;

+ (instancetype)addViewWithFrame:(CGRect)frame;

@end
