//
//  MainClockView.m
//  ObjectiveC_Example2
//
//  Created by sangbeom ma on 2017. 2. 21..
//  Copyright © 2017년 favorie. All rights reserved.
//

#import "MainClockView.h"
#define SECOND_WIDTH		100
#define MINUTE_WIDTH		75
#define HOUR_WIDTH			50

@implementation MainClockView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@synthesize pHour;
@synthesize pMinute;
@synthesize pSecond;



- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    
    UIImage *img = [UIImage imageNamed:@"clock.png"];        //시계 이미지를 불러옵니다.
    imgClock = CGImageRetain(img.CGImage);                   // CGImageRef형으로 변환합니다.
    
    return self;
}

// 뷰가 다시 그려질 경우 호출되는 함수
- (void)drawRect:(CGRect)rect {
    //  현재 뷰의 그래픽 컨텍스트를 구합니다.
    CGContextRef context = UIGraphicsGetCurrentContext();
    [self drawClockBitmap:context];     // 시계 이미지를 화면으로 출력합니다.
    [self drawLine:context];            // 시, 분, 초침을 화면으로 출력합니다.
}

-(void) drawLine:(CGContextRef)context {
    
    int centerX = self.bounds.size.width / 2;        // X축 중심
    int centerY = self.bounds.size.height / 2;       // Y축 중심
    
    
    [self DrawSecond:context CenterX:centerX CenterY:centerY];     // 초침을 그립니다.
    [self DrawMinute:context CenterX:centerX CenterY:centerY];     // 분침을 그립니다.
    [self DrawHour:context CenterX:centerX CenterY:centerY];       // 시침을 그립니다.
    
}

-(void) DrawSecond:(CGContextRef)context CenterX:(int)pCenterX  CenterY:(int)CenterY
{
    int newX, newY;
    
    // 현재의 초에 해당되는 좌표를 구합니다.
    newX = (int)(sin(pSecond * 6 * 3.14/180 ) * SECOND_WIDTH + pCenterX);
    newY = (int)(CenterY - (cos(pSecond * 6 * 3.14/180 ) * SECOND_WIDTH ) );
    
    CGContextSetRGBStrokeColor(context, 0, 0, 0, 1.0);            // 선의 색상 설정
    CGContextSetLineWidth(context, 2.0);                          // 선의 굵기 지정
    CGContextMoveToPoint(context, pCenterX, CenterY);             // 선의 시작점을 지정
    CGContextAddLineToPoint(context, newX, newY);                 // 선의 끝점 지정
    CGContextStrokePath(context);                                 // 선을 그립니다.
    
}

-(void) DrawMinute:(CGContextRef)context CenterX:(int)pCenterX  CenterY:(int)CenterY
{
    
    int newX, newY;
    
    // 분침의 끝점 좌표를 구합니다.
    newX = (int)(sin(pMinute * 6 * 3.14/180 ) * MINUTE_WIDTH + pCenterX);
    newY = (int)(CenterY - (cos(pMinute * 6 * 3.14/180 ) * MINUTE_WIDTH ) );
    
    CGContextSetRGBStrokeColor(context, 0, 0, 0, 1.0);            // 선의 색상 설정
    CGContextSetLineWidth(context, 3.0);                          // 선의 굵기 지정
    CGContextMoveToPoint(context, pCenterX, CenterY);             // 선의 시작점을 지정
    CGContextAddLineToPoint(context, newX, newY);                 // 선의 끝점 지정
    CGContextStrokePath(context);                                 // 선을 그립니다.
}


-(void) DrawHour:(CGContextRef)context CenterX:(int)pCenterX  CenterY:(int)CenterY
{
    int newX, newY;
    
    // 시침의 끝점 좌표를 구합니다.
    newX = (int)(sin(pHour * 30 * 3.14/180 ) * HOUR_WIDTH + pCenterX);
    newY = (int)(CenterY - (cos(pHour * 30 * 3.14/180 ) * HOUR_WIDTH ) );
    
    CGContextSetRGBStrokeColor(context, 0, 0, 0, 1.0);            // 선의 색상 설정
    CGContextSetLineWidth(context, 4.0);                          // 선의 굵기 지정
    CGContextMoveToPoint(context, pCenterX, CenterY);             // 선의 시작점을 지정
    CGContextAddLineToPoint(context, newX, newY);                 // 선의 끝점 지정
    CGContextStrokePath(context);                                 // 선을 그립니다.
}


-(void) drawClockBitmap:(CGContextRef)context {
    
    // CTM의 이전 상태를 저장.
    CGContextSaveGState(context);
    
    CGContextTranslateCTM(context, 0.0, self.bounds.size.height);         // 좌표의 원점을 이동
    CGContextScaleCTM(context, 1.0, -1.0);                                // 좌표의 비율을 바꿈
    
    CGContextClipToRect(context, CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height));
    //시계 이미지를 화면에 그립니다.
    CGContextDrawImage(context,CGRectMake(0,0,CGImageGetWidth(imgClock), CGImageGetHeight(imgClock)), imgClock);
    
    CGContextRestoreGState(context);   // CTM의 이전 상태를 복구
}



@end
