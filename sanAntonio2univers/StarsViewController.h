//
//  StarsViewController.h
//  sanAntonio2univers
//
//  Created by USAA on 10/16/15.
//  Copyright © 2015 KhayG. All rights reserved.
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
