//
//  LPGViewController.m
//  Phonagotchi
//
//  Created by Steven Masuch on 2014-07-26.
//  Copyright (c) 2014 Lighthouse Labs. All rights reserved.
//

#import "LPGViewController.h"

@interface LPGViewController ()


@property (nonatomic) UIImageView *petImageView;


@end

@implementation LPGViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

   // Phonagotchi *cat = [[Phonagotchi alloc]init];
    
    
    
    
//Programatically initializing background picture as cat
    
    self.view.backgroundColor = [UIColor colorWithRed:(252.0/255.0) green:(240.0/255.0) blue:(228.0/255.0) alpha:1.0];
    
    self.petImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
    self.petImageView.translatesAutoresizingMaskIntoConstraints = NO;
    
    self.petImageView.image = [UIImage imageNamed:@"default"];
    
    [self.view addSubview:self.petImageView];
    
    [NSLayoutConstraint constraintWithItem:self.petImageView
                                  attribute:NSLayoutAttributeCenterX
                                  relatedBy:NSLayoutRelationEqual
                                     toItem:self.view
                                  attribute:NSLayoutAttributeCenterX
                                 multiplier:1.0
                                   constant:0.0].active = YES;
    
    [NSLayoutConstraint constraintWithItem:self.petImageView
                                  attribute:NSLayoutAttributeCenterY
                                  relatedBy:NSLayoutRelationEqual
                                     toItem:self.view
                                  attribute:NSLayoutAttributeCenterY
                                 multiplier:1.0
                                   constant:0.0].active = YES;
 
    
 
    UIPanGestureRecognizer *pan1 = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
    [self.view addGestureRecognizer:pan1];
    
    
//New view of basket and apple
    


    
    UIImageView *basket = [[UIImageView alloc] initWithFrame:CGRectMake(220, 470, 80, 80)];
 

    [self.view addSubview:basket];

    UIImageView *apple = [[UIImageView alloc] initWithFrame:CGRectMake(230, 460, 60, 60)];
    apple.image = [UIImage imageNamed:@"apple.png"];
    
    [self.view addSubview:apple];

//Adding pinch for apple
    
    
    UIPinchGestureRecognizer *pinch = [[UIPinchGestureRecognizer alloc]initWithTarget:self action:@selector(pin:)];
  
    [apple addGestureRecognizer:pinch];

}








// Methods


//Tickling car method
- (void)pan:(UIPanGestureRecognizer *)sender {
   
    CGFloat velocityX = [sender velocityInView:self.view].x;
    if (velocityX >= 300 ){
        self.petImageView.image = [UIImage imageNamed:@"grumpy.png"];
        
        
    }
    if (sender.state == UIGestureRecognizerStateEnded) {
        self.petImageView.image = [UIImage imageNamed:@"default"];
    }
    
}

//Pinching apple method

-(void) pin : (UIPinchGestureRecognizer*) sender {
    UIImageView *appleCopyView = [[UIImageView alloc] initWithFrame:CGRectMake(230, 460, 60, 60)];
    CGPoint location = [sender locationInView:sender.view];
    
    
    switch (sender.state) {
        case UIGestureRecognizerStateBegan:
          
            break;
            
        case UIGestureRecognizerStateChanged:
            appleCopyView.center = location;
            break;
    
        case UIGestureRecognizerStateEnded:
            break;
    }
    
    }
    





@end




