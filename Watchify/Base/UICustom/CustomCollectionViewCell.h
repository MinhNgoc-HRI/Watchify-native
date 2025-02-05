//
//  CustomCollectionViewCell.h
//  Watchify
//
//  Created by Minh Ngọc on 04/02/2025.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CustomCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *customImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;

- (void)configureWithImage:(UIImage *)image title:(NSString *)title description:(NSString *)description;

@end

NS_ASSUME_NONNULL_END
