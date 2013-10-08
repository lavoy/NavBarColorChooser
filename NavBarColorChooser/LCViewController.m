//
//  LCViewController.m
//  NavBarColorChooser
//
//  Created by Andy LaVoy on 10/8/13.
//  Copyright (c) 2013 Log Cabin. All rights reserved.
//

#import "LCViewController.h"

@interface LCViewController ()

@property (nonatomic, strong) UISlider *hSlider;
@property (nonatomic, strong) UISlider *sSlider;
@property (nonatomic, strong) UISlider *bSlider;

@property (nonatomic, strong) UILabel *hLabel;
@property (nonatomic, strong) UILabel *sLabel;
@property (nonatomic, strong) UILabel *bLabel;

@property (nonatomic, strong) UIView *colorView;

@property (nonatomic, strong) UIToolbar *toolbar;

@end

@implementation LCViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[UINavigationBar appearance] setTitleTextAttributes:@{ NSForegroundColorAttributeName: [UIColor whiteColor] }];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    
    self.title = @"Title";
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Edit" style:UIBarButtonItemStylePlain target:nil action:nil];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:nil action:nil];
    
    CGFloat left = 20;
    CGFloat width = self.view.frame.size.width - (left * 2);
    CGFloat viewHeight = self.view.frame.size.height;
    CGFloat viewWidth = self.view.frame.size.width;
    
    UIView *blackView = [[UIView alloc] initWithFrame:CGRectMake(0, viewHeight - 100, 80, 100)];
    blackView.backgroundColor = [UIColor blackColor];
    [self.view addSubview:blackView];
    
    UIView *redView = [[UIView alloc] initWithFrame:CGRectMake(80, viewHeight - 100, 80, 100)];
    redView.backgroundColor = [UIColor redColor];
    [self.view addSubview:redView];
    
    UIView *yellowView = [[UIView alloc] initWithFrame:CGRectMake(160, viewHeight - 100, 80, 100)];
    yellowView.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:yellowView];
    
    UIView *blueView = [[UIView alloc] initWithFrame:CGRectMake(240, viewHeight - 100, 80, 100)];
    blueView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:blueView];
    
    self.colorView = [[UIView alloc] initWithFrame:CGRectMake(0, 400, viewWidth, 20)];
    [self.view addSubview:self.colorView];
    
    self.toolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, viewHeight - 44, viewWidth, 44)];
    [self.view addSubview:self.toolbar];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.hSlider = [[UISlider alloc] initWithFrame:CGRectMake(left, 100, width, 20)];
    self.hSlider.tintColor = [UIColor blueColor];
    self.hSlider.maximumValue = 360;
    self.hSlider.minimumValue = 0;
    self.hSlider.value = 180;
    [self.hSlider addTarget:self action:@selector(updateTintColor) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:self.hSlider];
    
    self.hLabel = [[UILabel alloc] initWithFrame:CGRectMake(left, 135, width, 20)];
    self.hLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:self.hLabel];
    
    self.sSlider = [[UISlider alloc] initWithFrame:CGRectMake(left, 200, width, 20)];
    self.sSlider.tintColor = [UIColor blueColor];
    self.sSlider.maximumValue = 1;
    self.sSlider.minimumValue = 0;
    self.sSlider.value = 0.5;
    [self.sSlider addTarget:self action:@selector(updateTintColor) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:self.sSlider];
    
    self.sLabel = [[UILabel alloc] initWithFrame:CGRectMake(left, 235, width, 20)];
    self.sLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:self.sLabel];
    
    self.bSlider = [[UISlider alloc] initWithFrame:CGRectMake(left, 300, width, 20)];
    self.bSlider.tintColor = [UIColor blueColor];
    self.bSlider.maximumValue = 1;
    self.bSlider.minimumValue = 0;
    self.bSlider.value = 0.5;
    [self.bSlider addTarget:self action:@selector(updateTintColor) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:self.bSlider];
    
    self.bLabel = [[UILabel alloc] initWithFrame:CGRectMake(left, 335, width, 20)];
    self.bLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:self.bLabel];
    
    [self updateTintColor];
}

- (void)updateTintColor {
    CGFloat hValue = self.hSlider.value;
    CGFloat sValue = self.sSlider.value;
    CGFloat bValue = self.bSlider.value;
    
    self.hLabel.text = [NSString stringWithFormat:@"H: %1.0f", hValue];
    self.sLabel.text = [NSString stringWithFormat:@"S: %1.2f", sValue];
    self.bLabel.text = [NSString stringWithFormat:@"B: %1.2f", bValue];
    
    UIColor *color = [UIColor colorWithHue:hValue / 360.0
                                saturation:sValue
                                brightness:bValue
                                     alpha:1.0f];
    
    self.navigationController.navigationBar.barTintColor = color;
    self.toolbar.barTintColor = color;
    self.colorView.backgroundColor = color;
    
    self.hSlider.tintColor = color;
    self.sSlider.tintColor = color;
    self.bSlider.tintColor = color;
}

@end
