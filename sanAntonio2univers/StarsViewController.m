//
//  StarsViewController.m
//  sanAntonio2univers
//
//  Created by USAA on 10/16/15.
//  Copyright © 2015 KhayG. All rights reserved.
//

#import "StarsViewController.h"
#import "starsTableCell.h"

@interface StarsViewController ()

@end

@implementation StarsViewController
{
    NSArray *levelsArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    levelsArray = [NSArray arrayWithObjects:@"Level I", @"Level II", @"Level III", @"Level IV", @"Level V", @"Level VI", @"Level VII", nil];
    
    self.starsTableView.contentInset = UIEdgeInsetsMake(-35, 0, 0, 0);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)dismissButton:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion: nil];
}

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
//    static NSString *levelTableIdentifier = @"starsTableCell";
//    
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:levelTableIdentifier];
//    
//    if (cell == nil) {
//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:levelTableIdentifier];
//    }
//    
//    cell.textLabel.text = [levelsArray objectAtIndex:indexPath.row];
//    cell.imageView.image = [UIImage imageNamed:@"noStar.png"];
//    
//    [self displayFor:cell atIndexPath:indexPath];
//    
//    return cell;
    
    
    static NSString *starsTableIdentifier = @"starsTableCell";
    
    starsTableCell *cell = (starsTableCell *)[tableView dequeueReusableCellWithIdentifier:starsTableIdentifier];
    if (cell == nil)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"starsTableCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    
    cell.levelNum.text = [levelsArray objectAtIndex:indexPath.row];
    NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];

    switch (indexPath.row) {
        case 0:
        {
            level_starCount = [defaults integerForKey:@"LEVEL0"];
        }
            break;
            
        case 1:
        {
            level_starCount = [defaults integerForKey:@"LEVEL1"];
        }
            break;
            
        case 2:
        {
            level_starCount = [defaults integerForKey:@"LEVEL2"];
        }
            break;
            
        case 3:
        {
            level_starCount = [defaults integerForKey:@"LEVEL3"];
        }
            break;
            
        case 4:
        {
            level_starCount = [defaults integerForKey:@"LEVEL4"];
        }
            break;
            
        case 5:
        {
            level_starCount = [defaults integerForKey:@"LEVEL5"];
        }
            break;
            
        case 6:
        {
            level_starCount = [defaults integerForKey:@"LEVEL6"];
        }
            break;
            
        default:
            break;
    }
    
    cell.star1ImageView.image = [self starsForLevel:indexPath];
    cell.star2ImageView.image = [self starsForLevel:indexPath];
    cell.star3ImageView.image = [self starsForLevel:indexPath];
    cell.star4ImageView.image = [self starsForLevel:indexPath];
    cell.star5ImageView.image = [self starsForLevel:indexPath];
    
    count = 0;
    
    return cell;
}

- (UIImage *)starsForLevel:(NSIndexPath *)indexPath {
    
    UIImage *starImage;
    
    if (count<level_starCount) {
        count+=1;
        
        starImage = [UIImage imageNamed:@"yesStarSmall.png"];
        
    } else {
        
        starImage = [UIImage imageNamed:@"noStar.png"];
    }
    
    return starImage;
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

@end
