//
//  starsTableCell.m
//  sanAntonio2univers
//
//  Created by USAA on 1/27/16.
//  Copyright © 2016 KhayG. All rights reserved.
//

#import "starsTableCell.h"

@implementation starsTableCell

@synthesize levelNum = _levelNum;
@synthesize star1ImageView = _star1ImageView;
@synthesize star2ImageView = _star2ImageView;
@synthesize star3ImageView = _star3ImageView;
@synthesize star4ImageView = _star4ImageView;
@synthesize star5ImageView = _star5ImageView;


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
