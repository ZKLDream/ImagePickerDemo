//
//  ViewController.m
//  ImagePickerDemo
//
//  Created by 千锋 on 16/3/24.
//  Copyright © 2016年 mobiletrain. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIImagePickerControllerDelegate,UINavigationControllerDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

- (IBAction)PikerAction:(UIButton *)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //设置圆角
    self.imageView.layer.cornerRadius=150;
    self.imageView.layer.masksToBounds=YES;
    
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)PikerAction:(UIButton *)sender {
    //创建图片选择控制器
    UIImagePickerController *picker=[[UIImagePickerController alloc]init];
    //设置委托
    picker.delegate=self;
    
    
    //设置编辑模式
    picker.allowsEditing=YES;
    
//    //设置数据源的类型
    
//    UIImagePickerControllerSourceTypePhotoLibrary, 图库
//    UIImagePickerControllerSourceTypeCamera, 相机
//    UIImagePickerControllerSourceTypeSavedPhotosAlbum 相簙/相册
    picker.sourceType=UIImagePickerControllerSourceTypePhotoLibrary;
    //设置显示的媒体类型
    //获取数据来源支持的类型
    
   NSArray *mediaTypes=[UIImagePickerController availableMediaTypesForSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
    //自定义媒体类型
 //   NSArray *mediaTypes=@[@"public.image"];
    
    picker.mediaTypes=mediaTypes;
    
    //判断是否支持
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]) {
        //如果支持该类型数据源 显示
        [self presentViewController:picker animated:YES completion:nil];
        
    }else{
        
        NSLog(@"不支持");
    }

    
    
}

#pragma mark UIImagePickerControllerDelegate
//当选择的了图片或者视频回调
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    NSLog(@"info =%@",info);
    
    //获取原始图片
 //   UIImage *originImage=info[UIImagePickerControllerOriginalImage];
  //  self.imageView.image=originImage;
    
    
    //获取编辑后的图片
    UIImage *editedImage=info[UIImagePickerControllerEditedImage];
    self.imageView.image=editedImage;
    
    //让UIImagePickerController消失
    [picker dismissViewControllerAnimated:YES completion:nil];
    
    
    
}

//选择AV时，点击取消按钮的回调
-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    [picker dismissViewControllerAnimated:YES completion:nil];
    
    
}




@end
