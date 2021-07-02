//
//  MVCCell.m
//  APPArchitecture
//
//  Created by Marshal on 2021/6/23.
//

#import "MVCCell.h"

@implementation MVCCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onTap)];
    [self.contentView addGestureRecognizer:tap];
    
    UILongPressGestureRecognizer *lp = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(onLongPress:)];
    [self.contentView addGestureRecognizer:lp];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)onTap {
    if (self.onTapBlock) self.onTapBlock(self);
}

- (void)onLongPress:(UILongPressGestureRecognizer *)sender {
    if (sender.state == UIGestureRecognizerStateEnded) {
        if (self.onLongPressBlock) self.onLongPressBlock(self);
    }
}

@end
