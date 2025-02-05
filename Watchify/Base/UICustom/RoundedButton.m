//
//  RoundedButton.m
//  Watchify
//
//  Created by Minh Ngọc on 04/02/2025.
//

#import "RoundedButton.h"

@implementation RoundedButton

// Khởi tạo khi tạo view từ code
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

// Khởi tạo khi tạo view từ storyboard hoặc xib
- (instancetype)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
        [self setup];
    }
    return self;
}

// Phương thức này được gọi khi thiết kế trên Interface Builder
- (void)prepareForInterfaceBuilder {
    [super prepareForInterfaceBuilder];
    [self setup];
}

// Phương thức cài đặt mặc định
- (void)setup {
    // Bạn có thể đặt các cấu hình mặc định tại đây, nếu cần
    self.layer.masksToBounds = YES;
}

#pragma mark - Setter

- (void)setCornerRadius:(CGFloat)cornerRadius {
    _cornerRadius = cornerRadius;
    self.layer.cornerRadius = cornerRadius;
    self.clipsToBounds = cornerRadius > 0;
}

- (void)setBorderWidth:(CGFloat)borderWidth {
    _borderWidth = borderWidth;
    self.layer.borderWidth = borderWidth;
}

- (void)setBorderColor:(UIColor *)borderColor {
    _borderColor = borderColor;
    self.layer.borderColor = borderColor.CGColor;
}

@end
