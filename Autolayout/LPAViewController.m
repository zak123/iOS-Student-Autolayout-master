//
//  LPAViewController.m
//  Autolayout
//
//  Created by Steven Masuch on 2014-07-20.
//  Copyright (c) 2014 Lighthouse Labs. All rights reserved.
//

#import "LPAViewController.h"

@interface LPAViewController ()

@property (nonatomic, weak) UIButton *  squareButton;
@property (nonatomic, weak) UIButton *  portraitButton;
@property (nonatomic, weak) UIButton *  landscapeButton;

@property (nonatomic, weak) UIView *                framingView;
@property (nonatomic, weak) UIView *                purpleBox;
@property (nonatomic, weak) UIView *                blueBoxLowest;
@property (nonatomic, weak) UIView *                blueBoxMiddle;
@property (nonatomic, weak) UIView *                blueBoxHighest;
@property (nonatomic, weak) UIView *                redBox;
@property (nonatomic, weak) UIView *                orangeBoxLeft;
@property (nonatomic, weak) UIView *                orangeBoxRight;
@property (nonatomic, weak) NSLayoutConstraint *    framingViewHeight;
@property (nonatomic, weak) NSLayoutConstraint *    framingViewWidth;

@end

@implementation LPAViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIButton *squareButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [squareButton setTitle:@"Square" forState:UIControlStateNormal];
    [squareButton addTarget:self action:@selector(resizeFramingView:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:squareButton];
    squareButton.translatesAutoresizingMaskIntoConstraints = NO;
    self.squareButton = squareButton;
    
    UIButton *portraitButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [portraitButton setTitle:@"Portrait" forState:UIControlStateNormal];
    [portraitButton addTarget:self action:@selector(resizeFramingView:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:portraitButton];
    portraitButton.translatesAutoresizingMaskIntoConstraints = NO;
    self.portraitButton = portraitButton;
    
    UIButton *landscapeButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [landscapeButton setTitle:@"Landscape" forState:UIControlStateNormal];
    [landscapeButton addTarget:self action:@selector(resizeFramingView:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:landscapeButton];
    landscapeButton.translatesAutoresizingMaskIntoConstraints = NO;
    self.landscapeButton = landscapeButton;
    
    UIView *framingView = [[UIView alloc] initWithFrame:CGRectZero];
    framingView.translatesAutoresizingMaskIntoConstraints = NO;
    framingView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:framingView];
    self.framingView = framingView;
    
    
    
    NSString *buttonsHorizontalConstraints = @"|[squareButton(==portraitButton)][portraitButton(==landscapeButton)][landscapeButton]|";
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:buttonsHorizontalConstraints
                                                                      options:NSLayoutFormatAlignAllCenterY
                                                                      metrics:nil
                                                                        views:NSDictionaryOfVariableBindings(squareButton, portraitButton, landscapeButton)]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:squareButton
                                                          attribute:NSLayoutAttributeBottom
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeBottom
                                                         multiplier:1.0
                                                           constant:-50.0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:framingView
                                                          attribute:NSLayoutAttributeCenterX
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeCenterX
                                                         multiplier:1.0
                                                           constant:0.0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:framingView
                                                          attribute:NSLayoutAttributeCenterY
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeCenterY
                                                         multiplier:1.0
                                                           constant:-50.0]];
    
    NSLayoutConstraint *framingViewHeight = [NSLayoutConstraint constraintWithItem:framingView
                                                                         attribute:NSLayoutAttributeHeight
                                                                         relatedBy:NSLayoutRelationEqual
                                                                            toItem:nil
                                                                         attribute:NSLayoutAttributeNotAnAttribute
                                                                        multiplier:1.0
                                                                          constant:500.0];
    
    NSLayoutConstraint *framingViewWidth = [NSLayoutConstraint constraintWithItem:framingView
                                                                        attribute:NSLayoutAttributeWidth
                                                                        relatedBy:NSLayoutRelationEqual
                                                                           toItem:nil
                                                                        attribute:NSLayoutAttributeNotAnAttribute
                                                                       multiplier:1.0
                                                                         constant:500.0];
    
    [framingView addConstraint:framingViewHeight];
    [framingView addConstraint:framingViewWidth];
    
    self.framingViewHeight = framingViewHeight;
    self.framingViewWidth = framingViewWidth;
    // Set up your views and constraints here
    
    UIView *purpleBox = [[UIView alloc] initWithFrame:CGRectZero];
    purpleBox.translatesAutoresizingMaskIntoConstraints = NO;
    purpleBox.backgroundColor = [UIColor purpleColor];
    [self.framingView addSubview:purpleBox];
    self.purpleBox = purpleBox;
    
    NSLayoutConstraint *purpleBoxWidth = [NSLayoutConstraint constraintWithItem:purpleBox
                                                                            attribute:NSLayoutAttributeWidth
                                                                            relatedBy:NSLayoutRelationEqual
                                                                               toItem:framingView
                                                                            attribute:NSLayoutAttributeWidth
                                                                           multiplier:305.0/500.0
                                                                             constant:0];
    
    [framingView addConstraint:purpleBoxWidth];
    
    NSLayoutConstraint *purpleBoxHeight = [NSLayoutConstraint constraintWithItem:purpleBox
                                                                      attribute:NSLayoutAttributeHeight
                                                                      relatedBy:NSLayoutRelationEqual
                                                                         toItem:nil
                                                                      attribute:NSLayoutAttributeNotAnAttribute
                                                                     multiplier:1
                                                                       constant:50];
    
    [framingView addConstraint:purpleBoxHeight];
    
    NSLayoutConstraint *purpleBoxRightMargin = [NSLayoutConstraint constraintWithItem:purpleBox
                                                                       attribute:NSLayoutAttributeRight
                                                                       relatedBy:NSLayoutRelationEqual
                                                                          toItem:framingView
                                                                       attribute:NSLayoutAttributeRight
                                                                      multiplier:1
                                                                        constant:-20];
    
    [framingView addConstraint:purpleBoxRightMargin];
    
    NSLayoutConstraint *purpleBoxBottomMargin = [NSLayoutConstraint constraintWithItem:purpleBox
                                                                       attribute:NSLayoutAttributeBottom
                                                                       relatedBy:NSLayoutRelationEqual
                                                                          toItem:framingView
                                                                       attribute:NSLayoutAttributeBottom
                                                                      multiplier:1
                                                                        constant:-20];
    
    [framingView addConstraint:purpleBoxBottomMargin];
    
    UIView *blueBoxLowest = [[UIView alloc] initWithFrame:CGRectZero];
    blueBoxLowest.translatesAutoresizingMaskIntoConstraints = NO;
    blueBoxLowest.backgroundColor = [UIColor blueColor];
    [self.framingView addSubview:blueBoxLowest];
    self.blueBoxLowest = blueBoxLowest;
    
    NSLayoutConstraint *blueBoxLowestWidth = [NSLayoutConstraint constraintWithItem:blueBoxLowest
                                                                      attribute:NSLayoutAttributeWidth
                                                                      relatedBy:NSLayoutRelationEqual
                                                                         toItem:nil
                                                                      attribute:NSLayoutAttributeWidth
                                                                     multiplier:1
                                                                       constant:50];
    [framingView addConstraint:blueBoxLowestWidth];
    
    NSLayoutConstraint *blueBoxLowestHeight = [NSLayoutConstraint constraintWithItem:blueBoxLowest
                                                                      attribute:NSLayoutAttributeHeight
                                                                      relatedBy:NSLayoutRelationEqual
                                                                         toItem:nil
                                                                      attribute:NSLayoutAttributeHeight
                                                                     multiplier:1
                                                                       constant:50];
    [framingView addConstraint:blueBoxLowestHeight];
    
    NSLayoutConstraint *blueBoxLowestRightMargin = [NSLayoutConstraint constraintWithItem:blueBoxLowest
                                                                      attribute:NSLayoutAttributeCenterX
                                                                      relatedBy:NSLayoutRelationEqual
                                                                         toItem:framingView
                                                                      attribute:NSLayoutAttributeCenterX
                                                                     multiplier:1
                                                                       constant:0];
    [framingView addConstraint:blueBoxLowestRightMargin];
    
    NSLayoutConstraint *blueBoxLowestBottomMargin = [NSLayoutConstraint constraintWithItem:blueBoxLowest
                                                                                attribute:NSLayoutAttributeCenterY
                                                                                relatedBy:NSLayoutRelationEqual
                                                                                   toItem:framingView
                                                                                attribute:NSLayoutAttributeCenterY
                                                                               multiplier:1.5
                                                                                 constant:0];
    [framingView addConstraint:blueBoxLowestBottomMargin];
    
    UIView *blueBoxMiddle = [[UIView alloc] initWithFrame:CGRectZero];
    blueBoxMiddle.translatesAutoresizingMaskIntoConstraints = NO;
    blueBoxMiddle.backgroundColor = [UIColor blueColor];
    [self.framingView addSubview:blueBoxMiddle];
    self.blueBoxMiddle = blueBoxMiddle;
    
    NSLayoutConstraint *blueBoxMiddleWidth = [NSLayoutConstraint constraintWithItem:blueBoxMiddle
                                                                          attribute:NSLayoutAttributeWidth
                                                                          relatedBy:NSLayoutRelationEqual
                                                                             toItem:nil
                                                                          attribute:NSLayoutAttributeWidth
                                                                         multiplier:1
                                                                           constant:50];
    [framingView addConstraint:blueBoxMiddleWidth];
    
    NSLayoutConstraint *blueBoxMiddleHeight = [NSLayoutConstraint constraintWithItem:blueBoxMiddle
                                                                           attribute:NSLayoutAttributeHeight
                                                                           relatedBy:NSLayoutRelationEqual
                                                                              toItem:nil
                                                                           attribute:NSLayoutAttributeHeight
                                                                          multiplier:1
                                                                            constant:50];
    [framingView addConstraint:blueBoxMiddleHeight];
    
    NSLayoutConstraint *blueBoxMiddleRightMargin = [NSLayoutConstraint constraintWithItem:blueBoxMiddle
                                                                                attribute:NSLayoutAttributeCenterX
                                                                                relatedBy:NSLayoutRelationEqual
                                                                                   toItem:framingView
                                                                                attribute:NSLayoutAttributeCenterX
                                                                               multiplier:1
                                                                                 constant:0];
    [framingView addConstraint:blueBoxMiddleRightMargin];
    
    NSLayoutConstraint *blueBoxMiddleBottomMargin = [NSLayoutConstraint constraintWithItem:blueBoxMiddle
                                                                                 attribute:NSLayoutAttributeCenterY
                                                                                 relatedBy:NSLayoutRelationEqual
                                                                                    toItem:framingView
                                                                                 attribute:NSLayoutAttributeCenterY
                                                                                multiplier:1
                                                                                  constant:0];
    [framingView addConstraint:blueBoxMiddleBottomMargin];
    
    UIView *blueBoxHighest = [[UIView alloc] initWithFrame:CGRectZero];
    blueBoxHighest.translatesAutoresizingMaskIntoConstraints = NO;
    blueBoxHighest.backgroundColor = [UIColor blueColor];
    [self.framingView addSubview:blueBoxHighest];
    self.blueBoxHighest = blueBoxHighest;
    
    NSLayoutConstraint *blueBoxHighestWidth = [NSLayoutConstraint constraintWithItem:blueBoxHighest
                                                                          attribute:NSLayoutAttributeWidth
                                                                          relatedBy:NSLayoutRelationEqual
                                                                             toItem:nil
                                                                          attribute:NSLayoutAttributeWidth
                                                                         multiplier:1
                                                                           constant:50];
    [framingView addConstraint:blueBoxHighestWidth];
    
    NSLayoutConstraint *blueBoxHighestHeight = [NSLayoutConstraint constraintWithItem:blueBoxHighest
                                                                           attribute:NSLayoutAttributeHeight
                                                                           relatedBy:NSLayoutRelationEqual
                                                                              toItem:nil
                                                                           attribute:NSLayoutAttributeHeight
                                                                          multiplier:1
                                                                            constant:50];
    [framingView addConstraint:blueBoxHighestHeight];
    
    NSLayoutConstraint *blueBoxHighestRightMargin = [NSLayoutConstraint constraintWithItem:blueBoxHighest
                                                                                attribute:NSLayoutAttributeCenterX
                                                                                relatedBy:NSLayoutRelationEqual
                                                                                   toItem:framingView
                                                                                attribute:NSLayoutAttributeCenterX
                                                                               multiplier:1
                                                                                 constant:0];
    [framingView addConstraint:blueBoxHighestRightMargin];
    
    NSLayoutConstraint *blueBoxHighestBottomMargin = [NSLayoutConstraint constraintWithItem:blueBoxHighest
                                                                                 attribute:NSLayoutAttributeCenterY
                                                                                 relatedBy:NSLayoutRelationEqual
                                                                                    toItem:framingView
                                                                                 attribute:NSLayoutAttributeCenterY
                                                                                multiplier:0.5
                                                                                  constant:0];
    [framingView addConstraint:blueBoxHighestBottomMargin];
    
    UIView *redBox = [[UIView alloc] initWithFrame:CGRectZero];
    redBox.translatesAutoresizingMaskIntoConstraints = NO;
    redBox.backgroundColor = [UIColor redColor];
    [self.framingView addSubview:redBox];
    self.redBox = redBox;
    
    NSLayoutConstraint *redBoxWidth = [NSLayoutConstraint constraintWithItem:redBox
                                                                      attribute:NSLayoutAttributeWidth
                                                                      relatedBy:NSLayoutRelationEqual
                                                                      toItem:nil
                                                                      attribute:NSLayoutAttributeWidth
                                                                    multiplier:1
                                                                       constant:200];
    
    [framingView addConstraint:redBoxWidth];
    
    NSLayoutConstraint *redBoxHeight = [NSLayoutConstraint constraintWithItem:redBox
                                                                       attribute:NSLayoutAttributeHeight
                                                                       relatedBy:NSLayoutRelationEqual
                                                                          toItem:nil
                                                                       attribute:NSLayoutAttributeNotAnAttribute
                                                                      multiplier:1
                                                                        constant:50];
    
    [framingView addConstraint:redBoxHeight];
    
    NSLayoutConstraint *redBoxRightMargin = [NSLayoutConstraint constraintWithItem:redBox
                                                                            attribute:NSLayoutAttributeRight
                                                                            relatedBy:NSLayoutRelationEqual
                                                                               toItem:framingView
                                                                            attribute:NSLayoutAttributeRight
                                                                           multiplier:1
                                                                             constant:-20];
    
    [framingView addConstraint:redBoxRightMargin];
    
    NSLayoutConstraint *redBoxTopMargin = [NSLayoutConstraint constraintWithItem:redBox
                                                                             attribute:NSLayoutAttributeTop
                                                                             relatedBy:NSLayoutRelationEqual
                                                                                toItem:framingView
                                                                             attribute:NSLayoutAttributeTop
                                                                            multiplier:1
                                                                              constant:20];
    
    [framingView addConstraint:redBoxTopMargin];
    
    UIView *orangeBoxRight = [[UIView alloc] initWithFrame:CGRectZero];
    orangeBoxRight.translatesAutoresizingMaskIntoConstraints = NO;
    orangeBoxRight.backgroundColor = [UIColor orangeColor];
    [self.redBox addSubview:orangeBoxRight];
    self.orangeBoxRight = orangeBoxRight;
    
    NSLayoutConstraint *orangeBoxRightWidth = [NSLayoutConstraint constraintWithItem:orangeBoxRight
                                                                   attribute:NSLayoutAttributeWidth
                                                                   relatedBy:NSLayoutRelationEqual
                                                                      toItem:nil
                                                                   attribute:NSLayoutAttributeWidth
                                                                  multiplier:1
                                                                    constant:50];
    
    [framingView addConstraint:orangeBoxRightWidth];
    
    NSLayoutConstraint *orangeBoxRightHeight = [NSLayoutConstraint constraintWithItem:orangeBoxRight
                                                                    attribute:NSLayoutAttributeHeight
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:nil
                                                                    attribute:NSLayoutAttributeNotAnAttribute
                                                                   multiplier:1
                                                                     constant:40];
    
    [framingView addConstraint:orangeBoxRightHeight];
    
    NSLayoutConstraint *orangeBoxRightRightMargin = [NSLayoutConstraint constraintWithItem:orangeBoxRight
                                                                         attribute:NSLayoutAttributeRight
                                                                         relatedBy:NSLayoutRelationEqual
                                                                            toItem:redBox
                                                                         attribute:NSLayoutAttributeRight
                                                                        multiplier:1
                                                                          constant:-5];
    
    [framingView addConstraint:orangeBoxRightRightMargin];
    
    NSLayoutConstraint *orangeBoxRightTopMargin = [NSLayoutConstraint constraintWithItem:orangeBoxRight
                                                                       attribute:NSLayoutAttributeCenterY
                                                                       relatedBy:NSLayoutRelationEqual
                                                                          toItem:redBox
                                                                       attribute:NSLayoutAttributeCenterY
                                                                      multiplier:1
                                                                        constant:0];
    
    [framingView addConstraint:orangeBoxRightTopMargin];
    
    UIView *orangeBoxLeft = [[UIView alloc] initWithFrame:CGRectZero];
    orangeBoxLeft.translatesAutoresizingMaskIntoConstraints = NO;
    orangeBoxLeft.backgroundColor = [UIColor orangeColor];
    [self.redBox addSubview:orangeBoxLeft];
    self.orangeBoxLeft = orangeBoxLeft;
    
    NSLayoutConstraint *orangeBoxLeftWidth = [NSLayoutConstraint constraintWithItem:orangeBoxLeft
                                                                           attribute:NSLayoutAttributeWidth
                                                                           relatedBy:NSLayoutRelationEqual
                                                                              toItem:nil
                                                                           attribute:NSLayoutAttributeWidth
                                                                          multiplier:1
                                                                            constant:130];
    
    [framingView addConstraint:orangeBoxLeftWidth];
    
    NSLayoutConstraint *orangeBoxLeftHeight = [NSLayoutConstraint constraintWithItem:orangeBoxLeft
                                                                            attribute:NSLayoutAttributeHeight
                                                                            relatedBy:NSLayoutRelationEqual
                                                                               toItem:nil
                                                                            attribute:NSLayoutAttributeNotAnAttribute
                                                                           multiplier:1
                                                                             constant:40];
    
    [framingView addConstraint:orangeBoxLeftHeight];
    
    NSLayoutConstraint *orangeBoxLeftRightMargin = [NSLayoutConstraint constraintWithItem:orangeBoxLeft
                                                                                 attribute:NSLayoutAttributeRight
                                                                                 relatedBy:NSLayoutRelationEqual
                                                                                    toItem:redBox
                                                                                 attribute:NSLayoutAttributeRight
                                                                                multiplier:1
                                                                                 constant:-65];
    
    [framingView addConstraint:orangeBoxLeftRightMargin];
    
    NSLayoutConstraint *orangeBoxLeftTopMargin = [NSLayoutConstraint constraintWithItem:orangeBoxLeft
                                                                               attribute:NSLayoutAttributeCenterY
                                                                               relatedBy:NSLayoutRelationEqual
                                                                                  toItem:redBox
                                                                               attribute:NSLayoutAttributeCenterY
                                                                              multiplier:1
                                                                                constant:0];
    
    [framingView addConstraint:orangeBoxLeftTopMargin];

    
    
    
    
    
}

- (void)resizeFramingView:(id)sender
{
    CGFloat newWidth = 0.0;
    CGFloat newHeight = 0.0;
    
    if (sender == self.squareButton) {
        newWidth = 500.0;
        newHeight = 500.0;
    } else if (sender == self.portraitButton) {
        newWidth = 350.0;
        newHeight = 550.0;
    } else if (sender == self.landscapeButton) {
        newWidth = 900.0;
        newHeight = 300.0;
    }
    
    [UIView animateWithDuration:2.0 animations:^(){
        self.framingViewHeight.constant = newHeight;
        self.framingViewWidth.constant = newWidth;
        [self.view layoutIfNeeded];
    }];
}

@end
