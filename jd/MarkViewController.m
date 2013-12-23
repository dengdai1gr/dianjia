//
//  MarkViewController.m
//  jd
//
//  Created by CR on 13-12-22.
//  Copyright (c) 2013年 CR. All rights reserved.
//

#import "MarkViewController.h"
#import "EditImageViewController.h"
#import "MovableImageView.h"

@interface MarkViewController ()

@end

@implementation MarkViewController
@synthesize editImage=_editImage;
@synthesize selectingImage=_selectingImage;
@synthesize imageView=_imageView;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    if (self.image!=nil) {
        self.imageView.image=self.image;
    }
    //添加 首页 按钮
    UIButton *btn=[[UIButton alloc]initWithFrame:CGRectMake(40, 0,149,35)];
    [btn setBackgroundImage:[UIImage imageNamed:@"bt_backbt.png"] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(toback:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *bt=[[UIBarButtonItem alloc]initWithCustomView:btn];
    
    self.navigationItem.leftBarButtonItem=bt;
}







- (void)toback:(id)sender {
    
    EditImageViewController *editView=[self.navigationController.viewControllers objectAtIndex:2];
   // [editView viewDidLoad];
   // editView.eimage=self.imageView.image;
    [self.navigationController popToViewController:editView animated:YES];
    
}

- (UIImage *)saveImage:(UIView *)view
{
    CGRect mainRect = [[UIScreen mainScreen] bounds];
    //UIGraphicsBeginImageContext(mainRect.size);
    UIGraphicsBeginImageContext(CGSizeMake(mainRect.size.width, mainRect.size.height/2+40));
    CGContextRef context = UIGraphicsGetCurrentContext();
    [[UIColor blackColor] set];
    
    CGContextFillRect(context, mainRect);
    //CGContextFillRect(context, CGRectMake(0, 0, mainRect.size.width, mainRect.size.height/2));
    [view.layer renderInContext:context];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return newImage;
}

#pragma mark - 保存图片至沙盒
- (void) saveImageIn:(UIImage *)currentImage withName:(NSString *)imageName
{
    
    NSData *imageData = UIImageJPEGRepresentation(currentImage, 0.5);
    // 获取沙盒目录
    
    NSString *fullPath = [[NSHomeDirectory() stringByAppendingPathComponent:@"Documents"] stringByAppendingPathComponent:imageName];
    
    // 将图片写入文件
    
    [imageData writeToFile:fullPath atomically:NO];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)the1:(id)sender {
    MovableImageView *iv = [[MovableImageView alloc] initWithImage:[UIImage imageNamed:@"1.png"]];
    [iv setUserInteractionEnabled:YES];
    [self.view addSubview:iv];
    self.the1show.hidden=true;
    
}

- (IBAction)the2:(id)sender {
    MovableImageView *iv = [[MovableImageView alloc] initWithImage:[UIImage imageNamed:@"2.png"]];
    [iv setUserInteractionEnabled:YES];
    [self.view addSubview:iv];
    self.the2show.hidden=true;
}

- (IBAction)the3:(id)sender {
    MovableImageView *iv = [[MovableImageView alloc] initWithImage:[UIImage imageNamed:@"3.png"]];
    [iv setUserInteractionEnabled:YES];
    [self.view addSubview:iv];
    self.the3show.hidden=true;
}

- (IBAction)the4:(id)sender {
    MovableImageView *iv = [[MovableImageView alloc] initWithImage:[UIImage imageNamed:@"4.png"]];
    [iv setUserInteractionEnabled:YES];
    [self.view addSubview:iv];
    self.the4show.hidden=true;
}

- (IBAction)the5:(id)sender {
    MovableImageView *iv = [[MovableImageView alloc] initWithImage:[UIImage imageNamed:@"5.png"]];
    [iv setUserInteractionEnabled:YES];
    [self.view addSubview:iv];
    self.the5show.hidden=true;
}

- (IBAction)the6:(id)sender {
    MovableImageView *iv = [[MovableImageView alloc] initWithImage:[UIImage imageNamed:@"6.png"]];
    [iv setUserInteractionEnabled:YES];
    [self.view addSubview:iv];
    self.the6show.hidden=true;
}

- (IBAction)the7:(id)sender {
    MovableImageView *iv = [[MovableImageView alloc] initWithImage:[UIImage imageNamed:@"7.png"]];
    [iv setUserInteractionEnabled:YES];
    [self.view addSubview:iv];
    self.the7show.hidden=true;
}

- (IBAction)the8:(id)sender {
    MovableImageView *iv = [[MovableImageView alloc] initWithImage:[UIImage imageNamed:@"8.png"]];
    [iv setUserInteractionEnabled:YES];
    [self.view addSubview:iv];
    self.the8show.hidden=true;
}

- (IBAction)btok:(id)sender {

    UIImage *img=[self saveImage:self.view];
    [self saveImageIn:img withName:@"image1.png"];//图片保存到沙盒
    EditImageViewController *editView=[self.navigationController.viewControllers objectAtIndex:2];
   
    editView.eimage=img;
    editView.rec=1;
     [editView viewDidLoad];
    [self.navigationController popToViewController:editView animated:YES];
    
}
@end
