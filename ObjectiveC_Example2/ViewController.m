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
@synthesize setupViewController;


- (void)viewDidLoad {
    MainViewController *viewController = [self.storyboard instantiateViewControllerWithIdentifier:@"MainViewController"];
    mainViewController = viewController;
    
    
    // infoButton 뒤로 MainViewController.view넣기
    [self.view insertSubview:viewController.view belowSubview:infoButton];
    
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

// 알람 설정버튼을 클릭하면 호출됩니다.
- (IBAction)setupClick {
    if (setupViewController == nil)
        setupViewController  = [self.storyboard     instantiateViewControllerWithIdentifier:@"SetupViewController"];
    
    
    [self presentViewController:setupViewController animated:YES completion:nil];
}

// 알람 설정 화면에서 완료버튼을 클릭하면 호출됩니다.
- (IBAction)closeClick
{
    [self AlarmSetting];
    [setupViewController dismissViewControllerAnimated:YES completion:nil];
    
}



- (void) AlarmSetting
{
    
    mainViewController.pAlarmOnOff = setupViewController.switchControl.on;
    
    if (mainViewController.pAlarmOnOff == YES)         // 알람이 설정되어 있을 경우
    {
        NSCalendar *pCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
        unsigned unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour| NSCalendarUnitMinute |NSCalendarUnitSecond;
        NSDate *date = [setupViewController.pDatePicker date];
        NSDateComponents *comps = [pCalendar components:unitFlags fromDate:date];
        mainViewController.pAlarmHour = (int)[comps hour];
        mainViewController.pAlarmMinute = (int)[comps minute];
        
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
