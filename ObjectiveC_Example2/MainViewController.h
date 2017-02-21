//
//  MainViewController.h
//  ObjectiveC_Example2
//
//  Created by sangbeom ma on 2017. 2. 21..
//  Copyright © 2017년 favorie. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainViewController : UIViewController
{
    NSTimer *timer;
    IBOutlet UILabel *clockDisplay; // 디지털시계를 표현할 Label참조 변수
}

-(void) onTimer; // 타이머 이벤트 핸들러

@end
