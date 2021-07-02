//
//  MVCCell.h
//  APPArchitecture
//
//  Created by Marshal on 2021/6/23.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MVCCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;

@property (nonatomic, copy) void(^onTapBlock)(MVCCell* cell);
@property (nonatomic, copy) void(^onLongPressBlock)(MVCCell* cell);

@end

NS_ASSUME_NONNULL_END
