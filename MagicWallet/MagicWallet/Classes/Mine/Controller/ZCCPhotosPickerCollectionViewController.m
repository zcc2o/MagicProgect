//
//  ZCCPhotosPickerCollectionViewController.m
//  MagicWallet
//
//  Created by mac on 2017/6/22.
//  Copyright © 2017年 zcc. All rights reserved.
//

#import "ZCCPhotosPickerCollectionViewController.h"
#import "ZCCCommon.h"
#import "ZCCPhtotCollectionViewCell.h"
#import <Photos/Photos.h>
#import "ZCCPhoneAlbumModel.h"
#define COLLECTIONWIDTH (SCREENWIDTH - 10)/3

@interface ZCCPhotosPickerCollectionViewController ()<UICollectionViewDelegate, UICollectionViewDataSource, UIImagePickerControllerDelegate,UINavigationControllerDelegate,ZCCSelectedPhotoImageDelegate>

@property (nonatomic, strong)UICollectionViewFlowLayout *flowLayout;

@property (nonatomic, strong)NSMutableArray *picsMArray;
//数组 存 照片模型
//@property (nonatomic, strong)NSMutableArray *photoAlbums;
//选中图片
@property (nonatomic, strong)UIImage *selectedImage;

@end

@implementation ZCCPhotosPickerCollectionViewController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.collectionView.backgroundColor = [UIColor whiteColor];
    
    [self.collectionView registerClass:[ZCCPhtotCollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    self.collectionView.alwaysBounceVertical = YES;
    
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    
    // Do any additional setup after loading the view.
    
    [self addRightNavBtns];
    
    [self getLastPic];
    
    self.title = @"最近照片";
    
}

- (void)addRightNavBtns{
    
    UIToolbar *tools = [[UIToolbar alloc] initWithFrame:CGRectMake(5, 0, 90, 39)];
    //解决出现的线
    tools.clipsToBounds = YES;
    [tools setBackgroundImage:[UIImage new] forToolbarPosition:UIBarPositionAny barMetrics:UIBarMetricsDefault];
    [tools setShadowImage:[UIImage new] forToolbarPosition:UIToolbarPositionAny];
    
    //添加两个button
    NSMutableArray *buttons = [[NSMutableArray alloc] initWithCapacity:2];
    
    UIBarButtonItem *quitBtn = [[UIBarButtonItem alloc] initWithTitle:@"相册" style:UIBarButtonItemStylePlain target:self action:@selector(albBtnClicked)];
    
    UIBarButtonItem *submitBtn = [[UIBarButtonItem alloc] initWithTitle:@"提交" style:UIBarButtonItemStylePlain target:self action:@selector(submitBtnClicked)];
    
    quitBtn.tintColor = [UIColor whiteColor];
    submitBtn.tintColor = [UIColor whiteColor];
    
    [buttons addObject:quitBtn];
    [buttons addObject:submitBtn];
    
    [tools setItems:buttons animated:NO];
    
    UIBarButtonItem *btn = [[UIBarButtonItem alloc] initWithCustomView:tools];
    
    self.navigationItem.rightBarButtonItem = btn;
}

- (void)albBtnClicked{
    
    UIImagePickerController *imagePickerVC = [[UIImagePickerController alloc] init];
    
    imagePickerVC.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    
    imagePickerVC.delegate = self;
    
    [self presentViewController:imagePickerVC animated:YES completion:nil];
    
}

- (void)submitBtnClicked{
    
    if(self.selectedImage){
        if([self.delegate respondsToSelector:@selector(thePictureIDcard: andCellNumber:)]){
            [self.delegate thePictureIDcard:self.selectedImage andCellNumber:self.cellNumber];
        }
        [self.navigationController popViewControllerAnimated:YES];
    }
}

- (void)selectedImage:(UIImage *)image{
    self.selectedImage = image;
}

//打开相册点击图片后 就把图片传到self.picsCollectionView上去
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    
    [picker dismissViewControllerAnimated:YES completion:nil];
    //返回回来的图片
    UIImage *image = info[@"UIImagePickerControllerOriginalImage"];
    
    self.selectedImage = image;
    
    if([self.delegate respondsToSelector:@selector(thePictureIDcard: andCellNumber:)]){
        [self.delegate thePictureIDcard:self.selectedImage andCellNumber:self.cellNumber];
    }
    [self.navigationController popViewControllerAnimated:YES];
}

- (instancetype)init{
    
    self.flowLayout = [[UICollectionViewFlowLayout alloc] init];
    
    CGFloat width = (SCREENWIDTH - 10)/3;
    CGFloat height = width;
    
    _flowLayout.itemSize = CGSizeMake(width, height);
    _flowLayout.minimumInteritemSpacing = 5;
    _flowLayout.minimumLineSpacing = 5;

    if(self = [super initWithCollectionViewLayout:self.flowLayout]){
        
    }
    return self;
}

#pragma mark <UICollectionViewDataSource>

//- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
//#warning Incomplete implementation, return the number of sections
//    return 0;
//}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
//#warning Incomplete implementation, return the number of items;
    return _picsMArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    ZCCPhtotCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    if(cell == nil){
        
    }
    
//    cell.photoImage = self.picsMArray[indexPath.row];
    
    cell.photoImage = _picsMArray[indexPath.row];

    cell.backgroundColor = ZCCRCOLOR;
    
    cell.delegate = self;
    
    return cell;
}

/*
 PHAsset : 一个资源, 比如一张图片\一段视频
 PHAssetCollection : 一个相簿
 PHImageManager 图片管理者,是单例,发送请求才能从asset获取图片
 PHImageRequestOptions图片请求选项
 
 PHAsset : 代表照片库中的一个资源，跟 ALAsset 类似，通过 PHAsset 可以获取和保存资源
 
 PHFetchOptions : 获取资源时的参数，可以传 nil，即使用系统默认值
 
 PHFetchResult : 表示一系列的资源集合，也可以是相册的集合
 
 PHAssetCollection : 表示一个相册或者一个时刻，或者是一个「智能相册（系统提供的特定的一系列相册，例如：最近删除，视频列表，收藏等等，如下图所示）
 
 PHImageManager : 用于处理资源的加载，加载图片的过程带有缓存处理，可以通过传入一个 PHImageRequestOptions 控制资源的输出尺寸等规格
 
 PHImageRequestOptions : 如上面所说，控制加载图片时的一系列参数;
 
 */


//获取最新一张照片
- (void)getLastPic{
    //获取资源时的参数
    PHFetchOptions *options = [[PHFetchOptions alloc] init];
//    表示一系列的资源集合，也可以是相册的集合
    PHFetchResult *assetsFetchResults = [PHAsset fetchAssetsWithOptions:options];
//    NSLog(@"%lu",assetsFetchResults.count);
//    一个资源 一张照片  视频
    
    NSUInteger count = 18;
    
    if(assetsFetchResults.count > 18){
        count = 18;
    }else{
        count = assetsFetchResults.count;
    }
    //获取18张
    for(int i = 0; i<count; i++){
        PHAsset *phasset = assetsFetchResults[assetsFetchResults.count - (count - i)];
        
        PHCachingImageManager *imageManager = [[PHCachingImageManager alloc] init];
        
        PHImageRequestOptions *options = [[PHImageRequestOptions alloc] init];
        
        //同步获得智慧返回一张
        options.synchronous = YES;
        
        CGFloat width = 0;
        
        CGFloat height = 0;
        
        //宽大于高 压缩高
        
        if(phasset.pixelWidth > phasset.pixelHeight){
            
            width = phasset.pixelWidth * COLLECTIONWIDTH/phasset.pixelHeight;
            
            height = COLLECTIONWIDTH;
            
        }else{//宽小于高 压缩宽
            
            width = COLLECTIONWIDTH;
            
            height = phasset.pixelHeight * COLLECTIONWIDTH/phasset.pixelWidth;
            
        }
        
        CGSize size = CGSizeMake(width, height);
        
        __weak typeof(self)weakself = self;
        
        [imageManager requestImageForAsset:phasset targetSize:size contentMode:PHImageContentModeDefault options:options resultHandler:^(UIImage * _Nullable result, NSDictionary * _Nullable info) {
//            NSLog(@"%@",result);
            if(result != nil){
                [weakself.picsMArray addObject:result];
            }
        }];
    }
    
}

- (NSMutableArray *)picsMArray{
    
    if(_picsMArray == nil){
        _picsMArray = [NSMutableArray array];
    }
    return _picsMArray;
}

@end
