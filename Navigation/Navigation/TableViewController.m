//
//  TableViewController.m
//  Navigation
//
//  Created by Vivian Chiodo Dias on 18/03/15.
//  Copyright (c) 2015 Vinicius Miana. All rights reserved.
//

#import "TableViewController.h"
#import "SingletonView.h"

@interface TableViewController ()

@end

@implementation TableViewController
    SingletonView *sv;
@synthesize tableView;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    sv = [SingletonView instance];
    
//    tableView = [UITableView alloc] initWithFrame:[CGRectMake(self., <#CGFloat y#>, <#CGFloat width#>, <#CGFloat height#>)]
    
    tableView.delegate = self;
    tableView.dataSource = self;
//    [self.view addSubview:tableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return [sv.palavras count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"palavra"];
    
    long row = indexPath.row;
    
    [cell.textLabel setText:[NSString stringWithFormat:@"%c",[[sv.palavras objectAtIndex:row] characterAtIndex:0]]];
    [cell.detailTextLabel setText: [sv.palavras objectAtIndex:row]];
//    [cell.imageView setImage:[UIImage imageNamed:[sv.imagens objectAtIndex:row]]];
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
