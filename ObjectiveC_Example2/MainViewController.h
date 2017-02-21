//
//  MainViewController.h
//  ObjectiveC_Example2
//
//  Created by sangbeom ma on 2017. 2. 21..
//  Copyright © 2017년 favorie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainClockView.h"


@interface MainViewController : UIViewController
{
    NSTimer *timer;
    
    IBOutlet UILabel *clockDisplay;
    IBOutlet MainClockView *pClockView;
    
}

-(void)onTimer;                    // 타이머 이벤트 핸들러
@property  Boolean pAlarmOnOff;    // 알람 여부
@property  int pAlarmHour;         // 알람 시간
@property  int pAlarmMinute;       // 알람 분

@end
