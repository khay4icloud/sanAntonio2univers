//
//  QuizViewController.m
//  sanAntonio2univers
//
//  Created by StMarys on 11/5/15.
//  Copyright © 2015 Shiva Narsimha Pulluri All rights reserved.
//

#import "QuizViewController.h"
#import "AppDelegate.h"



@interface QuizViewController ()

@property (nonatomic, strong) NSMutableArray *randomNumArray;

@end


@implementation QuizViewController

@synthesize curruntLevelArray;
@synthesize currentQuestion;


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setTitle];
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"Quiz" ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:filePath];
    NSArray *quizLevelData = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
    
    NSMutableArray *quizDataArray = [quizLevelData objectAtIndex:levelCount];
    
    self.curruntLevelArray = [[NSMutableArray alloc] init];
    self.curruntLevelArray = [quizDataArray valueForKey:@"data"];
    
    self.randomNumArray = [[NSMutableArray alloc] init];
    self.randomNumArray = [self getRandomInts:5 from:0 to:9];
    
    qCount = 0;
    aCount = 0;
    starsCount = 0;
    
    [self generateQuestion];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (void)generateQuestion {
    
    self.nextQButton.enabled = false;
    
    self.option1Button.enabled = true;
    self.option2Button.enabled = true;
    self.option3Button.enabled = true;
    self.option4Button.enabled = true;
    
    qCount = qCount +1;
    
    if (qCount > 5) {
        
        NSLog(@"qCount=%d",qCount);
        
        //Set final image for the level here
        
        
        
        //UIImage * spaceShipImg = [UIImage imageNamed: @"level 1.png"];
        UIImageView * myImageView;
        
        switch (levelCount) {
            case 0:
                myImageView = [[UIImageView alloc] initWithImage: [UIImage imageNamed: @"level 1.png"]];
                break;
            case 1:
                myImageView = [[UIImageView alloc] initWithImage: [UIImage imageNamed: @"Level 2.png"]];
                break;
            case 2:
                myImageView = [[UIImageView alloc] initWithImage: [UIImage imageNamed: @"level 3.png"]];
                break;
            case 3:
                myImageView = [[UIImageView alloc] initWithImage: [UIImage imageNamed: @"lavel 4.png"]];
                break;
            case 4:
                myImageView = [[UIImageView alloc] initWithImage: [UIImage imageNamed: @"level 5.png"]];
                break;
            case 5:
                myImageView = [[UIImageView alloc] initWithImage: [UIImage imageNamed: @"level 6.png"]];
                break;
            case 6:
                myImageView = [[UIImageView alloc] initWithImage: [UIImage imageNamed: @"level 7.png"]];
                break;
                
            default:
                break;
        }
        
        myImageView.frame = self.view.bounds;
        [self.view addSubview:myImageView];
        
        [NSTimer scheduledTimerWithTimeInterval:5.0
                                         target:self
                                       selector:@selector(dismissVC)
                                       userInfo:nil
                                        repeats:NO];
        
    } else {
        
        [self.option1Button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self.option2Button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self.option3Button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self.option4Button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
        int currentValue;
        currentValue = [(NSNumber *)[self.randomNumArray objectAtIndex:(qCount -1)] intValue];
        self.currentQuestion = [self.curruntLevelArray objectAtIndex:currentValue];
        
        self.questionTextView.text = [self.currentQuestion valueForKey:@"question"];
        
        [self.option1Button setTitle:[self.currentQuestion valueForKey:@"option1"] forState:UIControlStateNormal];
        [self.option2Button setTitle:[self.currentQuestion valueForKey:@"option2"] forState:UIControlStateNormal];
        [self.option3Button setTitle:[self.currentQuestion valueForKey:@"option3"] forState:UIControlStateNormal];
        [self.option4Button setTitle:[self.currentQuestion valueForKey:@"option4"] forState:UIControlStateNormal];
        
    }
}

-(void) dismissVC {
    [self dismissViewControllerAnimated:YES completion: nil];
}

-(NSMutableArray *)getRandomInts:(int)amount from:(int)fromInt to:(int)toInt {
    
    if ((toInt - fromInt) +1 < amount) {
        return nil;
    }
    
    NSMutableArray *uniqueNumbers = [[NSMutableArray alloc] init];
    int r;
    while ([uniqueNumbers count] < amount) {
        
        r = (arc4random() % toInt) + fromInt;
        if (![uniqueNumbers containsObject:[NSNumber numberWithInt:r]]) {
            [uniqueNumbers addObject:[NSNumber numberWithInt:r]];
        }
    }
    return uniqueNumbers;
}

- (IBAction)option1Action:(id)sender {
    
    if ([[self.currentQuestion valueForKey:@"answer"] isEqualToString:@"option1"]) {
        [self.option1Button setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
        [self rightAnswer];
    } else {
        [self.option1Button setBackgroundColor:[UIColor redColor]];
        [NSTimer scheduledTimerWithTimeInterval:2.0
                                         target:self
                                       selector:@selector(wrongAnswer)
                                       userInfo:nil
                                        repeats:NO];
    }
}

- (IBAction)option2Action:(id)sender {
    
    if ([[self.currentQuestion valueForKey:@"answer"] isEqualToString:@"option2"]) {
        [self.option2Button setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
        [self rightAnswer];
    } else {
        [self.option2Button setBackgroundColor:[UIColor redColor]];
        [NSTimer scheduledTimerWithTimeInterval:2.0
                                         target:self
                                       selector:@selector(wrongAnswer)
                                       userInfo:nil
                                        repeats:NO];
    }
}

- (IBAction)option3Action:(id)sender {
    
    if ([[self.currentQuestion valueForKey:@"answer"] isEqualToString:@"option3"]) {
        [self.option3Button setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
        [self rightAnswer];
    } else {
        [self.option3Button setBackgroundColor:[UIColor redColor]];
        [NSTimer scheduledTimerWithTimeInterval:2.0
                                         target:self
                                       selector:@selector(wrongAnswer)
                                       userInfo:nil
                                        repeats:NO];
    }
}

- (IBAction)option4Action:(id)sender {
    
    if ([[self.currentQuestion valueForKey:@"answer"] isEqualToString:@"option4"]) {
        [self.option4Button setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
        [self rightAnswer];
    } else {
        [self.option4Button setBackgroundColor:[UIColor redColor]];
        [NSTimer scheduledTimerWithTimeInterval:2.0
                                         target:self
                                       selector:@selector(wrongAnswer)
                                       userInfo:nil
                                        repeats:NO];
    }
}

- (IBAction)mainMenuAction:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion: nil];
    
}

- (IBAction)nextQAction:(id)sender {
    
    [self generateQuestion];
    
}

- (void) wrongAnswer {

    self.option1Button.enabled = false;
    self.option2Button.enabled = false;
    self.option3Button.enabled = false;
    self.option4Button.enabled = false;
    
}

- (void) rightAnswer {
    
    self.nextQButton.enabled = true;
    
    aCount = aCount + 100;
    
    if (aCount < 501 ) {
        UIButton *starBtn = (UIButton*)[self.view viewWithTag:aCount];
        
        [starBtn setImage:[UIImage imageNamed:@"yesStarSmall.png"] forState:UIControlStateNormal];
        
        NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];
        
        switch (levelCount) {
            case 0:
            {
                starsCount+=1;
                
                [defaults setInteger:starsCount forKey:@"LEVEL0"];
                [defaults synchronize];
            }
                break;
                
            case 1:
            {
                starsCount+=1;
                
                [defaults setInteger:starsCount forKey:@"LEVEL1"];
                [defaults synchronize];
            }
                break;
                
            case 2:
            {
                starsCount+=1;
                
                [defaults setInteger:starsCount forKey:@"LEVEL2"];
                [defaults synchronize];
            }
                break;
                
            case 3:
            {
                starsCount+=1;
                
                [defaults setInteger:starsCount forKey:@"LEVEL3"];
                [defaults synchronize];
            }
                break;
                
            case 4:
            {
                starsCount+=1;
                
                [defaults setInteger:starsCount forKey:@"LEVEL4"];
                [defaults synchronize];
            }
                break;
                
            case 5:
            {
                starsCount+=1;
                
                [defaults setInteger:starsCount forKey:@"LEVEL5"];
                [defaults synchronize];
            }
                break;
                
            case 6:
            {
                starsCount+=1;
                
                [defaults setInteger:starsCount forKey:@"LEVEL6"];
                [defaults synchronize];
            }
                break;
                
            default:
                break;
        }

        
    } else {
        NSLog(@"aCount= %d",aCount);
    }
    
}

- (void) setTitle {
    
       if ([self.titleName isEqualToString:@"San Antonio I"]) {
        self.titleLabel.text = @"Level I";
        levelCount = 0;
    } else if ([self.titleName isEqualToString:@"Texas II"]){
        self.titleLabel.text = @"Level II";
        levelCount = 1;
    }else if ([self.titleName isEqualToString:@"USA III"]){
        self.titleLabel.text = @"Level III";
        levelCount = 2;
    }else if ([self.titleName isEqualToString:@"North America IV"]){
        self.titleLabel.text = @"Level IV";
        levelCount = 3;
    }else if ([self.titleName isEqualToString:@"World V"]){
        self.titleLabel.text = @"Level V";
        levelCount = 4;
    }else if ([self.titleName isEqualToString:@"Solar System VI"]){
        self.titleLabel.text = @"Level VI";
        levelCount = 5;
    }else {
        self.titleLabel.text = @"Level VII";
        levelCount = 6;
    }
    
}

@end

//            self.texasInfo = [self.texasQInfoArray objectAtIndex:currentValue];
//
//            self.questionTextView.text = self.texasInfo.question;
//            [self.option1Button setTitle:self.texasInfo.option1 forState: UIControlStateNormal];
//            [self.option2Button setTitle:self.texasInfo.option2 forState: UIControlStateNormal];
//            [self.option3Button setTitle:self.texasInfo.option3 forState: UIControlStateNormal];
//            [self.option4Button setTitle:self.texasInfo.option4 forState: UIControlStateNormal];

//            self.sanAntonioInfo = [self.sanAntonioQInfoArray objectAtIndex:currentValue];
//
//            self.questionTextView.text = self.sanAntonioInfo.question;
//            [self.option1Button setTitle:self.sanAntonioInfo.option1 forState: UIControlStateNormal];
//            [self.option2Button setTitle:self.sanAntonioInfo.option2 forState: UIControlStateNormal];
//            [self.option3Button setTitle:self.sanAntonioInfo.option3 forState: UIControlStateNormal];
//            [self.option4Button setTitle:self.sanAntonioInfo.option4 forState: UIControlStateNormal];

//        NSInteger randomNumber = arc4random() % 9;

//- (void)generateQuestionWithArray:(NSArray *)quizInfoArray {
//
//    NSLog(@"The content of arry is%@",quizInfoArray);
//
//    qCount = qCount +1;
//
//    if (qCount > 5) {
//
//        NSLog(@"qCount=%d",qCount);
//
//        //Set final image for the level here
//
//        [self dismissViewControllerAnimated:YES completion: nil];
//
//    } else {
//
//        [self.option1Button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//        [self.option2Button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//        [self.option3Button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//        [self.option4Button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//
//        int currentValue;
//
//        currentValue = [(NSNumber *)[self.randomNumArray objectAtIndex:(qCount -1)] intValue];
//
//        {
//
//            self.sanAntonioInfo = [self.sanAntonioQInfoArray objectAtIndex:currentValue];
//
//            self.questionTextView.text = self.sanAntonioInfo.question;
//            [self.option1Button setTitle:self.sanAntonioInfo.option1 forState: UIControlStateNormal];
//            [self.option2Button setTitle:self.sanAntonioInfo.option2 forState: UIControlStateNormal];
//            [self.option3Button setTitle:self.sanAntonioInfo.option3 forState: UIControlStateNormal];
//            [self.option4Button setTitle:self.sanAntonioInfo.option4 forState: UIControlStateNormal];
//
//        }
//    }
//}