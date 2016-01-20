//
//  ViewController.m
//  TableViewEditModeExample
//
//  Created by Maitrayee Ghosh on 20/01/16.
//  Copyright © 2016 Maitrayee Ghosh. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    dataArray=[[NSMutableArray alloc]init];
    [dataArray addObject:@"Apple"];
    [dataArray addObject:@"Mango"];
    [dataArray addObject:@"Papaya"];
    [dataArray addObject:@"Guava"];
    [dataArray addObject:@"Pineapple"];
    [dataArray addObject:@"Strawberry"];
    [dataArray addObject:@"Banana"];
    
    self.mTableView.delegate=self;
    self.mTableView.dataSource=self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableView DataSource Methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [dataArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    cell.textLabel.text = [dataArray objectAtIndex:indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ( editingStyle== UITableViewCellEditingStyleDelete) {
        
        [dataArray removeObjectAtIndex:indexPath.row];
        [self.mTableView deleteRowsAtIndexPaths:[NSMutableArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
        [_mTableView setEditing:NO animated:YES];
    }
}

#pragma mark - UITableView Delegate Methods

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewCellEditingStyleDelete;
}


#pragma mark - Delete Button Action

- (IBAction)didTapDeleteBtn:(id)sender {
    
     [_mTableView setEditing:YES animated:YES];
}
@end
