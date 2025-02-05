//
//  OnbroadVC.m
//  Watchify
//
//  Created by Minh Ngọc on 03/02/2025.
//

#import "OnbroadVC.h"
#import "CustomCollectionViewCell.h"
#import "RippleEffectView.h"
#import "LoginVC.h"

@interface OnbroadVC ()<UICollectionViewDelegate, UICollectionViewDataSource>
@property (weak, nonatomic) IBOutlet UIView *btn;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionViewObj;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;
- (IBAction)pageControlAtc:(id)sender;
@property (nonatomic, strong) NSArray *dataArray;
@end

@implementation OnbroadVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self setUpbtn];
    
    self.collectionViewObj.delegate = self;
    self.collectionViewObj.dataSource = self;
    UINib *nib = [UINib nibWithNibName:@"CustomCollectionViewCell" bundle:nil];
    [self.collectionViewObj registerNib:nib forCellWithReuseIdentifier:@"cell"];
    self.dataArray = @[
        @{@"title": @"Xem hàng triệu video đặc sắc hấp dẫn", @"image": @"illus_splash_01", @"description": @"Đa dạng chủ đề Nhạc, Phim, TVShow, Tin Tức, Sao"},
        @{@"title": @"Phát sóng trực tiếp các sự kiện giải trí hot", @"image": @"illus_splash_02",  @"description":@"Hội tụ top streamers, KOLs và giải đấu Esport đỉnh cao"},
        @{@"title": @"Đăng tải và chia sẻ video mọi lúc mọi nơi", @"image": @"illus_splash_03",@"description" :@"Dễ dàng lưu trữ và chia sẻ video với bạn bè"}
        ];
    self.pageControl.numberOfPages = self.dataArray.count;
    self.pageControl.currentPage = 0;
}


- (void)setUpbtn{
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
    [self.btn addGestureRecognizer:tapGesture];
    self.btn.userInteractionEnabled = YES;
    self.btn.layer.cornerRadius = 10;
    self.btn.clipsToBounds = YES;
}
- (void)handleTap:(UITapGestureRecognizer *)gesture {
    LoginVC *loginVC = [[LoginVC alloc] initWithNibName:@"LoginVC" bundle:nil];
    [self.navigationController.navigationBar setHidden:YES];
    self.navigationController.navigationBar.clipsToBounds = YES;
    [self.navigationController pushViewController:loginVC animated:YES];
}

#pragma mark - UICollectionViewDataSource

// Trả về số lượng cell (số phần tử trong mảng dataArray)
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.dataArray.count;
}

// Cấu hình cell cho từng indexPath
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CustomCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    // Lấy dữ liệu tương ứng từ mảng dataArray
    NSDictionary *item = self.dataArray[indexPath.row];
    cell.titleLabel.text = item[@"title"];
    cell.customImageView.image = [UIImage imageNamed:item[@"image"]];
    cell.descriptionLabel.text = item[@"description"];
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout *)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    // Trả về kích thước của cell bằng kích thước của collectionView
    return collectionView.bounds.size;
}


#pragma mark - UICollectionViewDelegate

// (Tùy chọn) Xử lý khi người dùng chọn một cell
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"Selected item at row: %ld", (long)indexPath.row);
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat pageWidth = scrollView.frame.size.width;
        NSInteger page = (NSInteger)((scrollView.contentOffset.x + pageWidth/2) / pageWidth);
        self.pageControl.currentPage = page;
}
- (IBAction)pageControlAtc:(id)sender {
    NSInteger currentPage = self.pageControl.currentPage;
       NSIndexPath *indexPath = [NSIndexPath indexPathForItem:currentPage inSection:0];
       [self.collectionViewObj scrollToItemAtIndexPath:indexPath
                                       atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally
                                               animated:YES];
}
@end
