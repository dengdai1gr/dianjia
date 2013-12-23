//
//  DJViewController.h
//  jd
//
//  Created by CR on 13-12-9.
//  Copyright (c) 2013年 CR. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DJViewController : UIViewController <UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)IBOutlet UITableView *tableView;
-(void)backHome:(id)sender;
@end
