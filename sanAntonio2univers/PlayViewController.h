//
//  PlayViewController.h
//  sanAntonio2univers
//
//  Created by Stmarys on 10/16/15.
//  Copyright © 2015 Shiva Narsimha Pulluri All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PlayViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
{
    
}

@property (strong, nonatomic) IBOutlet UITableView *levelsTableView;

- (IBAction)backButton:(id)sender;

@end
