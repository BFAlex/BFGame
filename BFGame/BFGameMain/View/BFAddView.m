//
//  BFAddView.m
//  BFGame
//
//  Created by Readboy_BFAlex on 2017/8/28.
//  Copyright © 2017年 Readboy_BFAlex. All rights reserved.
//

#import "BFAddView.h"

@interface BFAddView ()
@property (weak, nonatomic) IBOutlet UITextField *contentTF;
@property (weak, nonatomic) IBOutlet UITextField *timeTF;

@end

@implementation BFAddView

+ (instancetype)addViewWithFrame:(CGRect)frame {
    
    BFAddView *addView = [[[NSBundle mainBundle] loadNibNamed:@"BFAddView" owner:nil options:nil] lastObject];
    if (addView) {
        addView.frame = frame;
        [addView setupGesture];
    }
    
    return addView;
}

#pragma mark - Private

- (void)setupGesture {
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapOnBaseView:)];
    [self addGestureRecognizer:tap];
}

- (void)tapOnBaseView:(UIGestureRecognizer *)gesture {
    [self endEditing:YES];
}

#pragma mark - Action

- (IBAction)actionSave:(UIButton *)sender {
    
    if (self.contentTF.text.length <= 0 || self.timeTF.text.length <= 0) {
        [[[UIAlertView alloc] initWithTitle:@"温馨提示" message:@"内容栏/频率栏不能为空" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil] show];
        return;
    }
    
    NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
    [dict setObject:self.contentTF.text forKey:@"BFAddViewContent"];
    [dict setObject:self.timeTF.text forKey:@"BFAddViewTime"];
    
    if ([self.delegate respondsToSelector:@selector(addView:didAddNewItem:)]) {
        [self.delegate addView:self didAddNewItem:dict];
    }
    
    [self removeFromSuperview];
}
- (IBAction)actionCancel:(UIButton *)sender {
    [self removeFromSuperview];
}

@end
