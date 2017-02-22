//
//  ViewController.h
//  ObjectiveC_Example2
//
//  Created by sangbeom ma on 2017. 2. 21..
//  Copyright © 2017년 favorie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainViewController.h"
#import "SetupViewController.h"

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIButton *infoButton;
@property (strong, nonatomic) MainViewController *mainViewController;
@property (strong, nonatomic) SetupViewController *setupViewController;

- (IBAction) setupClick; //알람 설정 버튼 클릭 시 호출되는 메서드
- (IBAction) closeClick; // 알람 설정 화면 닫기
- (void) AlarmSetting; // 알람 설정

@end

