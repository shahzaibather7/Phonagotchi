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
@property (nonatomic , strong) UIImageView *appleView;
@property (nonatomic , strong) UIImageView *basketView;
@property (nonatomic ) BOOL basketClick;


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
    
    self.appleView = [[UIImageView alloc]initWithFrame: CGRectZero];
    self.appleView.image = [UIImage imageNamed:@"apple.png"];
    self.appleView.translatesAutoresizingMaskIntoConstraints = NO;
    
    self.basketView = [[UIImageView alloc]initWithFrame:CGRectZero];
    self.basketView.image = [UIImage imageNamed:@"bucket.png"];
    self.basketView.translatesAutoresizingMaskIntoConstraints= NO;
    
    [self.view addSubview: self.basketView];
    [self.view addSubview: self.appleView];
    
    
    
//Autolayout Constraints for apple
    
    [NSLayoutConstraint constraintWithItem:self.appleView
                                 attribute:NSLayoutAttributeWidth
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.view
                                 attribute:NSLayoutAttributeWidth
                                multiplier:0.15
                                  constant:0.0].active = YES;
    
    
    [NSLayoutConstraint constraintWithItem:self.appleView
                                 attribute:NSLayoutAttributeHeight
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.view
                                 attribute:NSLayoutAttributeHeight
                                multiplier:0.15
                                  constant:0.0].active = YES;
    
    [NSLayoutConstraint constraintWithItem:self.appleView
                                 attribute:NSLayoutAttributeRight
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.view
                                 attribute:NSLayoutAttributeRight
                                multiplier:1
                                  constant:-30].active = YES;
    
    [NSLayoutConstraint constraintWithItem:self.appleView
                                 attribute:NSLayoutAttributeBottom
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.view
                                 attribute:NSLayoutAttributeBottom
                                multiplier:1
                                  constant:-45].active = YES;
    
    
    
    
    
    [NSLayoutConstraint constraintWithItem:self.basketView
                                 attribute:NSLayoutAttributeWidth
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.view
                                 attribute:NSLayoutAttributeWidth
                                multiplier:0.25
                                  constant:0.0].active = YES;
    
    [NSLayoutConstraint constraintWithItem:self.basketView
                                 attribute:NSLayoutAttributeHeight
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.view
                                 attribute:NSLayoutAttributeHeight
                                multiplier:0.20
                                  constant:0.0].active = YES;
    
    [NSLayoutConstraint constraintWithItem:self.basketView
                                 attribute:NSLayoutAttributeRight
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.view
                                 attribute:NSLayoutAttributeRight
                                multiplier:1
                                  constant:-15].active = YES;
    [NSLayoutConstraint constraintWithItem:self.basketView
                                 attribute:NSLayoutAttributeBottom
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.view
                                 attribute:NSLayoutAttributeBottom
                                multiplier:1
                                  constant:-20].active = YES;
 
 
    
    
    


    
    
    
    
    
//Adding pinch for apple
    
    
    UIPinchGestureRecognizer *pinch = [[UIPinchGestureRecognizer alloc]initWithTarget:self action:@selector(pin:)];
  
    [self.view addGestureRecognizer:pinch];

//    [self.appleView setUserInteractionEnabled:YES];
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
  
    
    CGPoint location = [sender locationInView:sender.view];
  
    
    switch (sender.state) {
        case UIGestureRecognizerStateBegan:
            if(CGRectContainsPoint(_basketView.frame, location)){
                _appleView.center = location;
                self.basketClick = TRUE;
            }
            
            
            break;
            
        case UIGestureRecognizerStateChanged:
            if (self.basketClick ==TRUE){
                _appleView.center = location;
            }
            break;
    
        case UIGestureRecognizerStateEnded:
            if (CGRectContainsPoint(_petImageView.frame, _appleView.center)) {
                self.petImageView.image = [UIImage imageNamed:@"sleeping.png"];
                [UIView animateWithDuration:2 animations:^{
                    _appleView.alpha = 0;
                    
                    
                    _appleView.center = self.basketView.center;
                    _appleView.alpha =1;
                    
                }];
                

            }
            else{
                [UIView animateWithDuration:2 animations:^{
                    _appleView.center = CGPointMake(_appleView.center.x, self.view.frame.size.height - self.appleView.frame.size.height/2);
                }];
                
            }
            break;
        default:
            break;
    }
    

    }


    





@end




