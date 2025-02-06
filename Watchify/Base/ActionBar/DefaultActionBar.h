//
//  DefaultActionBar.h
//  Watchify
//
//  Created by Minh Ngọc on 05/02/2025.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class DefaultActionBar;
@protocol DefaultActionBarDelegate <NSObject>

-(void)defaultActionBarBackHandle:(DefaultActionBar *)actionBar;

@end
IB_DESIGNABLE
@interface DefaultActionBar : UIView
@property (weak, nonatomic) IBOutlet UILabel *titleOL;
@property (strong, nonatomic) IBInspectable NSString *title;

@property (nonatomic, weak) id<DefaultActionBarDelegate> delegate;
@end

NS_ASSUME_NONNULL_END
