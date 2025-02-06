//
//  DefaultActionBar.m
//  Watchify
//
//  Created by Minh Ngọc on 05/02/2025.
//

#import "DefaultActionBar.h"
@interface DefaultActionBar(){
    UIView *uiView;
}
@end
@implementation DefaultActionBar

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self commonInit];
        [self setUp];
    }
    return self;
}
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self commonInit];
        [self setUp];
    }
    return self;
}

- (void)commonInit {
//    UIView *view = [[[NSBundle mainBundle] loadNibNamed:@"DefaultActionBar" owner:self options:nil] firstObject];
//    view.frame = self.bounds;
//    view.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
//    [self addSubview:view];
    NSBundle *bundle = [NSBundle bundleForClass:[self class]];
    NSString *className = NSStringFromClass([self class]);
    uiView = [[bundle loadNibNamed:className owner:self options:nil] firstObject];
    uiView.frame = self.bounds;
    self.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    [self addSubview:uiView];
}

-(void)setUp {
   
}
- (void)setTitle:(NSString *)title {
    _title = title;
    self.titleOL.text = _title;
}

- (IBAction)backBtnAction:(id)sender {
    if ([self.delegate respondsToSelector:@selector(defaultActionBarBackHandle:)]) {
           [self.delegate defaultActionBarBackHandle:self];
       }
}

@end
