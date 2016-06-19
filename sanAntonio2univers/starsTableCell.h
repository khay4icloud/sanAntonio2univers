//
//  starsTableCell.h
//  sanAntonio2univers
//
//  Created by StMarys on 1/27/16.
//  Copyright © 2016 Shiva Narsimha Pulluri All rights reserved.
//

#import <UIKit/UIKit.h>

@interface starsTableCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UILabel * levelNum;
@property (nonatomic, weak) IBOutlet UIImageView *star1ImageView;
@property (nonatomic, weak) IBOutlet UIImageView *star2ImageView;
@property (nonatomic, weak) IBOutlet UIImageView *star3ImageView;
@property (nonatomic, weak) IBOutlet UIImageView *star4ImageView;
@property (nonatomic, weak) IBOutlet UIImageView *star5ImageView;

@end
