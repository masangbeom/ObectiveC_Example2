//
//  MainClockView.h
//  ObjectiveC_Example2
//
//  Created by sangbeom ma on 2017. 2. 21..
//  Copyright © 2017년 favorie. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainClockView : UIView{
    CGImageRef imgClock; // image of clock
    int pHour;
    int pMinute;
    int pSecond;
}

-(void) drawLine:(CGContextRef)context; // 선을 화면에 그립니다.

-(void) drawClockBitmap:(CGContextRef)context; // 시계이미지를 화면에 그립니다.

-(void) DrawSecond:(CGContextRef)context CenterX:(int)pCenterX CenterY:(int)CenterY;
//  화면에 초침을 그림
-(void) DrawMinute:(CGContextRef)context CenterX:(int)pCenterX CenterY:(int)CenterY;
//  화면에 분침을 그림
-(void) DrawHour:(CGContextRef)context CenterX:(int)pCenterX CenterY:(int)CenterY;
//  화면에 시침을 그림


@property int pHour;
@property int pMinute;
@property int pSecond;

@end
