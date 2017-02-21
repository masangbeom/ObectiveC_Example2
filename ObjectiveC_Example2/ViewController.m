//
//  ViewController.m
//  ObjectiveC_Example2
//
//  Created by sangbeom ma on 2017. 2. 21..
//  Copyright © 2017년 favorie. All rights reserved.
//  Objective C    학습용 샘플프로젝트 알람시계 어플리케이션
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize infoButton;
@synthesize mainViewController;
//@synthesize setupViewController;


- (void)viewDidLoad {
    MainViewController *viewController = [self.storyboard instantiateViewControllerWithIdentifier:@"MainViewController"];
    mainViewController = viewController;
    
    
    // infoButton 뒤로 MainViewController.view넣기
    [self.view insertSubview:viewController.view belowSubview:infoButton];
    
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
