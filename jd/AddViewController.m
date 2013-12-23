//
//  AddViewController.m
//  jd
//
//  Created by CR on 13-12-10.
//  Copyright (c) 2013年 CR. All rights reserved.
//

#import "AddViewController.h"
#import "DetailViewController.h"
#import "EditImageViewController.h"

@interface AddViewController ()

@end

@implementation AddViewController
@synthesize popovercontroller ,scrollView;
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
    
    //添加图片点击事件
    self.imageView.userInteractionEnabled=YES;
    //单指单击
    UITapGestureRecognizer *singleFingerOne=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(fingerIncident:)];
    singleFingerOne.numberOfTouchesRequired=1;
    singleFingerOne.numberOfTapsRequired=1;
    //singleFingerOne.delegate=self;
    [self.imageView addGestureRecognizer:singleFingerOne];
    
    
    NSString *fullPath = [[NSHomeDirectory() stringByAppendingPathComponent:@"Documents"] stringByAppendingPathComponent:@"image1.png"];
     UIImage *savedImage = [[UIImage alloc] initWithContentsOfFile:fullPath];
     if (savedImage!=nil) {
     NSLog(@"havedoc");
         self.imageView.image=savedImage;
     }
     else
     {
     NSLog(@"nulldoc");
     }
    
 
    //从NSUserDefaults
    NSUserDefaults *us=[NSUserDefaults standardUserDefaults];
    self.wwid.text=[us stringForKey:@"saveid"];
    self.wwname.text=[us stringForKey:@"savename"];
    
    scrollView.contentSize=CGSizeMake(400, 600);

    
}

//手指点击事件
-(void)fingerIncident:(UITapGestureRecognizer *)sender
{
    if (sender.numberOfTapsRequired==1) {
        //NSLog(@"点击");
        UIImage *imagebg=[UIImage imageNamed:@"bt_addimage.png"];

        if([self.imageView.image isEqual:imagebg]){
            [self chooseImage];
        }
        else
        {
            //NSLog(@"have");
            UIActionSheet *sheet;
            sheet  = [[UIActionSheet alloc] initWithTitle:@"选择" delegate:self cancelButtonTitle:nil destructiveButtonTitle:@"取消" otherButtonTitles:@"预览",@"更换图片",@"编辑",@"清除图片", nil];
            sheet.tag = 256;
            [sheet showInView:self.view];
        }
    }
    
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([[segue identifier]isEqualToString:@"showimg"])
    {
        DetailViewController *detailViewController=[segue destinationViewController];
        detailViewController.image=self.imageView.image;
        
    }
    if([[segue identifier]isEqualToString:@"editimg"])
    {
        EditImageViewController *editViewController=[segue destinationViewController];
        editViewController.eimage=self.imageView.image;
    }
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)viewWillDisappear:(BOOL)animated //切换到其他页面前调用
{
    NSUserDefaults *ud=[NSUserDefaults standardUserDefaults];//userDefaulets 存储类
    [ud setObject:self.wwid.text forKey:@"saveid"];
    [ud setObject:self.wwname.text forKey:@"savename"];
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


#pragma mark - image picker delegte
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
	[picker dismissViewControllerAnimated:YES completion:^{}];
    
    UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
    
    
    //new add //切忌不可直接使用originImage，因为这是没有经过格式化的图片数据，可能会导致选择的图片颠倒或是失真等现象的发生，从UIImagePickerControllerOriginalImage中的Origin可以看出，
    NSString *mediaType = [info objectForKey:UIImagePickerControllerMediaType];
    NSData *data;
    if ([mediaType isEqualToString:@"public.image"])
    {
        //图片压缩，因为原图都是很大的，不必要传原图
        UIImage *scaleImage = [self scaleImage:image toScale:0.5];
        
        //以下这两步都是比较耗时的操作，最好开一个HUD提示用户，这样体验会好些，不至于阻塞界面
        if (UIImagePNGRepresentation(scaleImage) == nil) {
            //将图片转换为JPG格式的二进制数据
            data = UIImageJPEGRepresentation(scaleImage, 1);
        } else {
            //将图片转换为PNG格式的二进制数据
            data = UIImagePNGRepresentation(scaleImage);
        }
        
        //将二进制数据生成UIImage
        UIImage *newimage = [UIImage imageWithData:data];
        image=newimage;
    }
    
    
    
    [self saveImage:image withName:@"currentImage.png"];
    
    NSString *fullPath = [[NSHomeDirectory() stringByAppendingPathComponent:@"Documents"] stringByAppendingPathComponent:@"currentImage.png"];
    
    UIImage *savedImage = [[UIImage alloc] initWithContentsOfFile:fullPath];

    [self.imageView setImage:savedImage];
    
    self.imageView.tag = 100;
    
}
#pragma mark- 缩放图片
-(UIImage *)scaleImage:(UIImage *)image toScale:(float)scaleSize
{
    UIGraphicsBeginImageContext(CGSizeMake(image.size.width*scaleSize,image.size.height*scaleSize));
    [image drawInRect:CGRectMake(0, 0, image.size.width * scaleSize, image.size.height *scaleSize)];
    UIImage *scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return scaledImage;
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
	[self dismissViewControllerAnimated:YES completion:^{}];
}



#pragma mark - actionsheet delegate
-(void) actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (actionSheet.tag == 255) {
        
        NSUInteger sourceType = 0;
        
        // 判断是否支持相机
        if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
            
            switch (buttonIndex) {
                case 0:
                    // 取消
                    return;
                case 1:
                    // 相机
                    sourceType = UIImagePickerControllerSourceTypeCamera;
                    break;
                    
                case 2:
                    // 相册
                    sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
                    break;
            }
        }
        else {
            if (buttonIndex == 0) {
                
                return;
            }
            else if(buttonIndex!=1 && buttonIndex!=2)
            {
                return;
            }
            else
            {
                sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
            }
        }
        // 跳转到相机或相册页面
        UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
        
        imagePickerController.delegate = self;
        
        imagePickerController.allowsEditing = NO;
        
        imagePickerController.sourceType = sourceType;
         //  [self presentViewController:imagePickerController animated:YES completion:^{}];
        
        if (sourceType==1) {//直接使用相机 全屏拍照
            imagePickerController.modalPresentationStyle=UIModalPresentationFullScreen;
            [self presentViewController:imagePickerController animated:YES completion:nil];
        }
        else{
        
        
        //if ipad need this
        UIPopoverController *poppver=[[UIPopoverController alloc]initWithContentViewController:imagePickerController];
        self.popovercontroller =poppver;
        [popovercontroller presentPopoverFromRect:CGRectMake(60, 793, 300, 300) inView:self.view permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
        }
        
    }
    
    if (actionSheet.tag==256) {
        
        switch (buttonIndex) {
            case 0:
                //concel
                //NSLog(@"cancel");
                return;
            case 1:
                //NSLog(@"view");
                [self performSegueWithIdentifier:@"showimg" sender:self];
                break;
            case 2:
                // NSLog(@"chooseimage");
                [self chooseImage];
                break;
            case 3:
                 //NSLog(@"edit");
                [self performSegueWithIdentifier:@"editimg" sender:self];
                break;
            case 4:
                // NSLog(@"set null");
                self.imageView.image=[UIImage imageNamed:@"bt_addimage.png"];
                //这里 需要删除沙盒中文件代码
                NSString *fullPath = [[NSHomeDirectory() stringByAppendingPathComponent:@"Documents"] stringByAppendingPathComponent:@"image1.png"];
                UIImage *savedImage = [[UIImage alloc] initWithContentsOfFile:fullPath];
                if (savedImage!=nil)
                {
                    NSFileManager *fileManager=[NSFileManager defaultManager];
                    [fileManager removeItemAtPath:fullPath error:nil];
                }
                [self viewDidLoad];
                break;

        }
    }
    
    
    
}
//-(IBAction)chooseImage:(id)sender(
- (void)chooseImage{
    
    UIActionSheet *sheet;
    
    // 判断是否支持相机
    if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
    {
        sheet  = [[UIActionSheet alloc] initWithTitle:@"选择" delegate:self cancelButtonTitle:nil destructiveButtonTitle:@"取消" otherButtonTitles:@"拍照",@"从相册选择", nil];
    }
    else {
        
        sheet = [[UIActionSheet alloc] initWithTitle:@"选择" delegate:self cancelButtonTitle:nil destructiveButtonTitle:@"取消" otherButtonTitles:@"从相册选择", nil];
    }
    
    sheet.tag = 255;
    
    [sheet showInView:self.view];
    
}



@end
