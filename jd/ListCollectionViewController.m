//
//  ListCollectionViewController.m
//  jd
//
//  Created by CR on 13-12-12.
//  Copyright (c) 2013年 CR. All rights reserved.
//

#import "ListCollectionViewController.h"
#import "ListCollectionViewCell.h"
#import "DetailViewController.h"

@interface ListCollectionViewController ()

@end

@implementation ListCollectionViewController
@synthesize recipeNameas;

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
    
   // [[UINavigationBar appearance] setBackgroundImage:[UIImage imageNamed:@"firstgnl.png"] forBarMetrics:UIBarMetricsDefault];
    
    self.photoImages=[@[@"aaaa.jpg",@"aaaa.jpg",@"aaaa.jpg",@"aaaa.jpg",@"aaaa.jpg",@"aaaa.jpg",@"aaaa.jpg",@"aaaa.jpg",@"aaaa.jpg",@"aaaa.jpg",@"aaaa.jpg",@"aaaa.jpg"]mutableCopy];
    
 

}
//-(void) clickback:(id)sender
//{
//    NSLog(@"dd");
//}


#pragma mark -
#pragma mark UICollectionViewDataSource

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.photoImages.count;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ListCollectionViewCell *myCell =[collectionView dequeueReusableCellWithReuseIdentifier:@"photoCell" forIndexPath:indexPath];
    UIImage *image;
    int row =[indexPath row];
    image=[UIImage imageNamed:self.photoImages[row]];
    myCell.imageView.image=image;
    myCell.recipeLabel.text=self.recipeNameas;
    return myCell;
    
}



-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([[segue identifier]isEqualToString:@"ShowDetail"])
    {
        NSIndexPath *selectedIndexPath =[[self.collectionView indexPathsForSelectedItems]objectAtIndex:0];
        DetailViewController *detailViewController=[segue destinationViewController];
        detailViewController.image=[UIImage imageNamed:self.photoImages[selectedIndexPath.row]];

    }
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
