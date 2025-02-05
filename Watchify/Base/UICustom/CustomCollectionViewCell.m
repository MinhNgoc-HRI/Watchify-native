//
//  CustomCollectionViewCell.m
//  Watchify
//
//  Created by Minh Ngọc on 04/02/2025.
//

#import "CustomCollectionViewCell.h"

@implementation CustomCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (void)configureWithImage:(UIImage *)image title:(NSString *)title description:(NSString *)description {
    self.customImageView.image = image;
    self.titleLabel.text = title;
    self.descriptionLabel.text = description;
}

@end
