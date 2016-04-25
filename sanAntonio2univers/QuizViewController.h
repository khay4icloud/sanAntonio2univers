//
//  QuizViewController.h
//  sanAntonio2univers
//
//  Created by USAA on 11/5/15.
//  Copyright © 2015 KhayG. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QuizViewController : UIViewController {
    
    int qCount;
    int aCount;
    int levelCount;
    int starsCount;
}

@property (nonatomic, strong) NSString *titleName;
@property (nonatomic, strong) NSMutableArray *curruntLevelArray;
@property (nonatomic, strong) NSMutableDictionary *currentQuestion;

@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet UITextView *questionTextView;

@property (strong, nonatomic) IBOutlet UIButton *option1Button;
- (IBAction)option1Action:(id)sender;

@property (strong, nonatomic) IBOutlet UIButton *option2Button;
- (IBAction)option2Action:(id)sender;

@property (strong, nonatomic) IBOutlet UIButton *option3Button;
- (IBAction)option3Action:(id)sender;

@property (strong, nonatomic) IBOutlet UIButton *option4Button;
- (IBAction)option4Action:(id)sender;

- (IBAction)mainMenuAction:(id)sender;
- (IBAction)nextQAction:(id)sender;

@property (strong, nonatomic) IBOutlet UIButton *star1Outlet;
@property (strong, nonatomic) IBOutlet UIButton *star2Outlet;
@property (strong, nonatomic) IBOutlet UIButton *star3Outlet;
@property (strong, nonatomic) IBOutlet UIButton *star4Outlet;
@property (strong, nonatomic) IBOutlet UIButton *star5Outlet;

@property (strong, nonatomic) IBOutlet UIButton *nextQButton;

@end
