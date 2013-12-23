//
//  AddViewController.h
//  jd
//
//  Created by CR on 13-12-10.
//  Copyright (c) 2013年 CR. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddViewController : UIViewController<UIActionSheetDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate ,UIScrollViewDelegate>
{
    UIScrollView *scrollView;
}
//-(IBAction)chooseImage :(id)sender;
@property(retain, nonatomic) IBOutlet UIImageView *imageView;
//@property(retain, nonatomic) UIImage *recimage; //接受图片 从其他viewcontroller
@property (retain,nonatomic) UIPopoverController *popovercontroller;
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;


@property (strong, nonatomic) IBOutlet UITextField *wwid;
@property (strong, nonatomic) IBOutlet UITextField *wwname;






@end
