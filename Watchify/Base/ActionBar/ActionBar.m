//
//  ActionBar.m
//  Watchify
//
//  Created by Minh Ngọc on 05/02/2025.
//

#import "ActionBar.h"

@interface ActionBar(){
        
}
@end

@implementation ActionBar

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (void)commonInit {
    UIView *nibView = [[[NSBundle mainBundle] loadNibNamed:@"ActionBar" owner:self options:nil] firstObject];
    nibView.frame = self.bounds;
    nibView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [self addSubview:nibView];
}


- (IBAction)backBtn:(id)sender {
}




@end
