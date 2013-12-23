//
//  DetailViewController.m
//  jd
//
//  Created by Chen Rui on 12/13/13.
//  Copyright (c) 2013 CR. All rights reserved.
//

#import "DetailViewController.h"
#import "ListCollectionViewController.h"
@interface DetailViewController ()

@end

@implementation DetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

/*
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.imageView.image=self.image;
}*/




- (void)viewDidLoad
{
    [super viewDidLoad];
    
	// Do any additional setup after loading the view.
    CGFloat imagex=(self.image.size.width > self.view.frame.size.width) ? self.view.frame.size.width:self.image.size.width;
    CGFloat imagey=(self.image.size.height > self.view.frame.size.height) ? self.view.frame.size.height : self.image.size.height;
    CGFloat origin;
    if (self.image.size.width>self.view.frame.size.width) {
        origin=self.view.frame.size.width/self.image.size.width;
        imagey=self.image.size.height*origin;
    
    imageView=[[UIImageView alloc]initWithFrame:CGRectMake((self.view.frame.size.width-imagex)/2, (self.view.frame.size.height-imagey)/2, imagex, imagey)];
    imageView.image=self.image;
    }
    else
    {
         imageView =[[UIImageView alloc]initWithImage:self.image];
    }

    
   
    //[imageView setAutoresizingMask:(UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth)];
    [self.view addSubview:imageView];
    [self.scrollView addSubview:imageView];
    //[self.scrollView setContentSize:CGSizeMake(imageView.bounds.size.width,imageView.bounds.size.height+200)];
    [self.scrollView setContentSize:imageView.bounds.size];
    [self.scrollView setMaximumZoomScale:1.5];
    [self.scrollView setMinimumZoomScale:0.75];
    
    [self scrollViewDidZoom:self.scrollView];
    
    
}

#pragma mark - UIScrollViewDelegate

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return imageView;
}
-(void)scrollViewDidZoom:(UIScrollView *)scrollView
{
    CGFloat offsetX = (scrollView.bounds.size.width > scrollView.contentSize.width)?(scrollView.bounds.size.width - scrollView.contentSize.width)/2 : 0.0;
    CGFloat offsetY = (scrollView.bounds.size.height > scrollView.contentSize.height)?(scrollView.bounds.size.height - scrollView.contentSize.height)/2 : 0.0;
     imageView.center = CGPointMake(scrollView.contentSize.width/2 + offsetX,scrollView.contentSize.height/2 + offsetY);
}

- (void)scrollViewDidEndZooming:(UIScrollView *)scrollView withView:(UIView *)view atScale:(float)scale
{
    [scrollView setZoomScale:scale animated:NO];
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
