//
//  ViewController.m
//  sanAntonio2univers
//
//  Created by KhayG on 8/30/15.
//  Copyright © 2015 KhayG. All rights reserved.
//

#import "ViewController.h"
#import "PlayViewController.h"
#import "StarsViewController.h"
#import "HelpViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIImage *backgroundImage = [UIImage imageNamed:@"sanAntonio2universe.png"];
    UIImageView *backgroundImageView=[[UIImageView alloc]initWithFrame:self.view.frame];
    backgroundImageView.image=backgroundImage;
    [self.view insertSubview:backgroundImageView atIndex:0];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)playButton:(id)sender {
    
    PlayViewController *playViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"playVCStoryBoard"];
    [self presentViewController:playViewController animated:YES completion:nil];
}

- (IBAction)settingsButton:(id)sender {
    
}

- (IBAction)starsButton:(id)sender {
    
    StarsViewController *starsViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"starsVCStoryBoard"];
    [self presentViewController:starsViewController animated:YES completion:nil];
}

- (IBAction)helpButton:(id)sender {
    
    HelpViewController *helpViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"helpVCStoryBoard"];
    [self presentViewController:helpViewController animated:YES completion:nil];
}
@end
