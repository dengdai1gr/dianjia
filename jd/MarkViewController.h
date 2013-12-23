//
//  MarkViewController.h
//  jd
//
//  Created by CR on 13-12-22.
//  Copyright (c) 2013年 CR. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface MarkViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic)UIImage *image;
@property bool selectingImage;
@property (nonatomic, strong) UIImage *editImage;

- (IBAction)the1:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *the1show;
@property (strong, nonatomic) IBOutlet UIButton *the2show;
@property (strong, nonatomic) IBOutlet UIButton *the3show;
@property (strong, nonatomic) IBOutlet UIButton *the4show;
@property (strong, nonatomic) IBOutlet UIButton *the5show;
@property (strong, nonatomic) IBOutlet UIButton *the6show;
@property (strong, nonatomic) IBOutlet UIButton *the7show;
@property (strong, nonatomic) IBOutlet UIButton *the8show;
- (IBAction)the2:(id)sender;
- (IBAction)the3:(id)sender;
- (IBAction)the4:(id)sender;
- (IBAction)the5:(id)sender;
- (IBAction)the6:(id)sender;
- (IBAction)the7:(id)sender;
- (IBAction)the8:(id)sender;
- (IBAction)btok:(id)sender;

@end
