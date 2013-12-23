//
//  EditImageViewController.m
//  jd
//
//  Created by CR on 13-12-14.
//  Copyright (c) 2013年 CR. All rights reserved.
//

#import "EditImageViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "ImageCropperView.h"
#import "AddViewController.h"
#import "MovableImageView.h"

@interface EditImageViewController ()

@property (nonatomic,retain) IBOutlet ImageCropperView *cropper;
@property (nonatomic, retain)IBOutlet UIImageView *result;

@end

@implementation EditImageViewController
@synthesize cropper,result ,rec;
@synthesize editImage=_editImage;
@synthesize selectingImage=_selectingImage;

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
    
    cropper.layer.borderWidth=1.0;
    cropper.layer.borderColor=[UIColor whiteColor].CGColor;
    [cropper setup];

    if (self.eimage.size.width<300||self.eimage.size.height<300) {
        cropper.hidden=YES;
        result.image=self.eimage;
    }
    else
    {
        cropper.image=self.eimage;
        result.hidden=YES;
    }
    
    if(rec==1)
    {
        //[self goback];
    }
    self.the1show.hidden=true;
    self.the2show.hidden=true;
    self.the3show.hidden=true;
    self.the4show.hidden=true;
    self.the5show.hidden=true;
    self.the6show.hidden=true;
    self.the7show.hidden=true;
    self.the8show.hidden=true;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btcrop:(id)sender {
    
    [cropper finishCropping];
    result.image=cropper.croppedImage;
    cropper.hidden=YES;
    result.hidden=NO;
    //[self saveImage:result.image withName:@"image1.png"];//图片保存到沙盒
    self.the1show.hidden=true;
    self.the2show.hidden=true;
    self.the3show.hidden=true;
    self.the4show.hidden=true;
    self.the5show.hidden=true;
    self.the6show.hidden=true;
    self.the7show.hidden=true;
    self.the8show.hidden=true;
}

- (IBAction)btReset:(id)sender {
    
    [cropper reset];
    cropper.hidden=NO;
    result.hidden=YES;
    result.image=nil;
    self.the1show.hidden=true;
    self.the2show.hidden=true;
    self.the3show.hidden=true;
    self.the4show.hidden=true;
    self.the5show.hidden=true;
    self.the6show.hidden=true;
    self.the7show.hidden=true;
    self.the8show.hidden=true;
    
}

- (IBAction)btok:(id)sender {
    
    
    UIImage *img=[self saveMarkImage:self.view];
    result.hidden=NO;
    result.image=img;
    [self saveImage:result.image withName:@"image1.png"];//图片保存到沙盒
    AddViewController *addView=[self.navigationController.viewControllers objectAtIndex:1];
    [addView viewDidLoad];
    [self.navigationController popToViewController:addView animated:YES];
    
}
/*-(void)goback
{
    AddViewController *addView=[self.navigationController.viewControllers objectAtIndex:1];
    [addView viewDidLoad];
    [self.navigationController popToViewController:addView animated:YES];
}*/

- (IBAction)btmark:(id)sender {
    
    cropper.hidden=true;
    result.hidden=false;
    if (result.image==nil) {
        result.image=self.eimage;
    }
    //result.image=self.eimage;
    
    self.the1show.hidden=false;
    self.the2show.hidden=false;
    self.the3show.hidden=false;
    self.the4show.hidden=false;
    self.the5show.hidden=false;
    self.the6show.hidden=false;
    self.the7show.hidden=false;
    self.the8show.hidden=false;
}


- (UIImage *)saveMarkImage:(UIView *)view
{
    CGRect mainRect = [[UIScreen mainScreen] bounds];
    //UIGraphicsBeginImageContext(mainRect.size);
    UIGraphicsBeginImageContext(CGSizeMake(mainRect.size.width, mainRect.size.height/2+36));
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
- (void) saveImage:(UIImage *)currentImage withName:(NSString *)imageName
{
    
    NSData *imageData = UIImageJPEGRepresentation(currentImage, 0.5);
    // 获取沙盒目录
    
    NSString *fullPath = [[NSHomeDirectory() stringByAppendingPathComponent:@"Documents"] stringByAppendingPathComponent:imageName];
    
    // 将图片写入文件
    
    [imageData writeToFile:fullPath atomically:NO];
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

@end
