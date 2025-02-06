//
//  LoginVC.m
//  Watchify
//
//  Created by Minh Ngọc on 05/02/2025.
//

#import "LoginVC.h"
#import "DefaultActionBar.h"
@interface LoginVC ()<DefaultActionBarDelegate>
@property (weak, nonatomic) IBOutlet DefaultActionBar *actionBar;

@end

@implementation LoginVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
 
    self.actionBar.delegate = self;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
#pragma mark - DefaultActionBarDelegate
- (void)defaultActionBarBackHandle:(DefaultActionBar *)actionBar{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
