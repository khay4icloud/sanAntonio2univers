//
//  StarsViewController.h
//  sanAntonio2univers
//
//  Created by StMarys on 10/16/15.
//  Copyright © 2015 Shiva Narsimha Pulluri All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StarsViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
{
    int level_starCount;
    int count;
}

@property (strong, nonatomic) IBOutlet UITableView *starsTableView;

- (IBAction)dismissButton:(id)sender;




@end
