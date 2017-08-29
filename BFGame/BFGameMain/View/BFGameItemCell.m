//
//  BFGameItemCell.m
//  BFGame
//
//  Created by Readboy_BFAlex on 2017/8/28.
//  Copyright © 2017年 Readboy_BFAlex. All rights reserved.
//

#import "BFGameItemCell.h"

@interface BFGameItemCell ()
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;

@end

@implementation BFGameItemCell

+ (instancetype)gameItemCell {
    BFGameItemCell *cell = [[[NSBundle mainBundle] loadNibNamed:@"BFGameItemCell" owner:nil options:nil] lastObject];
    if (cell) {
        // 随机一个颜色
        int r = arc4random()%256 + 1;
        int g = arc4random()%256 + 1;
        int b = arc4random()%256 + 1;
        UIColor *bgColor = [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1];
        cell.backgroundColor = bgColor;
    }
    
    return cell;
}

- (void)configurateCellWithModule:(BFGameItemModule *)module {
    self.contentLabel.text = module.contentStr;
    self.timeLabel.text = [NSString stringWithFormat:@"%d", module.time];
}

//- (void)awakeFromNib {
//    [super awakeFromNib];
//    // Initialization code
//}
//
//- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
//    [super setSelected:selected animated:animated];
//
//    // Configure the view for the selected state
//}

@end
