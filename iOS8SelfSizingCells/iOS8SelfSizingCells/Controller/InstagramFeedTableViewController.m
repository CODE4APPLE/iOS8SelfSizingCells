//
//  InstagramFeedTableViewController.m
//  iOS8SelfSizingCells
//
//  Created by dw_iOS on 14-10-22.
//  Copyright (c) 2014年 广州华多网络科技有限公司 多玩事业部 iOS软件工程师 曾宪华. All rights reserved.
//

#import "InstagramFeedTableViewController.h"
#import "InstagramItem.h"
#import "InstagramFeedTableViewCell.h"

@interface InstagramFeedTableViewController ()

@property (nonatomic, strong) NSMutableArray *dataSource;

@end

@implementation InstagramFeedTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.estimatedRowHeight = 44.0;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    
    
    self.dataSource = [[InstagramItem newDataSource] mutableCopy];
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return self.dataSource.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    InstagramFeedTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"InstagramFeedTableViewCellCellIdentifider" forIndexPath:indexPath];
    
    // Configure the cell...
    cell.instagramItem = self.dataSource[indexPath.row];
    
    
    return cell;
}

#pragma mark - UITableView Delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (!self.navigationController) {
        
    }
    UIViewController *viewController = [[UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]] instantiateViewControllerWithIdentifier:@"InstagramFeedTableViewController"];
    
    [self.navigationController presentViewController:viewController animated:YES completion:NULL];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3. * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [viewController dismissViewControllerAnimated:YES completion:NULL];
    });
}

@end
