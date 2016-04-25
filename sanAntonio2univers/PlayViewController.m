//
//  PlayViewController.m
//  sanAntonio2univers
//
//  Created by USAA on 10/16/15.
//  Copyright © 2015 KhayG. All rights reserved.
//

#import "PlayViewController.h"
#import "QuizViewController.h"

@interface PlayViewController ()

@end

@implementation PlayViewController
{
    NSArray *levelsArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    levelsArray = [NSArray arrayWithObjects:@"San Antonio I", @"Texas II", @"USA III", @"North America IV", @"World V", @"Solar System VI", @"Universe VII", nil];
    
    self.levelsTableView.contentInset = UIEdgeInsetsMake(-35, 0, 0, 0);
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.levelsTableView reloadData]; // to reload selected cell
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)backButton:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion: nil];
}

#pragma mark - TableView Methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
{
    return [levelsArray count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 56.25;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    static NSString *levelTableIdentifier = @"LevelTableCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:levelTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:levelTableIdentifier];
    }
    
    cell.textLabel.text = [levelsArray objectAtIndex:indexPath.row];
    cell.textLabel.textAlignment = NSTextAlignmentCenter;
    
    [self displayFor:cell atIndexPath:indexPath];
    
    return cell;
}

- displayFor:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    
//    if (<#condition#>) {
//        <#statements#>
//    } else {
//        cell.userInteractionEnabled = NO;
//        cell.selectionStyle = UITableViewCellSelectionStyleNone;
//    }
    
//    cell.backgroundColor = [UIColor grayColor];
//    cell.userInteractionEnabled = NO;
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section;
{
    return 0;
}

#pragma mark - Quiz View

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"questionSB"]) {
        NSIndexPath *indexPath = [self.levelsTableView indexPathForSelectedRow];
        QuizViewController *quizViewController = [[QuizViewController alloc] init];
        quizViewController = segue.destinationViewController;
        quizViewController.titleName = [levelsArray objectAtIndex:indexPath.row];

        NSLog(@"Title Label: %@", quizViewController.titleName);
    }
}

@end
