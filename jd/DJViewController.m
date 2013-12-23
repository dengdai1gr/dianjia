//
//  DJViewController.m
//  jd
//
//  Created by CR on 13-12-9.
//  Copyright (c) 2013年 CR. All rights reserved.
//

#import "DJViewController.h"
//#import "RecipeDetailViewController.h"
#import "ListCollectionViewController.h"
@interface DJViewController ()

@end

@implementation DJViewController
{
    NSArray *recipes;
}
@synthesize tableView;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    recipes=[NSArray arrayWithObjects:@"佛像展",@"近代文物展",@"ccc",@"ddd",@"eee",@"fff",@"ggg",@"hhh",@"qqq",@"www",@"rrr",@"ttt", nil];
    
    [[UINavigationBar appearance] setBackgroundImage:[UIImage imageNamed:@"navb.png"] forBarMetrics:UIBarMetricsDefault];
    //[[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
   // [[UIBarButtonItem appearanceWhenContainedIn:[UINavigationBar class], nil] setTintColor:[UIColor colorWithRed:0.36 green:0.64 blue:0.36 alpha:1]];
   
    //添加 首页 按钮
    //UIBarButtonItem *bt=[[UIBarButtonItem alloc]initWithTitle:@"首页" style:UIBarButtonItemStylePlain target:self action:@selector(backHome:)];
     //UIBarButtonItem *bt=[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"bt_back.png"] style:UIBarButtonItemStylePlain target:self action:@selector(backHome:)];
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    //添加 首页 按钮
    UIButton *btn=[[UIButton alloc]initWithFrame:CGRectMake(40, 0,149,35)];
    [btn setBackgroundImage:[UIImage imageNamed:@"bt_backbt.png"] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(backHome:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *bt=[[UIBarButtonItem alloc]initWithCustomView:btn];
    
    self.navigationItem.leftBarButtonItem=bt;
   
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [recipes count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier=@"RecipeCell";
    UITableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if(cell==nil)
    {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    tableView.backgroundColor=[UIColor clearColor];
   // [tableView setBackgroundView:[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"navbg.png"]]];
    
    cell.textLabel.text=[recipes objectAtIndex:indexPath.row];
    cell.backgroundColor=[UIColor clearColor];
    return  cell;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"showRecipeDetail"])
    {
        NSIndexPath *indexPath =[self.tableView indexPathForSelectedRow];
        //RecipeDetailViewController *destViewController=segue.destinationViewController;
        //destViewController.recipeName=[recipes objectAtIndex:indexPath.row];
        
        ListCollectionViewController *destViewController=segue.destinationViewController;
        destViewController.recipeNameas=[recipes objectAtIndex:indexPath.row];
        
    }
    
}

-(void)backHome:(id)sender
{
    [self performSegueWithIdentifier:@"backhome" sender:self];
}


















- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
