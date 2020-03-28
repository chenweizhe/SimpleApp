//
//  VideoViewController.m
//  SimpleApp
//
//  Created by codingzhe on 2020/3/23.
//  Copyright © 2020 codingzhe. All rights reserved.
//

#import "VideoViewController.h"

@interface VideoViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>

@end

@implementation VideoViewController


- (instancetype)init
{
    self = [super init];
    if (self) {
        self.tabBarItem.title = @"视频";
        self.tabBarItem.image = [UIImage imageNamed:@"icon.bundle/aixin.png"];
        //   选中时的图片
        self.tabBarItem.selectedImage = [UIImage imageNamed:@"icon.bundle/aixin.png"];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    NSLog(@"videocontroller");
/********************************************/
//   创建一个基本的layout 系统为我们创建的一个流式布局
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.minimumLineSpacing = 10;
    flowLayout.minimumInteritemSpacing = 10;
    flowLayout.itemSize = CGSizeMake((self.view.frame.size.width - 10) / 2, 200);
    
//  创建collectionView initWithFrame 大小 collectionViewLayout 必填
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:flowLayout];
    collectionView.backgroundColor = [UIColor whiteColor];
    
//    delegate datasource
    collectionView.delegate = self;
    collectionView.dataSource = self;
    
//    重点：必须注册cell  实现重用cell类型的注册
    [collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"UICollectionViewCell"];
    
    
    [self.view addSubview:collectionView];
    
}

//datasource的必要操作 两个
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 20;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"UICollectionViewCell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor lightGrayColor];
    UILabel *label = [[UILabel alloc] initWithFrame:cell.bounds];
    label.textAlignment = NSTextAlignmentCenter;
    label.text = @"Cell";
    label.textColor = [UIColor whiteColor];
//    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(20, 0, 48, 48)];
//    imageView.image = [UIImage imageNamed:@"icon.bundle/yidali-bisaxieta-48.png"];
//    UIImage *image = [UIImage imageNamed:@"icon.bundle/zhongguo-gugong.png"];
    [cell addSubview:label];
//    [cell addSubview:imageView];
//    由于我们没有z设置cell大小 系统默认就是50*50的大小
//    如果系统回收池m中没有cell，那么系统将会自动生成cell
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.item % 3 == 0) {
        return CGSizeMake(self.view.frame.size.width, 100);
    }else {
        return CGSizeMake((self.view.frame.size.width - 10) / 2, 200);
    }
}
@end
