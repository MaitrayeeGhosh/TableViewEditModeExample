//
//  ViewController.h
//  TableViewEditModeExample
//
//  Created by Maitrayee Ghosh on 20/01/16.
//  Copyright © 2016 Maitrayee Ghosh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
{
    NSMutableArray *dataArray;
}

@property (weak, nonatomic) IBOutlet UITableView *mTableView;
- (IBAction)didTapDeleteBtn:(id)sender;

@end

