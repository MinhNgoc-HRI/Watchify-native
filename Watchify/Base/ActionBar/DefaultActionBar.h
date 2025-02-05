//
//  DefaultActionBar.h
//  Watchify
//
//  Created by Minh Ngọc on 05/02/2025.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
IB_DESIGNABLE
@interface DefaultActionBar : UIView
@property (weak, nonatomic) IBOutlet UILabel *titleOL;
@property (strong, nonatomic) IBInspectable NSString *title;
@end

NS_ASSUME_NONNULL_END
