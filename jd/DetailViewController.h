//
//  DetailViewController.h
//  jd
//
//  Created by Chen Rui on 12/13/13.
//  Copyright (c) 2013 CR. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController <UIScrollViewDelegate>
{
    UIImageView *imageView;
}
//@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;

@property (strong, nonatomic)UIImage *image;
@end
